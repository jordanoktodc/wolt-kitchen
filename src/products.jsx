// Store products (what the kitchen actually buys: pack sizes, Costco item numbers, prices)
// and the grocery list that turns recipe amounts into whole packs.
import { useState, useMemo } from 'react';
import { fmt, packsFor, UNITS } from './units.js';
import { saveProduct, deleteProduct, linkIngredient } from './lib/db.js';

export const STORES = ['Costco', 'Superstore', 'Wholesale', 'Other'];
const money = (n) => (n == null ? '' : n.toLocaleString('en-CA', { style: 'currency', currency: 'CAD' }));
const packText = (p) => p.pack_label || `${Number(p.pack_qty)} ${p.pack_unit || ''}`.trim();
const BLANK = { name: '', store: 'Costco', item_number: '', pack_qty: 1, pack_unit: 'kg', pack_label: '', equiv_qty: '', equiv_unit: 'cup', price: '', notes: '' };

function ProductForm({ product, onSaved, onCancel, onDelete, setMsg }) {
  const [p, setP] = useState(product);
  const [confirm, setConfirm] = useState(false);
  const set = (patch) => setP((x) => ({ ...x, ...patch }));
  const save = async (e) => {
    e.preventDefault();
    if (!p.name.trim()) return setMsg('Give the product a name.');
    if (!(Number(p.pack_qty) > 0)) return setMsg('Pack size must be more than 0.');
    try { await saveProduct(p); setMsg('Product saved'); onSaved(); } catch (x) { setMsg('Could not save: ' + x.message); }
  };
  return <form className="product-form" onSubmit={save}>
    <div className="facts">
      <label className="fact full"><span>Product</span><input id="pf-name" value={p.name} autoFocus placeholder="e.g. Kirkland Basmati Rice" onChange={(e) => set({ name: e.target.value })} /></label>
      <label className="fact"><span>Store</span><select id="pf-store" value={p.store} onChange={(e) => set({ store: e.target.value })}>{STORES.map((s) => <option key={s}>{s}</option>)}</select></label>
      <label className="fact"><span>Item number</span><input id="pf-num" value={p.item_number || ''} inputMode="numeric" placeholder="Costco item #" onChange={(e) => set({ item_number: e.target.value })} /></label>
      <label className="fact"><span>One pack is</span><div className="pair"><input id="pf-q" type="number" step="any" min="0" value={p.pack_qty} onChange={(e) => set({ pack_qty: e.target.value })} /><select id="pf-u" aria-label="Pack unit" value={p.pack_unit || ''} onChange={(e) => set({ pack_unit: e.target.value })}>{UNITS.map((u) => <option key={u} value={u}>{u || 'each'}</option>)}</select></div></label>
      <label className="fact"><span>Same pack also equals</span><div className="pair"><input id="pf-eq" type="number" step="any" min="0" value={p.equiv_qty ?? ''} placeholder="optional" onChange={(e) => set({ equiv_qty: e.target.value })} /><select id="pf-eu" aria-label="Equivalent unit" value={p.equiv_unit || ''} onChange={(e) => set({ equiv_unit: e.target.value })}>{UNITS.map((u) => <option key={u} value={u}>{u || 'each'}</option>)}</select></div></label>
      <label className="fact"><span>Label</span><input id="pf-label" value={p.pack_label || ''} placeholder="e.g. 5 kg pink bag" onChange={(e) => set({ pack_label: e.target.value })} /></label>
      <label className="fact"><span>Price per pack</span><input id="pf-price" type="number" step="0.01" min="0" inputMode="decimal" value={p.price ?? ''} placeholder="optional" onChange={(e) => set({ price: e.target.value })} /></label>
      <label className="fact full"><span>Notes</span><input id="pf-notes" value={p.notes || ''} placeholder="e.g. 14/16 is thicker; order ahead" onChange={(e) => set({ notes: e.target.value })} /></label>
    </div>
    <p className="muted hint">Use “same pack also equals” when recipes measure it differently, e.g. a 5 kg rice bag ≈ 24 cups, or a 1 kg parmesan ≈ 8 cups grated.</p>
    <div className="head-actions">
      <button type="submit" className="btn primary">Save product</button>
      <button type="button" className="btn ghost" onClick={onCancel}>Cancel</button>
      {p.id && (confirm
        ? <span className="push-right">Delete for everyone? <button type="button" className="btn small danger-btn" onClick={onDelete}>Delete</button> <button type="button" className="btn small ghost" onClick={() => setConfirm(false)}>Keep</button></span>
        : <button type="button" className="btn ghost push-right" onClick={() => setConfirm(true)}>Delete</button>)}
    </div>
  </form>;
}

