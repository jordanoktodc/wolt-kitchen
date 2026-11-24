import React, { useState, useEffect, useMemo, useRef, useCallback } from 'react';
import { Routes, Route, useNavigate, useParams, useLocation, Navigate } from 'react-router-dom';
import { PrepDays, OvenSchedule, SafetyLog, daySheetHtml, safetyText } from './phase2.jsx';
import { fmtIng, baseQty, family, itemKey, allergenHits, UNITS } from './units.js';
import { Products, GroceryTab } from './products.jsx';
import { readInput, importRecipe, importEvent } from './lib/importDoc.js';
import { supabase, AUTH_LINK_TYPE, loadRecipes, saveRecipe, deleteRecipe, loadReference, loadEventList, loadEvent, syncEvent, createEvent, deleteEvent, markImported, download, loadProfiles, setRole, loadProducts, loadProductLinks } from './lib/db.js';

const CATS = ['Protein', 'Starch', 'Vegetable', 'Salad', 'Soup', 'Sauce & dressing', 'Bread', 'Other'];
const TAGS = [
  { k: 'gf', label: 'GF', long: 'Gluten free' },
  { k: 'df', label: 'DF', long: 'Dairy free' },
  { k: 'garlicFree', label: 'Garlic free', long: 'Garlic free' },
  { k: 'containsNuts', label: 'Contains nuts', long: 'Contains nuts' },
];
const uid = () => crypto.randomUUID();
const today = () => new Date().toLocaleDateString('en-CA', { timeZone: 'America/Edmonton' });
const fmtDate = (d) => {
  if (!d) return 'No date';
  const [y, m, day] = d.split('-').map(Number);
  return new Date(y, m - 1, day).toLocaleDateString('en-CA', { weekday: 'short', month: 'short', day: 'numeric', year: 'numeric' });
};
const tagLine = (tags = {}) => TAGS.filter((t) => tags[t.k]).map((t) => t.label).join(', ');

/* ---------- data layer ---------- */
function useStore(session) {
  const [state, setState] = useState({ status: 'loading', recipes: [], events: [], reference: null, profile: null, products: [], links: {} });
  const refresh = useCallback(async (what = ['recipes', 'events', 'reference', 'profile', 'products', 'links']) => {
    try {
      const patch = {};
      if (what.includes('recipes')) patch.recipes = await loadRecipes();
      if (what.includes('events')) patch.events = await loadEventList();
      if (what.includes('reference')) patch.reference = await loadReference();
      if (what.includes('products')) patch.products = await loadProducts().catch(() => []);
      if (what.includes('links')) patch.links = await loadProductLinks().catch(() => ({}));
      if (what.includes('profile')) {
        const { data } = await supabase.from('profiles').select('*').eq('id', session.user.id).single();
        patch.profile = data;
      }
      setState((st) => ({ ...st, ...patch, status: 'ready' }));
    } catch (e) {
      console.error(e);
      setState((st) => ({ ...st, status: 'error' }));
    }
  }, [session]);
  useEffect(() => { refresh(); }, [refresh]);
  useEffect(() => {
    const f = () => { if (document.visibilityState === 'visible') refresh(['recipes', 'events']); };
    document.addEventListener('visibilitychange', f);
    return () => document.removeEventListener('visibilitychange', f);
  }, [refresh]);
  const organizer = state.profile?.role === 'organizer';
  return { ...state, canEdit: organizer, organizer, refresh };
}

/* ---------- logo (chef's hat) ---------- */
function Logo({ size = 28, className = '' }) {
  return <svg className={'logo ' + className} width={size} height={size} viewBox="0 0 64 64" aria-hidden="true">
    <rect width="64" height="64" rx="14" fill="#1f5fa8" />
    <g fill="#fff"><circle cx="22" cy="26" r="9" /><circle cx="32" cy="21" r="11" /><circle cx="42" cy="26" r="9" /><rect x="19" y="27" width="26" height="17" rx="2" /></g>
    <rect x="19" y="44" width="26" height="7" rx="2" fill="#f2b233" />
    <path d="M26 36v6M32 34v8M38 36v6" stroke="#1f5fa8" strokeOpacity=".25" strokeWidth="2" strokeLinecap="round" />
  </svg>;
}

/* ---------- small pieces ---------- */
function Chip({ on, children, onClick, warn }) {
  return <button type="button" className={'chip' + (on ? ' on' : '') + (warn ? ' warn' : '')} onClick={onClick} aria-pressed={!!on}>{children}</button>;
}
function TagChips({ tags = {}, onChange, readOnly }) {
  return <div className="chips">{TAGS.map((t) => (
    readOnly ? (tags[t.k] ? <span key={t.k} className="chip on static">{t.label}</span> : null)
      : <Chip key={t.k} on={tags[t.k]} onClick={() => onChange({ ...tags, [t.k]: !tags[t.k] })}>{t.label}</Chip>
  ))}</div>;
}
function warningsFor(tags = {}, ingredients) {
  const h = allergenHits(ingredients);
  const w = [];
  if (tags.gf && h.gf.length) w.push(`Marked GF but lists ${h.gf.join(', ')}`);
  if (tags.df && h.df.length) w.push(`Marked DF but lists ${h.df.join(', ')}`);
  if (tags.garlicFree && h.garlicFree.length) w.push('Marked garlic free but lists garlic');
  if (!tags.containsNuts && h.nutFree.length) w.push(`Lists ${h.nutFree.join(', ')}: label should say contains nuts`);
  return w;
}
function Warnings({ list }) {
  if (!list.length) return null;
  return <ul className="warnings">{list.map((w) => <li key={w}>{w}</li>)}</ul>;
}
function Empty({ title, children }) {
  return <div className="empty"><h3>{title}</h3><div>{children}</div></div>;
}

/* ---------- error boundary (a screen that crashes shows a message, not a blank app) ---------- */
class ErrorBoundary extends React.Component {
  constructor(p) { super(p); this.state = { err: null }; }
  static getDerivedStateFromError(err) { return { err }; }
  componentDidCatch(err, info) { console.error(err, info); }
  componentDidUpdate(prev) { if (prev.resetKey !== this.props.resetKey && this.state.err) this.setState({ err: null }); }
  render() {
    if (!this.state.err) return this.props.children;
    return <Empty title="Something went wrong on this screen">Go back and try again. If it keeps happening, tell Jordan what you were doing. <div style={{ marginTop: 12 }}><button type="button" className="btn small" onClick={() => window.location.reload()}>Reload</button></div></Empty>;
  }
}

