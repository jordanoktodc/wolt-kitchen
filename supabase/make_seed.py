"""Builds supabase/seed/*.sql from the prototype export (export/recipes, export/events, export/reference)."""
import json, os, sys, uuid, glob

SRC = sys.argv[1] if len(sys.argv) > 1 else "/home/claude/wolt/export"
OUT = os.path.join(os.path.dirname(__file__), "seed")
os.makedirs(OUT, exist_ok=True)
NS = uuid.UUID("6f1d2c1a-7c55-4a8e-9a0e-0d0a3c2b1e10")
U = lambda *parts: str(uuid.uuid5(NS, "/".join(map(str, parts))))  # stable ids, so re-running is safe

def q(v):
    if v is None: return "null"
    if isinstance(v, bool): return "true" if v else "false"
    if isinstance(v, (int, float)): return repr(v)
    return "'" + str(v).replace("'", "''") + "'"
def j(v): return q(json.dumps(v, ensure_ascii=False)) + "::jsonb"
def load(kind):
    out = []
    for p in sorted(glob.glob(f"{SRC}/{kind}/*.json")):
        d = json.load(open(p)); d = d.get("data", d)
        d["_id"] = os.path.basename(p)[:-5]; out.append(d)
    return out

def ins(table, cols, rows, conflict):
    if not rows: return ""
    vals = ",\n".join("(" + ", ".join(r) + ")" for r in rows)
    upd = ", ".join(f"{c} = excluded.{c}" for c in cols if c not in conflict)
    return f"insert into public.{table} ({', '.join(cols)}) values\n{vals}\non conflict ({', '.join(conflict)}) do update set {upd};\n\n"

# ---- recipes + reference (file 1)
recipes = load("recipes")
rcols = ["id", "name", "category", "batch_label", "servings_per_batch", "tags", "ingredients", "notes", "source_text", "source_file", "reviewed"]
rrows = [[q(r["_id"]), q(r["name"]), q(r.get("category", "Other")), q(r.get("batchLabel") or ""), q(r.get("servingsPerBatch")),
          j(r.get("tags") or {}), j(r.get("ingredients") or []), q(r.get("notes") or ""), q(r.get("text") or ""), q(r.get("source")), q(bool(r.get("reviewed")))] for r in recipes]
ref = load("reference")
refrows = []
for d in ref:
    for i, s in enumerate(d.get("sections", [])):
        refrows.append([q(f"ref-{i+1}"), q(s["title"]), q(s["text"]), q(i)])
with open(f"{OUT}/01_recipes.sql", "w") as f:
    f.write("-- WOLT Kitchen seed 1 of 3: recipes + quantity reference\nbegin;\n")
    f.write(ins("recipes", rcols, rrows, ["id"]))
    f.write(ins("reference_notes", ["id", "title", "body", "sort"], refrows, ["id"]))
    f.write("commit;\n")

# ---- events (files 2 and 3)
recipe_ids = {r["_id"] for r in recipes}
events = [e for e in load("events") if e.get("dishes") or e.get("planText") or e.get("prepDays")]  # skip empty test events
half = (len(events) + 1) // 2
for part, chunk in ((2, events[:half]), (3, events[half:])):
    ev, di, pd, pt, os_, sl, tl = [], [], [], [], [], [], []
    for e in chunk:
        eid = e["_id"]
        ev.append([q(eid), q(e["name"]), q(e.get("date")), q(int(e.get("guests") or 0)), q(e.get("notes") or ""), j(e.get("extras") or []),
                   j(e.get("checked") or {}), j(e.get("stores") or {}), q(bool(e.get("imported"))), q(e.get("source")), q(e.get("planText"))])
        keymap = {}
        for i, d in enumerate(e.get("dishes") or []):
            did = U(eid, "dish", d["key"]); keymap[d["key"]] = did
            di.append([q(did), q(eid), q(d.get("table", "regular")), q(d["name"]), q(d.get("recipeId") if d.get("recipeId") in recipe_ids else None),
                       q(float(d.get("batches") or 0)), j(d.get("tags") or {}), q(int(d.get("labelCopies") or 0)), q(i)])
        for i, p in enumerate(e.get("prepDays") or []):
            pid = U(eid, "day", p["id"])
            pd.append([q(pid), q(eid), q(p.get("date")), q(p.get("title") or ""), q(p.get("crew") or ""), q(i)])
            for k, t in enumerate(p.get("tasks") or []):
                pt.append([q(U(eid, "task", t["id"])), q(pid), q(eid), q(t["text"]), q(bool(t.get("done"))), q(k)])
        for i, o in enumerate(e.get("ovenDays") or []):
            oid = U(eid, "oven", o["id"])
            os_.append([q(oid), q(eid), q(o.get("title") or ""), q(o.get("service")), q(i)])
            for s in o.get("slots") or []:
                sl.append([q(U(eid, "slot", s["id"])), q(oid), q(s["lane"]), q(s["start"]), q(max(5, int(s.get("minutes") or 60))), q(s.get("label") or ""), q(keymap.get(s.get("dishKey")))])
        for t in e.get("tempLog") or []:
            tl.append([q(U(eid, "temp", t["id"])), q(eid), q(t["time"]), q(t["item"]), q(t["stage"]), q(float(t["tempF"])), q(t.get("initials") or ""), q(t.get("action") or "")])
    with open(f"{OUT}/0{part}_events.sql", "w") as f:
        f.write(f"-- WOLT Kitchen seed {part} of 3: events {', '.join(e['name'] for e in chunk)[:200]}...\nbegin;\n")
        f.write(ins("events", ["id", "name", "event_date", "guests", "notes", "extras", "grocery_checked", "grocery_stores", "imported", "source_file", "plan_text"], ev, ["id"]))
        f.write(ins("event_dishes", ["id", "event_id", "buffet", "name", "recipe_id", "batches", "tags", "label_copies", "sort"], di, ["id"]))
        f.write(ins("prep_days", ["id", "event_id", "day_date", "title", "crew", "sort"], pd, ["id"]))
        f.write(ins("prep_tasks", ["id", "prep_day_id", "event_id", "text", "done", "sort"], pt, ["id"]))
        f.write(ins("oven_schedules", ["id", "event_id", "title", "service_time", "sort"], os_, ["id"]))
        f.write(ins("oven_slots", ["id", "schedule_id", "lane", "start_time", "minutes", "label", "dish_id"], sl, ["id"]))
        f.write(ins("temp_logs", ["id", "event_id", "logged_at", "item", "stage", "temp_f", "initials", "action"], tl, ["id"]))
        f.write("commit;\n")
    print(part, len(chunk), "events", len(di), "dishes", len(pt), "tasks", len(sl), "slots")
print("recipes", len(recipes), "reference", len(refrows), "skipped empty events:", [e["_id"] for e in load("events") if e not in events])
