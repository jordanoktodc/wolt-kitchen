// Supabase data layer. The UI works with the same nested "draft" shapes the
// prototype used; this file maps them to rows and writes only what changed.
import { createClient } from '@supabase/supabase-js';

// Capture invite / recovery links before supabase-js reads and clears the URL.
export const AUTH_LINK_TYPE = (() => {
  const m = (window.location.hash + window.location.search).match(/type=(invite|recovery|signup)/);
  return m ? m[1] : null;
})();

export const supabase = createClient(import.meta.env.VITE_SUPABASE_URL, import.meta.env.VITE_SUPABASE_ANON_KEY);

export const newId = () => crypto.randomUUID();
const hhmm = (t) => (t ? t.slice(0, 5) : null);
const edmontonHHMM = (iso) => (iso ? new Date(iso).toLocaleTimeString('en-CA', { timeZone: 'America/Edmonton', hour: '2-digit', minute: '2-digit', hour12: false }) : null);
const fail = (error) => { if (error) throw error; };

/* ---------------- recipes ---------------- */
export const recipeFromRow = (r) => ({
  id: r.id, name: r.name, category: r.category, batchLabel: r.batch_label, servingsPerBatch: r.servings_per_batch == null ? null : Number(r.servings_per_batch),
  tags: r.tags || {}, ingredients: r.ingredients || [], notes: r.notes, text: r.source_text, source: r.source_file, reviewed: r.reviewed,
  ovenProgram: r.oven_program || '', ovenMinutes: r.oven_minutes ?? null,
});
const recipeToRow = (r) => ({
  id: r.id, name: r.name, category: r.category, batch_label: r.batchLabel || '', servings_per_batch: r.servingsPerBatch ?? null,
  tags: r.tags || {}, ingredients: r.ingredients || [], notes: r.notes || '', source_text: r.text || '', source_file: r.source || null, reviewed: !!r.reviewed,
  oven_program: r.ovenProgram || '', oven_minutes: r.ovenMinutes ? Math.round(Number(r.ovenMinutes)) : null,
});
export async function loadRecipes() {
  const { data, error } = await supabase.from('recipes').select('*').order('name');
  fail(error); return data.map(recipeFromRow);
}
export async function deleteRecipe(id) {
  const { error } = await supabase.from('recipes').delete().eq('id', id); fail(error);
}
export async function saveRecipe(r) {
  const { error } = await supabase.from('recipes').upsert(recipeToRow(r)); fail(error);
}

/* ---------------- products (store items + which ingredient each covers) ---------------- */
export async function loadProducts() {
  const { data, error } = await supabase.from('products').select('*').order('store').order('name');
  fail(error); return data;
}
export async function loadProductLinks() {
  const { data, error } = await supabase.from('ingredient_products').select('*');
  fail(error); return Object.fromEntries(data.map((l) => [l.item_key, l.product_id]));
}
export async function saveProduct(p) {
  const row = { id: p.id || newId(), name: p.name, store: p.store || 'Costco', item_number: p.item_number || '', pack_qty: Number(p.pack_qty) || 1,
    pack_unit: p.pack_unit || '', pack_label: p.pack_label || '', equiv_qty: p.equiv_qty === '' || p.equiv_qty == null ? null : Number(p.equiv_qty),
    equiv_unit: p.equiv_unit || null, price: p.price === '' || p.price == null ? null : Number(p.price), notes: p.notes || '' };
  const { error } = await supabase.from('products').upsert(row); fail(error);
  return row.id;
}
export async function deleteProduct(id) {
  const { error } = await supabase.from('products').delete().eq('id', id); fail(error);
}
export async function linkIngredient(itemKey, productId) {
  const q = productId ? supabase.from('ingredient_products').upsert({ item_key: itemKey, product_id: productId }) : supabase.from('ingredient_products').delete().eq('item_key', itemKey);
  const { error } = await q; fail(error);
}

