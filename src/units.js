// Quantity maths: unit families, aggregation, kitchen-friendly formatting.
export const VOL = { tsp: 4.929, tbsp: 14.787, cup: 236.6, ml: 1, L: 1000 };
export const WT = { g: 1, kg: 1000, oz: 28.35, lb: 453.6 };
export const UNITS = ['', 'tsp', 'tbsp', 'cup', 'ml', 'L', 'g', 'kg', 'oz', 'lb', 'can', 'jar', 'bag', 'box', 'case', 'pkg', 'head', 'clove', 'bunch', 'block', 'bottle', 'carton', 'tube', 'rack', 'pinch', 'stick'];

export function family(u) {
  if (u in VOL) return 'vol';
  if (u in WT) return 'wt';
  return 'count:' + (u || '');
}

// Total of one ingredient line in its family's base unit (ml / g / count)
export function baseQty(ing) {
  if (ing.qty == null || ing.qty === '') return null;
  const q = Number(ing.qty);
  if (!isFinite(q)) return null;
  const f = family(ing.unit);
  let b = f === 'vol' ? q * VOL[ing.unit] : f === 'wt' ? q * WT[ing.unit] : q;
  if (ing.plus && ing.plus.qty != null) {
    const pf = family(ing.plus.unit);
    if (pf === f) b += pf === 'vol' ? ing.plus.qty * VOL[ing.plus.unit] : pf === 'wt' ? ing.plus.qty * WT[ing.plus.unit] : ing.plus.qty;
  }
  return b;
}

const FR = [[0, ''], [0.125, '⅛'], [0.25, '¼'], [1 / 3, '⅓'], [0.5, '½'], [2 / 3, '⅔'], [0.75, '¾'], [1, '']];
export function frac(x, fine = true) {
  if (x >= 40) return String(Math.round(x));
  if (x >= 10) fine = false;
  const whole = Math.floor(x);
  let r = x - whole;
  const steps = fine ? FR : [[0, ''], [0.25, '¼'], [0.5, '½'], [0.75, '¾'], [1, '']];
  let best = steps[0];
  for (const s of steps) if (Math.abs(s[0] - r) < Math.abs(best[0] - r)) best = s;
  const w = best[0] === 1 ? whole + 1 : whole;
  if (w === 0 && !best[1]) return fine ? '⅛' : '¼';
  return (w ? String(w) : '') + best[1];
}
const dec = (x, d = 1) => (Math.round(x * 10 ** d) / 10 ** d).toLocaleString('en-CA');

// Format a base quantity for display. `pref` = the unit the recipe used, so
// cups stay cups and litres stay litres; small spoons climb as totals grow.
export function fmt(base, fam, pref) {
  if (base == null) return '';
  if (fam === 'vol') {
    if (pref === 'L' || pref === 'ml') return base >= 1000 ? `${dec(base / 1000)} L` : `${Math.round(base)} ml`;
    if (base < 14) return `${frac(base / VOL.tsp)} tsp`;
    if (base < 59 || (pref === 'tsp' && base < 45)) return `${frac(base / VOL.tbsp)} tbsp`;
    return `${frac(base / VOL.cup)} ${base / VOL.cup > 1.01 ? 'cups' : 'cup'}`;
  }
  if (fam === 'wt') {
    if (pref === 'lb' || pref === 'oz') return base < 453 ? `${frac(base / WT.oz)} oz` : `${dec(base / WT.lb)} lb`;
    return base >= 1000 ? `${dec(base / 1000, 2)} kg` : `${Math.round(base)} g`;
  }
  const u = fam.slice(6);
  const n = base % 1 === 0 ? String(base) : frac(base);
  return u ? `${n} ${u}${base > 1 && !/s$/.test(u) && u !== 'L' ? 's' : ''}` : n;
}

export function fmtIng(ing, mult = 1) {
  const b = baseQty(ing);
  if (b == null) return '';
  const fam = family(ing.unit);
  let s = fmt(b * mult, fam, ing.unit);
  if (ing.qtyMax && mult) {
    const hi = { ...ing, qty: ing.qtyMax, plus: null };
    s = fmt(b * mult, fam, ing.unit) + ' – ' + fmt(baseQty(hi) * mult, fam, ing.unit);
  }
  return s;
}

export function itemKey(item) {
  return (item || '')
    .toLowerCase()
    .replace(/\(.*?\)/g, '')
    .split(/[,;]| - | or /)[0]
    .replace(/\b(fresh|freshly|finely|roughly|large|medium|med|small|lg|sm|chopped|diced|minced|grated|shredded|sliced|melted|softened|packed|lightly|beaten|room temp)\b/g, '')
    .replace(/[^a-z0-9 ]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

// Allergen keyword check — flags only, the organizer decides.
const KW = {
  df: /\b(butter|cream|milk|cheese|parmesan|parm|feta|mozzarella|cheddar|marble|yogurt|yoghurt|sour cream|ghee|tzatziki|alfredo|whey|cream cheese)\b/i,
  gf: /\b(flour|bread|breadcrumbs?|panko|pasta|noodles?|croutons?|soy sauce|naan|buns?|couscous|barley|oats|lasagna|beer|crackers?|tortillas?|focaccia|sourdough)\b/i,
  garlicFree: /\bgarlic\b/i,
  nutFree: /\b(almonds?|walnuts?|pecans?|cashews?|pistachios?|hazelnuts?|peanuts?|pine nuts?)\b/i,
};
const NEG = {
  df: /dairy[- ]free|\bdf\b|coconut milk|cream of tartar|vegan/i,
  gf: /gluten[- ]free|\bgf\b|rice flour|corn ?starch|cornmeal|tapioca/i,
  garlicFree: /omit for garlic|garlic[- ]free/i,
  nutFree: /nut[- ]free|nutmeg/i,
};
export function allergenHits(ingredients) {
  const hits = { df: new Set(), gf: new Set(), garlicFree: new Set(), nutFree: new Set() };
  for (const i of ingredients || []) {
    const t = `${i.item || ''}`;
    for (const k in KW) if (KW[k].test(t) && !NEG[k].test(t)) hits[k].add(t.match(KW[k])[0].toLowerCase());
  }
  return Object.fromEntries(Object.entries(hits).map(([k, v]) => [k, [...v]]));
}

// How many store packs cover a grocery total. A product is sold as pack_qty pack_unit
// (e.g. 5 kg), optionally also described in another unit (e.g. ≈ 24 cup) so recipes
// written in cups can still be matched to a product sold by weight.
export function packsFor(row, product) {
  if (!product || row.loose || !row.total) return { packs: null, reason: row.loose ? 'amount not given in recipe' : null };
  const options = [[product.pack_qty, product.pack_unit], [product.equiv_qty, product.equiv_unit]];
  for (const [q, u] of options) {
    if (!q) continue;
    if (family(u || null) !== row.fam) continue;
    const base = baseQty({ qty: Number(q), unit: u || null });
    if (!base) continue;
    const exact = row.total / base;
    return { packs: Math.max(1, Math.ceil(exact - 0.02)), exact };
  }
  const fam = (f) => (f === 'vol' ? 'volume (cups, L)' : f === 'wt' ? 'weight (kg, lb)' : 'count');
  return { packs: null, reason: `recipes use ${fam(row.fam)}; add what one pack equals in that unit` };
}
