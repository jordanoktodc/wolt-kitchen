import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

// Reads a recipe or an event plan (Word text, PDF, photo, or pasted text) and returns it as
// structured data for the app to show in an editable form. It only READS: nothing is saved here.
// Organizers only. Called from the browser, so it answers CORS preflight.

const cors = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}
const json = (data: unknown, status = 200) =>
  new Response(JSON.stringify(data), { status, headers: { ...cors, 'Content-Type': 'application/json' } })

const UNITS = ['tsp', 'tbsp', 'cup', 'ml', 'L', 'g', 'kg', 'oz', 'lb', 'can', 'jar', 'bag', 'box', 'case', 'pkg', 'head', 'clove', 'bunch', 'block', 'bottle', 'carton', 'tube', 'rack', 'pinch', 'stick']
const CATS = ['Protein', 'Starch', 'Vegetable', 'Salad', 'Soup', 'Sauce & dressing', 'Bread', 'Other']
const STAGES_NOTE = 'lane is one of ovenA, ovenB, ivario, prep (Oven A / Oven B / iVario columns, anything else is prep).'

const RECIPE_PROMPT = (full: string) => `This is a recipe from a church kitchen that cooks for large events (weddings of 400-600 people). Return ONLY a JSON object, no other text:
{
 "name": short recipe name, without event names,
 "category": one of ${JSON.stringify(CATS)},
 "batchLabel": what ONE batch of the base recipe is, as written (e.g. "1 full steam pan", "per 2 kg chicken") or "",
 "servingsPerBatch": number of servings one batch makes if stated, else null,
 "tags": {"gf": bool, "df": bool, "garlicFree": bool, "containsNuts": bool} — only true when the recipe says so or the ingredients make it certain; otherwise false,
 "ingredients": [{"qty": number|null, "qtyMax": number|null, "unit": one of ${JSON.stringify(UNITS)} or null, "item": text}] for ONE batch of the base recipe, in order. Use decimals for fractions (½ = 0.5). For a range like "1-1¼ cup" use qty 1, qtyMax 1.25. Items with no amount ("salt to taste") get qty null. If the document also lists a scaled-up grocery list, do NOT use it for ingredients,
 "ovenProgram": the oven (iCombi / iVario) program or settings to select, short, e.g. "Poultry › Roast, probe 170°F" or "Manual combi 338°F, 30% humidity, probe 165°F", or "",
 "ovenMinutes": minutes in the oven if stated, else null,
 "notes": short kitchen notes worth keeping (oven pathway, pan counts, quantities for weddings), at most 400 characters,
 "text": ${full}
}`

const EVENT_PROMPT = (today: string, recipes: { id: string; name: string }[], full: string) => `This is a menu / prep plan for an event cooked by a church kitchen. Today is ${today} (America/Edmonton). Return ONLY a JSON object, no other text:
{
 "name": event name (e.g. "Dawson & Grace's Wedding"),
 "date": event date YYYY-MM-DD if written (pick the year that makes sense from today if missing), else null,
 "guests": number of guests if written, else 0,
 "notes": one short line (crew, venue) or "",
 "dishes": [{"name": dish name as it should appear on the buffet label, "table": "regular" or "allergy" (special / allergy / GF table), "recipeId": the id of the matching recipe from the list below or null, "tags": {"gf","df","garlicFree","containsNuts"} as booleans from the menu's allergen notes, "labelCopies": number of labels if written (e.g. "x6") else 6 for regular and 1 for allergy, "batches": number of batches of the recipe if clearly written (e.g. "29x recipe"), else 0}],
 "prepDays": [{"date": YYYY-MM-DD or null, "title": e.g. "Friday – main prep day", "crew": who/when e.g. "8 ladies 9-12" or "", "tasks": [task text, ...]}],
 "ovenDays": [{"title": e.g. "Saturday", "service": time food is served "HH:MM" 24h or null, "slots": [{"lane": ..., "start": "HH:MM" 24h, "minutes": number, "label": text}]}] — from any oven schedule table; ${STAGES_NOTE} Kitchen times like "1:00" in an afternoon schedule are 13:00,
 "extras": [grocery items that are not food from recipes, e.g. "take-out containers"],
 "planText": ${full}
}
Recipes in the library (match dishes to these by meaning, e.g. "Mashed Potatoes" -> the mashed potato recipe):
${recipes.map((r) => `${r.id}: ${r.name}`).join('\n')}`

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: cors })
  try {
    const ANTHROPIC_KEY = Deno.env.get('ANTHROPIC_API_KEY')
    if (!ANTHROPIC_KEY) return json({ error: 'ANTHROPIC_API_KEY is not set for this project.' }, 500)
    const userClient = createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_ANON_KEY')!, {
      global: { headers: { Authorization: req.headers.get('Authorization') ?? '' } },
    })
    const { data: isOrg } = await userClient.rpc('is_organizer')
    if (!isOrg) return json({ error: 'Only organizers can import.' }, 403)

    const { kind, text, file, fileName } = await req.json()
    if (kind !== 'recipe' && kind !== 'event') return json({ error: 'kind must be recipe or event' }, 400)
    if (!text && !file) return json({ error: 'Nothing to read.' }, 400)

    // When the app already sent the text (Word / pasted), don't make the model copy it back.
    const full = text ? '"" (the app already has the text)' : 'the full document as plain text, keeping every line of the original'
    let prompt = RECIPE_PROMPT(full)
    if (kind === 'event') {
      const { data: recipes } = await userClient.from('recipes').select('id, name').order('name')
      const today = new Date().toLocaleDateString('en-CA', { timeZone: 'America/Edmonton' })
      prompt = EVENT_PROMPT(today, recipes ?? [], full)
    }

    const content: unknown[] = []
    if (file) {
      const mime = String(file.mime || '').toLowerCase()
      const isPdf = mime.includes('pdf')
      const img = ['image/jpeg', 'image/png', 'image/webp', 'image/gif'].includes(mime) ? mime : 'image/jpeg'
      const source = { type: 'base64', media_type: isPdf ? 'application/pdf' : img, data: file.data }
      content.push(isPdf ? { type: 'document', source } : { type: 'image', source })
    }
    if (text) content.push({ type: 'text', text: `Document${fileName ? ` (${fileName})` : ''}:\n\n${String(text).slice(0, 120000)}` })
    content.push({ type: 'text', text: prompt })

    const res = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'x-api-key': ANTHROPIC_KEY, 'anthropic-version': '2023-06-01' },
      body: JSON.stringify({ model: 'claude-sonnet-4-6', max_tokens: kind === 'event' ? 16000 : 8000, messages: [{ role: 'user', content }] }),
    })
    const out = await res.json()
    const reply = out?.content?.find((b: { type: string }) => b.type === 'text')?.text?.trim() ?? ''
    if (!res.ok || !reply) return json({ error: out?.error?.message ?? 'Could not read the document.' }, 500)
    try {
      const m = reply.match(/\{[\s\S]*\}/)
      return json({ data: JSON.parse(m ? m[0] : reply) })
    } catch {
      return json({ error: 'The document could not be read. Try pasting the text instead.' }, 422)
    }
  } catch (err) {
    return json({ error: (err as Error).message }, 500)
  }
})