/* ---------- change password ---------- */
function ChangePassword({ onClose, setMsg }) {
  const [err, setErr] = useState('');
  const [busy, setBusy] = useState(false);
  const submit = async (e) => {
    e.preventDefault();
    const f = e.target.elements;
    if (f.pw.value.length < 8) return setErr('Use at least 8 characters.');
    if (f.pw.value !== f.pw2.value) return setErr('The two passwords don’t match.');
    setBusy(true);
    const { error } = await supabase.auth.updateUser({ password: f.pw.value });
    setBusy(false);
    if (error) return setErr(error.message);
    setMsg('Password changed'); onClose();
  };
  return <div className="modal-overlay" onClick={onClose}>
    <form className="modal" role="dialog" aria-modal="true" aria-labelledby="cp-title" onClick={(e) => e.stopPropagation()} onSubmit={submit}>
      <div className="modal-header"><b id="cp-title">Change password</b><button type="button" className="x" aria-label="Close" onClick={onClose}>×</button></div>
      <div className="modal-body">
        <label className="fact"><span>New password (8+ characters)</span><input id="cp-pw" name="pw" type="password" autoComplete="new-password" autoFocus required /></label>
        <label className="fact"><span>Type it again</span><input id="cp-pw2" name="pw2" type="password" autoComplete="new-password" required /></label>
        {err && <p className="notice">{err}</p>}
      </div>
      <div className="modal-footer"><button type="button" className="btn ghost" onClick={onClose}>Cancel</button><button type="submit" className="btn primary" disabled={busy}>{busy ? 'Saving…' : 'Change password'}</button></div>
    </form>
  </div>;
}

/* ---------- import dialog ---------- */
function ImportDialog({ kind, onClose, onDone }) {
  const [file, setFile] = useState(null);
  const [pasted, setPasted] = useState('');
  const [busy, setBusy] = useState(false);
  const [err, setErr] = useState('');
  const go = async () => {
    setBusy(true); setErr('');
    try { const input = await readInput({ file, pasted }); await onDone(input); }
    catch (e) { setErr(e.message || 'Could not read that.'); setBusy(false); }
  };
  const what = kind === 'recipe' ? 'recipe' : 'menu or event plan';
  return <div className="modal-overlay" onClick={busy ? undefined : onClose}>
    <div className="modal" role="dialog" aria-modal="true" aria-labelledby="imp-title" onClick={(e) => e.stopPropagation()}>
      <div className="modal-header"><b id="imp-title">Import a {what}</b><button type="button" className="x" aria-label="Close" onClick={onClose} disabled={busy}>×</button></div>
      <div className="modal-body">
        <p className="muted hint">Upload the Word doc, a PDF, or a photo of the {kind === 'recipe' ? 'recipe card' : 'plan'}, or paste the text. It’s read for you and opened as a new {kind} to check before anything is saved{kind === 'event' ? '' : ''}.</p>
        <label className="fact"><span>File</span><input id="imp-file" type="file" accept=".docx,.pdf,.txt,image/*" disabled={busy} onChange={(e) => setFile(e.target.files?.[0] || null)} /></label>
        <div className="or"><span>or</span></div>
        <label className="fact"><span>Paste text</span><textarea id="imp-text" rows="6" disabled={busy} value={pasted} onChange={(e) => setPasted(e.target.value)} placeholder={kind === 'recipe' ? 'Balsamic Fig Chicken\n3 Tbsp butter…' : 'Smith Wedding – Oct 3\nRegular table: …'} /></label>
        {err && <p className="notice">{err}</p>}
      </div>
      <div className="modal-footer">
        <button type="button" className="btn ghost" onClick={onClose} disabled={busy}>Cancel</button>
        <button type="button" className="btn primary" onClick={go} disabled={busy || (!file && !pasted.trim())}>{busy ? 'Reading… this takes about 20 seconds' : 'Read it'}</button>
      </div>
    </div>
  </div>;
}

const slugify = (s) => (s || 'recipe').toLowerCase().normalize('NFKD').replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '').slice(0, 60) || 'recipe';
const BLANK_RECIPE = { id: null, name: '', ovenProgram: '', ovenMinutes: null, category: 'Other', batchLabel: '', servingsPerBatch: null, tags: {}, ingredients: [{ qty: null, unit: null, item: '' }], notes: '', text: '', source: null, reviewed: false };

/* ---------- recipes ---------- */
function RecipeList({ recipes, open, organizer, onNew, onImport }) {
  const [q, setQ] = useState('');
  const [cat, setCat] = useState('All');
  const list = recipes
    .filter((r) => cat === 'All' || r.category === cat)
    .filter((r) => !q || (r.name + ' ' + (r.ingredients || []).map((i) => i.item).join(' ')).toLowerCase().includes(q.toLowerCase()))
    .sort((a, b) => a.name.localeCompare(b.name));
  const counts = useMemo(() => Object.fromEntries(CATS.map((c) => [c, recipes.filter((r) => r.category === c).length])), [recipes]);
  return <section>
    <div className="toolbar">
      <input id="recipe-search" type="search" placeholder="Search recipes or ingredients" value={q} onChange={(e) => setQ(e.target.value)} />
      {organizer && <div className="head-actions push-right">
        <button type="button" className="btn" onClick={onImport}><i className="ti ti-file-import" />Import</button>
        <button type="button" className="btn primary" onClick={onNew}><i className="ti ti-plus" />New recipe</button>
      </div>}
    </div>
    <div className="chips scroll">
      <Chip on={cat === 'All'} onClick={() => setCat('All')}>All {recipes.length}</Chip>
      {CATS.filter((c) => counts[c]).map((c) => <Chip key={c} on={cat === c} onClick={() => setCat(c)}>{c} {counts[c]}</Chip>)}
    </div>
    {!list.length ? <Empty title="No recipes match">Try a different word, or clear the category filter.</Empty> :
      <ul className="rows">{list.map((r) => (
        <li key={r.id}><button type="button" className="row" onClick={() => open(r.id)}>
          <span className="row-main"><span className="row-title">{r.name}</span><span className="row-sub">{r.batchLabel || 'Batch size not set'}</span></span>
          <span className="row-meta"><span className="cat">{r.category}</span>{organizer && !r.reviewed && <span className="pill amber">Check import</span>}</span>
        </button></li>
      ))}</ul>}
  </section>;
}