/* ---------------- reference ---------------- */
export async function loadReference() {
  const { data, error } = await supabase.from('reference_notes').select('*').order('sort');
  fail(error); return { sections: data.map((r) => ({ title: r.title, text: r.body })) };
}

/* ---------------- people ---------------- */
export async function loadProfiles() {
  const { data, error } = await supabase.from('profiles').select('*').order('full_name');
  fail(error); return data;
}
export async function setRole(id, role) {
  const { error } = await supabase.from('profiles').update({ role }).eq('id', id); fail(error);
}

/* ---------------- events ---------------- */
export async function loadEventList() {
  const { data, error } = await supabase.from('events').select('id, name, event_date, guests, imported, event_dishes(count)');
  fail(error);
  return data.map((e) => ({ id: e.id, name: e.name, date: e.event_date, guests: e.guests, imported: e.imported, dishCount: e.event_dishes?.[0]?.count ?? 0 }));
}

export async function loadEvent(id) {
  const { data: e, error } = await supabase.from('events')
    .select('*, event_dishes(*), prep_days(*, prep_tasks(*)), oven_schedules(*, oven_slots(*)), temp_logs(*), event_checks(*)')
    .eq('id', id).single();
  fail(error);
  const bySort = (a, b) => (a.sort ?? 0) - (b.sort ?? 0);
  return {
    id: e.id, name: e.name, date: e.event_date, guests: e.guests, notes: e.notes, extras: e.extras || [], checked: e.grocery_checked || {}, stores: e.grocery_stores || {},
    imported: e.imported, source: e.source_file, planText: e.plan_text,
    dishes: e.event_dishes.sort(bySort).map((d) => ({ key: d.id, recipeId: d.recipe_id, name: d.name, table: d.buffet, batches: Number(d.batches), tags: d.tags || {}, labelCopies: d.label_copies })),
    prepDays: e.prep_days.sort(bySort).map((d) => ({ id: d.id, date: d.day_date, title: d.title, crew: d.crew,
      tasks: d.prep_tasks.sort(bySort).map((t) => ({ id: t.id, text: t.text, done: t.done, doneAt: t.done_at })) })),
    ovenDays: e.oven_schedules.sort(bySort).map((s) => ({ id: s.id, title: s.title, service: hhmm(s.service_time),
      slots: s.oven_slots.map((x) => ({ id: x.id, lane: x.lane, start: hhmm(x.start_time), minutes: x.minutes, label: x.label, dishKey: x.dish_id })) })),
    tempLog: e.temp_logs.map((t) => ({ id: t.id, time: hhmm(t.logged_at), item: t.item, stage: t.stage, tempF: Number(t.temp_f), initials: t.initials, action: t.action, createdBy: t.created_by })),
    checks: Object.fromEntries(e.event_checks.map((c) => [c.item, { done: c.done, at: edmontonHHMM(c.done_at), doneAt: c.done_at }])),
  };
}

