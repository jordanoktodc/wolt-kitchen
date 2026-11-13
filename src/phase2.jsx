// Phase 2: prep days, oven schedule, safety log, printable day sheet.
import { useState } from 'react';

export const LANES = [
  { k: 'ovenA', label: 'Oven A', hot: true },
  { k: 'ovenB', label: 'Oven B', hot: true },
  { k: 'ivario', label: 'iVario', hot: true },
  { k: 'prep', label: 'Prep', hot: false },
];
const laneLabel = (k) => (LANES.find((l) => l.k === k) || { label: k }).label;
const uid = () => crypto.randomUUID();
export const toMin = (t) => { if (!t) return null; const [h, m] = t.split(':').map(Number); return h * 60 + (m || 0); };
const hhmm = (m) => `${String(Math.floor(m / 60) % 24).padStart(2, '0')}:${String(m % 60).padStart(2, '0')}`;
export const t12 = (m) => { if (m == null) return ''; const h = Math.floor(m / 60) % 24; return `${h % 12 || 12}:${String(m % 60).padStart(2, '0')}${h < 12 ? ' am' : ''}`; };
const nowHHMM = () => new Date().toLocaleTimeString('en-CA', { timeZone: 'America/Edmonton', hour: '2-digit', minute: '2-digit', hour12: false });
const addDays = (iso, n) => { const [y, m, d] = iso.split('-').map(Number); const x = new Date(y, m - 1, d + n); return `${x.getFullYear()}-${String(x.getMonth() + 1).padStart(2, '0')}-${String(x.getDate()).padStart(2, '0')}`; };
const dayName = (iso) => { if (!iso) return 'No date'; const [y, m, d] = iso.split('-').map(Number); return new Date(y, m - 1, d).toLocaleDateString('en-CA', { weekday: 'long', month: 'short', day: 'numeric' }); };
const esc = (s) => String(s ?? '').replace(/[&<>"]/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]));

// Rough cooking time from a recipe's own text ("Time: 65 min", "about 45 min", "(1½-2 hrs)")
export function guessMinutes(text) {
  if (!text) return null;
  const t = text.replace(/hours?|hrs/gi, 'hr');
  const fr = { '½': 0.5, '¼': 0.25, '¾': 0.75 };
  let m = t.match(/(\d+(?:\.\d+)?)?\s*([½¼¾])?\s*(?:[-–]\s*(\d+(?:\.\d+)?)?\s*([½¼¾])?)?\s*hr\b/i);
  if (m && (m[1] || m[2])) { const a = Number(m[1] || 0) + (fr[m[2]] || 0); const b = Number(m[3] || 0) + (fr[m[4]] || 0); return Math.round(Math.max(a, b) * 60); }
  m = t.match(/(?:time:?\s*|about\s*|took about\s*|~\s*)(\d+)\s*(?:[-–]\s*(\d+))?\s*min/i) || t.match(/(\d+)\s*(?:[-–]\s*(\d+))?\s*min/i);
  if (m) return Number(m[2] || m[1]);
  return null;
}

/* ================= Prep days ================= */
export function PrepDays({ draft, update, ro, canTick, byId, onDownload }) {
  const days = [...(draft.prepDays || [])].sort((a, b) => (a.date || '').localeCompare(b.date || ''));
  const [confirm, setConfirm] = useState(null);
  const setDays = (next) => update({ prepDays: next });
  const setDay = (id, patch) => setDays((draft.prepDays || []).map((d) => (d.id === id ? { ...d, ...patch } : d)));
  const setTask = (day, tid, patch) => setDay(day.id, { tasks: day.tasks.map((t) => (t.id === tid ? { ...t, ...patch } : t)) });
  const template = () => {
    const base = draft.date || new Date().toISOString().slice(0, 10);
    const linked = (draft.dishes || []).filter((d) => byId[d.recipeId]);
    const uniq = [...new Map(linked.map((d) => [d.recipeId, d])).values()];
    setDays([
      { id: uid(), date: addDays(base, -2), title: 'Prep', crew: '', tasks: [{ id: uid(), text: 'Groceries delivered / picked up', done: false }, { id: uid(), text: 'Send buffet labels', done: false }] },
      { id: uid(), date: addDays(base, -1), title: 'Main prep day', crew: '', tasks: uniq.map((d) => ({ id: uid(), text: `${d.name}: prep ahead`, done: false })) },
      { id: uid(), date: base, title: 'Event day', crew: '', tasks: [...uniq.map((d) => ({ id: uid(), text: `${d.name}: cook / reheat`, done: false })), { id: uid(), text: 'Set up allergy table', done: false }] },
    ]);
  };
  const total = days.reduce((n, d) => n + d.tasks.length, 0);
  const done = days.reduce((n, d) => n + d.tasks.filter((t) => t.done).length, 0);
  return <div className="phase">
    <div className="toolbar between">
      <p className="muted">{days.length ? `${done} of ${total} tasks done across ${days.length} days.` : 'Plan the kitchen days leading up to the event: who is coming in and what gets done.'}</p>
      <div className="head-actions">
        {!!days.length && <button type="button" className="btn small" onClick={onDownload}>Download day sheet</button>}
        {!ro && <button type="button" className="btn small" onClick={() => setDays([...(draft.prepDays || []), { id: uid(), date: draft.date || '', title: 'Prep day', crew: '', tasks: [] }])}>+ Add day</button>}
      </div>
    </div>
    {!days.length && <div className="empty"><h3>No prep days yet</h3><div>{ro ? 'The organizers have not planned prep days for this event.' : 'Start from the usual three-day pattern: prep, main prep day, event day. Tasks are added for each dish on the menu.'}</div>
      {!ro && <button type="button" className="btn primary" style={{ marginTop: 12 }} onClick={template}>Start from template</button>}</div>}
    <div className="days">{days.map((d) => {
      const n = d.tasks.filter((t) => t.done).length;
      return <article key={d.id} className="day">
        <header className="day-head">
          <div className="day-when">
            {ro ? <b>{dayName(d.date)}</b> : <input id={'dd' + d.id} type="date" aria-label="Day" value={d.date || ''} onChange={(e) => setDay(d.id, { date: e.target.value })} />}
            {ro ? <span className="day-title">{d.title}</span> : <input id={'dt' + d.id} className="day-title" aria-label="Day title" defaultValue={d.title} onBlur={(e) => e.target.value !== d.title && setDay(d.id, { title: e.target.value })} />}
          </div>
          <span className="progress" aria-label={`${n} of ${d.tasks.length} done`}><span style={{ width: d.tasks.length ? `${(n / d.tasks.length) * 100}%` : 0 }} /></span>
        </header>
        <label className="crew"><span>Crew</span>{ro ? <b>{d.crew || '—'}</b> : <input id={'dc' + d.id} defaultValue={d.crew} placeholder="e.g. 8 ladies, 9:00–12:00" onBlur={(e) => e.target.value !== d.crew && setDay(d.id, { crew: e.target.value })} />}</label>
        <ul className="tasks">{d.tasks.map((t) => <li key={t.id} className={t.done ? 'done' : ''}>
          <input id={'tc' + t.id} type="checkbox" checked={!!t.done} disabled={ro && !canTick} aria-label="Done" onChange={(e) => setTask(d, t.id, { done: e.target.checked })} />
          {ro ? <span>{t.text}</span> : <textarea id={'tt' + t.id} rows={1} defaultValue={t.text} aria-label="Task" onBlur={(e) => e.target.value !== t.text && setTask(d, t.id, { text: e.target.value })} />}
          {!ro && <button type="button" className="x" aria-label="Remove task" onClick={() => setDay(d.id, { tasks: d.tasks.filter((x) => x.id !== t.id) })}>×</button>}
        </li>)}</ul>
        {!ro && <form className="extra" onSubmit={(e) => { e.preventDefault(); const v = e.target.elements.task.value.trim(); if (v) { setDay(d.id, { tasks: [...d.tasks, { id: uid(), text: v, done: false }] }); e.target.reset(); } }}>
          <input id={'na' + d.id} name="task" placeholder="Add a task: Romaine: wash, drain, into fridge" /><button className="btn small" type="submit">Add</button>
        </form>}
        {!ro && <div className="day-foot">{confirm === d.id
          ? <span>Remove this day and its tasks? <button type="button" className="btn small danger-btn" onClick={() => { setDays((draft.prepDays || []).filter((x) => x.id !== d.id)); setConfirm(null); }}>Remove day</button> <button type="button" className="btn small ghost" onClick={() => setConfirm(null)}>Keep</button></span>
          : <button type="button" className="btn ghost small" onClick={() => setConfirm(d.id)}>Remove day</button>}</div>}
      </article>;
    })}</div>
  </div>;
}

/* ================= Oven schedule ================= */
function layout(slots) {
  // side-by-side columns where blocks overlap in a lane
  const out = {};
  for (const lane of LANES) {
    const ls = slots.filter((s) => s.lane === lane.k).map((s) => ({ s, a: toMin(s.start), b: toMin(s.start) + Number(s.minutes || 0) })).sort((x, y) => x.a - y.a);
    let cluster = [], end = -1;
    const flush = () => { const cols = []; for (const it of cluster) { let c = cols.findIndex((e) => e <= it.a); if (c < 0) { c = cols.length; cols.push(0); } cols[c] = it.b; it.col = c; } for (const it of cluster) out[it.s.id] = { col: it.col, cols: cols.length, clash: cols.length > 1 && lane.hot }; cluster = []; };
    for (const it of ls) { if (it.a >= end && cluster.length) flush(); cluster.push(it); end = Math.max(end, it.b); }
    if (cluster.length) flush();
  }
  return out;
}

export function OvenSchedule({ draft, update, ro, byId, onDownload }) {
  const days = draft.ovenDays || [];
  const [di, setDi] = useState(0);
  const [sel, setSel] = useState(null);
  const day = days[Math.min(di, days.length - 1)];
  const setDaysArr = (next) => update({ ovenDays: next });
  const setDay = (patch) => setDaysArr(days.map((d) => (d.id === day.id ? { ...d, ...patch } : d)));
  const setSlot = (id, patch) => setDay({ slots: day.slots.map((s) => (s.id === id ? { ...s, ...patch } : s)) });
  const newDay = () => { setDaysArr([...days, { id: uid(), title: days.length ? `Schedule ${days.length + 1}` : 'Event day', service: '17:00', slots: [] }]); setDi(days.length); };

  const fill = () => {
    const service = toMin(day.service) ?? 17 * 60;
    const hot = (draft.dishes || []).filter((d) => byId[d.recipeId] && ['Protein', 'Starch', 'Vegetable', 'Soup'].includes(byId[d.recipeId].category));
    const uniq = [...new Map(hot.map((d) => [d.recipeId + d.table, d])).values()].filter((d) => d.table === 'regular');
    const items = uniq.map((d) => ({ d, min: guessMinutes(byId[d.recipeId].text) || 60 })).sort((a, b) => b.min - a.min);
    const cursor = { ovenA: service - 15, ovenB: service - 15 };
    const add = items.map(({ d, min }) => {
      const lane = cursor.ovenA >= cursor.ovenB ? 'ovenA' : 'ovenB';
      const start = cursor[lane] - min; cursor[lane] = start;
      return { id: uid(), lane, start: hhmm(start), minutes: min, label: d.name, dishKey: d.key };
    });
    setDay({ slots: [...day.slots, ...add] });
  };

  if (!day) return <div className="phase"><div className="empty"><h3>No oven schedule yet</h3><div>{ro ? 'The organizers have not scheduled the ovens for this event.' : 'Lay out what goes into Oven A, Oven B and the iVario, hour by hour, so nothing fights for oven space.'}</div>
    {!ro && <button type="button" className="btn primary" style={{ marginTop: 12 }} onClick={newDay}>Start an oven schedule</button>}</div></div>;

  const slots = day.slots || [];
  const service = toMin(day.service);
  const starts = slots.map((s) => toMin(s.start)), ends = slots.map((s) => toMin(s.start) + Number(s.minutes || 0));
  const lo = Math.floor(Math.min(...starts, service ?? 1e9, 12 * 60) / 60) * 60;
  const hi = Math.ceil(Math.max(...ends, (service ?? 0) + 30, lo + 240) / 60) * 60;
  const PPM = 1.1;
  const lay = layout(slots);
  const warnings = [];
  for (const lane of LANES.filter((l) => l.hot)) {
    const ls = slots.filter((s) => s.lane === lane.k).sort((a, b) => toMin(a.start) - toMin(b.start));
    for (let i = 0; i < ls.length; i++) for (let j = i + 1; j < ls.length; j++) {
      const ae = toMin(ls[i].start) + Number(ls[i].minutes), bs = toMin(ls[j].start);
      if (bs < ae) warnings.push(`${lane.label}: “${short(ls[i].label)}” and “${short(ls[j].label)}” overlap ${t12(bs)}–${t12(Math.min(ae, bs + Number(ls[j].minutes)))}`);
    }
  }
  if (service != null) for (const s of slots) if (LANES.find((l) => l.k === s.lane)?.hot && toMin(s.start) + Number(s.minutes) > service) warnings.push(`“${short(s.label)}” comes out at ${t12(toMin(s.start) + Number(s.minutes))}, after the ${t12(service)} service`);
  const selected = slots.find((s) => s.id === sel);

  return <div className="phase">
    <div className="toolbar between">
      <div className="chips">{days.map((d, i) => <button key={d.id} type="button" className={'chip' + (d === day ? ' on' : '')} onClick={() => { setDi(i); setSel(null); }}>{d.title}</button>)}
        {!ro && <button type="button" className="chip" onClick={newDay}>+ Schedule</button>}</div>
      <div className="head-actions"><button type="button" className="btn small" onClick={onDownload}>Download day sheet</button></div>
    </div>
    <div className="facts">
      <label className="fact"><span>Schedule</span>{ro ? <b>{day.title}</b> : <input id={'od' + day.id} key={'od' + day.id} defaultValue={day.title} onBlur={(e) => e.target.value !== day.title && setDay({ title: e.target.value })} />}</label>
      <label className="fact"><span>Food served at</span>{ro ? <b>{t12(service) || '—'}</b> : <input id={'os' + day.id} key={'os' + day.id} type="time" value={day.service || ''} onChange={(e) => setDay({ service: e.target.value })} />}</label>
      {!ro && <div className="fact actions-fact"><span>Add</span><div className="head-actions">
        <button type="button" className="btn small" onClick={() => { const id = uid(); setDay({ slots: [...slots, { id, lane: 'ovenA', start: hhmm((service ?? 17 * 60) - 60), minutes: 45, label: 'New item' }] }); setSel(id); }}>+ Block</button>
        {!!(draft.dishes || []).length && <button type="button" className="btn small" onClick={fill} title="Back-schedules each hot dish into Oven A and B so it finishes 15 minutes before service">Fill from menu</button>}
      </div></div>}
    </div>
    {!!warnings.length && <ul className="warnings">{warnings.slice(0, 8).map((w) => <li key={w}>{w}</li>)}</ul>}

    <div className="tl-wrap">
      <div className="tl" style={{ '--lanes': LANES.length }}>
        <div className="tl-head"><span />{LANES.map((l) => <b key={l.k}>{l.label}</b>)}</div>
        <div className="tl-body" style={{ height: (hi - lo) * PPM }}>
          <div className="tl-gutter">{Array.from({ length: (hi - lo) / 60 + 1 }, (_, i) => <span key={i} style={{ top: i * 60 * PPM }}>{t12(lo + i * 60)}</span>)}</div>
          {Array.from({ length: (hi - lo) / 30 + 1 }, (_, i) => <div key={i} className={'tl-line' + (i % 2 ? ' half' : '')} style={{ top: i * 30 * PPM }} />)}
          {service != null && <div className="tl-service" style={{ top: (service - lo) * PPM }}><span>Served {t12(service)}</span></div>}
          {LANES.map((l, li) => <div key={l.k} className={'tl-lane' + (l.hot ? '' : ' prep')} style={{ gridColumn: li + 2 }}>
            {slots.filter((s) => s.lane === l.k).map((s) => {
              const p = lay[s.id] || { col: 0, cols: 1 };
              const a = toMin(s.start);
              return <button key={s.id} type="button" className={'blk' + (p.clash ? ' clash' : '') + (sel === s.id ? ' sel' : '') + (l.hot ? '' : ' prep')}
                style={{ top: (a - lo) * PPM, height: Math.max(Number(s.minutes) * PPM, 22), left: `calc(${(p.col / p.cols) * 100}% + 2px)`, width: `calc(${100 / p.cols}% - 4px)` }}
                onClick={() => setSel(sel === s.id ? null : s.id)} title={`${s.label} · ${t12(a)}–${t12(a + Number(s.minutes))}`}>
                <span className="blk-t">{t12(a)}–{t12(a + Number(s.minutes))}</span><span className="blk-l">{s.label}</span>
              </button>;
            })}
          </div>)}
        </div>
      </div>
    </div>

    {selected && <div className="slot-edit" key={selected.id}>
      <div className="toolbar between"><h3>{ro ? selected.label : 'Edit block'}</h3><button type="button" className="x" aria-label="Close" onClick={() => setSel(null)}>×</button></div>
      {ro ? <p>{laneLabel(selected.lane)} · {t12(toMin(selected.start))} for {selected.minutes} min</p> : <div className="facts">
        <label className="fact wide"><span>What</span><input id="se-l" defaultValue={selected.label} onBlur={(e) => setSlot(selected.id, { label: e.target.value })} /></label>
        <label className="fact"><span>Where</span><select id="se-lane" value={selected.lane} onChange={(e) => setSlot(selected.id, { lane: e.target.value })}>{LANES.map((l) => <option key={l.k} value={l.k}>{l.label}</option>)}</select></label>
        <label className="fact"><span>Starts</span><input id="se-s" type="time" value={selected.start} onChange={(e) => e.target.value && setSlot(selected.id, { start: e.target.value })} /></label>
        <label className="fact"><span>Minutes</span><input id="se-m" type="number" min="5" step="5" defaultValue={selected.minutes} onBlur={(e) => setSlot(selected.id, { minutes: Math.max(5, Number(e.target.value) || 5) })} /></label>
        <div className="fact actions-fact"><span>Ends {t12(toMin(selected.start) + Number(selected.minutes))}</span><div className="head-actions">
          <button type="button" className="btn small" onClick={() => { const id = uid(); setDay({ slots: [...slots, { ...selected, id, start: hhmm(toMin(selected.start) + Number(selected.minutes)) }] }); setSel(id); }}>Add after</button>
          <button type="button" className="btn small ghost" onClick={() => { setDay({ slots: slots.filter((s) => s.id !== selected.id) }); setSel(null); }}>Remove</button>
        </div></div>
      </div>}
    </div>}
    {!slots.length && <p className="muted hint">Nothing scheduled yet. Use + Block, or Fill from menu to place each hot dish so it finishes 15 minutes before service.</p>}
  </div>;
}
const short = (s) => (s || '').split(/[:(]/)[0].trim().slice(0, 40);

/* ================= Safety log ================= */
export const STAGES = [
  { k: 'cook-poultry', label: 'Cook – poultry', min: 165 },
  { k: 'cook-ground', label: 'Cook – ground meat', min: 160 },
  { k: 'cook-roast', label: 'Cook – beef or pork roast', min: 145 },
  { k: 'reheat', label: 'Reheat', min: 165 },
  { k: 'hot-hold', label: 'Hot hold (warmer / chafing)', min: 140 },
  { k: 'cold-hold', label: 'Cold hold / fridge', max: 40 },
  { k: 'cool-2', label: 'Cooling – 2 h check', max: 70 },
  { k: 'cool-6', label: 'Cooling – 6 h check', max: 40 },
  { k: 'freezer', label: 'Freezer', max: 0 },
];
const stageOf = (k) => STAGES.find((s) => s.k === k) || STAGES[0];
export const tempOk = (e) => { const s = stageOf(e.stage); const t = Number(e.tempF); if (e.tempF === '' || e.tempF == null || !isFinite(t)) return null; return s.min != null ? t >= s.min : t <= s.max; };
const target = (s) => (s.min != null ? `≥ ${s.min}°F` : `≤ ${s.max}°F`);
export const CHECKS = [
  'Allergy table set up apart from the regular buffet',
  'Allergy table has its own serving utensils',
  'Every dish on both tables is labelled',
  'Allergy dishes cooked and held in their own pans',
  'Surfaces sanitized and gloves changed before allergy prep',
  'Fridges at 40°F or below before prep starts',
  'Hand sink stocked (soap, paper towel)',
  'Warmers on and at 140°F or above before food goes out',
];

export function SafetyLog({ draft, update, ro, organizer, me, onDownload }) {
  const log = draft.tempLog || [];
  const checks = draft.checks || {};
  const [stage, setStage] = useState('hot-hold');
  const names = [...new Set((draft.dishes || []).map((d) => d.name))];
  const add = (e) => {
    e.preventDefault();
    const f = e.target.elements;
    const entry = { id: uid(), time: f.time.value || nowHHMM(), item: f.what.value.trim(), stage: f.stage.value, tempF: f.temp.value === '' ? '' : Number(f.temp.value), initials: f.initials.value.trim().toUpperCase(), action: f.fix.value.trim() };
    if (!entry.item || entry.tempF === '') return;
    update({ tempLog: [...log, entry] });
    e.target.reset(); f.time.value = nowHHMM(); f.stage.value = stage;
  };
  const sorted = [...log].sort((a, b) => (a.time || '').localeCompare(b.time || ''));
  const bad = log.filter((e) => tempOk(e) === false);
  return <div className="phase">
    <div className="toolbar between"><p className="muted">Temperature checks and the allergy table checklist for this event, kept with the event as a record.</p>
      <div className="head-actions"><button type="button" className="btn small" onClick={onDownload}>Download log</button></div></div>

    <h3>Allergy table and kitchen checklist</h3>
    <ul className="checks">{CHECKS.map((c) => <li key={c} className={checks[c]?.done ? 'done' : ''}>
      <label><input type="checkbox" id={'ck' + CHECKS.indexOf(c)} checked={!!checks[c]?.done} disabled={ro} onChange={(e) => update({ checks: { ...checks, [c]: e.target.checked ? { done: true, at: nowHHMM() } : { done: false } } })} />
        <span>{c}</span>{checks[c]?.done && checks[c]?.at && <span className="muted stamp">{t12(toMin(checks[c].at))}</span>}</label>
    </li>)}</ul>

    <div className="toolbar between"><h3>Temperature log</h3>{!!bad.length && <span className="pill red">{bad.length} out of range</span>}</div>
    {!log.length && <p className="muted hint">No temperatures logged yet.{ro ? '' : ' Add one below each time a dish is probed.'}</p>}
    {!!log.length && <div className="tablewrap"><table className="temps"><thead><tr><th>Time</th><th>Item</th><th>Check</th><th>Temp</th><th>By</th><th>Action taken</th><th /></tr></thead><tbody>
      {sorted.map((e) => { const ok = tempOk(e); const s = stageOf(e.stage); return <tr key={e.id} className={ok === false ? 'bad' : ''}>
        <td className="qty">{t12(toMin(e.time))}</td><td>{e.item}</td><td><span className="muted">{s.label}</span><br /><span className="target">{target(s)}</span></td>
        <td className="qty"><b>{e.tempF}°F</b> {ok === false ? <span className="pill red">Out</span> : <span className="pill green">OK</span>}</td>
        <td>{e.initials}</td>
        <td>{ro || !(organizer || !e.createdBy || e.createdBy === me) ? (e.action || '') : <input id={'ta' + e.id} aria-label="Action taken" defaultValue={e.action} placeholder={ok === false ? 'Required: what was done' : ''} onBlur={(x) => x.target.value !== e.action && update({ tempLog: log.map((y) => (y.id === e.id ? { ...y, action: x.target.value } : y)) })} />}
          {ok === false && !e.action && <span className="warn-inline">Record what was done</span>}</td>
        <td>{organizer && <button type="button" className="x" aria-label="Remove entry" onClick={() => update({ tempLog: log.filter((y) => y.id !== e.id) })}>×</button>}</td>
      </tr>; })}
    </tbody></table></div>}
    {!ro && <form className="temp-form" onSubmit={add}>
      <label><span>Time</span><input id="tf-time" name="time" type="time" defaultValue={nowHHMM()} /></label>
      <label className="grow"><span>Item</span><input id="tf-item" name="what" list="tf-items" placeholder="Creamy Tuscan Chicken, walk-in fridge…" required /></label>
      <datalist id="tf-items">{names.map((n) => <option key={n} value={n} />)}<option value="Walk-in fridge" /><option value="Reach-in fridge" /><option value="Freezer" /></datalist>
      <label><span>Check</span><select id="tf-stage" name="stage" value={stage} onChange={(e) => setStage(e.target.value)}>{STAGES.map((s) => <option key={s.k} value={s.k}>{s.label} ({target(s)})</option>)}</select></label>
      <label className="sm"><span>°F</span><input id="tf-temp" name="temp" type="number" inputMode="decimal" step="any" required /></label>
      <label className="sm"><span>Initials</span><input id="tf-init" name="initials" maxLength={4} /></label>
      <label className="grow"><span>Action (if out of range)</span><input id="tf-action" name="fix" placeholder="Back in the oven to 165°F" /></label>
      <button className="btn primary" type="submit">Log temperature</button>
    </form>}
    <p className="muted hint">Targets follow common Canadian food-safety guidance (Alberta uses 60°C / 140°F hot holding and 4°C / 40°F cold holding). Confirm them against your health inspector's requirements.</p>
  </div>;
}

/* ================= Downloads ================= */
export function daySheetHtml(ev, byId, tagLine) {
  const css = `body{font-family:Helvetica,Arial,sans-serif;font-size:11pt;margin:0.5in;color:#111}h1{font-size:20pt;margin:0 0 4px}h2{font-size:14pt;margin:22px 0 6px;border-bottom:2px solid #111;padding-bottom:3px}
  h3{font-size:12pt;margin:14px 0 4px}table{border-collapse:collapse;width:100%;table-layout:fixed}td,th{border:1px solid #444;padding:5px 6px;vertical-align:top;text-align:left;font-size:10pt}th{background:#eee}
  ul{margin:4px 0;padding-left:0;list-style:none}li{margin:3px 0}li:before{content:"☐  "}.muted{color:#555}.page{break-before:page}td.t{width:12%;font-weight:bold}`;
  const menu = ['regular', 'allergy'].map((t) => {
    const ds = (ev.dishes || []).filter((d) => d.table === t);
    if (!ds.length) return '';
    return `<h3>${t === 'regular' ? 'Regular buffet' : 'Allergy table'}</h3><table><tr><th>Dish</th><th style="width:22%">Labels</th><th style="width:12%">Batches</th></tr>${ds.map((d) => `<tr><td>${esc(d.name)}</td><td>${esc(tagLine(d.tags))}</td><td>${d.batches || ''}</td></tr>`).join('')}</table>`;
  }).join('');
  const prep = [...(ev.prepDays || [])].sort((a, b) => (a.date || '').localeCompare(b.date || '')).map((d) => `<h3>${esc(dayName(d.date))}: ${esc(d.title)}${d.crew ? ` <span class="muted">(${esc(d.crew)})</span>` : ''}</h3><ul>${d.tasks.map((t) => `<li>${esc(t.text)}</li>`).join('')}</ul>`).join('');
  const ovens = (ev.ovenDays || []).map((o) => {
    const times = [...new Set(o.slots.map((s) => toMin(s.start)))].sort((a, b) => a - b);
    const rows = times.map((t) => `<tr><td class="t">${t12(t)}</td>${LANES.map((l) => `<td>${o.slots.filter((s) => s.lane === l.k && toMin(s.start) === t).map((s) => `${esc(s.label)} <span class="muted">(until ${t12(t + Number(s.minutes))})</span>`).join('<br>')}</td>`).join('')}</tr>`).join('');
    return `<h3>${esc(o.title)}${o.service ? ` · food served ${t12(toMin(o.service))}` : ''}</h3><table><tr><th class="t">Time</th>${LANES.map((l) => `<th>${l.label}</th>`).join('')}</tr>${rows}</table>`;
  }).join('');
  return `<!doctype html><html><head><meta charset="utf-8"><title>${esc(ev.name)} – day sheet</title><style>${css}</style></head><body>
  <h1>${esc(ev.name)}</h1><div class="muted">${esc(dayName(ev.date))}${ev.guests ? ` · ${ev.guests} guests` : ''}</div>
  <h2>Menu</h2>${menu || '<p class="muted">No dishes.</p>'}
  ${prep ? `<h2>Prep days</h2>${prep}` : ''}
  ${ovens ? `<h2 class="page">Oven schedule</h2>${ovens}` : ''}
  <h2 class="page">Temperature log</h2><table><tr><th class="t">Time</th><th>Item</th><th style="width:22%">Check</th><th style="width:10%">°F</th><th style="width:8%">By</th><th>Action</th></tr>${Array.from({ length: 18 }, () => '<tr><td>&nbsp;</td><td></td><td></td><td></td><td></td><td></td></tr>').join('')}</table>
  </body></html>`;
}

export function safetyText(ev) {
  const lines = [`${ev.name} — safety log (${dayName(ev.date)})`, '', 'CHECKLIST'];
  for (const c of CHECKS) lines.push(`${ev.checks?.[c]?.done ? '[x]' : '[ ]'} ${c}${ev.checks?.[c]?.at ? '  (' + t12(toMin(ev.checks[c].at)) + ')' : ''}`);
  lines.push('', 'TEMPERATURES');
  for (const e of [...(ev.tempLog || [])].sort((a, b) => (a.time || '').localeCompare(b.time || ''))) {
    const s = stageOf(e.stage), ok = tempOk(e);
    lines.push(`${t12(toMin(e.time)).padEnd(9)} ${e.item} — ${s.label} ${e.tempF}°F (${target(s)}) ${ok === false ? 'OUT OF RANGE' : 'OK'}${e.initials ? ' — ' + e.initials : ''}${e.action ? ' — Action: ' + e.action : ''}`);
  }
  return lines.join('\n');
}