function RecipeDetail({ recipe, store, back, setMsg, isNew = false, onCreated }) {
  const [mult, setMult] = useState(1);
  const [confirmDel, setConfirmDel] = useState(false);
  const [edit, setEdit] = useState(isNew);
  const [draft, setDraft] = useState(recipe);
  const [showDoc, setShowDoc] = useState(false);
  useEffect(() => { if (!edit) setDraft(recipe); }, [recipe, edit]);
  const r = edit ? draft : recipe;
  const set = (patch) => setDraft((d) => ({ ...d, ...patch }));
  const setIng = (i, patch) => set({ ingredients: draft.ingredients.map((x, j) => (j === i ? { ...x, ...patch } : x)) });
  const commit = async () => {
    if (!draft.name.trim()) { setMsg('Give the recipe a name first.'); return; }
    let id = draft.id;
    if (isNew) { const base = slugify(draft.name); id = base; let n = 2; while (store.recipes.some((x) => x.id === id)) id = `${base}-${n++}`; }
    const ingredients = (draft.ingredients || []).filter((i) => (i.item || '').trim());
    try { await saveRecipe({ ...draft, id, ingredients, reviewed: true }); setMsg('Saved'); setEdit(false); await store.refresh(['recipes']); if (isNew && onCreated) onCreated(id); }
    catch (e) { setMsg('Could not save the recipe. ' + (e.message || '')); }
  };
  const warn = warningsFor(r.tags, r.ingredients);
  return <section className="detail">
    <header className="detail-head">
      {edit ? <label className="fact grow"><span>Recipe name</span><input id="r-name" value={draft.name} placeholder="e.g. Creamy Tuscan Chicken" autoFocus={isNew} onChange={(e) => set({ name: e.target.value })} /></label> : <h2>{r.name}</h2>}
      <div className="head-actions">
        {store.canEdit && !edit && <button type="button" className="btn" onClick={() => setEdit(true)}>Edit recipe</button>}
        {edit && <><button type="button" className="btn ghost" onClick={() => (isNew ? back() : setEdit(false))}>Cancel</button><button type="button" className="btn primary" onClick={commit}>Save recipe</button></>}
      </div>
    </header>
    {isNew && r.source && <p className="notice">Read from <b>{r.source}</b>. Check the name, batch size, allergen tags and every ingredient against the original below, then save.</p>}
    {store.organizer && !r.reviewed && !edit && <p className="notice">Imported automatically from <b>{r.source}</b>. Check the ingredient list against the original below, then save it to mark it checked.</p>}

    <div className="facts">
      <label className="fact"><span>Category</span>
        {edit ? <select id="r-cat" value={draft.category} onChange={(e) => set({ category: e.target.value })}>{CATS.map((c) => <option key={c}>{c}</option>)}</select> : <b>{r.category}</b>}
      </label>
      <label className="fact wide"><span>One batch is</span>
        {edit ? <input id="r-batch" value={draft.batchLabel || ''} placeholder="e.g. 1 full steam pan" onChange={(e) => set({ batchLabel: e.target.value })} /> : <b>{r.batchLabel || 'Not set'}</b>}
      </label>
      <label className="fact"><span>Servings per batch</span>
        {edit ? <input id="r-serv" type="number" min="0" inputMode="numeric" value={draft.servingsPerBatch ?? ''} onChange={(e) => set({ servingsPerBatch: e.target.value === '' ? null : Number(e.target.value) })} /> : <b>{r.servingsPerBatch || 'Not set'}</b>}
      </label>
      <label className="fact wide"><span>Oven program</span>
        {edit ? <input id="r-prog" value={draft.ovenProgram || ''} placeholder="e.g. Poultry › Roast, probe 170°F" onChange={(e) => set({ ovenProgram: e.target.value })} /> : <b>{r.ovenProgram || 'Not set'}</b>}
      </label>
      <label className="fact"><span>Oven time (min)</span>
        {edit ? <input id="r-min" type="number" min="1" inputMode="numeric" value={draft.ovenMinutes ?? ''} placeholder="e.g. 45" onChange={(e) => set({ ovenMinutes: e.target.value === '' ? null : Number(e.target.value) })} /> : <b>{r.ovenMinutes ? `${r.ovenMinutes} min` : 'Not set'}</b>}
      </label>
    </div>
    <div className="fact-tags"><span className="label">Usually labelled</span>
      <TagChips tags={r.tags} readOnly={!edit} onChange={(tags) => set({ tags })} />
      {!edit && !tagLine(r.tags) && <span className="muted">No allergen tags yet</span>}
    </div>
    <Warnings list={warn} />

    <div className="ing-head">
      <h3>Ingredients</h3>
      {!edit && <div className="scaler"><span>Batches</span>
        {[0.5, 1, 2, 5, 10].map((m) => <Chip key={m} on={mult === m} onClick={() => setMult(m)}>{m === 0.5 ? '½' : m}×</Chip>)}
        <input id="r-mult" type="number" min="0" step="0.5" aria-label="Custom batches" value={mult} onChange={(e) => setMult(Number(e.target.value) || 0)} />
      </div>}
    </div>
    {edit ? <div className="tablewrap"><table className="ing edit"><thead><tr><th>Qty</th><th>Unit</th><th>Ingredient</th><th></th></tr></thead><tbody>
      {draft.ingredients.map((i, n) => <tr key={n}>
        <td><input id={`q${n}`} type="number" step="any" value={i.qty ?? ''} onChange={(e) => setIng(n, { qty: e.target.value === '' ? null : Number(e.target.value), plus: null, qtyMax: null })} /></td>
        <td><select id={`u${n}`} value={i.unit || ''} onChange={(e) => setIng(n, { unit: e.target.value || null, plus: null })}>{UNITS.map((u) => <option key={u} value={u}>{u || '—'}</option>)}</select></td>
        <td><input id={`i${n}`} value={i.item} onChange={(e) => setIng(n, { item: e.target.value })} /></td>
        <td><button type="button" className="x" aria-label="Remove ingredient" onClick={() => set({ ingredients: draft.ingredients.filter((_, j) => j !== n) })}>×</button></td>
      </tr>)}
    </tbody></table><button type="button" className="btn ghost small" onClick={() => set({ ingredients: [...draft.ingredients, { qty: null, unit: null, item: '' }] })}>+ Add ingredient</button></div>
      : <div className="tablewrap"><table className="ing"><tbody>{(r.ingredients || []).map((i, n) => (
        <tr key={n}><td className="qty">{fmtIng(i, mult) || <span className="muted">as needed</span>}</td><td>{i.item}</td></tr>
      ))}</tbody></table></div>}

    {edit && <label className="fact wide notes"><span>Kitchen notes</span><textarea id="r-notes" rows="3" value={draft.notes || ''} onChange={(e) => set({ notes: e.target.value })} placeholder="Oven pathway, pan counts, what worked last time" /></label>}
    {!edit && r.notes && <div className="notes-view"><h3>Kitchen notes</h3><p>{r.notes}</p></div>}

    <div className="doc">
      <button type="button" className="btn ghost" onClick={() => setShowDoc(!showDoc)} aria-expanded={showDoc}>{showDoc ? 'Hide' : 'Show'} the original recipe, method and oven settings</button>
      {showDoc && (r.text ? <pre className="doctext">{r.text}</pre> : <p className="muted hint">No original text for this recipe.</p>)}
    </div>
      {store.organizer && !isNew && !edit && <div className="danger">
      {confirmDel ? <span>Delete this recipe for everyone? Events that use it keep the dish, just unlinked. <button type="button" className="btn small danger-btn" onClick={async () => { try { await deleteRecipe(recipe.id); setMsg('Recipe deleted'); await store.refresh(['recipes']); back(); } catch (e) { setMsg('Could not delete: ' + e.message); } }}>Delete recipe</button> <button type="button" className="btn small ghost" onClick={() => setConfirmDel(false)}>Keep it</button></span>
        : <button type="button" className="btn ghost small" onClick={() => setConfirmDel(true)}>Delete recipe</button>}
    </div>}
  </section>;
}