export function Products({ store, setMsg }) {
  const [editing, setEditing] = useState(null);
  const [q, setQ] = useState('');
  const covers = useMemo(() => {
    const m = {};
    for (const [k, pid] of Object.entries(store.links || {})) (m[pid] ||= []).push(k);
    return m;
  }, [store.links]);
  const list = (store.products || []).filter((p) => !q || (p.name + ' ' + p.item_number + ' ' + (covers[p.id] || []).join(' ')).toLowerCase().includes(q.toLowerCase()));
  const done = () => { setEditing(null); store.refresh(['products']); };
  return <section>
    <div className="toolbar">
      <input id="prod-search" type="search" placeholder="Search products, item numbers or ingredients" value={q} onChange={(e) => setQ(e.target.value)} />
      {store.organizer && <button type="button" className="btn primary push-right" onClick={() => setEditing({ ...BLANK })}><i className="ti ti-plus" />New product</button>}
    </div>
    <p className="muted hint">What the kitchen buys and in what size. Match an ingredient to a product on any event’s Groceries tab and every event’s list will show whole packs and item numbers for it.</p>
    {editing && !editing.id && <ProductForm product={editing} setMsg={setMsg} onSaved={done} onCancel={() => setEditing(null)} />}
    {STORES.map((s) => {
      const items = list.filter((p) => p.store === s);
      if (!items.length) return null;
      return <div key={s} className="table-block">
        <h3 className="group">{s}</h3>
        <ul className="rows">{items.map((p) => <li key={p.id}>
          {editing?.id === p.id
            ? <div className="row-edit"><ProductForm product={editing} setMsg={setMsg} onSaved={done} onCancel={() => setEditing(null)} onDelete={async () => { try { await deleteProduct(p.id); setMsg('Product deleted'); done(); } catch (x) { setMsg('Could not delete: ' + x.message); } }} /></div>
            : <button type="button" className={'row' + (store.organizer ? '' : ' static-row')} onClick={() => store.organizer && setEditing({ ...p })}>
              <span className="row-main"><span className="row-title">{p.name}</span>
                <span className="row-sub">{packText(p)}{p.equiv_qty ? ` ≈ ${Number(p.equiv_qty)} ${p.equiv_unit || ''}` : ''}{p.item_number ? ` · #${p.item_number}` : ''}{covers[p.id] ? ` · for ${covers[p.id].join(', ')}` : ''}</span></span>
              <span className="row-meta">{p.price != null && <span className="cat">{money(Number(p.price))}</span>}{!p.item_number && store.organizer && <span className="pill amber">Add item #</span>}</span>
            </button>}
        </li>)}</ul>
      </div>;
    })}
    {!list.length && <div className="empty"><h3>{q ? 'No products match' : 'No products yet'}</h3><div>{store.organizer ? 'Add what the kitchen buys, with its pack size and item number.' : 'Organizers add products here.'}</div></div>}
  </section>;
}

/* ---------------- grocery list with packs ---------------- */
export function groceryPlan(groceries, extras, products, links, stores) {
  const byId = Object.fromEntries((products || []).map((p) => [p.id, p]));
  const rows = groceries.map((g) => {
    const product = byId[links[g.name]];
    const pk = packsFor(g, product);
    return { ...g, product, ...pk, storeName: product?.store || stores[g.key] || 'Unassigned', cost: product?.price != null && pk.packs ? pk.packs * Number(product.price) : null };
  });
  const groups = [...STORES, 'Unassigned'].map((s) => ({ store: s, rows: rows.filter((r) => r.storeName === s), extras: (extras || []).filter((x) => (x.store || 'Unassigned') === s) })).filter((g) => g.rows.length || g.extras.length);
  const total = rows.reduce((t, r) => t + (r.cost || 0), 0);
  return { rows, groups, total, priced: rows.filter((r) => r.cost != null).length };
}

export function groceryText(ev, plan, checked) {
  const lines = [`${ev.name} — groceries`, '', ''];
  for (const g of plan.groups) {
    lines.push(g.store.toUpperCase());
    for (const r of g.rows) {
      const need = r.loose ? 'as needed' : fmt(r.total, r.fam, r.pref);
      const buy = r.product ? (r.packs ? `${r.packs} × ${r.product.name} (${packText(r.product)})${r.product.item_number ? ' #' + r.product.item_number : ''}` : `${r.product.name} — ${need}`) : need;
      lines.push(`${checked[r.key] ? '[x]' : '[ ]'} ${r.name}: ${buy}`);
    }
    for (const x of g.extras) lines.push(`${x.done ? '[x]' : '[ ]'} ${x.text}`);
    lines.push('');
  }
  if (plan.priced) lines.push(`Estimated cost of priced items: ${money(plan.total)}`);
  return lines.join('\n');
}

export function GroceryTab({ draft, update, ro, groceries, store, setMsg, onDownload, onAddProduct, Empty }) {
  const checked = draft.checked || {};
  const stores = draft.stores || {};
  const extras = draft.extras || [];
  const plan = useMemo(() => groceryPlan(groceries, draft.extras || [], store.products, store.links || {}, draft.stores || {}), [groceries, draft.extras, draft.stores, store.products, store.links]);
  const [picking, setPicking] = useState(null);
  const products = store.products || [];
  const match = async (row, pid) => {
    if (pid === '__new') { setPicking(null); onAddProduct(); return; }
    try { await linkIngredient(row.name, pid || null); setMsg(pid ? 'Matched for every event' : 'Match removed'); setPicking(null); store.refresh(['links']); }
    catch (x) { setMsg('Could not save the match: ' + x.message); }
  };
  return <div className="groceries">
    <div className="toolbar between"><p className="muted">Totals add up every dish’s ingredients × batches. Matched items are rounded up to whole packs from the Products list.</p>
      <div className="head-actions"><button type="button" className="btn small" onClick={() => onDownload(groceryText(draft, plan, checked))}>Download list</button></div></div>
    {!groceries.length && !extras.length && <Empty title="Nothing to buy yet">Add dishes on the Menu tab and set their batches; the ingredients show up here.</Empty>}
    {plan.groups.map((g) => <div key={g.store} className="table-block">
      <h3 className="group">{g.store}{g.store !== 'Unassigned' && <span className="muted"> · {g.rows.length + g.extras.length} items</span>}</h3>
      <ul className="rows grocery-rows">
        {g.rows.map((r) => <li key={r.key} className={checked[r.key] ? 'done' : ''}>
          <div className="g-row">
            <input id={'gc' + r.key} type="checkbox" aria-label={'Got ' + r.name} checked={!!checked[r.key]} disabled={ro} onChange={(e) => update({ checked: { ...checked, [r.key]: e.target.checked } })} />
            <div className="g-main">
              <span className="g-name">{r.name}</span>
              <span className="g-need">Recipes need {r.loose ? 'some (no amount given)' : fmt(r.total, r.fam, r.pref)} · {[...r.from].join(', ')}</span>
              {r.product && <span className="g-buy">{r.packs ? <><b>{r.packs} ×</b> {r.product.name} <span className="muted">({packText(r.product)}){r.product.item_number ? ` · #${r.product.item_number}` : ''}{r.cost != null ? ` · ${money(r.cost)}` : ''}</span></> : <><b>{r.product.name}</b> <span className="muted">— {r.reason}</span></>}</span>}
            </div>
            {!ro && <button type="button" className="btn small ghost" onClick={() => setPicking(picking === r.key ? null : r.key)}>{r.product ? 'Change' : 'Match'}</button>}
          </div>
          {!ro && picking === r.key && <div className="g-pick">
            <select id={'gp' + r.key} aria-label={'Product for ' + r.name} value={r.product?.id || ''} onChange={(e) => match(r, e.target.value)}>
              <option value="">{r.product ? 'No product (remove match)' : 'Choose a product…'}</option>
              {products.map((p) => <option key={p.id} value={p.id}>{p.store} · {p.name} ({packText(p)})</option>)}
              <option value="__new">+ Add a new product…</option>
            </select>
            {!r.product && <select id={'gs' + r.key} aria-label="Store" value={stores[r.key] || ''} onChange={(e) => update({ stores: { ...stores, [r.key]: e.target.value } })}><option value="">Store only, no product</option>{STORES.map((s) => <option key={s}>{s}</option>)}</select>}
          </div>}
        </li>)}
        {g.extras.map((x) => <li key={x.id} className={x.done ? 'done' : ''}><div className="g-row">
          <input id={'xc' + x.id} type="checkbox" aria-label={'Got ' + x.text} checked={!!x.done} disabled={ro} onChange={(e) => update({ extras: extras.map((y) => (y.id === x.id ? { ...y, done: e.target.checked } : y)) })} />
          <div className="g-main"><span className="g-name">{x.text}</span><span className="g-need">Extra item</span></div>
          {!ro && <button type="button" className="x" aria-label="Remove" onClick={() => update({ extras: extras.filter((y) => y.id !== x.id) })}>×</button>}
        </div></li>)}
      </ul>
    </div>)}
    {plan.priced > 0 && <p className="g-total">Estimated cost of priced items: <b>{money(plan.total)}</b> <span className="muted">({plan.priced} of {plan.rows.length} items priced)</span></p>}
    {!ro && <form className="extra" onSubmit={(e) => { e.preventDefault(); const f = e.target.elements; const v = f.extra.value.trim(); if (v) { update({ extras: [...extras, { id: crypto.randomUUID(), text: v, store: f.xstore.value || undefined }] }); e.target.reset(); } }}>
      <input id="extra" name="extra" placeholder="Add an extra item: take-out containers, gloves…" /><select id="xstore" name="xstore" aria-label="Store"><option value="">Store</option>{STORES.map((s) => <option key={s}>{s}</option>)}</select><button className="btn small" type="submit">Add</button>
    </form>}
  </div>;
}
