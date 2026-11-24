// Turn a dropped file (Word, PDF, photo, text) or pasted text into a recipe or event draft
// using the import-doc edge function. Nothing is saved here; the caller opens the result for review.
import { supabase, newId } from './db.js';

const MAX = 12 * 1024 * 1024;

async function toBase64(file) {
  const buf = new Uint8Array(await file.arrayBuffer());
  let bin = '';
  for (let i = 0; i < buf.length; i += 0x8000) bin += String.fromCharCode(...buf.subarray(i, i + 0x8000));
  return btoa(bin);
}

export async function readInput({ file, pasted }) {
  if (pasted && pasted.trim()) return { text: pasted.trim(), fileName: null };
  if (!file) throw new Error('Choose a file or paste the text first.');
  if (file.size > MAX) throw new Error('That file is over 12 MB. Try a smaller photo or a PDF.');
  const name = file.name || 'upload';
  const lower = name.toLowerCase();
  if (lower.endsWith('.docx')) {
    const mammoth = (await import('mammoth/mammoth.browser.js')).default;
    const { value } = await mammoth.extractRawText({ arrayBuffer: await file.arrayBuffer() });
    return { text: value, fileName: name };
  }
  if (lower.endsWith('.doc')) throw new Error('Old .doc files can’t be read. Open it in Word and save as .docx, or paste the text.');
  if (lower.endsWith('.txt') || lower.endsWith('.md') || file.type.startsWith('text/')) return { text: await file.text(), fileName: name };
  if (file.type === 'application/pdf' || lower.endsWith('.pdf')) return { file: { mime: 'application/pdf', data: await toBase64(file) }, fileName: name };
  if (file.type.startsWith('image/')) return { file: { mime: file.type, data: await toBase64(file) }, fileName: name };
  throw new Error('Use a Word (.docx), PDF, photo or text file.');
}

async function callImport(kind, input) {
  const { data, error } = await supabase.functions.invoke('import-doc', { body: { kind, text: input.text, file: input.file, fileName: input.fileName } });
  if (error) {
    let msg = error.message;
    try { const body = await error.context?.json?.(); if (body?.error) msg = body.error; } catch { /* keep message */ }
    throw new Error(msg);
  }
  if (data?.error) throw new Error(data.error);
  return data.data;
}

const tagsOf = (t = {}) => ({ gf: !!t.gf, df: !!t.df, garlicFree: !!t.garlicFree, containsNuts: !!t.containsNuts });
const num = (v) => (v === null || v === undefined || v === '' || !isFinite(Number(v)) ? null : Number(v));
const hhmm = (t) => (typeof t === 'string' && /^\d{1,2}:\d{2}/.test(t) ? t.padStart(5, '0').slice(0, 5) : null);
const isoDate = (d) => (typeof d === 'string' && /^\d{4}-\d{2}-\d{2}$/.test(d) ? d : null);

export async function importRecipe(input) {
  const r = await callImport('recipe', input);
  return {
    id: null,
    name: r.name || 'Imported recipe',
    category: r.category || 'Other',
    batchLabel: r.batchLabel || '',
    servingsPerBatch: num(r.servingsPerBatch),
    tags: tagsOf(r.tags),
    ingredients: (r.ingredients || []).map((i) => ({ qty: num(i.qty), qtyMax: num(i.qtyMax), unit: i.unit || null, item: String(i.item || '').trim() })).filter((i) => i.item),
    notes: r.notes || '',
    ovenProgram: r.ovenProgram || '',
    ovenMinutes: num(r.ovenMinutes),
    text: input.text || r.text || '',
    source: input.fileName || 'Pasted text',
    reviewed: false,
  };
}

export async function importEvent(input, recipeIds) {
  const e = await callImport('event', input);
  const ids = new Set(recipeIds);
  const dishes = (e.dishes || []).filter((d) => d.name).map((d) => ({
    key: newId(), name: String(d.name).trim(), table: d.table === 'allergy' ? 'allergy' : 'regular',
    recipeId: ids.has(d.recipeId) ? d.recipeId : null, tags: tagsOf(d.tags),
    labelCopies: num(d.labelCopies) ?? (d.table === 'allergy' ? 1 : 6), batches: num(d.batches) ?? 0,
  }));
  return {
    id: newId(),
    name: e.name || 'Imported event',
    date: isoDate(e.date),
    guests: num(e.guests) || 0,
    notes: e.notes || '',
    extras: (e.extras || []).filter(Boolean).map((t) => ({ id: newId(), text: String(t) })),
    checked: {}, stores: {},
    imported: true,
    source: input.fileName || 'Pasted text',
    planText: input.text || e.planText || '',
    dishes,
    prepDays: (e.prepDays || []).map((p) => ({ id: newId(), date: isoDate(p.date), title: p.title || '', crew: p.crew || '',
      tasks: (p.tasks || []).filter(Boolean).map((t) => ({ id: newId(), text: String(t), done: false })) })).filter((p) => p.tasks.length || p.title),
    ovenDays: (e.ovenDays || []).map((o) => ({ id: newId(), title: o.title || 'Event day', service: hhmm(o.service),
      slots: (o.slots || []).filter((s) => hhmm(s.start)).map((s) => ({ id: newId(), lane: ['ovenA', 'ovenB', 'ivario', 'prep'].includes(s.lane) ? s.lane : 'prep',
        start: hhmm(s.start), minutes: Math.max(5, Math.round(num(s.minutes) || 30)), label: String(s.label || '') })) })),
    tempLog: [], checks: {},
  };
}