/* ---------- events ---------- */
function EventList({ events, open, create, canEdit, onImport }) {
  const t = today();
  const sorted = [...events].sort((a, b) => (a.date || '').localeCompare(b.date || ''));
  const upcoming = sorted.filter((e) => e.date && e.date >= t);
  const past = sorted.filter((e) => e.date && e.date < t).reverse();
  const undated = sorted.filter((e) => !e.date).sort((a, b) => a.name.localeCompare(b.name));
  const Card = ({ e }) => <li><button type="button" className="row" onClick={() => open(e.id)}>
    <span className="date-block"><b>{e.date ? fmtDate(e.date).split(',')[1]?.trim().split(' ')[1] || '' : '—'}</b><span>{e.date ? fmtDate(e.date).split(',')[1]?.trim().split(' ')[0] : ''}</span></span>
    <span className="row-main"><span className="row-title">{e.name}</span><span className="row-sub">{fmtDate(e.date)} · {e.guests ? e.guests + ' guests' : 'guests not set'} · {e.dishCount} dishes</span></span>
    {e.imported && <span className="row-meta"><span className="pill muted-pill">From plan doc</span></span>}
  </button></li>;
  return <section>
    <div className="toolbar between">{canEdit && <div className="head-actions push-right"><button type="button" className="btn" onClick={onImport}><i className="ti ti-file-import" />Import</button><button type="button" className="btn primary" onClick={create}><i className="ti ti-plus" />New event</button></div>}</div>
    {!events.length && <Empty title="No events planned yet">{canEdit ? 'Start with New event: name it, set the guest count, then add dishes from the recipe library.' : 'Events the organizers plan will show up here.'}</Empty>}
    {!!upcoming.length && <><h3 className="group">Coming up</h3><ul className="rows">{upcoming.map((e) => <Card key={e.id} e={e} />)}</ul></>}
    {!!past.length && <><h3 className="group">Past</h3><ul className="rows">{past.map((e) => <Card key={e.id} e={e} />)}</ul></>}
    {!!undated.length && <><h3 className="group">No date</h3><ul className="rows">{undated.map((e) => <Card key={e.id} e={e} />)}</ul></>}
  </section>;
}

function aggregate(ev, byId) {
  const map = new Map();
  for (const d of ev.dishes || []) {
    const r = byId[d.recipeId];
    if (!r || !d.batches) continue;
    for (const ing of r.ingredients || []) {
      const key0 = itemKey(ing.item);
      if (!key0) continue;
      const b = baseQty(ing);
      const fam = b == null ? 'none' : family(ing.unit);
      const key = key0 + '|' + fam;
      if (!map.has(key)) map.set(key, { key, name: key0, fam, pref: ing.unit, total: 0, from: new Set(), loose: b == null });
      const row = map.get(key);
      if (b != null) row.total += b * d.batches;
      row.from.add(r.name);
    }
  }
  return [...map.values()].sort((a, b) => a.name.localeCompare(b.name));
}