// Flatten a draft into rows, keyed per table.
function toRows(ev) {
  const dishKeys = new Set((ev.dishes || []).map((d) => d.key));
  const rows = {
    events: [{ id: ev.id, name: ev.name || 'Untitled event', event_date: ev.date || null, guests: Number(ev.guests) || 0, notes: ev.notes || '', extras: ev.extras || [], grocery_checked: ev.checked || {}, grocery_stores: ev.stores || {} }],
    event_dishes: (ev.dishes || []).map((d, i) => ({ id: d.key, event_id: ev.id, buffet: d.table, name: d.name, recipe_id: d.recipeId || null, batches: Number(d.batches) || 0, tags: d.tags || {}, label_copies: Number(d.labelCopies) || 0, sort: i })),
    prep_days: (ev.prepDays || []).map((d, i) => ({ id: d.id, event_id: ev.id, day_date: d.date || null, title: d.title || '', crew: d.crew || '', sort: i })),
    prep_tasks: (ev.prepDays || []).flatMap((d) => d.tasks.map((t, i) => ({ id: t.id, prep_day_id: d.id, event_id: ev.id, text: t.text, done: !!t.done, sort: i }))),
    oven_schedules: (ev.ovenDays || []).map((s, i) => ({ id: s.id, event_id: ev.id, title: s.title || '', service_time: s.service || null, sort: i })),
    oven_slots: (ev.ovenDays || []).flatMap((s) => s.slots.map((x) => ({ id: x.id, schedule_id: s.id, lane: x.lane, start_time: x.start, minutes: Number(x.minutes) || 5, label: x.label || '', dish_id: dishKeys.has(x.dishKey) ? x.dishKey : null }))),
    temp_logs: (ev.tempLog || []).map((t) => ({ id: t.id, event_id: ev.id, logged_at: t.time, item: t.item, stage: t.stage, temp_f: Number(t.tempF), initials: t.initials || '', action: t.action || '' })),
    event_checks: Object.entries(ev.checks || {}).map(([item, c]) => ({ event_id: ev.id, item, done: !!c.done })),
  };
  return rows;
}
const keyOf = (table, r) => (table === 'event_checks' ? r.item : r.id);
const PARENTS_FIRST = ['events', 'event_dishes', 'prep_days', 'prep_tasks', 'oven_schedules', 'oven_slots', 'temp_logs', 'event_checks'];

// Write the difference between two drafts. Inserts new rows, updates changed
// rows, deletes removed ones — so a volunteer ticking a task touches one row.
export async function syncEvent(prev, next) {
  const a = toRows(prev), b = toRows(next);
  const { data: { user } } = await supabase.auth.getUser();
  for (const t of PARENTS_FIRST) {
    const before = new Map(a[t].map((r) => [keyOf(t, r), r]));
    for (const r of b[t]) {
      const old = before.get(keyOf(t, r));
      if (!old) {
        let row = r;
        if (t === 'event_checks') row = { ...r, done_by: r.done ? user?.id : null, done_at: r.done ? new Date().toISOString() : null };
        const { error } = await supabase.from(t).insert(row); fail(error);
      } else if (JSON.stringify(old) !== JSON.stringify(r)) {
        let patch = r;
        if (t === 'event_checks') patch = { done: r.done, done_by: r.done ? user?.id : null, done_at: r.done ? new Date().toISOString() : null };
        const q = supabase.from(t).update(patch);
        const { error } = t === 'event_checks' ? await q.eq('event_id', r.event_id).eq('item', r.item) : await q.eq('id', r.id);
        fail(error);
      }
    }
  }
  for (const t of [...PARENTS_FIRST].reverse()) {
    const after = new Set(b[t].map((r) => keyOf(t, r)));
    const gone = a[t].filter((r) => !after.has(keyOf(t, r)));
    if (!gone.length || t === 'events') continue;
    const q = supabase.from(t).delete();
    const { error } = t === 'event_checks' ? await q.eq('event_id', next.id).in('item', gone.map((r) => r.item)) : await q.in('id', gone.map((r) => r.id));
    fail(error);
  }
}

export async function createEvent(today, id = newId(), name = 'New event') {
  const { error } = await supabase.from('events').insert({ id, name, event_date: today, guests: 0 }); fail(error);
  return id;
}
// Imported events keep where they came from and the original text (not part of the normal diff sync).
export async function markImported(ev) {
  const { error } = await supabase.from('events').update({ imported: true, source_file: ev.source || null, plan_text: ev.planText || null }).eq('id', ev.id); fail(error);
}
export async function deleteEvent(id) {
  const { error } = await supabase.from('events').delete().eq('id', id); fail(error);
}

// Plain browser download (the prototype used the artifact downloads capability).
export function download(filename, data, type = 'text/plain') {
  const blob = new Blob([data], { type: filename.endsWith('.html') ? 'text/html' : type });
  const url = URL.createObjectURL(blob);
  const a = Object.assign(document.createElement('a'), { href: url, download: filename });
  document.body.appendChild(a); a.click(); a.remove();
  setTimeout(() => URL.revokeObjectURL(url), 1000);
}