function labelsHtml(ev) {
  const cards = [];
  const tables = [['regular', 'Regular buffet'], ['allergy', 'Allergy table']];
  for (const [t] of tables) for (const d of (ev.dishes || []).filter((x) => x.table === t)) {
    const n = Math.max(0, Number(d.labelCopies ?? (t === 'regular' ? 6 : 1)));
    for (let i = 0; i < n; i++) cards.push(`<div class="l ${t}"><div class="n">${esc(d.name)}</div><div class="t">${esc(tagLine(d.tags)) || '&nbsp;'}</div>${t === 'allergy' ? '<div class="a">Allergy table</div>' : ''}</div>`);
  }
  return `<!doctype html><html><head><meta charset="utf-8"><title>${esc(ev.name)} – buffet labels</title><style>
@page{size:letter;margin:0.4in}body{font-family:Georgia,serif;margin:0}.g{display:grid;grid-template-columns:1fr 1fr;gap:0.2in}
.l{border:1.5px solid #333;border-radius:6px;height:2.1in;display:flex;flex-direction:column;align-items:center;justify-content:center;text-align:center;padding:0.15in;break-inside:avoid}
.n{font-size:24pt;line-height:1.15}.t{font-family:Helvetica,Arial,sans-serif;font-size:13pt;letter-spacing:.06em;margin-top:.12in;text-transform:uppercase}
.a{font-family:Helvetica,Arial,sans-serif;font-size:10pt;margin-top:.1in;border-top:1px solid #333;padding-top:.05in}</style></head>
<body><div class="g">${cards.join('')}</div></body></html>`;
}
function esc(s) { return String(s || '').replace(/[&<>"]/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c])); }

function Picker({ table, recipes, addDish, close }) {
    const [q, setQ] = useState('');
    const list = recipes.filter((r) => !q || r.name.toLowerCase().includes(q.toLowerCase())).sort((a, b) => a.name.localeCompare(b.name)).slice(0, 40);
    return <div className="picker">
      <input id={'pick-' + table} autoFocus type="search" placeholder="Find a recipe to add" value={q} onChange={(e) => setQ(e.target.value)} />
      <ul>{list.map((r) => <li key={r.id}><button type="button" onClick={() => addDish(r, table)}>{r.name}<span className="muted"> · {r.category}</span></button></li>)}</ul>
      <button type="button" className="btn ghost small" onClick={close}>Close</button>
    </div>;
  }

function EventLoader({ store, setMsg }) {
  const { id } = useParams();
  const nav = useNavigate();
  const [ev, setEv] = useState(null);
  const [err, setErr] = useState(null);
  useEffect(() => { let on = true; setEv(null); loadEvent(id).then((e) => on && setEv(e), (e) => on && setErr(e)); return () => { on = false; }; }, [id]);
  if (err) return <Empty title="Couldn't open this event">It may have been deleted. <button type="button" className="btn small" onClick={() => nav('/events')}>Back to events</button></Empty>;
  if (!ev) return <Empty title="Opening the event…" />;
  return <EventDetail key={ev.id} ev={ev} store={store} back={() => { store.refresh(['events']); nav('/events'); }} setMsg={setMsg} />;
}

function EventDetail({ ev, store, back, setMsg }) {
  const nav = useNavigate();
  const [draft, setDraft] = useState(ev);
  const saved = useRef(ev);
  const latest = useRef(ev);
  const chain = useRef(Promise.resolve());
  const [tab, setTab] = useState('menu');
  const [adding, setAdding] = useState(null);
  const [confirmDel, setConfirmDel] = useState(false);
  const timer = useRef(null);
  const byId = useMemo(() => Object.fromEntries(store.recipes.map((r) => [r.id, r])), [store.recipes]);
  const sortedRecipes = useMemo(() => [...store.recipes].sort((a, b) => a.name.localeCompare(b.name)), [store.recipes]);
  const ro = !store.organizer;
  const flush = useCallback(() => {
    chain.current = chain.current.then(async () => {
      const next = latest.current;
      if (next === saved.current) return;
      try { await syncEvent(saved.current, next); saved.current = next; setMsg('Saved'); }
      catch (e) {
        console.error(e);
        setMsg('Could not save: ' + (e.message || 'check your connection'));
        const fresh = await loadEvent(ev.id).catch(() => null);
        if (fresh) { saved.current = fresh; latest.current = fresh; setDraft(fresh); }
      }
    });
  }, [ev.id]);
  useEffect(() => () => { clearTimeout(timer.current); flush(); }, [flush]);
  const update = useCallback((patch) => {
    setDraft((d) => {
      const next = { ...d, ...patch };
      latest.current = next;
      clearTimeout(timer.current);
      timer.current = setTimeout(flush, 600);
      return next;
    });
  }, [flush]);
  const dishes = draft.dishes || [];
  const setDish = (key, patch) => update({ dishes: dishes.map((d) => (d.key === key ? { ...d, ...patch } : d)) });
  const addDish = (r, table) => {
    const tags = { ...(r.tags || {}) };
    if (table === 'allergy') { tags.gf = true; tags.df = true; tags.garlicFree = true; }
    const suggested = r.servingsPerBatch && draft.guests ? Math.ceil((table === 'allergy' ? Math.max(10, draft.guests * 0.05) : draft.guests) / r.servingsPerBatch) : 1;
    update({ dishes: [...dishes, { key: uid(), recipeId: r.id, name: r.name, table, batches: suggested, tags, labelCopies: table === 'regular' ? 6 : 1 }] });
    setAdding(null);
  };
  const groceries = useMemo(() => aggregate(draft, byId), [draft.dishes, byId]);
  const extras = draft.extras || [];
  const doDownload = (filename, data) => download(filename, data);

  const DishRow = ({ d }) => {
    const r = byId[d.recipeId];
    const warn = r ? warningsFor(d.tags, r.ingredients) : [];
    return <li className="dish">
      <div className="dish-top">
        {ro ? <b className="dish-name">{d.name}</b> : <input id={'dn' + d.key} className="dish-name" aria-label="Label name" defaultValue={d.name} onBlur={(e) => e.target.value !== d.name && setDish(d.key, { name: e.target.value })} />}
        <label className="batches"><span>Batches</span>{ro ? <b>{d.batches}</b> : <input id={'db' + d.key} type="number" min="0" step="0.5" defaultValue={d.batches} onBlur={(e) => setDish(d.key, { batches: Number(e.target.value) || 0 })} />}</label>
        {!ro && <button type="button" className="x" aria-label={'Remove ' + d.name} onClick={() => update({ dishes: dishes.filter((x) => x.key !== d.key) })}>×</button>}
      </div>
      <div className="dish-sub">
        {r ? <span className="muted">{`${r.name}${r.batchLabel ? ' · batch = ' + r.batchLabel : ''}${r.servingsPerBatch ? ` · ≈${Math.round(r.servingsPerBatch * d.batches)} servings` : ''}`}</span>
          : ro ? <span className="muted">Not linked to a recipe</span>
          : <label className="link-recipe"><span>Not linked to a recipe.</span><select id={'lr' + d.key} value="" onChange={(e) => e.target.value && setDish(d.key, { recipeId: e.target.value })}><option value="">Link a recipe…</option>{sortedRecipes.map((x) => <option key={x.id} value={x.id}>{x.name}</option>)}</select></label>}
        {r && !d.batches && <span className="pill amber">Set batches to add to groceries</span>}
      </div>
      <div className="dish-tags"><TagChips tags={d.tags} readOnly={ro} onChange={(tags) => setDish(d.key, { tags })} />
        <label className="copies"><span>Labels</span>{ro ? <b>{d.labelCopies}</b> : <input id={'dl' + d.key} type="number" min="0" defaultValue={d.labelCopies} onBlur={(e) => setDish(d.key, { labelCopies: Number(e.target.value) || 0 })} />}</label>
      </div>
      <Warnings list={warn} />
    </li>;
  };

  const tableBlock = (table, title, hint) => <div className="table-block">
    <div className="toolbar between"><h3>{title}</h3>{!ro && adding !== table && <button type="button" className="btn small" onClick={() => setAdding(table)}>+ Add dish</button>}</div>
    <p className="muted hint">{hint}</p>
    {adding === table && <Picker table={table} recipes={store.recipes} addDish={addDish} close={() => setAdding(null)} />}
    <ul className="dishes">{dishes.filter((d) => d.table === table).map((d) => <React.Fragment key={d.key}>{DishRow({ d })}</React.Fragment>)}</ul>
  </div>;

  return <section className="detail">
    <header className="event-head">
      {ro && <h2>{draft.name}</h2>}
      <div className="facts">
        {!ro && <label className="fact full"><span>Event name</span><input id="ev-name" defaultValue={draft.name} placeholder="e.g. Smith Wedding" onBlur={(e) => update({ name: e.target.value })} /></label>}
        <label className="fact"><span>Date</span>{ro ? <b>{fmtDate(draft.date)}</b> : <input id="ev-date" type="date" value={draft.date || ''} onChange={(e) => update({ date: e.target.value })} />}</label>
        <label className="fact"><span>Guests</span>{ro ? <b>{draft.guests}</b> : <input id="ev-guests" type="number" min="0" inputMode="numeric" defaultValue={draft.guests} onBlur={(e) => update({ guests: Number(e.target.value) || 0 })} />}</label>
        <label className="fact wide"><span>Notes</span>{ro ? <b>{draft.notes || '—'}</b> : <input id="ev-notes" defaultValue={draft.notes || ''} placeholder="Kitchen crew, delivery day, venue" onBlur={(e) => update({ notes: e.target.value })} />}</label>
      </div>
    </header>
    <div className="tabs" role="tablist">
      {[['menu', 'Menu'], ['groceries', `Groceries (${groceries.length + extras.length})`], ['prep', 'Prep days'], ['ovens', 'Oven schedule'], ['labels', 'Buffet labels'], ['safety', 'Safety log'], ...(draft.planText ? [['plan', 'Original plan']] : [])].map(([k, l]) => <button key={k} type="button" role="tab" aria-selected={tab === k} className={tab === k ? 'on' : ''} onClick={() => setTab(k)}>{l}</button>)}
    </div>

    {!ro && draft.imported && tab === 'menu' && <p className="notice">Imported from <b>{draft.source}</b>. Dishes were matched to recipes automatically and start at 0 batches, so the grocery list fills in as you set batch counts. Prep days and the oven schedule were read from the doc too; the full original is on the Original plan tab.</p>}
    {tab === 'prep' && <PrepDays draft={draft} update={update} ro={ro} canTick byId={byId} onDownload={() => doDownload(`${draft.name} day sheet.html`, daySheetHtml(draft, byId, tagLine))} />}
    {tab === 'ovens' && <OvenSchedule draft={draft} update={update} ro={ro} byId={byId} onDownload={() => doDownload(`${draft.name} day sheet.html`, daySheetHtml(draft, byId, tagLine))} />}
    {tab === 'safety' && <SafetyLog draft={draft} update={update} ro={false} organizer={store.organizer} me={store.profile?.id} onDownload={() => doDownload(`${draft.name} safety log.txt`, safetyText(draft))} />}
    {tab === 'plan' && <div className="doc"><p className="muted hint">From {draft.source}</p><pre className="doctext">{draft.planText}</pre></div>}
    {tab === 'menu' && <>
      {tableBlock('regular', 'Regular buffet', 'Batches are multiples of the recipe as written. Set servings per batch on a recipe and the planner will suggest a count from the guest number.')}
      {tableBlock('allergy', 'Allergy table', 'New dishes here start tagged GF, DF and garlic free. The checks below flag any ingredient that conflicts with a tag.')}
    </>}

    {tab === 'groceries' && <GroceryTab draft={draft} update={update} ro={ro} groceries={groceries} store={store} setMsg={setMsg} Empty={Empty} onAddProduct={() => nav('/products')} onDownload={(text) => doDownload(`${draft.name} groceries.txt`, text)} />}

    {tab === 'labels' && <div className="labels">
      <div className="toolbar between"><p className="muted">Each dish prints the number of labels set on the Menu tab. Download the sheet and print it on letter paper.</p>
        <button type="button" className="btn small primary" onClick={() => doDownload(`${draft.name} buffet labels.html`, labelsHtml(draft))}>Download label sheet</button></div>
      <div className="label-grid">
        {dishes.map((d) => <div key={d.key} className={'label-card ' + d.table}><div className="ln">{d.name}</div><div className="lt">{tagLine(d.tags) || ' '}</div>{d.table === 'allergy' && <div className="la">Allergy table</div>}<span className="lx">×{d.labelCopies}</span></div>)}
      </div>
    </div>}

    {!ro && <div className="danger">
      {confirmDel ? <span>Delete this event for everyone? <button type="button" className="btn small danger-btn" onClick={async () => { clearTimeout(timer.current); latest.current = saved.current; try { await deleteEvent(ev.id); setMsg('Event deleted'); back(); } catch (e) { setMsg('Could not delete: ' + e.message); } }}>Delete event</button> <button type="button" className="btn small ghost" onClick={() => setConfirmDel(false)}>Keep it</button></span>
        : <button type="button" className="btn ghost small" onClick={() => setConfirmDel(true)}>Delete event</button>}
    </div>}
  </section>;
}

/* ---------- reference ---------- */
function Reference({ reference }) {
  if (!reference) return <Empty title="No reference notes yet">Quantity rules of thumb will appear here.</Empty>;
  return <section className="reference">{(reference.sections || []).map((s) => <div key={s.title} className="ref-block"><h3>{s.title}</h3><pre>{s.text}</pre></div>)}</section>;
}

/* ---------- shell ---------- */
/* ---------- people (organizers) ---------- */
function People({ store, setMsg }) {
  const [rows, setRows] = useState(null);
  const load = () => loadProfiles().then(setRows, () => setRows([]));
  useEffect(() => { load(); }, []);
  if (!store.organizer) return <Navigate to="/events" replace />;
  return <section>
    <p className="muted">Organizers can edit recipes and events. Volunteers can read everything, tick prep tasks and the safety checklist, and log temperatures. To add someone, invite them by email from the Supabase dashboard (Authentication → Users → Invite user); they appear here as a volunteer once they accept.</p>
    {!rows ? <Empty title="Loading people…" /> : <ul className="rows">{rows.map((p) => <li key={p.id}><div className="row static-row">
      <span className="row-main"><span className="row-title">{p.full_name || p.email}</span><span className="row-sub">{p.email}</span></span>
      <span className="row-meta">{p.id === store.profile?.id ? <span className="pill you-pill">You · {p.role}</span>
        : <select id={'role' + p.id} aria-label={'Role for ' + (p.full_name || p.email)} value={p.role} onChange={async (e) => { try { await setRole(p.id, e.target.value); setMsg('Role updated'); load(); } catch (x) { setMsg('Could not change role: ' + x.message); } }}>
          <option value="organizer">Organizer</option><option value="volunteer">Volunteer</option></select>}</span>
    </div></li>)}</ul>}
  </section>;
}

/* ---------- sign in ---------- */
function SignIn() {
  const [mode, setMode] = useState('in');
  const [busy, setBusy] = useState(false);
  const [msg, setMsg] = useState('');
  const submit = async (e) => {
    e.preventDefault(); setBusy(true); setMsg('');
    const f = e.target.elements;
    if (mode === 'in') {
      const { error } = await supabase.auth.signInWithPassword({ email: f.email.value.trim(), password: f.password.value });
      if (error) setMsg(error.message === 'Invalid login credentials' ? 'That email and password don’t match. Try again, or reset your password.' : error.message);
    } else {
      const { error } = await supabase.auth.resetPasswordForEmail(f.email.value.trim(), { redirectTo: window.location.origin });
      setMsg(error ? error.message : 'Check your email for a link to set a new password.');
    }
    setBusy(false);
  };
  return <div className="auth"><form className="auth-card" onSubmit={submit}>
    <div className="auth-logo"><Logo size={56} /><span>WOLT Kitchen</span></div>
    <h2>{mode === 'in' ? 'Sign in' : 'Reset your password'}</h2>
    <label className="fact"><span>Email</span><input id="email" name="email" type="email" autoComplete="email" required /></label>
    {mode === 'in' && <label className="fact"><span>Password</span><input id="password" name="password" type="password" autoComplete="current-password" required /></label>}
    {msg && <p className="notice">{msg}</p>}
    <button className="btn primary" type="submit" disabled={busy}>{mode === 'in' ? 'Sign in' : 'Email me a reset link'}</button>
    <button className="btn ghost small" type="button" onClick={() => { setMode(mode === 'in' ? 'reset' : 'in'); setMsg(''); }}>{mode === 'in' ? 'Forgot your password?' : 'Back to sign in'}</button>
    <p className="muted hint">WOLT Kitchen is invitation only. Ask an organizer for an invite.</p>
  </form></div>;
}

function SetPassword({ done, invite }) {
  const [msg, setMsg] = useState('');
  const submit = async (e) => {
    e.preventDefault();
    const f = e.target.elements;
    if (f.pw.value.length < 8) return setMsg('Use at least 8 characters.');
    if (f.pw.value !== f.pw2.value) return setMsg('The two passwords don’t match.');
    const data = invite && f.name.value.trim() ? { full_name: f.name.value.trim() } : undefined;
    const { data: res, error } = await supabase.auth.updateUser({ password: f.pw.value, data });
    if (error) return setMsg(error.message);
    if (data) await supabase.from('profiles').update({ full_name: data.full_name }).eq('id', res.user.id);
    done();
  };
  return <div className="auth"><form className="auth-card" onSubmit={submit}>
    <div className="auth-logo"><Logo size={56} /><span>WOLT Kitchen</span></div>
    <h2>{invite ? 'Welcome! Set up your account' : 'Set a new password'}</h2>
    {invite && <label className="fact"><span>Your name</span><input id="name" name="name" autoComplete="name" required /></label>}
    <label className="fact"><span>Password (8+ characters)</span><input id="pw" name="pw" type="password" autoComplete="new-password" required /></label>
    <label className="fact"><span>Type it again</span><input id="pw2" name="pw2" type="password" autoComplete="new-password" required /></label>
    {msg && <p className="notice">{msg}</p>}
    <button className="btn primary" type="submit">Save and continue</button>
  </form></div>;
}

/* ---------- shell ---------- */
function RecipeRoute({ store, setMsg }) {
  const { id } = useParams();
  const nav = useNavigate();
  const loc = useLocation();
  if (id === 'new') {
    if (!store.organizer) return <Navigate to="/recipes" replace />;
    const draft = loc.state?.draft || BLANK_RECIPE;
    return <RecipeDetail key={loc.key} recipe={draft} isNew store={store} back={() => nav('/recipes')} setMsg={setMsg} onCreated={(newId) => nav('/recipes/' + newId, { replace: true })} />;
  }
  const recipe = store.recipes.find((r) => r.id === id);
  if (!recipe) return store.status === 'ready' ? <Empty title="Recipe not found">It may have been renamed or removed.</Empty> : null;
  return <RecipeDetail recipe={recipe} store={store} back={() => nav('/recipes')} setMsg={setMsg} />;
}

function Signed({ session }) {
  const store = useStore(session);
  const nav = useNavigate();
  const [msg, setMsg] = useState('');
  useEffect(() => { if (!msg) return; const t = setTimeout(() => setMsg(''), 2600); return () => clearTimeout(t); }, [msg]);
  const create = async () => {
    try { const id = await createEvent(today()); store.refresh(['events']); nav('/events/' + id); }
    catch (e) { setMsg('Could not create the event: ' + e.message); }
  };
  const [importing, setImporting] = useState(null);
  const [changingPw, setChangingPw] = useState(false);
  const doImport = async (input) => {
    if (importing === 'recipe') {
      const draft = await importRecipe(input);
      setImporting(null); nav('/recipes/new', { state: { draft } });
    } else {
      const draft = await importEvent(input, store.recipes.map((r) => r.id));
      await createEvent(draft.date || today(), draft.id, draft.name);
      await syncEvent({ id: draft.id, name: draft.name, date: draft.date || today(), guests: 0, notes: '', extras: [], checked: {}, stores: {}, dishes: [], prepDays: [], ovenDays: [], tempLog: [], checks: {} }, draft);
      await markImported(draft);
      setImporting(null); store.refresh(['events']); setMsg('Imported — check it over'); nav('/events/' + draft.id);
    }
  };
  const loc = useLocation();
  const [menu, setMenu] = useState(false);
  useEffect(() => { setMenu(false); window.scrollTo(0, 0); }, [loc.pathname]);
  const parts = loc.pathname.split('/').filter(Boolean);
  const section = parts[0] || 'events';
  const detail = parts.length > 1;
  const TITLES = { events: 'Events', recipes: 'Recipes', products: 'Products', quantities: 'Quantities', people: 'People' };
  const title = detail ? (section === 'events' ? 'Event' : 'Recipe') : (TITLES[section] || 'WOLT Kitchen');
  const items = [
    ['/events', 'Events', 'ti-calendar-event'],
    ['/recipes', 'Recipes', 'ti-chef-hat'],
    ['/products', 'Products', 'ti-shopping-cart'],
    ['/quantities', 'Quantities', 'ti-scale'],
  ];
  const first = (store.profile?.full_name || store.profile?.email || '').split(/[ @]/)[0];
  return <div className="app">
    <header className="top">
      <div className="top-left">
        {detail
          ? <button type="button" className="shell-back" onClick={() => nav('/' + section)}><i className="ti ti-arrow-left" /><span>{TITLES[section]}</span></button>
          : <button type="button" className="logo-btn" onClick={() => nav('/events')} aria-label="WOLT Kitchen home"><Logo size={30} /></button>}
      </div>
      <span className="top-title">{title}</span>
      <div className="top-right">
        <span className="top-name">{first}</span>
        <button type="button" className="icon-btn" onClick={() => setMenu(true)} aria-label="Menu"><i className="ti ti-menu-2" /></button>
      </div>
    </header>
    {menu && <div className="menu-overlay" onClick={() => setMenu(false)}>
      <nav className="menu-drawer" onClick={(e) => e.stopPropagation()} aria-label="Main menu">
        <div className="menu-drawer-header">
          <div><b>{store.profile?.full_name || 'WOLT Kitchen'}</b><small>{store.profile?.email} · {store.profile?.role}</small></div>
          <button type="button" className="icon-btn" onClick={() => setMenu(false)} aria-label="Close menu"><i className="ti ti-x" /></button>
        </div>
        <div className="menu-section">
          <div className="menu-section-label">Kitchen</div>
          {items.map(([to, l, ic]) => <button key={to} type="button" className={'menu-item' + (section === to.slice(1) ? ' on' : '')} onClick={() => nav(to)}><i className={'ti ' + ic} />{l}</button>)}
        </div>
        {store.organizer && <div className="menu-section">
          <div className="menu-section-label">Admin</div>
          <button type="button" className={'menu-item' + (section === 'people' ? ' on' : '')} onClick={() => nav('/people')}><i className="ti ti-users" />People</button>
        </div>}
        <div className="menu-section">
          <button type="button" className="menu-item" onClick={() => { setMenu(false); setChangingPw(true); }}><i className="ti ti-key" />Change password</button>
          <button type="button" className="menu-item menu-item-danger" onClick={() => supabase.auth.signOut()}><i className="ti ti-logout" />Sign out</button>
        </div>
      </nav>
    </div>}
    <main>
      {store.status === 'error' && <Empty title="Couldn't load the kitchen data">Reload the page. If it keeps happening, check your connection.</Empty>}
      {store.status === 'loading' ? <Empty title="Loading the kitchen…" /> : <ErrorBoundary resetKey={loc.pathname}><Routes>
        <Route path="/" element={<Navigate to="/events" replace />} />
        <Route path="/events" element={<EventList events={store.events} open={(id) => nav('/events/' + id)} create={create} canEdit={store.organizer} onImport={() => setImporting('event')} />} />
        <Route path="/events/:id" element={<EventLoader store={store} setMsg={setMsg} />} />
        <Route path="/recipes" element={<RecipeList recipes={store.recipes} open={(id) => nav('/recipes/' + id)} organizer={store.organizer} onNew={() => nav('/recipes/new', { state: { draft: BLANK_RECIPE } })} onImport={() => setImporting('recipe')} />} />
        <Route path="/recipes/:id" element={<RecipeRoute store={store} setMsg={setMsg} />} />
        <Route path="/products" element={<Products store={store} setMsg={setMsg} />} />
        <Route path="/quantities" element={<Reference reference={store.reference} />} />
        <Route path="/people" element={<People store={store} setMsg={setMsg} />} />
        <Route path="*" element={<Navigate to="/events" replace />} />
      </Routes></ErrorBoundary>}
    </main>
    {changingPw && <ChangePassword onClose={() => setChangingPw(false)} setMsg={setMsg} />}
    {importing && <ImportDialog kind={importing} onClose={() => setImporting(null)} onDone={doImport} />}
    <div className={'toast' + (msg ? ' show' : '')} role="status" aria-live="polite">{msg}</div>
  </div>;
}

export function App() {
  const [session, setSession] = useState(undefined);
  const [needsPassword, setNeedsPassword] = useState(AUTH_LINK_TYPE === 'invite' || AUTH_LINK_TYPE === 'recovery');
  useEffect(() => {
    supabase.auth.getSession().then(({ data }) => setSession(data.session));
    const { data: sub } = supabase.auth.onAuthStateChange((event, s) => {
      setSession(s);
      if (event === 'PASSWORD_RECOVERY') setNeedsPassword(true);
    });
    return () => sub.subscription.unsubscribe();
  }, []);
  if (session === undefined) return <div className="auth"><Empty title="Loading…" /></div>;
  if (!session) return <SignIn />;
  if (needsPassword) return <SetPassword invite={AUTH_LINK_TYPE === 'invite'} done={() => { setNeedsPassword(false); history.replaceState(null, '', '/events'); }} />;
  return <Signed session={session} />;
}

