-- WOLT Kitchen seed 1 of 3: recipes + quantity reference
begin;
insert into public.recipes (id, name, category, batch_label, servings_per_batch, tags, ingredients, notes, source_text, source_file, reviewed) values
('alfredo-pasta', 'Alfredo & Pasta', 'Starch', 'Serving Dry Pasta: (60g) per person', null, '{}'::jsonb, '[{"item": "pkgs Giardino Penne 40 kg Penne pasta", "qty": 12, "qtyMax": 4, "raw": "12 - 4 kg pkgs Giardino Penne 40 kg Penne pasta", "unit": "kg"}, {"item": "Original Recipe (serves 4-6)", "qty": null, "raw": "Original Recipe (serves 4-6)", "unit": null}, {"item": "butter", "qty": 3, "raw": "3 Tbsp butter", "unit": "tbsp"}, {"item": "heavy cream, or half and half for a lighter sauce", "qty": 1, "raw": "1 cup heavy cream, or half and half for a lighter sauce", "unit": "cup"}, {"item": "garlic, minced", "qty": 2, "raw": "2 tsp garlic, minced", "unit": "tsp"}, {"item": "freshly grated parm", "qty": 1.5, "raw": "1½ cups freshly grated parm", "unit": "cup"}, {"item": "Salt and freshly cracked pepper", "qty": null, "raw": "Salt and freshly cracked pepper", "unit": null}, {"item": "Nutmeg, optional", "qty": null, "raw": "Nutmeg, optional", "unit": null}, {"item": "half and half to thin if needed", "qty": 0.25, "raw": "¼ cup half and half to thin if needed", "unit": "cup"}, {"item": "Alfredo Sauce 36x original 4 servings/ recipe", "qty": null, "raw": "Alfredo Sauce 36x original 4 servings/ recipe", "unit": null}, {"item": "Should make 25 L sauce", "qty": null, "raw": "Should make 25 L sauce", "unit": null}, {"item": "x recipe makes 100L sauce (2x double ivario)", "qty": 144, "raw": "-144x recipe makes 100L sauce (2x double ivario)", "unit": null}, {"item": "each 2” steam pan holds about 14 L", "qty": null, "raw": "- each 2” steam pan holds about 14 L", "unit": null}]'::jsonb, '', 'Alfredo & Pasta

Quantity: 650 people: 46 kg (dry pasta)

Serving Dry Pasta: (60g) per person

12 - 4 kg pkgs Giardino Penne 40 kg Penne pasta

Original Recipe (serves 4-6)

3 Tbsp butter

1 cup heavy cream, or half and half for a lighter sauce

2 tsp garlic, minced

1½ cups freshly grated parm

Salt and freshly cracked pepper

Nutmeg, optional

¼ cup half and half to thin if needed

Alfredo Sauce 36x original 4 servings/ recipe

Should make 25 L sauce

-144x recipe makes 100L sauce (2x double ivario)

- each 2” steam pan holds about 14 L

1.  Melt butter over medium-low heat. Add cream and bring to a simmer (lightly bubbling not a full boil). Cook, whisking often, for 5 min until it starts to thicken slightly.

2.  Then add garlic, cook for 1 min more. Add the cheese slowly (two or three batches per original recipe) and whisk constantly until melted. Add salt & pepper, nutmeg if using.

3.  If your sauce becomes too thick, think it out with a little extra cream or pasta water, or half and half.', 'Alfredo & Pasta.docx', false),
('applewood-smoked-ham', 'Applewood Smoked Ham', 'Protein', '', null, '{}'::jsonb, '[{"item": "Applewood Smoked Master Carve Ham", "qty": 40, "raw": "40kg Applewood Smoked Master Carve Ham", "unit": "kg"}, {"item": "chicken broth", "qty": 0.75, "raw": "¾ cup chicken broth", "unit": "cup"}, {"item": "apple juice", "qty": 0.25, "raw": "¼ cup apple juice", "unit": "cup"}]'::jsonb, '', 'Applewood Smoked Ham

+-----------------------------------------------------------------------+
| Ham Groceries                                                         |
|                                                                       |
| 40kg Applewood Smoked Master Carve Ham (13-14 pans)                   |
|                                                                       |
| 3 L broth                                                             |
|                                                                       |
| 1 L apple juice                                                       |
|                                                                       |
| Chutney (x56 for 14 pans)                                             |
|                                                                       |
| 56 x 20 oz cans crushed pineapple                                     |
|                                                                       |
| 28 cups brown sugar                                                   |
|                                                                       |
| 2 cups cinnamon                                                       |
|                                                                       |
| 3½ cup apple cider vinegar                                            |
|                                                                       |
| ⅓ cup cloves, ground                                                  |
+=======================================================================+
+-----------------------------------------------------------------------+

Wedding quantity:

40kg Applewood Smoked Master Carve Ham

¾ cup chicken broth

¼ cup apple juice

Prep Ahead: Preslice ham while cold, about ¼“ thick slices. Arrange shingled in foil steam pans. Each pan contains about 2.5-3kg ham and 1 cup of liquid. (12-15 pans total)

Reheat Setting: 250F, 80% humidity, Fan: low, tight fitting lid. Check internal temp at 40 min (165F probe)

Warmer setting: 165F

Pineapple Chutney (4x per pan)

20oz can crushed pineapple

½ cup brown sugar

½ tsp cinnamon

1 tbsp apple cider vinegar (add more towards the end if it needs more acidity)

¼ cloves, ground

Simmer 20-30 min until thickened (large batch may take 30-60 min). Prep two days ahead.', 'Applewood Smoked Ham.docx', false),
('baby-roasted-potatoes', 'Baby Roasted Potatoes', 'Starch', 'Each pan holds about 10 lbs baby potatoes', null, '{}'::jsonb, '[{"item": "baby potatoes", "qty": 10, "raw": "10 lbs baby potatoes", "unit": "lb"}, {"item": "onions (optional, or purple onion)", "qty": 1, "qtyMax": 2, "raw": "1-2 onions (optional, or purple onion)", "unit": null}, {"item": "Olive oil", "qty": 0.5, "raw": "½ cup Olive oil", "unit": "cup"}, {"item": "~1½ tbsp Kosher salt", "qty": null, "raw": "~1½ tbsp Kosher salt", "unit": null}, {"item": "~½ tbsp coarse black pepper", "qty": null, "raw": "~½ tbsp coarse black pepper", "unit": null}]'::jsonb, '', 'Baby Roasted Potatoes

Each pan holds about 10 lbs baby potatoes

Plan for 100lbs for wedding; 120lb for whole church

1 Costco box is 25lbs or 11.34kg

Groceries for 1 pan:

10 lbs baby potatoes

1-2 onions (optional, or purple onion)

½ cup Olive oil

Squeeze of fresh lemon juice if potatoes are cut and stored overnight.

~1½ tbsp Kosher salt

~½ tbsp coarse black pepper

1.  Quarter large potatoes/ halve baby potatoes

2.  Cube onions

3.  Store potatoes in water and refrigerate overnight.

4.  Day of serving: drain water, dry potatoes on large towels. Weigh 10lbs per bowl/pan.

5.  Toss potatoes (and onions) with olive oil, salt and pepper before filling roasting pans. Cover to roast.

6.  Pathway: Manual combi at 425 for 1hr: longer if larger pieces. Add 20 min uncovered for crispier potatoes.

7.  Check for salt.', 'Baby Roasted Potatoes.docx', false),
('baked-chicken-and-vegetables', 'Baked Chicken and Vegetables', 'Protein', 'Each Hotel pan holds ~33 pieces, really snug', null, '{}'::jsonb, '[{"item": "chicken pieces skin on preferably", "qty": 7, "qtyMax": 9, "raw": "7-9 chicken pieces skin on preferably", "unit": null}, {"item": "sliced onion", "qty": 1, "raw": "1 sliced onion", "unit": null}, {"item": "sliced red pepper", "qty": 1, "raw": "1 sliced red pepper", "unit": null}, {"item": "sweet chilli sauce", "qty": 0.5, "raw": "½ cup sweet chilli sauce", "unit": "cup"}]'::jsonb, '', 'Baked Chicken and Vegetables - Sivanskitchen

1 pkg thighs = ~20 pieces

Each Hotel pan holds ~33 pieces, really snug

Original recipe:

7-9 chicken pieces skin on preferably

1 sliced onion

1 sliced red pepper

½ cup sweet chilli sauce

RUB:

3 tsp salt

2 tsp paprika

2 tsp onion powder

1 tsp black pepper

1 tsp turmeric

3 minced garlic cloves

⅓ cup oil

DIRECTIONS:

1 Prepare the rub ahead of time. Slice onions and peppers ahead.

2. In a large bowl, combine all the spices, garlic and oil. Mix well. Season the chicken: Spread the rub on each piece of chicken and underneath the skin. Set the bowl aside without washing it. Arrange chicken snuggly into steam pan, about 33 pieces per pan.

3. Prepare the vegetables: Peel and cut the potatoes into chunks. Slice onion and pepper. Place vegetable into the same bowl as the chicken rub. Add sweet chilli sauce and toss to coat.

4. Place the sliced vegetables on top of and around the chicken pieces in the baking dish. Cover with parchment paper and then aluminum foil so it doesn’t stick to the lid. Parchment paper will also keep from the toxins of the foil to contaminate food.

5. Pathway: Manual combi ovens at 350º. Bake for at least 2 hours. Remove the parchment paper and foil, then preheat oven for “Crisp/Refresh” for additional 6 minutes to brown the top.

If browning is uneven, try pans on every other rack.', 'Baked Chicken and Veg.docx', false),
('baked-potato', 'Baked Potato', 'Starch', '-   Halve, olive oil, kosher salt & pepper', null, '{}'::jsonb, '[]'::jsonb, '', 'Baked Potato

Quatity: 200-225 lbs russets

Prep:

-   Scrub clean

-   Halve, olive oil, kosher salt & pepper

-   Onto parchment paper on pans

Cooking method:

- Combi: 10-20%, @375º with probe: about 30-40 min

- finish with 5-8min with 0% humidity @400º for crispier skins (opt)

- **Just use presetting for baked potato, with probe ( about 1 hour)', 'Baked Potatoes.docx', false),
('balsamic-fig-chicken', 'Balsamic Fig Chicken', 'Protein', 'Single Steam Pan: 20 bone-in, skin-on, chicken thighs, trimmed of extra fat', null, '{}'::jsonb, '[{"item": "butter or olive oil (*use if frying onions)", "qty": 3, "raw": "3 Tbsp butter or olive oil (*use if frying onions)", "unit": "tbsp"}, {"item": "onion, finely diced (3 cups)", "qty": 1.5, "raw": "1 ½ onion, finely diced (3 cups)", "unit": null}, {"item": "garlic, minced", "qty": 2, "raw": "2 Tbsp garlic, minced", "unit": "tbsp"}, {"item": "dried Thyme leaves", "qty": 1, "raw": "1 Tbsp dried Thyme leaves", "unit": "tbsp"}, {"item": "red chili flakes", "qty": 1, "raw": "1 tsp red chili flakes", "unit": "tsp"}, {"item": "balsamic vinegar", "qty": 0.75, "raw": "¾ cup balsamic vinegar", "unit": "cup"}, {"item": "chicken stock (add salt if using the Costco, unsalted one)", "qty": 2, "raw": "2 cups chicken stock (add salt if using the Costco, unsalted one)", "unit": "cup"}, {"item": "dry white wine", "qty": 1, "raw": "1 cup dry white wine", "unit": "cup"}, {"item": "Dijon mustard", "qty": 0.25, "raw": "¼ cup Dijon mustard", "unit": "cup"}, {"item": "honey, melted", "qty": 0.25, "raw": "¼ cup honey, melted", "unit": "cup"}, {"item": "dried figs, cut in half lengthwise", "qty": 12, "raw": "12 dried figs, cut in half lengthwise", "unit": null}]'::jsonb, '', 'Balsamic Fig Chicken

Single Steam Pan: 20 bone-in, skin-on, chicken thighs, trimmed of extra fat
salt and pepper both sides (each flat has ~24 bone in thighs)

3 Tbsp butter or olive oil (*use if frying onions)
1 ½ onion, finely diced (3 cups)
2 Tbsp garlic, minced
1 Tbsp dried Thyme leaves
1 tsp red chili flakes
¾ cup balsamic vinegar
2 cups chicken stock (add salt if using the Costco, unsalted one)
1 cup dry white wine
¼ cup Dijon mustard
¼ cup honey, melted
12 dried figs, cut in half lengthwise

PREP AHEAD: (Steps 1-4)

1.  Mince onions, (1 cup finely chopped onion = ½ large onion)

2.  Remove stems from figs if needed and cut in half. Portion 12 figs per pan

3.  Trim thighs, season well with salt and pepper.

4.  Stir together balsamic vinegar, chicken stock, wine, Dijon mustard, and honey. Pour over onions, spices, and figs; lay chicken on top.

DAY OF:

5.  Cook uncovered. Icombi: Poultry>roast > probe to 170F (second browning setting – med was too dark) - took about 26 min

6.  Combine 2 pans of chicken into one (only keep one pan of sauce) and serve.

Note: 100 kg = about 650 average thighs

Wedding : 425 guests

Balsamic Fig Chicken Groceries
(100 kg chicken thighs – 33 times original recipe, so ~30 pans)

50 med onions
1 L minced garlic
2 ¼ cups thyme
¾ cup chili flakes
6 L balsamic vinegar
16 L chicken stock
7.81 L white wine
2.5 L Dijon mustard
2 L honey
396 dried figs', 'Balsamic Fig Chicken.docx', false),
('bbq-baby-back-ribs', 'BBQ Baby Back Ribs', 'Protein', '(SLW- bought 119kg ribs; had 1 pan in warmers plus pans on serving table leftover)', null, '{}'::jsonb, '[{"item": "pork back ribs", "qty": 4, "raw": "4 racks of pork back ribs", "unit": "rack"}, {"item": "yellow mustard", "qty": 0.5, "raw": "½ cup yellow mustard", "unit": "cup"}, {"item": "brown sugar", "plus": {"qty": 2, "unit": "tbsp"}, "qty": 0.5, "raw": "½ cup + 2 Tbsp brown sugar", "unit": "cup"}, {"item": "smoked paprika (sweet optional)", "plus": {"qty": 1, "unit": "tbsp"}, "qty": 0.25, "raw": "¼ cup + 1 Tbsp smoked paprika (sweet optional)", "unit": "cup"}, {"item": "kosher salt", "qty": 5, "raw": "5 tsp kosher salt", "unit": "tsp"}, {"item": "black pepper", "qty": 5, "raw": "5 tsp black pepper", "unit": "tsp"}, {"item": "garlic powder", "qty": 5, "raw": "5 tsp garlic powder", "unit": "tsp"}, {"item": "onion powder", "qty": 5, "raw": "5 tsp onion powder", "unit": "tsp"}, {"item": "cayenne pepper (up to 2 tsp for more heat)", "qty": 1, "raw": "1 tsp cayenne pepper (up to 2 tsp for more heat)", "unit": "tsp"}, {"item": "BBQ sauce", "qty": 2.5, "raw": "2½ cups BBQ sauce", "unit": "cup"}]'::jsonb, '', 'BBQ Baby Back Ribs

Quantity: 1 rack / 5 people: 675 people =

Costco: 8 packages (or 16 racks) / case …. Get 8 cases = 128 racks

(SLW- bought 119kg ribs; had 1 pan in warmers plus pans on serving table leftover)

Recipe per 2 pkgs (1 pan = 4 racks standing in each pan): **calculate oven space/# pans

4 racks of pork back ribs

½ cup yellow mustard

½ cup + 2 Tbsp brown sugar

¼ cup + 1 Tbsp smoked paprika (sweet optional)

5 tsp kosher salt

5 tsp black pepper

5 tsp garlic powder

5 tsp onion powder

1 tsp cayenne pepper (up to 2 tsp for more heat)

2½ cups BBQ sauce

Instructions:

1.  Pat ribs dry, Cut into approx 3 rib pieces, rub in yellow mustard, coat evenly with rub mixture (divided between 4 racks: use ⅓ cup seasoning/rack)

2.  Stack racks on end in a steam pan. Cover tightly. Refrigerate overnight.

3.  Pathway: Manual Bake: 70% moisture, 275ºF for 3 hours.

    1.  Best method: use Low Temp Roasting preset, with probe through the thickest part of the ribs ( about 7 hours)

4.  Remove from oven, drain liquid from the pan, baste with BBQ sauce

5.  Panfry uncovered (without probe) for 5 min', 'BBQ Ribs.docx', false),
('bbq-grilled-chicken', 'BBQ Grilled Chicken', 'Protein', 'Per 2kg package of boneless chicken thighs (about 22 pieces)', null, '{}'::jsonb, '[{"item": "smoked paprika", "qty": 10, "raw": "10 tsp smoked paprika", "unit": "tsp"}, {"item": "garlic powder", "qty": 5, "raw": "5 tsp garlic powder", "unit": "tsp"}, {"item": "onion powder", "qty": 5, "raw": "5 tsp onion powder", "unit": "tsp"}, {"item": "kosher salt", "qty": 5, "raw": "5 tsp kosher salt", "unit": "tsp"}, {"item": "black pepper", "qty": 2.5, "raw": "2½ tsp black pepper", "unit": "tsp"}, {"item": "chili powder or cayenne (optional for heat) **use only 1½ tsp chili powder for the church", "qty": 2.5, "raw": "2½ tsp chili powder or cayenne (optional for heat) **use only 1½ tsp chili powder for the church", "unit": "tsp"}, {"item": "brown sugar", "qty": 5, "raw": "5 Tbsp brown sugar", "unit": "tbsp"}, {"item": "Olive oil**", "qty": null, "raw": "Olive oil**", "unit": null}]'::jsonb, '', 'BBQ Grilled Chicken

Church meal: 7 cases of thighs (42 packages)

Per 2kg package of boneless chicken thighs (about 22 pieces)

Dry Rub:

10 tsp smoked paprika

5 tsp garlic powder

5 tsp onion powder

5 tsp kosher salt

2½ tsp black pepper

2½ tsp chili powder or cayenne (optional for heat) **use only 1½ tsp chili powder for the church

5 Tbsp brown sugar

Olive oil**

Directions

1.  Pat chicken dry with paper towels, **rub lightly with olive oil to help seasoning stick. Mix rub ingredients together and coat chicken. Let sit 15 min or overnight for deeper flavour.

2.  Place chicken on parchment paper lined pans. Refrigerate overnight.

3.  Pathway: Preheat: Grill Chicken, with probe. About 8 mins', 'BBQ Chicken.docx', false),
('bbq-shredded-chicken', 'BBQ Shredded Chicken', 'Protein', '', null, '{}'::jsonb, '[{"item": "breast or thigh", "qty": 5, "raw": "5 lbs breast or thigh", "unit": "lb"}, {"item": "chicken broth", "qty": 1, "raw": "1 cup chicken broth", "unit": "cup"}, {"item": "salt", "qty": 1.5, "raw": "1½ tsp salt", "unit": "tsp"}, {"item": "black pepper", "qty": 1, "raw": "1 tsp black pepper", "unit": "tsp"}, {"item": "smoked paprika", "qty": 1, "raw": "1 tsp smoked paprika", "unit": "tsp"}, {"item": "chili powder", "qty": 0.5, "raw": "½ tsp chili powder", "unit": "tsp"}, {"item": "garlic powder", "qty": 1, "raw": "1 tsp garlic powder", "unit": "tsp"}, {"item": "BBQ sauce (Cattlemans Caralina Tangy Gold)", "qty": 1, "qtyMax": 2, "raw": "1-2 cups BBQ sauce (Cattlemans Caralina Tangy Gold)", "unit": "cup"}]'::jsonb, '', 'BBQ Shredded Chicken

Original Recipe:

5 lbs breast or thigh

1 cup chicken broth

1½ tsp salt

1 tsp black pepper

1 tsp smoked paprika

½ tsp chili powder

1 tsp garlic powder

1-2 cups BBQ sauce (Cattlemans Caralina Tangy Gold)

-   Place chicken in foil steam pans in a single layer, pour chicken broth over top. Season with spices and cover with lids.

-   Method: combi steam @ 200 - humidity 70%, use probe to 165º (for 35-45 min)

-   Let chicken rest for 10 min before shredding

-   Remove from broth, Shred with forks or paddle attachement on mixer.

-   Return to broth and mix with cooking juices from the pan to keep moist.

-   Refridgerate or freeze

-   Thaw and then Reheat: with probe to 160.

-   Stir in BBQ sauce, into warmers', 'BBQ Shredded Chicken.docx', false),
('beet-feta-salad', 'Beet & Feta Salad', 'Salad', 'Buffet plan ~3-3.5 oz salad per person when there are more than one salad', null, '{}'::jsonb, '[{"item": "lg beets (Costco bag is ~18 beets)", "qty": 2, "raw": "2 lg beets (Costco bag is ~18 beets)", "unit": null}, {"item": "chopped walnuts, toasted (or other nut)", "qty": 0.5, "raw": "½ cup chopped walnuts, toasted (or other nut)", "unit": "cup"}, {"item": "maple syrup if doing candied nuts", "qty": 3, "raw": "3 tbsp maple syrup if doing candied nuts", "unit": "tbsp"}, {"item": "(284g) crispies & crunchies", "qty": 1, "raw": "1 pkg (284g) crispies & crunchies", "unit": "pkg"}, {"item": "(3 oz) crumbled goat or feta cheese", "qty": 0.3333333333333333, "raw": "⅓ cup (3 oz) crumbled goat or feta cheese", "unit": "cup"}]'::jsonb, '', 'Beet & Feta Salad

Buffet plan ~3-3.5 oz salad per person when there are more than one salad

Wedding quantity: 7 rectangle pans

Full Church quantity: 8 rectangle pans

Base Recipe: (3x/ rectangle bowl)

2 lg beets (Costco bag is ~18 beets)

½ cup chopped walnuts, toasted (or other nut)

3 tbsp maple syrup if doing candied nuts

1 pkg (284g) crispies & crunchies

⅓ cup (3 oz) crumbled goat or feta cheese

Dressing: (yields ~½ cup -plan for 4x/ rectangle bowl )

3 tbsp extra virgin olive oil

2 tbsp balsamic vinegar

2½ tsp dijon mustard

2 tsp honey

½ tsp Kosher Salt

¼ tsp pepper

*dressing can be made 5-7 days ahead

1.  Walnuts: toasted or candied, a few days ahead.

1.  Roast beets 1-2 days ahead, peel, cover, refrigerate. —Wash beets well, trim tops, leave skin on. Wrap individually in foil. Pathway: combo mode 356ºF, Humidity 25%, Fan: Medium, Time: 45-75 min depending on beet size, it should pierce easily.

2.  Dressing can be made ahead, refrigerated.

3.  Beets chopped

4.  In shallow plastic hotel pans: layer greens.

5.  Just before serving scatter beets, feta and walnuts on top, drizzle vinaigrette (don’t toss)', 'Beet & Feta Salad.docx', false),
('blackened-salmon', 'Blackened Salmon', 'Protein', '', null, '{}'::jsonb, '[{"item": "extra virgin olive oil", "qty": 3, "raw": "3 tbsp extra virgin olive oil", "unit": "tbsp"}, {"item": "light brown sugar, packed", "qty": 1, "raw": "1 tbsp light brown sugar, packed", "unit": "tbsp"}, {"item": "smoked paprika", "qty": 1, "raw": "1 tbsp smoked paprika", "unit": "tbsp"}, {"item": "cumin", "qty": 2, "raw": "2 tsp cumin", "unit": "tsp"}, {"item": "dried thyme", "qty": 1, "raw": "1 tsp dried thyme", "unit": "tsp"}, {"item": "dried oregano", "qty": 1, "raw": "1 tsp dried oregano", "unit": "tsp"}, {"item": "cayenne", "qty": 1, "raw": "1 tsp cayenne", "unit": "tsp"}, {"item": "crushed red pepper flakes", "qty": 0.25, "qtyMax": 0.5, "raw": "¼-½ tsp crushed red pepper flakes", "unit": "tsp"}, {"item": "fink pink salt", "qty": 0.5, "raw": "½ tsp fink pink salt", "unit": "tsp"}, {"item": "garlic, minced", "qty": 2, "raw": "2 tsp garlic, minced", "unit": "tsp"}, {"item": "(0.9kg) skinless salmon, cut to serve", "qty": 2, "raw": "2lb (0.9kg) skinless salmon, cut to serve", "unit": "lb"}, {"item": "Spicy Honey Mustard Sauce", "qty": null, "raw": "Spicy Honey Mustard Sauce", "unit": null}, {"item": "mayo", "qty": 0.3333333333333333, "raw": "⅓ cup mayo", "unit": "cup"}, {"item": "dijon mustard", "qty": 0.25, "raw": "¼ cup dijon mustard", "unit": "cup"}, {"item": "honey", "qty": 2, "raw": "2 tbsp honey", "unit": "tbsp"}, {"item": "Juice of ½ lemon", "qty": null, "raw": "Juice of ½ lemon", "unit": null}, {"item": "curry powder", "qty": 1, "raw": "1 tsp curry powder", "unit": "tsp"}, {"item": "cayenne", "qty": 0.25, "raw": "¼ tsp cayenne", "unit": "tsp"}, {"item": "Fine pink Himalayan salt", "qty": null, "raw": "Fine pink Himalayan salt", "unit": null}, {"item": "Pieces onto sheetpans with parchment paper.", "qty": null, "raw": "Pieces onto sheetpans with parchment paper.", "unit": null}]'::jsonb, '', 'Blackened Salmon

Original recipe (9½ tbsp)

3 tbsp extra virgin olive oil

1 tbsp light brown sugar, packed

1 tbsp smoked paprika

2 tsp cumin

1 tsp dried thyme

1 tsp dried oregano

1 tsp cayenne

¼-½ tsp crushed red pepper flakes

½ tsp fink pink salt

2 tsp garlic, minced

2lb (0.9kg) skinless salmon, cut to serve

Spicy Honey Mustard Sauce

(Makes ⅔ cup)

⅓ cup mayo

¼ cup dijon mustard

2 tbsp honey

Juice of ½ lemon

1 tsp curry powder

¼ tsp cayenne

Fine pink Himalayan salt

(Stores up to 2 weeks)

Make the dry rub the 2-3 days ahead. Add olive oil and zest the morning of (max 4 hours early). Portion Salmon pieces the day before. Toss with marinade no earlier than 4 hours before.

Pieces onto sheetpans with parchment paper.

Pathway: Salmon: Pan Fry: ~8 min?', 'Blackened Salmon_.docx', false),
('brown-sugar-glazed-carrots', 'Brown Sugar Glazed Carrots', 'Vegetable', 'Serving: 3-4 oz per person', null, '{}'::jsonb, '[{"item": "carrot, peeled, rough chop", "qty": 2, "raw": "2lb carrot, peeled, rough chop", "unit": "lb"}, {"item": "brown sugar, loosely packed", "qty": 0.25, "raw": "¼ cup brown sugar, loosely packed", "unit": "cup"}, {"item": "garlic cloves, minced", "qty": 2, "raw": "2 garlic cloves, minced", "unit": null}, {"item": "olive oil", "qty": 3, "raw": "3 tbsp olive oil", "unit": "tbsp"}, {"item": "salt", "qty": 0.5, "raw": "½ tsp salt", "unit": "tsp"}, {"item": "black pepper", "qty": 0.25, "raw": "¼ tsp black pepper", "unit": "tsp"}]'::jsonb, '', 'Brown Sugar Glazed Carrots

Serving: 3-4 oz per person

Original:

2lb carrot, peeled, rough chop

¼ cup brown sugar, loosely packed

2 garlic cloves, minced

3 tbsp olive oil

½ tsp salt

¼ tsp black pepper

Prep:

-   Prep Glaze 1-2 days ahead

-   Prep 1 day ahead:

    -   Peel carrots, slice diagonally into 4 cm lengths, for thicker ends, halve them so all pieces are roughly the same for even cooking

    -   Toss carrots with glaze and cool covered. (*option: reserve a portion of glaze to toss in after roasting for glossy finish and boosts flavour)

-   Day of: Toss once more, spread evenly onto baking sheets, don’t overcrowd pans

Pathway : either “Vegetables - roasting”

OR step 1: 170º, 40% humidity, 10 min

step 2: 210º, 0% humidity, 10-15 min (until caramelized)', 'Brown Sugar Glazed Carrots.docx', false),
('caesar-salad', 'Caesar Salad', 'Salad', '7 large pebble serving bowls (plus reserved for refill)', null, '{}'::jsonb, '[{"item": "large pebble serving bowls (plus reserved for refill)", "qty": 7, "raw": "7 large pebble serving bowls (plus reserved for refill)", "unit": null}, {"item": "Romaine lettuce (each case is 6 pkgs)", "qty": 3, "raw": "3 cases of Romaine lettuce (each case is 6 pkgs)", "unit": "case"}, {"item": "fresh bacon (Olymel 14/16 - 5kg (or 11lb) per box) (~2lb/bowl)", "qty": 1.5, "qtyMax": 2, "raw": "1½-2 boxes fresh bacon (Olymel 14/16 - 5kg (or 11lb) per box) (~2lb/bowl)", "unit": "box"}, {"item": "Petal parmesan - about ⅓ jar per salad bowl", "qty": 3, "raw": "3 jars Petal parmesan - about ⅓ jar per salad bowl", "unit": "jar"}, {"item": "lg jugs Renee’s Caesar dressing (1.4 L ea)…", "qty": 2, "qtyMax": 3, "raw": "2-3 lg jugs Renee’s Caesar dressing (1.4 L ea)…", "unit": null}, {"item": "Croutons (opt)", "qty": 4, "raw": "4 bags Croutons (opt)", "unit": "bag"}, {"item": "if its only 1 salad, get 4 cases of romaine", "qty": null, "raw": "*if its only 1 salad, get 4 cases of romaine", "unit": null}]'::jsonb, '', 'Caesar Salad

7 large pebble serving bowls (plus reserved for refill)

3 cases of Romaine lettuce (each case is 6 pkgs)

1½-2 boxes fresh bacon (Olymel 14/16 - 5kg (or 11lb) per box) (~2lb/bowl)

3 jars Petal parmesan - about ⅓ jar per salad bowl

2-3 lg jugs Renee’s Caesar dressing (1.4 L ea)…

4 bags Croutons (opt)

*if its only 1 salad, get 4 cases of romaine

Prep:

1.  Chop bacon, fry, strain in sieves, then paper towel off remaining grease. Store in the fridge until needed.

2.  Wash romaine the day prior: - chop off base, rinse well as a full head, shake really well keeping it as a full head, stand up to drain in sanitized bus bins.

3.  Drain the water from the bins 2x

4.  Serving Day: chop romaine

5.  Prep bowls with romaine, bacon.

6.  Just before serving, toss with dressing, parm petals and optional croutons', 'Ceasar Salad.docx', false),
('cajun-chicken', 'Cajun Chicken', 'Protein', 'Recipe per 5kg (11lb) box', null, '{}'::jsonb, '[{"item": "olive oil", "qty": 0.5, "raw": "½ cup olive oil", "unit": "cup"}, {"item": "powdered parm", "qty": 0.6666666666666666, "raw": "⅔ cup powdered parm", "unit": "cup"}, {"item": "*cajun seasoning (pre-make)", "qty": 0.6666666666666666, "raw": "⅔ cup *cajun seasoning (pre-make)", "unit": "cup"}, {"item": "smoked paprika", "qty": 5.5, "raw": "5½ tsp smoked paprika", "unit": "tsp"}, {"item": "onion powder", "qty": 5.5, "raw": "5½ tsp onion powder", "unit": "tsp"}, {"item": "garlic powder", "qty": 5.5, "raw": "5½ tsp garlic powder", "unit": "tsp"}, {"item": "Himalayan salt", "qty": 1.5, "raw": "1½ Tbsp Himalayan salt", "unit": "tbsp"}, {"item": "pepper", "qty": 1, "raw": "1 Tbsp pepper", "unit": "tbsp"}]'::jsonb, '', 'Cajun Chicken

Church Lunch: 90kg (198lbs) or 7.5 cases

Wedding: 14x chicken recipe (70kg), 40x parm dip

Recipe per 5kg (11lb) box

½ cup olive oil

⅔ cup powdered parm

⅔ cup *cajun seasoning (pre-make)

5½ tsp smoked paprika

5½ tsp onion powder

5½ tsp garlic powder

1½ Tbsp Himalayan salt

1 Tbsp pepper

Directions:

-   rinse 5kg box chicken, toss each box per bowl: following recipe

-   Single chicken onto sheet pans with parchment

Pathway:

-   Chicken: Pan Fry - with probe: select Dark #3 (about 12 min)', 'Cajun Chicken.docx', false),
('chicken-with-garlic-parmesan-cream-sauce', 'Chicken with Garlic Parmesan Cream Sauce', 'Protein', 'Each serving pan holds about 3 flats of chicken = 16 serving trays in warmer', null, '{}'::jsonb, '[{"item": "salted butter", "qty": 0.3333333333333333, "raw": "-   ⅓ cup salted butter", "unit": "cup"}, {"item": "minced garlic (jar style)", "qty": 3, "raw": "-   3 Tbsp minced garlic (jar style)", "unit": "tbsp"}, {"item": "Italian seasoning", "qty": 3, "raw": "-   3 tsp Italian seasoning", "unit": "tsp"}, {"item": "chicken broth", "qty": 3, "raw": "-   3 L chicken broth", "unit": "L"}, {"item": "heavy cream", "qty": 1.5, "raw": "-   1½ cup heavy cream", "unit": "cup"}, {"item": "salt", "qty": 1.5, "raw": "-   1½ tsp salt", "unit": "tsp"}, {"item": "pepper", "qty": 0.75, "raw": "-   ¾ tsp pepper", "unit": "tsp"}, {"item": "grated Parmesan cheese", "qty": 0.75, "raw": "-   ¾ cup grated Parmesan cheese", "unit": "cup"}]'::jsonb, '', 'Chicken with Garlic Parmesan Cream Sauce

Wedding Quantity (450 people): 1½ thighs/person

Costco case = 6 flats (20 pieces/flat). Total: buy 8 cases of thighs (48 flats)

Each serving pan holds about 3 flats of chicken = 16 serving trays in warmer

Prep before event:

Chicken Ingredients:

-   1 flat of chicken thighs (about 4 lbs)

-   Italian seasoning (Costco) very generously

-   Salt and Pepper

Process

-   Open thighs on a cookie sheet with parchment paper

-   Lightly Salt & pepper both sides of thigh, and generous Italian seasoning both sides

-   Load oven trolley

PATHWAY

Select “Panfry” (12min)?

Select “Medium” colouring

-   Insert Probe: direction from thin side towards thicker side (use a thick piece in the centre of the pan)

-   Shingle-Layer chicken into serving pans to slightly cool, cover and refrigerate

Sauce Ingredients: (per 1 serving pan)

-   ⅓ cup salted butter

-   3 Tbsp minced garlic (jar style)

-   3 tsp Italian seasoning

-   3 L chicken broth

-   1½ cup heavy cream

-   1½ tsp salt

-   ¾ tsp pepper

-   ¾ cup grated Parmesan cheese

-   In Ivario: @250º Melt butter, add garlic

-   Add remaining ingredients (except Parm cheese!)

-   Cook until slightly thickened at 200º

-   Remove from skillet

-   Add parm cheese

-   Cool and refrigerate

REHEAT DAY

-   Allow about 30 min to prep for the reheat

-   RE-Shingle - Layer chicken into serving pans, drizzle with sauce between layers

-   Equal amounts of sauce on each piece

-   Stack 3 layers deep

-   Cover pans

-   Fill oven trolley

PATHWAY

Select: “Heat Through”

Allow about 45 in oven

-   Insert probe from top to bottom through multiple pieces of meat', 'Chicken w_ Parmesean cream sauce.docx', false),
('chipotle-chili', 'Chipotle Chili', 'Soup', '', null, '{}'::jsonb, '[{"item": "gr beef", "qty": 6, "raw": "6 lb gr beef", "unit": "lb"}, {"item": "Italian sausage", "qty": 3, "raw": "3 lb Italian sausage", "unit": "lb"}, {"item": "cumin", "qty": 3, "raw": "3 Tbsp cumin", "unit": "tbsp"}, {"item": "coriander", "qty": 3, "raw": "3 tsp coriander", "unit": "tsp"}, {"item": "lg onion, diced", "qty": 3, "raw": "3 lg onion, diced", "unit": null}, {"item": "minced garlic", "qty": 3, "raw": "3 tsp minced garlic", "unit": "tsp"}, {"item": "cans diced tomatoes", "qty": 3, "qtyMax": 28, "raw": "3 - 28 oz cans diced tomatoes", "unit": "oz"}, {"item": "cans tomatoes sauce", "qty": 3, "qtyMax": 15, "raw": "3 - 15 oz cans tomatoes sauce", "unit": "oz"}, {"item": "can kidney beans", "qty": 2, "qtyMax": 14, "raw": "2 - 14oz can kidney beans", "unit": "oz"}, {"item": "minced chipotle peppers in adobo sauce", "qty": 2, "raw": "2 Tbsp minced chipotle peppers in adobo sauce", "unit": "tbsp"}, {"item": "salt", "qty": 3, "raw": "3 tsp salt", "unit": "tsp"}, {"item": "Ground black pepper", "qty": null, "raw": "Ground black pepper", "unit": null}, {"item": "cans tomato paste", "qty": 3, "qtyMax": 6, "raw": "3 - 6 oz cans tomato paste", "unit": "oz"}]'::jsonb, '', 'Chipotle Chili

Recipe for 1 liner:

6 lb gr beef

3 lb Italian sausage

(15 Tbsp!) try 10 Tbsp chili powder

3 Tbsp cumin

3 tsp coriander

3 lg onion, diced

3 tsp minced garlic

3 - 28 oz cans diced tomatoes

3 - 15 oz cans tomatoes sauce

2 - 14oz can kidney beans

2 Tbsp minced chipotle peppers in adobo sauce

3 tsp salt

Ground black pepper

3 - 6 oz cans tomato paste

Directions:

Method:

-   spray steam pans with holes with Pam Spray

-   Add 10lbs beef to one pan

-   Break up the beef with your hands

-   Add diced onion and minced garlic, mix by hand

-   Insert steam pan into deep hotel pan

-   Pathway: Steam on 265 high heat for 20 min: break up meat with mincer: return to oven for another 20 min

-   Transfer to serving pans: add seasonings and break up further and mix all together

-   Serving pans can then be topped up to each hold 15 lbs (or 1½ pans)

Reheat:

Pathway: Heat through with probe; ?', 'Chipotle Chili.docx', false),
('cilantro-lime-rice', 'Cilantro Lime Rice', 'Starch', '', null, '{}'::jsonb, '[{"item": "hot cooked brown rice (⅔ cup raw)", "qty": 2, "raw": "2 c hot cooked brown rice (⅔ cup raw)", "unit": "cup"}, {"item": "fresh lime juice", "qty": 1, "raw": "1 Tbsp fresh lime juice", "unit": "tbsp"}, {"item": "minced fresh cilantro", "qty": 1, "raw": "1 Tbsp minced fresh cilantro", "unit": "tbsp"}, {"item": "grated lime zest", "qty": 0.5, "raw": "½ tsp grated lime zest", "unit": "tsp"}]'::jsonb, '', 'Cilantro Lime Rice

Original Recipe

2 c hot cooked brown rice (⅔ cup raw)

1 Tbsp fresh lime juice

1 Tbsp minced fresh cilantro

½ tsp grated lime zest

-   Cook rice 1:1.5 ratio to water, with salt

-   Add lime juice, zest and cilantro: combine

(**Raw rice ~triples once cooked)

Church Quantities

8 cups raw rice per pan = 24 cups cooked rice

(We made 9 for the Sunday Lunch, at least 2-3 pans left over)

Recipe for 1 serving pan:

8 cups raw basmati rice

3 tsp salt (*we did 2 tsp and it could have used more)

½ cup lime juice. (*Actually only had enough for ⅓ cup /pan)

2 Tbsp lime zest

½ cup minced cilantro', 'Cilantro Lime RIce.docx', false),
('cilantro-lime-vinaigrette', 'Cilantro Lime Vinaigrette', 'Sauce & dressing', 'Original Recipe (yields 1¼ cups)', null, '{}'::jsonb, '[{"item": "extra virgin olive oil", "qty": 0.3333333333333333, "raw": "⅓ cup extra virgin olive oil", "unit": "cup"}, {"item": "salsa verde (omit for garlic-free)", "qty": 0.3333333333333333, "raw": "⅓ cup salsa verde (omit for garlic-free)", "unit": "cup"}, {"item": "lime juice **Note: ~12 limes juiced yields ~2 cups", "qty": 0.25, "raw": "¼ cup lime juice **Note: ~12 limes juiced yields ~2 cups", "unit": "cup"}, {"item": "spicy honey (hot honey)", "qty": 2, "raw": "2 tsp spicy honey (hot honey)", "unit": "tsp"}, {"item": "cilantro, chopped", "qty": 0.3333333333333333, "raw": "⅓ cup cilantro, chopped", "unit": "cup"}]'::jsonb, '', 'Cilantro Lime Vinaigrette

Original Recipe (yields 1¼ cups)

⅓ cup extra virgin olive oil

⅓ cup salsa verde (omit for garlic-free)

¼ cup lime juice **Note: ~12 limes juiced yields ~2 cups

2 tsp spicy honey (hot honey)

⅓ cup cilantro, chopped

32x recipe yields 10L

26x recipe yields 8L

16x recipe yields 5L **do this for church

Prepare dressing in 1L containers: 3x recipe/container

Add chopped cilantro unto 1 day before serving', 'Cilantro Lime Vinaigrette.docx', false),
('cornbread', 'Cornbread', 'Bread', '16 batches for the Church function. Each pan yields 40 pieces. Total 640 pieces.', null, '{}'::jsonb, '[{"item": "batches for the Church function. Each pan yields 40 pieces. Total 640 pieces.", "qty": 16, "raw": "16 batches for the Church function. Each pan yields 40 pieces. Total 640 pieces.", "unit": null}, {"item": "(360 g) corn meal", "qty": 3, "raw": "3 cups (360 g) corn meal", "unit": "cup"}, {"item": "(375 g) flour", "qty": 3, "raw": "3 cups (375 g) flour", "unit": "cup"}, {"item": "baking powder", "qty": 3, "raw": "3 tsp baking powder", "unit": "tsp"}, {"item": "baking soda", "qty": 1.5, "raw": "1½ tsp baking soda", "unit": "tsp"}, {"item": "salt", "qty": 0.5, "raw": "½ tsp salt", "unit": "tsp"}, {"item": "unsalted butter, melted", "qty": 1.5, "raw": "1½ cup unsalted butter, melted", "unit": "cup"}, {"item": "brown sugar, packed", "qty": 1, "raw": "1 cup brown sugar, packed", "unit": "cup"}, {"item": "honey", "qty": 6, "raw": "6 Tbsp honey", "unit": "tbsp"}, {"item": "large eggs, at room temp", "qty": 3, "raw": "3 large eggs, at room temp", "unit": null}, {"item": "buttermilk, at room temp", "qty": 3, "raw": "3 cups buttermilk, at room temp", "unit": "cup"}]'::jsonb, '', 'Cornbread

16 batches for the Church function. Each pan yields 40 pieces. Total 640 pieces.

Recipe per 20x14 cake pan. (Divide recipe by 3 for a 9x9” pan)

3 cups (360 g) corn meal

3 cups (375 g) flour

3 tsp baking powder

1½ tsp baking soda

½ tsp salt

1½ cup unsalted butter, melted

1 cup brown sugar, packed

6 Tbsp honey

3 large eggs, at room temp

3 cups buttermilk, at room temp

Directions

1.  Preheat oven to 375ºF, line baking pans with parchment paper

2.  Whisk cornmeal, flour, baking powder, baking soda, and salt together.

3.  In a separate bowl: whisk melted butter, brown sugar, and honey together.

4.  Whisk in eggs, until combined.

5.  Whisk in buttermilk (room temp or warmed)

6.  Pour wet ingredients over dry, stir just until combined (do not over mix)

7.  Pour batter into prepared pan, spread evenly

8.  Bake for 14-18 min', 'Cornbread.docx', false),
('cream-gravy', 'Cream Gravy', 'Sauce & dressing', 'Fills 3 serving pans', null, '{}'::jsonb, '[{"item": "whipping cream", "qty": 13, "raw": "-   13 L whipping cream", "unit": "L"}, {"item": "melted butter", "qty": 13, "raw": "-   13 cups melted butter", "unit": "cup"}, {"item": "flour", "qty": 13, "raw": "-   13 cups flour", "unit": "cup"}, {"item": "milk", "qty": 2.5, "raw": "-   2½ cups milk", "unit": "cup"}, {"item": "salt", "qty": 6.5, "raw": "-   6½ Tbsp salt", "unit": "tbsp"}, {"item": "pepper", "qty": 3.25, "raw": "-   3¼ tsp pepper", "unit": "tsp"}, {"item": "onion powder", "qty": 6.5, "raw": "-   6½ Tbsp onion powder", "unit": "tbsp"}]'::jsonb, '', 'Cream Gravy

Wedding Quantity (450 people): 25 L

Fills 3 serving pans

Prep before event:

Ingredients: (13x original recipe)

-   13 L whipping cream

-   13 cups melted butter

-   13 cups flour

-   2½ cups milk

-   6½ Tbsp salt

-   3¼ tsp pepper

-   6½ Tbsp onion powder

-   Melt butter at 250º

-   Reduce heat to 200º, add flour to create a roux

-   Add cream slowly

-   Add milk

-   Add salt, pepper and onion powder

-   Bring to a gentle boil

-   Cool in large container until serving day

REHEAT DAY

Allow 45 min?

-   Pour prepared cream gravy into ivario

-   Set ivario to Reheat?

-   Slowing bring to serving temperature (165)

-   Fill serving pans (3 pans)', 'Cream Gravy.docx', false),
('cream-of-tomato-soup', 'Cream of Tomato Soup', 'Soup', '15x the original recipe fills one roaster', null, '{}'::jsonb, '[{"item": "(15 ml) oil", "qty": 1, "raw": "1 Tbsp (15 ml) oil", "unit": "tbsp"}, {"item": "(125 ml) roughly chopped onion", "qty": 0.5, "raw": "½ cup (125 ml) roughly chopped onion", "unit": "cup"}, {"item": "(125 ml) roughly chopped carrots", "qty": 0.5, "raw": "½ cup (125 ml) roughly chopped carrots", "unit": "cup"}, {"item": "(125 ml) roughly chopped celery", "qty": 0.5, "raw": "½ cup (125 ml) roughly chopped celery", "unit": "cup"}, {"item": "(125 ml) roughly chopped red pepper", "qty": 0.5, "raw": "½ cup (125 ml) roughly chopped red pepper", "unit": "cup"}, {"item": "(250 ml) roughly chopped, peeled russet or Yukon gold potatoes", "qty": 1, "raw": "1 cup (250 ml) roughly chopped, peeled russet or Yukon gold potatoes", "unit": "cup"}, {"item": "(5 ml) minced garlic", "qty": 1, "raw": "1 tsp (5 ml) minced garlic", "unit": "tsp"}, {"item": "(5 ml) fine salt", "qty": 1, "raw": "1 tsp (5 ml) fine salt", "unit": "tsp"}, {"item": "(5 ml) dried oregano", "qty": 1, "raw": "1 tsp (5 ml) dried oregano", "unit": "tsp"}, {"item": "(2.5 ml) ground black pepper", "qty": 0.5, "raw": "½ tsp (2.5 ml) ground black pepper", "unit": "tsp"}, {"item": "(660 ml) vegetable stock", "qty": 2.75, "raw": "2¾ cups (660 ml) vegetable stock", "unit": "cup"}, {"item": "(5 ml) Worcestershire sauce", "qty": 1, "raw": "1 tsp (5 ml) Worcestershire sauce", "unit": "tsp"}, {"item": "(1.125 L) canned San Marzano tomatoes", "qty": 4.5, "raw": "4½ cups (1.125 L) canned San Marzano tomatoes", "unit": "cup"}, {"item": "(160 ml) heavy cream", "qty": 0.6666666666666666, "raw": "⅔ cup (160 ml) heavy cream", "unit": "cup"}, {"item": "(60 ml) finely chopped parsley (opt)", "qty": 0.25, "raw": "¼ cup (60 ml) finely chopped parsley (opt)", "unit": "cup"}, {"item": "(125 ml) croutons (opt)", "qty": 0.5, "raw": "½ cup (125 ml) croutons (opt)", "unit": "cup"}]'::jsonb, '', 'Cream of Tomato Soup

15x the original recipe fills one roaster

—30x the original fits one side of the ivario

—make two roasters for a shower

—make 5-6 roasters for the church (plus a second type of soup)

Original recipe:

1 Tbsp (15 ml) oil

½ cup (125 ml) roughly chopped onion

½ cup (125 ml) roughly chopped carrots

½ cup (125 ml) roughly chopped celery

½ cup (125 ml) roughly chopped red pepper

1 cup (250 ml) roughly chopped, peeled russet or Yukon gold potatoes

1 tsp (5 ml) minced garlic

1 tsp (5 ml) fine salt

1 tsp (5 ml) dried oregano

½ tsp (2.5 ml) ground black pepper

2¾ cups (660 ml) vegetable stock

1 tsp (5 ml) Worcestershire sauce

4½ cups (1.125 L) canned San Marzano tomatoes

⅔ cup (160 ml) heavy cream

¼ cup (60 ml) finely chopped parsley (opt)

½ cup (125 ml) croutons (opt)

Directions:

1.  Heat the oil in a deep heavy stockpot or Dutch oven until it ripples. Add the onions, carrots, celery and red peppers, sautéing until th onions are translucent and the carrots are tender, approximately 10 min.

2.  Add the potatoes, garlic, salt, oregano, black pepper, vegetable stock and Worcestershire sauce. Bring to a Bol and then simmer, covered, until potatoes are soft, approximately 15 min. Remove from heat. Using a hand-held or stand blender, purée until the soup is extremely smooth and no chunks remain.

3.  Break up the canned San Marzano tomatoes using your hands until the pieces are no greater than ½ inch across. Add to the pot along with the cream.

4.  Return to a simmer and then immediately remove from the heat.

5.  Serve with parsley and some croutons if desired.', 'Earl_s Cream of Tomato Soup.docx', false),
('creamy-greek-salad', 'Creamy Greek Salad', 'Salad', 'Wedding: make 7 fluted bowls (make 8 if its the more popular salad)', null, '{}'::jsonb, '[{"item": "med cucumbers (business centre is 12/box)", "qty": 3, "qtyMax": 4, "raw": "3-4 med cucumbers (business centre is 12/box)", "unit": null}, {"item": "lg clams (Costco) tomatoes", "qty": 1.5, "qtyMax": 2, "raw": "1½-2 lg clams (Costco) tomatoes", "unit": null}, {"item": "bell peppers (500g - or more??)", "qty": 4, "raw": "4 bell peppers (500g - or more??)", "unit": null}, {"item": "kalmata olives", "qty": 1, "qtyMax": 2, "raw": "1-2 cup kalmata olives", "unit": "cup"}, {"item": "lg tub of feta, cubed", "qty": 0.5, "qtyMax": 0.75, "raw": "½-¾ lg tub of feta, cubed", "unit": null}, {"item": "med. purple onion, sliced thinly (pickled)", "qty": 0.5, "raw": "½ med. purple onion, sliced thinly (pickled)", "unit": null}, {"item": "creamy Renee’s Greek dressing", "qty": 2, "raw": "2 bottles creamy Renee’s Greek dressing", "unit": "bottle"}]'::jsonb, '', 'Creamy Greek Salad

Wedding: make 7 fluted bowls (make 8 if its the more popular salad)

Single bowl recipe

~3 hearts of romaine lettuce (6 hearts for the crystal bowls)

3-4 med cucumbers (business centre is 12/box)

1½-2 lg clams (Costco) tomatoes

4 bell peppers (500g - or more??)

1-2 cup kalmata olives

½-¾ lg tub of feta, cubed

½ med. purple onion, sliced thinly (pickled)

2 bottles creamy Renee’s Greek dressing

1.  Pre chop cucumber, tomatoes and set aside to drain

2.  Chop, and Pickle the onion, optional

3.  Wash and chop romaine

4.  Drain olives

Picked Purple Onion

1 lg onion, thinly sliced

½ cup vinegar (apple cider (milder)/ White (sharper))

½ cup water

1 Tbsp sugar

- submerge onion in liquid and let it sit 30 min or longer', 'Creamy Greek Salad.docx', false),
('creamy-mashed-potatoes', 'Creamy Mashed Potatoes', 'Starch', 'Base Recipe: (yields 10 - ½ cup servings)', null, '{}'::jsonb, '[{"item": "Yukon Gold potatoes", "qty": 5, "raw": "5 lbs Yukon Gold potatoes", "unit": "lb"}, {"item": "heavy cream, warmed (adjust for texture)", "qty": 0.75, "raw": "¾ cup heavy cream, warmed (adjust for texture)", "unit": "cup"}, {"item": "salted butter, melted", "qty": 0.5, "raw": "½ cup salted butter, melted", "unit": "cup"}, {"item": "kosher salt (taste and adjust)", "qty": 2, "raw": "2 tsp kosher salt (taste and adjust)", "unit": "tsp"}, {"item": "white pepper (or black if you don’t mind specks)", "qty": 0.75, "raw": "¾ tsp white pepper (or black if you don’t mind specks)", "unit": "tsp"}]'::jsonb, '', 'Creamy Mashed Potatoes. (Dawson & Grace’s wedding)

Quantity: wedding 425 people: 150 lb potatoes

(With two starches, plan for ~½ cup mashed potatoes/person)

Base Recipe: (yields 10 - ½ cup servings)

5 lbs Yukon Gold potatoes

¾ cup heavy cream, warmed (adjust for texture)

½ cup salted butter, melted

2 tsp kosher salt (taste and adjust)

¾ tsp white pepper (or black if you don’t mind specks)

Method:

1.  Bring to room temp: cream and butter

2.  Wash potatoes, remove eyes and spots. Quarter to even sizes. Place in water until ready to steam.

3.  Add 18lbs potatoes per perforated steam pans (do not use second solid steam pan)

1.  Pathway: Potatoes: Steam: with Probe: “Soft”. Insert Probe into large potatoes, ensuring it is fully covered. (Allow about 45 min)

2.  After steaming, let them sit in the hot oven on dry heat 212ºF for 3-5 min to drive off surface moisture. This avoids watery mash.

3.  Melt butter, and warm cream.

4.  Butter steam pans to prepare for mashed potatoes.

5.  Mashing: Use paddle on low speed only. (High mixing = gluey). Add melted butter first (protects starch granules). Then slowly add warmed cream. Season last. Do not over work - mix just until creamy.

6.  Spread into buttered steam pans. Smooth tops, dot with dabs of more butter (not too much).

7.  Wrap tightly (plastic wrap directly on surface, then foil.

8.  Chill quickly, store up to 3 days.

Reheat:

1.  Pull pans from the fridge 45-60 min before reheating

2.  Remove plastic wrap. Cover with foil

9.  Heat through setting, with probe, gentle setting (plan for about 2-3hrs)

10. Stir partway through if possible, adding a splash of warm cream or melted butter if potatoes look stiff.

11. Optional: Garnish with parsley or chives before serving.

12. Place in warmers.', 'Creamy Mashed Potatoes.docx', false),
('creamy-sweet-potatoes-with-pumpkin-seeds', 'Creamy Sweet Potatoes with Pumpkin Seeds', 'Starch', '(recipe per steam pan)', null, '{}'::jsonb, '[{"item": "sweet potatoes, or yams, peeled and trimmed", "qty": 15, "raw": "15 lbs sweet potatoes, or yams, peeled and trimmed", "unit": "lb"}, {"item": "Thyme leaves", "qty": 2.5, "raw": "2 ½ Tbsp Thyme leaves", "unit": "tbsp"}, {"item": "garlic, minced", "qty": 4, "raw": "4 tsp garlic, minced", "unit": "tsp"}, {"item": "milk", "qty": 1, "raw": "**1 cup milk", "unit": "cup"}, {"item": "butter", "qty": 0.5, "raw": "½ cup butter", "unit": "cup"}, {"item": "salt", "qty": 4, "raw": "4 tsp salt", "unit": "tsp"}, {"item": "pepper", "qty": 2, "raw": "2 tsp pepper", "unit": "tsp"}, {"item": "pumpkin seeds, for garnish", "qty": 1, "raw": "*1 cup pumpkin seeds, for garnish", "unit": "cup"}]'::jsonb, '', 'Creamy Sweet Potatoes with Pumpkin Seeds
(recipe per steam pan)

15 lbs sweet potatoes, or yams, peeled and trimmed
2 ½ Tbsp Thyme leaves
4 tsp garlic, minced
**1 cup milk
½ cup butter
4 tsp salt
2 tsp pepper
*1 cup pumpkin seeds, for garnish

Diary-free & garlic free option: omit garlic, ½ cup olive oil, up to 1 cup unsweetened oat milk (use only if needed), possibly more salt.

1.  PREP TWO DAYS AHEAD: Peel and cube sweet potatoes 1½“ chunks, put in perforated steam pans.

2.  Icombi oven: vegetables>side dishes>steam>without probe>30 min on med – 212F setting. Allow for preheat and load.

3.  Mash and season. Cool uncovered until temp is 4℉ within 6 hrs.

4.  DAY OF: Heat through (allow 3 hours?)

5.  Holding: keep the mash covered in warmer @ 140F or hotter, and *add pumpkin seeds just before serving

**(start with slightly less – steamed sweet potatoes can retain moisture, and we don’t want the mash too loose)

Wedding: 425 guests
(6 times original recipe)
6 hotel pans (5 regular + 1 dairy/garlic free)

Creamy Sweet Potatoes Groceries

100 lbs sweet potato (peeled & trimmed)
⅔ cup dried thyme
½ cup minced garlic
6 cups milk
3 cups butter
½ cup salt
¼ cup pepper
6 cups pumpkin seeds', 'Creamy Sweet Potatoes.docx', false),
('creamy-tuscan-chicken', 'Creamy Tuscan Chicken', 'Protein', 'Quantity: average 1.75 pieces per person with two meats', null, '{}'::jsonb, '[{"item": "chicken thighs", "qty": 2, "raw": "2kg chicken thighs", "unit": "kg"}, {"item": "olive oil", "qty": 3, "raw": "3 Tbsp olive oil", "unit": "tbsp"}, {"item": "garlic", "qty": 9, "raw": "9 tsp garlic", "unit": "tsp"}, {"item": "heavy cream", "qty": 3, "raw": "3 cups heavy cream", "unit": "cup"}, {"item": "chicken broth", "qty": 1, "raw": "1 cup chicken broth", "unit": "cup"}, {"item": "fresh grated parmesan (*about 8-9 cups per block)", "qty": 2.25, "raw": "2¼ cup fresh grated parmesan (*about 8-9 cups per block)", "unit": "cup"}, {"item": "Italian Seasoning", "qty": 2, "raw": "2 tsp Italian Seasoning", "unit": "tsp"}, {"item": "crushed red chili pepper flakes, (opt)", "qty": 1, "raw": "1 tsp crushed red chili pepper flakes, (opt)", "unit": "tsp"}, {"item": "pepper", "qty": 1, "raw": "1 tsp pepper", "unit": "tsp"}, {"item": "?~2-4 Tbsp Cornstarch", "qty": null, "raw": "?~2-4 Tbsp Cornstarch", "unit": null}, {"item": "more Italian seasoning for frying chicken", "qty": 0.3333333333333333, "raw": "⅓ cup more Italian seasoning for frying chicken", "unit": "cup"}, {"item": "small jar sun-dried tomatoes (superstore)", "qty": 0.5, "raw": "½ small jar sun-dried tomatoes (superstore)", "unit": null}, {"item": "clam baby spinach (costco)", "qty": 0.5, "raw": "½ clam baby spinach (costco)", "unit": null}]'::jsonb, '', 'Creamy Tuscan Chicken

Quantity: average 1.75 pieces per person with two meats

-   20 pieces/2kg

-   Wedding: 425 guests: 70 kg chicken (24x sauce)

-   New Years: 95kg chicken (32x sauce)

Original recipe - for 1 flat chicken (2kg) (per 3kg for NYE)

2kg chicken thighs

3 Tbsp olive oil

9 tsp garlic

3 cups heavy cream

1 cup chicken broth

2¼ cup fresh grated parmesan (*about 8-9 cups per block)

2 tsp Italian Seasoning

1 tsp crushed red chili pepper flakes, (opt)

1 tsp pepper

?~2-4 Tbsp Cornstarch

⅓ cup more Italian seasoning for frying chicken

½ small jar sun-dried tomatoes (superstore)

½ clam baby spinach (costco)

Chicken:

1.  Season thighs lightly with Italian seasoning on parchment paper pans, pieces should not be touching.

2.  Pathway: Chicken, Panfry: with probe 165º

3.  Transfer cooked chicken to steam pans, top with sun-dried tomatoes and grated Parmesan cheese, cover and cool in fridge.

Sauce:

1.  Saute garlic for about 1 min, until fragrant.

2.  Temp 210ºF Add cream and chicken broth, Italian seasoning, red pepper flakes, salt and pepper. Bring to a gentle simmer for about 10 min. The sauce should thicken enough to coat the back of a spoon.

3.  Lower the heat to 150ºF and whisk in the cheese, if adding it at the this stage. Adjust seasoning if needed.

4.  Add spinach and cook a few min longer to wilt.

5.  Pour sauce evenly over cooled (if it was prepped ahead of time) chicken and gently stir. Cover.

1.  Pathway: container reheat function: normal settings, 165ºF probe in through the centre of pan, Allow about 1-2 hour to reheat.', 'Creamy Tuscan Chicken.docx', false),
('dill-pickle-coleslaw', 'Dill Pickle Coleslaw', 'Salad', '', null, '{}'::jsonb, '[{"item": "mayo", "qty": 3, "raw": "3 cups mayo", "unit": "cup"}, {"item": "sour cream", "qty": 3, "raw": "3 cups sour cream", "unit": "cup"}, {"item": "finely chopped dill pickles", "qty": 4, "raw": "4 cups finely chopped dill pickles", "unit": "cup"}, {"item": "large sweet onions, finely chopped", "qty": 2, "raw": "2 large sweet onions, finely chopped", "unit": null}, {"item": "pickle juice", "qty": 0.25, "raw": "¼ cup pickle juice", "unit": "cup"}, {"item": "dry dill", "qty": 1, "raw": "1 tbsp dry dill", "unit": "tbsp"}, {"item": "fresh dill, chopped", "qty": 1, "raw": "1 bunch fresh dill, chopped", "unit": "bunch"}, {"item": "1.3kg bags coleslaw mix", "qty": 2.5, "raw": "2 ½ bags 1.3kg bags coleslaw mix", "unit": "bag"}]'::jsonb, '', 'Dill Pickle Coleslaw

+-----------------------------------------------------------------------+
| Dill Pickle Coleslaw Groceries for 4 pans                             |
|                                                                       |
| 12 cups mayo                                                          |
|                                                                       |
| 12 cups sour cream                                                    |
|                                                                       |
| 16 cups finely chopped dill pickles                                   |
|                                                                       |
| 8 large sweet onions, finely chopped                                  |
|                                                                       |
| 1 cup pickle juice                                                    |
|                                                                       |
| 4 tbsp dry dill                                                       |
|                                                                       |
| 4 bunches fresh dill, chopped                                         |
|                                                                       |
| 10 bags 1.3kg bags coleslaw mix                                       |
+=======================================================================+
+-----------------------------------------------------------------------+

Per rectangle serving pan

3 cups mayo

3 cups sour cream

4 cups finely chopped dill pickles

2 large sweet onions, finely chopped

¼ cup pickle juice

1 tbsp dry dill

1 bunch fresh dill, chopped

2 ½ bags 1.3kg bags coleslaw mix

1.  Combine all dressing ingredients. Use food processor for pickles and and onion. Can be done ahead of time.

2.  Toss with coleslaw mix and refrigerate, max about 2 hours before serving', 'Dill Pickle Coleslaw.docx', false),
('earl-s-creamy-potatoes', 'Earl’s Creamy Potatoes', 'Starch', '12 lbs potatoes per pan', null, '{}'::jsonb, '[{"item": "Baby potatoes", "qty": 12, "raw": "12 lb Baby potatoes", "unit": "lb"}, {"item": "Olive oil", "qty": 0.6666666666666666, "raw": "⅔ cup Olive oil", "unit": "cup"}, {"item": "kosher salt", "qty": 1.5, "raw": "1½ Tbsp kosher salt", "unit": "tbsp"}, {"item": "pepper", "qty": 1, "raw": "1 Tbsp pepper", "unit": "tbsp"}, {"item": "Corn kernels, fresh or frozen (2.5kg bag is about 16 cups)", "qty": 6, "qtyMax": 6.5, "raw": "6-6½ cups Corn kernels, fresh or frozen (2.5kg bag is about 16 cups)", "unit": "cup"}, {"item": "olive oil", "qty": 0.6666666666666666, "raw": "⅔ cup olive oil", "unit": "cup"}, {"item": "Garlic, minced", "qty": 0.25, "raw": "¼ cup Garlic, minced", "unit": "cup"}, {"item": "Kosher salt", "qty": 1, "raw": "1 tbs Kosher salt", "unit": "tbsp"}, {"item": "Pepper", "qty": 0.5, "raw": "½ tbsp Pepper", "unit": "tbsp"}, {"item": "Dressing (chatGTP)/ pan", "qty": null, "raw": "Dressing (chatGTP)/ pan", "unit": null}, {"item": "Mayonnaise", "qty": 5, "raw": "5 cups Mayonnaise", "unit": "cup"}, {"item": "Sour cream", "qty": 3, "raw": "3 cups Sour cream", "unit": "cup"}, {"item": "Parmesean, finely grated", "qty": 3, "raw": "3 cups Parmesean, finely grated", "unit": "cup"}, {"item": "Lemon juice", "qty": 0.3333333333333333, "raw": "⅓ cup Lemon juice", "unit": "cup"}, {"item": "green onion, chopped (plus extra for garnish)", "qty": 1.5, "raw": "1½ cup green onion, chopped (plus extra for garnish)", "unit": "cup"}, {"item": "Salt & Pepper to taste", "qty": null, "raw": "Salt & Pepper to taste", "unit": null}]'::jsonb, '', 'Earl’s Creamy Potatoes

12 lbs potatoes per pan

Wedding: 6-7 Pans

Full Church: 8-9 pans (9 if only one starch)

Recipe / serving Pan: (Original x6)

1 or more kg Bacon: (14/16 is thicker) (1 box is 5kg)

12 lb Baby potatoes

⅔ cup Olive oil

1½ Tbsp kosher salt

1 Tbsp pepper

6-6½ cups Corn kernels, fresh or frozen (2.5kg bag is about 16 cups)

⅔ cup olive oil

¼ cup Garlic, minced

1 tbs Kosher salt

½ tbsp Pepper

Dressing (chatGTP)/ pan

5 cups Mayonnaise

3 cups Sour cream

3 cups Parmesean, finely grated

⅓ cup Lemon juice

1½ cup green onion, chopped (plus extra for garnish)

Salt & Pepper to taste

-   Prep ahead: prefry bacon, chop green onion, Prepare dressing/ serving pan

-   Toss frozen corn with olive oil and salt & pepper and garlic, Pathway: Vegetables: Grill ~8 min

-   Potatoes: quarter potatoes and hold in the water in the fridge until the next day.

-   Toss with olive oil, salt and pepper. Divide potatoes into 12lbs per pan (or try roasting as single layer on cookie sheets?)

-   Warm corn and bacon?

-   30-60 min before serving: Toss warm potatoes with bacon, corn, dressing (generous) and green onion just before serving

-   Hold in warming ovens @140º', 'Earl_s Warm Potato Salad.docx', false),
('fajita-chicken', 'Fajita Chicken', 'Protein', 'Recipe per 4kg (8.8lb) chicken (purple box):', null, '{}'::jsonb, '[{"item": "Kosher salt", "qty": 3, "raw": "3 Tbsp Kosher salt", "unit": "tbsp"}, {"item": "chili powder", "qty": 3, "raw": "3 Tbsp chili powder", "unit": "tbsp"}, {"item": "smoked paprika", "qty": 1.5, "raw": "1½ Tbsp smoked paprika", "unit": "tbsp"}, {"item": "cumin", "qty": 1.5, "raw": "1½ Tbsp cumin", "unit": "tbsp"}, {"item": "garlic powder", "qty": 1.5, "raw": "1½ Tbsp garlic powder", "unit": "tbsp"}, {"item": "onion powder", "qty": 2.25, "raw": "2¼ tsp onion powder", "unit": "tsp"}, {"item": "black pepper", "qty": 2.25, "raw": "2¼ tsp black pepper", "unit": "tsp"}, {"item": "cayenne", "qty": 0.5, "raw": "½ tsp cayenne", "unit": "tsp"}, {"item": "brown sugar", "qty": 1.5, "raw": "1½ Tbsp brown sugar", "unit": "tbsp"}]'::jsonb, '', 'Fajita Chicken

Recipe per 4kg (8.8lb) chicken (purple box):

3 Tbsp Kosher salt

3 Tbsp chili powder

1½ Tbsp smoked paprika

1½ Tbsp cumin

1½ Tbsp garlic powder

2¼ tsp onion powder

2¼ tsp black pepper

½ tsp cayenne

1½ Tbsp brown sugar

Directions:

1.  Prep ahead: premix seasonings, omit brown sugar until prep day.

    1.  Thaw chicken

2.  Slice chicken for fajita meat.

3.  Pat dry, add seasonings mix well.

4.  Spread chicken pieces onto pans with parchment paper. Refigerate overnight.

5.  Pathway: Chicken, PanFry:

Fajita Chicken - Shredded version

Recipe per 4kg (8.8lb) chicken (purple box):

1½ cup chicken broth

3 Tbsp Kosher salt

3 Tbsp chili powder

1½ Tbsp smoked paprika

1½ Tbsp cumin

1½ Tbsp garlic powder

2¼ tsp onion powder

2¼ tsp black pepper

½ tsp cayenne

1½ Tbsp brown sugar

1.  Thaw Chicken - lay out 20 pans for chicken (and make it all fit) (remember 1 box for Garlic Free)

2.  Place chicken in foil steam pans in a single layer, pour 1½ -1¾ chicken broth over top. Season with spices and cover with lids.

3.  Method: combi steam @ 200 - humidity 70%, use probe to 165º (for 35-45 min)

4.  Let chicken rest for 10 min before shredding

5.  Remove from broth, Shred with forks or paddle attachment on mixer.

6.  Return to broth and mix with cooking juices from the pan to keep moist.

7.  Refridgerate or freeze

8.  Thaw and then Reheat: with probe to 160 (takes 2-3 hours)

9.  Drain after reheating and Crisp the top', 'Fajita Chicken.docx', false),
('greek-chicken-marinade', 'Greek Chicken Marinade', 'Sauce & dressing', '', null, '{}'::jsonb, '[{"item": "olive oil", "qty": 0.75, "raw": "¾ cup olive oil", "unit": "cup"}, {"item": "lemon juice", "qty": 0.5, "raw": "½ cup lemon juice", "unit": "cup"}, {"item": "red wine vinegar", "qty": 0.25, "raw": "¼ cup red wine vinegar", "unit": "cup"}, {"item": "Greek Seasoning", "qty": 0.25, "raw": "¼ cup Greek Seasoning", "unit": "cup"}, {"item": "sea salt", "qty": 1, "raw": "1 tsp sea salt", "unit": "tsp"}, {"item": "Garlic Free recipe per 1 pkg", "qty": null, "raw": "*Garlic Free recipe per 1 pkg", "unit": null}, {"item": "olive oil", "qty": 0.6666666666666666, "raw": "⅔ cup olive oil", "unit": "cup"}, {"item": "red wine vinegar", "qty": 0.5, "raw": "½ cup red wine vinegar", "unit": "cup"}, {"item": "lemon juice", "qty": 0.6666666666666666, "raw": "⅔ cup lemon juice", "unit": "cup"}, {"item": "oregano", "qty": 2, "raw": "2 tbsp oregano", "unit": "tbsp"}, {"item": "salt", "qty": 3, "raw": "3 tsp salt", "unit": "tsp"}, {"item": "black pepper", "qty": 3, "raw": "3 tsp black pepper", "unit": "tsp"}, {"item": "paprika", "qty": 2, "raw": "2 tsp paprika", "unit": "tsp"}]'::jsonb, '', 'Greek Chicken Marinade

Quantity: Sunday lunch; plan for 45 packages thighs (7 cases + 3 more)

Grad (650 ppl): 8 cases (48 pkgs)

Greek marinade for 1 pkg of chicken thighs

¾ cup olive oil

½ cup lemon juice

¼ cup red wine vinegar

¼ cup Greek Seasoning

1 tsp sea salt

*Garlic Free recipe per 1 pkg

⅔ cup olive oil

½ cup red wine vinegar

⅔ cup lemon juice

2 tbsp oregano

3 tsp salt

3 tsp black pepper

2 tsp paprika

-   mix marinade

-   Let set overnight

-   Prep grill racks on cookie sheets, spray grill racks really well

-   Lay out chicken thighs on racks without touching

-   Pathway: chicken grill, carefully set probe, (about 8 min)

-   Remove from racks quickly', 'Greek Chicken Marinade.docx', false),
('greek-lemon-oregano-green-beans', 'Greek Lemon-Oregano Green Beans', 'Vegetable', '', null, '{}'::jsonb, '[{"item": "olive oil", "qty": 0.5, "raw": "½ cup olive oil", "unit": "cup"}, {"item": "dried oregano", "qty": 1.5, "raw": "1 ½ tbsp dried oregano", "unit": "tbsp"}, {"item": "kosher salt (maybe more)", "qty": 1, "raw": "1 tbsp kosher salt (maybe more)", "unit": "tbsp"}, {"item": "pepper", "qty": 2.5, "raw": "2 ½ tsp pepper", "unit": "tsp"}, {"item": "onion powder", "qty": 2, "raw": "2 tsp onion powder", "unit": "tsp"}, {"item": "lemon juice, fresh (added after cooking)", "qty": 0.3333333333333333, "qtyMax": 0.5, "raw": "⅓ - ½ cup lemon juice, fresh (added after cooking)", "unit": "cup"}]'::jsonb, '', 'Greek Lemon-Oregano Green Beans

3.5kg frozen green beans (1 bag)

+-----------------------------------------------------------------------+
| Greek Green Beans Groceries for 625                                   |
|                                                                       |
| 4x7kg boxes green beans (28kg)                                        |
|                                                                       |
| 1L olive oil                                                          |
|                                                                       |
| ¾ cup oregano                                                         |
|                                                                       |
| ¾ cup kosher salt                                                     |
|                                                                       |
| ½ cup pepper                                                          |
|                                                                       |
| ⅓ cup onion powder                                                    |
|                                                                       |
| 4 cups lemon juice (16 lemons?) prob 2 bags                           |
+=======================================================================+
+-----------------------------------------------------------------------+

½ cup olive oil

1 ½ tbsp dried oregano

1 tbsp kosher salt (maybe more)

2 ½ tsp pepper

2 tsp onion powder

⅓ - ½ cup lemon juice, fresh (added after cooking)

Toss frozen beans with everything, except lemon juice. Each bag onto two full size sheet pans. Roast at 400, 0% humidity, med-hi fan, about 12-18 min.

Toss with lemon juice in the steam pans. Keep uncovered or loosely covered in warmers.', 'Greek Lemon-Oregano Green Beans.docx', false),
('greek-roasted-potatoes', 'Greek Roasted Potatoes', 'Starch', 'Pepper', null, '{}'::jsonb, '[{"item": "Yukon Gold", "qty": 2, "raw": "2 lb Yukon Gold", "unit": "lb"}, {"item": "olive oil", "qty": 0.25, "raw": "¼ cup olive oil", "unit": "cup"}, {"item": "Lemon juice (~2-3 tbsp)", "qty": 1, "raw": "1 Lemon juice (~2-3 tbsp)", "unit": null}, {"item": "garlic", "qty": 2, "raw": "2 tsp garlic", "unit": "tsp"}, {"item": "dried oregano", "qty": 1, "raw": "1 tbsp dried oregano", "unit": "tbsp"}, {"item": "Salt", "qty": null, "raw": "Salt", "unit": null}, {"item": "Pepper", "qty": null, "raw": "Pepper", "unit": null}, {"item": "Mix in 10lb batches/pan", "qty": null, "raw": "Mix in 10lb batches/pan", "unit": null}, {"item": "Yukon Gold", "qty": 10, "raw": "10 lb Yukon Gold", "unit": "lb"}, {"item": "olive oil", "qty": 1.25, "raw": "1¼ cup olive oil", "unit": "cup"}, {"item": "Lemon juice", "qty": 15, "raw": "15 tbsp Lemon juice", "unit": "tbsp"}, {"item": "garlic", "qty": 3.5, "raw": "3½ tbsp garlic", "unit": "tbsp"}, {"item": "dried oregano", "qty": 1, "raw": "1 cup dried oregano", "unit": "cup"}, {"item": "Salt", "qty": 3, "qtyMax": 4, "raw": "3-4 Tbsp Salt", "unit": "tbsp"}, {"item": "Pepper", "qty": 2, "raw": "2 Tbsp Pepper", "unit": "tbsp"}, {"item": "Preheat oven to 425º.", "qty": null, "raw": "Preheat oven to 425º.", "unit": null}]'::jsonb, '', 'Greek Roasted Potatoes

Original recipe - serves 10

2 lb Yukon Gold

¼ cup olive oil

1 Lemon juice (~2-3 tbsp)

2 tsp garlic

1 tbsp dried oregano

Salt

Pepper

Mix in 10lb batches/pan

10 lb Yukon Gold

1¼ cup olive oil

15 tbsp Lemon juice

3½ tbsp garlic

1 cup dried oregano

3-4 Tbsp Salt

2 Tbsp Pepper

Preheat oven to 425º.

Prep Ahead: Wash potatoes, cut to similar sizes, refrigerate in water with a touch of lemon or salt

Premake marinade

Day Of: Dry potatoes. toss potatoes with marinade until well coated, adjust marinade salt to taste.

Arrange on baking sheet, not touching. Bake for 35-45 min until golden brown and crispy.

Or(Try roasting in 10lb batches for 2 hours?

Or Roast in steam pans (won’t be crispy) (about 2 hrs)', 'Greek Roasted Potatoes_.docx', false),
('greek-style-roasted-cauliflower', 'Greek Style Roasted Cauliflower', 'Vegetable', 'Original recipe - 10 servings', null, '{}'::jsonb, '[{"item": "(~3 2lb bags) cauliflower florets", "qty": 2.5, "qtyMax": 3, "raw": "2.5-3kg (~3 2lb bags) cauliflower florets", "unit": "kg"}, {"item": "olive oil", "qty": 0.5, "raw": "½ cup olive oil", "unit": "cup"}, {"item": "garlic", "qty": 2, "raw": "2 tsp garlic", "unit": "tsp"}, {"item": "dried oregano", "qty": 2, "raw": "2 tsp dried oregano", "unit": "tsp"}, {"item": "smoked paprika (opt - or use sumac)", "qty": 1, "raw": "1 tsp smoked paprika (opt - or use sumac)", "unit": "tsp"}, {"item": "kosher salt", "qty": 1.5, "raw": "1½ tsp kosher salt", "unit": "tsp"}, {"item": "black pepper", "qty": 1, "raw": "1 tsp black pepper", "unit": "tsp"}, {"item": "Zest of 1 lemon", "qty": null, "raw": "Zest of 1 lemon", "unit": null}]'::jsonb, '', 'Greek Style Roasted Cauliflower

Original recipe - 10 servings

2.5-3kg (~3 2lb bags) cauliflower florets

½ cup olive oil

2 tsp garlic

2 tsp dried oregano

1 tsp smoked paprika (opt - or use sumac)

1½ tsp kosher salt

1 tsp black pepper

Zest of 1 lemon

Lemon Tahini Drizzle: (makes ~1½ cups)

½ cup tahini

⅓ cup fresh lemon juice

½ tsp garlic

½ tsp salt

*¼-½ cup cold water to thin

Whisk all, except water. It will thicken. Slowly whisk in cold water until pourable but creamy. Adjust lemon and salt to taste.

Cauliflower:

Toss cauliflower with all ingredients. Spread in a single layer on parchment pan - do not overcrowd.

Pathway: Grill (~10 min?). Until deeply golden, crisp edges, tender inside.', 'Greek Style Roasted Cauliflower_.docx', false),
('green-salad-bar-toppings', 'Green Salad Bar & Toppings', 'Salad', '', null, '{}'::jsonb, '[{"item": "romaine lettuce", "qty": 14, "raw": "14 pkg romaine lettuce", "unit": "pkg"}, {"item": "clams spring mix", "qty": 16, "raw": "16 clams spring mix", "unit": null}, {"item": "grape tomatoes", "qty": 14, "raw": "14 pkg grape tomatoes", "unit": "pkg"}, {"item": "12ct cucumber (send some upstairs with dip)", "qty": 4, "raw": "4 boxes 12ct cucumber (send some upstairs with dip)", "unit": "box"}, {"item": "6ct bell peppers", "qty": 10, "raw": "10 pkg 6ct bell peppers", "unit": "pkg"}, {"item": "olives", "qty": 3, "raw": "3 jars olives", "unit": "jar"}, {"item": "feta, crumbles (1kg bags)", "qty": 6, "raw": "6 kg feta, crumbles (1kg bags)", "unit": "kg"}, {"item": "double pack of shredded cheese (baked potato bar)", "qty": 12, "raw": "12 double pack of shredded cheese (baked potato bar)", "unit": null}, {"item": "green onion", "qty": 3, "raw": "3 pkg green onion", "unit": "pkg"}, {"item": "bacon bits", "qty": 12, "raw": "12 pkg bacon bits", "unit": "pkg"}, {"item": "jugs Buttermilk Ranch (get 3 if sending some upstairs)", "qty": 2, "raw": "2 jugs Buttermilk Ranch (get 3 if sending some upstairs)", "unit": null}, {"item": "Check GF salad dressings", "qty": null, "raw": "*Check GF salad dressings", "unit": null}]'::jsonb, '', 'Green Salad Bar & Toppings

14 pkg romaine lettuce

16 clams spring mix

14 pkg grape tomatoes

4 boxes 12ct cucumber (send some upstairs with dip)

10 pkg 6ct bell peppers

3 jars olives

6 kg feta, crumbles (1kg bags)

12 double pack of shredded cheese (baked potato bar)

3 pkg green onion

12 pkg bacon bits

2 jugs Buttermilk Ranch (get 3 if sending some upstairs)

*Check GF salad dressings', 'Green Salad Bar & Toppings.docx', false),
('grilled-broccoli-and-cauliflower', 'Grilled Broccoli and Cauliflower', 'Vegetable', 'Wedding Quantity: 3 Costco bags of Broccoli + 3 Costco bags of Cauliflower/ pan = 27 cookie sheets', null, '{}'::jsonb, '[]'::jsonb, '', 'Grilled Broccoli and Cauliflower

Wedding Quantity: 3 Costco bags of Broccoli + 3 Costco bags of Cauliflower/ pan = 27 cookie sheets

Plan for 9 mounded pans for serving = 25 bags broccoli and 25 bags cauliflower

Prep day of event:

-   Cut to even out sizes of broccoli and cauliflower

-   Mix two bags broccoli in a bowl with generous olive oil, salt & pepper - spread out on a cookie sheet with parchment paper

-   Mix two bags cauliflower in a bowl with generous olive oil, salt & pepper - spread out on a cookie sheet with parchment paper

-   Load oven trolley ( per load)

PATHWAY

Select: “Grilled Vegetable” (5 min)

Start cooking 30 min before serving time.

Serving:

-   Transfer 1.5 sheets of cauliflower & 1.5 sheets of broccoli into each serving pan (9 total)

-   Fill buffet warmers and warming ovens', 'Grilled Broccoli & Cauliflower.docx', false),
('grilled-corn', 'Grilled Corn', 'Vegetable', 'Serving: ½ cup per person', null, '{}'::jsonb, '[{"item": "olive oil", "qty": 0.3333333333333333, "raw": "⅓ olive oil", "unit": null}, {"item": "salt", "qty": 1, "raw": "1 tbsp salt", "unit": "tbsp"}, {"item": "pepper", "qty": 1, "raw": "1 tsp pepper", "unit": "tsp"}, {"item": "spread 1 bag/sheet pan", "qty": null, "raw": "- spread 1 bag/sheet pan", "unit": null}]'::jsonb, '', 'Grilled Corn

Serving: ½ cup per person

Wedding Grilled Corn: (makes 6 pans)

36 kg frozen corn

Prep:

Toss 2kg frozen corn (1 bag) with:

⅓ olive oil

1 tbsp salt

1 tsp pepper

- spread 1 bag/sheet pan

Pathway: Vegetables: Grill 7-8 min.', 'Grilled Corn.docx', false),
('grilled-green-beans', 'Grilled Green Beans', 'Vegetable', 'Plan 4 oz fresh or frozen / per person, cook 6 boxes for the church', null, '{}'::jsonb, '[{"item": "is 7kg (2x3.5kg bags) frozen green beans", "qty": 1, "raw": "1 box is 7kg (2x3.5kg bags) frozen green beans", "unit": "box"}, {"item": "Olive oil", "qty": null, "raw": "Olive oil", "unit": null}, {"item": "Generous Salt", "qty": null, "raw": "Generous Salt", "unit": null}, {"item": "Pepper", "qty": null, "raw": "Pepper", "unit": null}, {"item": "Toasted almonds", "qty": null, "raw": "Toasted almonds", "unit": null}]'::jsonb, '', 'Grilled Green Beans

Plan 4 oz fresh or frozen / per person, cook 6 boxes for the church

Church quantity: 6 boxes (SLW could have done 7 boxes)

1 box is 7kg (2x3.5kg bags) frozen green beans

(no need to thaw)

Olive oil

Generous Salt

Pepper

Toasted almonds

1.  Toss green beans with olive oil, generous salt.

2.  Lay out on sheet pans.

3.  Pathway: Veggies-Grill, roasted, 8 min to start. Depending how dense the beans per pan.

4.  Transfer to steam pans, sprinkle on roasted almonds, adjust salt as needed.', 'Green Beans.docx', false),
('herbed-lemon-rice', 'Herbed Lemon Rice', 'Starch', 'Quantities: Make 6 pans of 8 cups of rice per pan', null, '{}'::jsonb, '[{"item": "basmati rice, rinsed", "qty": 8, "raw": "8 cups basmati rice, rinsed", "unit": "cup"}, {"item": "coconut oil, solid", "qty": 0.5, "raw": "½ cup coconut oil, solid", "unit": "cup"}, {"item": "salt", "qty": 2, "raw": "2 tsp salt", "unit": "tsp"}, {"item": "lemons zested (28g)", "qty": 4, "raw": "4 lemons zested (28g)", "unit": null}, {"item": "dried basil", "qty": 2, "raw": "2 Tbsp dried basil", "unit": "tbsp"}, {"item": "dried oregano", "qty": 2, "raw": "2 Tbsp dried oregano", "unit": "tbsp"}, {"item": "stock", "qty": 3, "raw": "3 L stock", "unit": "L"}]'::jsonb, '', 'Herbed Lemon Rice - GF, DF, Gar. F

Quantities: Make 6 pans of 8 cups of rice per pan

Ingredients per 1 pan:

8 cups basmati rice, rinsed

½ cup coconut oil, solid

2 tsp salt

4 lemons zested (28g)

2 Tbsp dried basil

2 Tbsp dried oregano

3 L stock

After cooking: ½ cup lemon juiced (just under ½)

Directions:

1.  Prep lemon zest and lemon juice ahead.

2.  Rinse rice really well. Add to hotel steam pan.

3.  Mix in the coconut oil, salt, lemon zest, basil, oregano and stock.

4.  Cover for cooking.

5.  Pathway: Basmati Rice 1:1.5. (20 min) -

6.  Add lemon juice to cooked rice, fluff. Cover and keep in warmers until serving.', 'Herbed Lemon Rice.docx', false),
('herbed-rice', 'Herbed Rice', 'Starch', '1 Serving pan Herb Rice', null, '{}'::jsonb, '[{"item": "basmati rice (1 costco pink bag is is 5kg = +24 cups raw) with 12½ cups chicken broth", "qty": 7.5, "raw": "7½ cups basmati rice (1 costco pink bag is is 5kg = +24 cups raw) with 12½ cups chicken broth", "unit": "cup"}, {"item": "Sella basmati (parboiled) with 13¾ cups broth (play between 13½ - 14 cups of broth) ((Try 3 cartons +½ cups of water/broth)", "qty": 7.5, "raw": "7½ cups Sella basmati (parboiled) with 13¾ cups broth (play between 13½ - 14 cups of broth) ((Try 3 cartons +½ cups of water/broth)", "unit": "cup"}, {"item": "onion powder", "qty": 5, "raw": "5 tsp onion powder", "unit": "tsp"}, {"item": "dried oregano", "qty": 2.5, "raw": "2½ tsp dried oregano", "unit": "tsp"}, {"item": "dried parsley", "qty": 0.6666666666666666, "raw": "⅔ cup dried parsley", "unit": "cup"}, {"item": "salt", "qty": 1.5, "raw": "1½ tbsp salt", "unit": "tbsp"}, {"item": "pepper", "qty": 1, "raw": "1 tbsp pepper", "unit": "tbsp"}, {"item": "salted butter", "qty": 2, "raw": "2 cups salted butter", "unit": "cup"}, {"item": "Pre measure & cube butter per pan", "qty": null, "raw": "Pre measure & cube butter per pan", "unit": null}]'::jsonb, '', 'Herbed Rice - Dawson & Grace’s

Quantities: for weddings make 6 regular plus 1 garlic/dairy free

For grad: 8 regular plus 1 GF/ DF

1 Serving pan Herb Rice

7½ cups basmati rice (1 costco pink bag is is 5kg = +24 cups raw) with 12½ cups chicken broth

Or

7½ cups Sella basmati (parboiled) with 13¾ cups broth (play between 13½ - 14 cups of broth) ((Try 3 cartons +½ cups of water/broth)

5 tsp onion powder

2½ tsp dried oregano

⅔ cup dried parsley

1½ tbsp salt

1 tbsp pepper

2 cups salted butter

Pre measure & cube butter per pan

-   rinse rice

-   Add rice, broth, spices and butter to serving pans. Cover.

    -   Mode: Dry Heat

    -   Temp: 355ºF

    -   Fan: (2)

    -   Time: 65 min

-   Remove from oven, let rest 10 min. Fluff with fork. Test for salt and pepper. If it’s dry, add a little olive oil.', 'Herbed Rice - Semyra_s_Liz_s.docx', false),
('herbes-de-provence-chicken', 'Herbes de Provence Chicken', 'Protein', 'Recipe per 1 flat of thighs:', null, '{}'::jsonb, '[{"item": "flat of chicken thighs", "qty": 1, "raw": "1 flat of chicken thighs", "unit": null}, {"item": "dry white wine (sauvignon blanc or a French chardonnay)", "qty": 0.5, "raw": "½ cup dry white wine (sauvignon blanc or a French chardonnay)", "unit": "cup"}, {"item": "dijon mustard", "qty": 3, "raw": "3 tbsp dijon mustard", "unit": "tbsp"}, {"item": "olive oil", "qty": 3, "raw": "3 tbsp olive oil", "unit": "tbsp"}, {"item": "honey (or a touch of lavender honey)", "qty": 1.5, "raw": "1½ tbsp honey (or a touch of lavender honey)", "unit": "tbsp"}, {"item": "Herbes de Provence", "qty": 1.5, "raw": "1½ tbsp Herbes de Provence", "unit": "tbsp"}, {"item": "minced garlic", "qty": 2, "raw": "2 tsp minced garlic", "unit": "tsp"}, {"item": "Zest of 1 large lemon", "qty": null, "raw": "Zest of 1 large lemon", "unit": null}, {"item": "lemon juice", "qty": 3, "raw": "3 tbsp lemon juice", "unit": "tbsp"}, {"item": "kosher salt", "qty": 2.25, "raw": "2¼ tsp kosher salt", "unit": "tsp"}, {"item": "black pepper", "qty": 0.75, "raw": "¾ tsp black pepper", "unit": "tsp"}]'::jsonb, '', 'Herbes de Provence Chicken

Recipe per 1 flat of thighs:

1 flat of chicken thighs

½ cup dry white wine (sauvignon blanc or a French chardonnay)

3 tbsp dijon mustard

3 tbsp olive oil

1½ tbsp honey (or a touch of lavender honey)

1½ tbsp Herbes de Provence

2 tsp minced garlic

Zest of 1 large lemon

3 tbsp lemon juice

2¼ tsp kosher salt

¾ tsp black pepper

Directions:

1.  Whisk marinade to combine. Add chicken thighs and toss to coat. Marinate at least 4 hours or overnight.

2.  Spray wire racks well, with Pam spray. Lay thighs open. Using a probe, Grill.

3.  Garnish with herbs or lemons if desired.', 'Herbes de Provence Chicken.docx', false),
('honey-roasted-brussels-sprouts-with-greek-drizzle', 'Honey Roasted Brussels Sprouts with Greek Drizzle', 'Vegetable', '', null, '{}'::jsonb, '[{"item": "brussels sprouts", "qty": 3, "raw": "3lbs brussels sprouts", "unit": "lb"}, {"item": "olive oil", "qty": 5, "raw": "5 tbsp olive oil", "unit": "tbsp"}, {"item": "Salt and pepper to taste", "qty": null, "raw": "Salt and pepper to taste", "unit": null}, {"item": "melted honey", "qty": 5, "raw": "5 tbsp melted honey", "unit": "tbsp"}]'::jsonb, '', 'Honey Roasted Brussels Sprouts with Greek Drizzle

Wedding quantity: 14 sheet pans

+-----------------------------------------------------------------------+
| Brussels Sprouts: 14 sheet pans                                       |
|                                                                       |
| 42lbs brussels sprouts                                                |
|                                                                       |
| 5 cups olive oil                                                      |
|                                                                       |
| Salt and pepper to taste                                              |
|                                                                       |
| 5 cups melted honey                                                   |
|                                                                       |
| Greek Drizzle                                                         |
|                                                                       |
| 7 cups mayo                                                           |
|                                                                       |
| 7 cups greek yogurt                                                   |
|                                                                       |
| 5 tbsp minced garlic                                                  |
|                                                                       |
| 3 lemons                                                              |
|                                                                       |
| 1 cup olive oil                                                       |
|                                                                       |
| 5 cups dry, crumbled feta                                             |
|                                                                       |
| 2¾ cup dried dill, chopped                                            |
+=======================================================================+
+-----------------------------------------------------------------------+

Recipe per 1 sheet pan:

3lbs brussels sprouts

5 tbsp olive oil

Salt and pepper to taste

5 tbsp melted honey

Method:

1.  Prep ahead Thursday:

    a.  juice lemons

    b.  wash, dry and chop dill

    c.  Prep Greek Drizzle

    d.  Brussels sprouts washed, trimmed, and halved, store cool and dry, covered

2.  Saturday: toss in oil

3.  Arrange cut side down on a baking tray, season with salt and pepper.

4.  Pathway: Manual Roast set at 425F, 15-20% humidity, about 6 minutes.

5.  Remove from the oven and toss with honey. Increase temp to 475F, return to oven 2-3 minutes. Transfer to a serving dish and drizzle with sauce just before serving.

Greek Drizzle - can be made 2 days ahead

½ cup mayo

½ cup greek yogurt

1 tsp minced garlic

1 tbsp lemon juice

1 tbsp olive oil, whisked in after previous ingredients are combined.

⅓ cup dry, crumbled feta

2 tbsp dried dill', 'Honey Roasted Brussels Sprouts with Greek Drizzle.docx', false),
('lemon-herb-rice', 'Lemon Herb Rice', 'Starch', '', null, '{}'::jsonb, '[{"item": "Tilda parboiled rice (orange bag)", "qty": 6, "raw": "6 cups Tilda parboiled rice (orange bag)", "unit": "cup"}, {"item": "Kirkland Organic Chicken Broth", "qty": 11.5, "raw": "11½ cups Kirkland Organic Chicken Broth", "unit": "cup"}, {"item": "olive oil", "qty": 0.3333333333333333, "raw": "⅓ cup olive oil", "unit": "cup"}, {"item": "lemon zest", "qty": 2, "raw": "2 Tbsp lemon zest", "unit": "tbsp"}, {"item": "oregano", "qty": 1.5, "raw": "1½ Tbsp oregano", "unit": "tbsp"}, {"item": "parsley", "qty": 2, "raw": "2 Tbsp parsley", "unit": "tbsp"}, {"item": "salt", "qty": 2, "raw": "2 Tbsp salt", "unit": "tbsp"}, {"item": "pepper", "qty": 0.5, "raw": "½ Tbsp pepper", "unit": "tbsp"}, {"item": "lemon juice (after cooking)", "qty": 0.5, "raw": "½ cup lemon juice (after cooking)", "unit": "cup"}, {"item": "fresh chopped parsley (optional, after cooking)", "qty": 0.5, "raw": "½ cup fresh chopped parsley (optional, after cooking)", "unit": "cup"}]'::jsonb, '', 'Lemon Herb Rice

+-----------------------------------------------------------------------+
| Lemon Herb Rice: 7 pans for wedding                                   |
|                                                                       |
| 42 cups Tilda parboiled rice (2 orange bags)                          |
|                                                                       |
| 20L Kirkland Organic Chicken Broth (4 cases)                          |
|                                                                       |
| 2⅓ cup olive oil                                                      |
|                                                                       |
| 16-18 lemons (14 Tbsp lemon zest, 3½ cups juice)                      |
|                                                                       |
| 10½ Tbsp oregano                                                      |
|                                                                       |
| 14 Tbsp parsley                                                       |
|                                                                       |
| 14 Tbsp salt                                                          |
|                                                                       |
| 3½ Tbsp pepper                                                        |
|                                                                       |
| 3½ cup fresh chopped parsley (optional, after cooking)                |
+=======================================================================+
+-----------------------------------------------------------------------+

Recipe per full size steam pan

6 cups Tilda parboiled rice (orange bag)

11½ cups Kirkland Organic Chicken Broth

⅓ cup olive oil

2 Tbsp lemon zest

1½ Tbsp oregano

2 Tbsp parsley

2 Tbsp salt

½ Tbsp pepper

½ cup lemon juice (after cooking)

½ cup fresh chopped parsley (optional, after cooking)

Method:

1.  *Day Ahead: Lemons zested and juiced

2.  Measure rice into steam pans

3.  Add Broth, olive oil, lemon zest, and dry seasonings.

4.  Stir thoroughly, and distribute rice evenly.

5.  Seal tightly with foil lids.

6.  Preheat Oven: 266 F, 100% humidity, low fan, 75 min

7.  Check for tenderness, extend cooking time if necessary

8.  Rest covered for 10 min, then add lemon juice and fresh parsley.', 'Lemon Herb Rice - Mel_s.docx', false),
('lemon-vinaigrette-salad', 'Lemon Vinaigrette Salad', 'Salad', '', null, '{}'::jsonb, '[{"item": "crispies & crunchies lettuce mix", "qty": 2, "raw": "• 2 pkg crispies & crunchies lettuce mix", "unit": "pkg"}, {"item": "baby arugula (Costco)", "qty": 1, "raw": "• 1 pkg baby arugula (Costco)", "unit": "pkg"}, {"item": "pumpkin seeds", "qty": 0.5, "raw": "• ½ cup pumpkin seeds", "unit": "cup"}, {"item": "slivered almonds", "qty": 0.5, "raw": "• ½ cup slivered almonds", "unit": "cup"}, {"item": "sun-dried tomatoes packed in oil, drained and chopped—reserve the oil for the dressing", "qty": 2, "raw": "• 2 cups sun-dried tomatoes packed in oil, drained and chopped—reserve the oil for the dressing", "unit": "cup"}, {"item": "well-drained pickled red onion, loosely measured", "qty": 0.5, "raw": "• ½ cup well-drained pickled red onion, loosely measured", "unit": "cup"}, {"item": "chopped fresh dill", "qty": 0.3333333333333333, "raw": "• ⅓ cup chopped fresh dill", "unit": "cup"}, {"item": "roughly chopped fresh basil", "qty": 0.3333333333333333, "raw": "• ⅓ cup roughly chopped fresh basil", "unit": "cup"}, {"item": "(255 g) crumbled feta", "qty": 1.75, "raw": "• 1¾ cup (255 g) crumbled feta", "unit": "cup"}, {"item": "ripe but firm avocados, diced just before serving", "qty": 2, "raw": "• 2 ripe but firm avocados, diced just before serving", "unit": null}, {"item": "DRESSING", "qty": null, "raw": "DRESSING", "unit": null}, {"item": "olive oil", "qty": 4.5, "raw": "• 4½ tablespoons olive oil", "unit": "tbsp"}, {"item": "reserved sun-dried tomato oil", "qty": 3, "raw": "• 3 tablespoons reserved sun-dried tomato oil", "unit": "tbsp"}, {"item": "apple cider vinegar", "qty": 1.5, "raw": "• 1½ tablespoon apple cider vinegar", "unit": "tbsp"}, {"item": "fresh lemon juice", "qty": 1.5, "raw": "• 1½ tablespoon fresh lemon juice", "unit": "tbsp"}, {"item": "honey", "qty": 1, "raw": "• 1 tablespoon honey", "unit": "tbsp"}]'::jsonb, '', 'Lemon Vinaigrette Salad

+-----------------------------------------------------------------------+
| SALAD (7 rectangle pans + allergy table)                              |
|                                                                       |
| • 15 pkg crispies & crunchies lettuce mix                             |
|                                                                       |
| • 8 pkg baby arugula (Costco)                                         |
|                                                                       |
| • 4 cup pumpkin seeds                                                 |
|                                                                       |
| • 4 cup slivered almonds                                              |
|                                                                       |
| • 16 cups sun-dried tomatoes packed in oil, drained                   |
|                                                                       |
| • 4 cup well-drained pickled red onion                                |
|                                                                       |
| • 5 bunches fresh dill (2⅔ cup chopped)                               |
|                                                                       |
| • 2⅔ cup chopped fresh basil                                          |
|                                                                       |
| • 2 kg crumbled feta                                                  |
|                                                                       |
| • 16 ripe but firm avocados                                           |
|                                                                       |
| DRESSING (10x recipe)                                                 |
|                                                                       |
| • 3 cups olive oil                                                    |
|                                                                       |
| • 2 cups reserved sun-dried tomato oil                                |
|                                                                       |
| • 1 cup apple cider vinegar                                           |
|                                                                       |
| • 1 cup fresh lemon juice (1 bag lemons)                              |
|                                                                       |
| •  ⅔ cup honey                                                        |
|                                                                       |
| • Salt and freshly ground black pepper, to taste                      |
+=======================================================================+
+-----------------------------------------------------------------------+

SALAD (1 recipe/ rectangle serving pan)

• 2 pkg crispies & crunchies lettuce mix

• 1 pkg baby arugula (Costco)

• ½ cup pumpkin seeds

• ½ cup slivered almonds

• 2 cups sun-dried tomatoes packed in oil, drained and chopped—reserve the oil for the dressing

• ½ cup well-drained pickled red onion, loosely measured

• ⅓ cup chopped fresh dill

• ⅓ cup roughly chopped fresh basil

• 1¾ cup (255 g) crumbled feta

• 2 ripe but firm avocados, diced just before serving

DRESSING

• 4½ tablespoons olive oil

• 3 tablespoons reserved sun-dried tomato oil

• 1½ tablespoon apple cider vinegar

• 1½ tablespoon fresh lemon juice

• 1 tablespoon honey

• Salt and freshly ground black pepper, to taste

METHOD

Make ahead:

1. Toast the pumpkin seeds in a dry skillet over medium-low heat, stirring frequently, until fragrant and lightly toasted. Transfer to a plate to cool. Repeat with the slivered almonds, watching carefully as they brown quickly.

2. Whisk or shake together the dressing ingredients. Premake dressing per serving bowl.

Day of:

3. Place spring mix and arugula in a large serving bowl with the sun-dried tomatoes, well-drained pickled red onion, dill and basil.

4. Just before serving, dice the avocado and add it along with the feta, cooled pumpkin seeds and almonds.

5. Add enough dressing to lightly coat the leaves and toss gently. Serve immediately.', 'Lemon Vinaigrette Salad_.docx', false),
('liz-s-spring-salad', 'Liz’s Spring Salad', 'Salad', 'Wedding: Plan for 5 large pebble bowls.', null, '{}'::jsonb, '[{"item": "spring mix lettuce", "qty": 1, "raw": "1 bag spring mix lettuce", "unit": "bag"}, {"item": "crispies & crunchies lettuce", "qty": 3, "raw": "3 pkg crispies & crunchies lettuce", "unit": "pkg"}, {"item": "thin asparagus, ends trimmed, sliced", "qty": 2, "raw": "2 bunches thin asparagus, ends trimmed, sliced", "unit": "bunch"}, {"item": "frozen petite peas, thawed", "qty": 3.5, "raw": "3½ cups frozen petite peas, thawed", "unit": "cup"}, {"item": "radishes, trimmed, thinly sliced", "qty": 2, "raw": "2 bunches radishes, trimmed, thinly sliced", "unit": "bunch"}, {"item": "green onions, thinly sliced", "qty": 2, "raw": "2 bunches green onions, thinly sliced", "unit": "bunch"}, {"item": "slices of bacon, cooked & crumbled", "qty": 28, "raw": "28 slices of bacon, cooked & crumbled", "unit": null}, {"item": "roasted salted pumpkin seeds", "qty": 1.75, "raw": "1¾ cups roasted salted pumpkin seeds", "unit": "cup"}, {"item": "slivered almonds", "qty": 1.75, "raw": "1¾ cups slivered almonds", "unit": "cup"}, {"item": "(1¾ lbs) feta cheese", "qty": 28, "raw": "28 oz (1¾ lbs) feta cheese", "unit": "oz"}, {"item": "Lemon Vinaigrette", "qty": null, "raw": "Lemon Vinaigrette", "unit": null}, {"item": "garlic", "qty": 0.5, "raw": "½ tsp garlic", "unit": "tsp"}, {"item": "lemon juice", "qty": 3, "raw": "3 tbsp lemon juice", "unit": "tbsp"}, {"item": "red wine vinegar", "qty": 1, "raw": "1 tbsp red wine vinegar", "unit": "tbsp"}, {"item": "dijon mustard", "qty": 1, "raw": "1 tsp dijon mustard", "unit": "tsp"}, {"item": "~½ tsp kosher salt", "qty": null, "raw": "~½ tsp kosher salt", "unit": null}, {"item": "olive oil", "qty": 0.5, "raw": "½ cup olive oil", "unit": "cup"}, {"item": "Black pepper", "qty": null, "raw": "Black pepper", "unit": null}, {"item": "Oregano", "qty": null, "raw": "Oregano", "unit": null}, {"item": "Basil", "qty": null, "raw": "Basil", "unit": null}]'::jsonb, '', 'Liz’s Spring Salad

Wedding: Plan for 5 large pebble bowls.

Original recipe makes about 10-12 cups?

Recipe for 1 large church bowl (19L)

1 bag spring mix lettuce

3 pkg crispies & crunchies lettuce

2 bunches thin asparagus, ends trimmed, sliced

3½ cups frozen petite peas, thawed

2 bunches radishes, trimmed, thinly sliced

2 bunches green onions, thinly sliced

28 slices of bacon, cooked & crumbled

1¾ cups roasted salted pumpkin seeds

1¾ cups slivered almonds

28 oz (1¾ lbs) feta cheese

Lemon Vinaigrette

½ tsp garlic

3 tbsp lemon juice

1 tbsp red wine vinegar

1 tsp dijon mustard

~½ tsp kosher salt

½ cup olive oil

Black pepper

Oregano

Basil

1.  Mix dressing in a high speed blender.

2.  Chop bacon, cook, pat dry

3.  Roast and salt pumpkin seeds ahead

4.  Toast almonds

5.  Chop veggies a day ahead, asparagus, snap peas, radishes, green onion

6.  Day of: Rinse frozen petite peas under water to remove and ice. Pat dry.

7.  Layer ingredients into salad bowls (save seeds, almonds and avocado until tossing)

8.  Toss with dressing, then garnish with pumpkin seeds, almonds and avocado .', 'Spring Green Salad.docx', false),
('mandarin-orange-salad', 'Mandarin Orange Salad', 'Salad', '6 fluted salad bowls', null, '{}'::jsonb, '[{"item": "fluted salad bowls", "qty": 6, "raw": "6 fluted salad bowls", "unit": null}, {"item": "Each bowl holds 4 L of orange Jello.", "qty": null, "raw": "Each bowl holds 4 L of orange Jello.", "unit": null}, {"item": "large cans Mandarin orange segments - drained", "qty": 3, "raw": "-3 large cans Mandarin orange segments - drained", "unit": null}, {"item": "Whipped cream ½ - 1 L per bowl", "qty": null, "raw": "-Whipped cream ½ - 1 L per bowl", "unit": null}]'::jsonb, '', 'Mandarin Orange Salad

6 fluted salad bowls

Each bowl holds 4 L of orange Jello.

-Orange Jello powder, enough for total 24L of Jello ( 4 large bags from Superstore Wholesale, 1 lg bag makes 6L))

-3 large cans Mandarin orange segments - drained

**extra mandarins for garnish (? 2 regular size cans)

-Whipped cream ½ - 1 L per bowl

Prep jello 2 days ahead

Use Hot Water Tap, to measure out the water to dissolve Jello crystals. Add cold water and ½ can of mandarin oranges.

A Day Ahead

Whip cream, low and slow, to stabilize. Can be done a day ahead and top the Jello with whipped cream.

Day-of Event

Garnish (mandarins, mint leaves?)

Strawberry Jello

6 fluted salad bowls

Each bowl holds 4 L of Jello.

-Strawberry Jello powder, enough for total 24L of Jello ( 4 large bags from Superstore Wholesale, (1 lg bag makes 6L))

-   fresh strawberries

-   6 L whipped cream

-   24 packets of stabilizer', 'Jello Salad.docx', false),
('maple-tarragon-roasted-carrots', 'Maple Tarragon Roasted Carrots', 'Vegetable', '- adjusted per chatGTP', null, '{}'::jsonb, '[{"item": "sheetpan", "qty": 1, "raw": "1 sheetpan", "unit": null}, {"item": "carrots, peeled and halved (not too skinny)", "qty": 5, "raw": "5 lb carrots, peeled and halved (not too skinny)", "unit": "lb"}, {"item": "butter, melted", "qty": 4, "raw": "4 tbsp butter, melted", "unit": "tbsp"}, {"item": "maple syrup", "qty": 5, "raw": "5 tbsp maple syrup", "unit": "tbsp"}, {"item": "chopped tarragon (or ¾ tsp dried)", "qty": 2, "raw": "2 tsp chopped tarragon (or ¾ tsp dried)", "unit": "tsp"}, {"item": "kosher salt", "qty": 2, "raw": "2 tsp kosher salt", "unit": "tsp"}, {"item": "black pepper", "qty": 1, "raw": "1 tsp black pepper", "unit": "tsp"}, {"item": "dijon mustard", "qty": 1, "raw": "1 tsp dijon mustard", "unit": "tsp"}, {"item": "Dairy Free Pans", "qty": null, "raw": "Dairy Free Pans", "unit": null}, {"item": "sheetpans with olive oil instead of butter", "qty": 2, "qtyMax": 3, "raw": "2-3 sheetpans with olive oil instead of butter", "unit": null}]'::jsonb, '', 'Maple Tarragon Roasted Carrots

- adjusted per chatGTP

Wedding: 140lbs carrots (single hot veg) (120lb for double hot veg?)

1 sheetpan

5 lb carrots, peeled and halved (not too skinny)

4 tbsp butter, melted

5 tbsp maple syrup

2 tsp chopped tarragon (or ¾ tsp dried)

2 tsp kosher salt

1 tsp black pepper

1 tsp dijon mustard

Dairy Free Pans

2-3 sheetpans with olive oil instead of butter

Prep:

1.  Carrots: peeled and halved

2.  Prep marinade the day before except tarragon

3.  Mix marinade in bowls with 5 lbs carrots

4.  Spread evenly onto cookie sheets with parchment paper

5.  Preheat ovens; use Vegetable: Roast setting 7-8 min, #3 dark

6.  3 sheetpans fit one full size steam pan (15lb/serving pan)', 'Maple Tarragon Roasted Carrots_.docx', false),
('marry-me-chicken', 'Marry Me Chicken', 'Protein', '', null, '{}'::jsonb, '[{"item": "boneless, skinless chicken thighs", "qty": 5, "raw": "5kg boneless, skinless chicken thighs", "unit": "kg"}, {"item": "olive oil", "qty": 6, "raw": "6 tbsp olive oil", "unit": "tbsp"}, {"item": "kosher salt", "qty": 2, "raw": "2 tbsp kosher salt", "unit": "tbsp"}, {"item": "black pepper", "qty": 1, "raw": "1 tbsp black pepper", "unit": "tbsp"}, {"item": "paprika", "qty": 2, "raw": "2 tbsp paprika", "unit": "tbsp"}, {"item": "Italian seasoning", "qty": 2, "raw": "2 tbsp Italian seasoning", "unit": "tbsp"}, {"item": "garlic powder (optional)", "qty": 1, "raw": "1 tbsp garlic powder (optional)", "unit": "tbsp"}, {"item": "chicken", "qty": 2, "raw": "2 kg chicken", "unit": "kg"}, {"item": "olive oil", "qty": 2, "raw": "2 tbsp olive oil", "unit": "tbsp"}, {"item": "kosher salt", "qty": 3, "raw": "3 tsp kosher salt", "unit": "tsp"}, {"item": "black pepper", "qty": 1, "raw": "1 tsp black pepper", "unit": "tsp"}, {"item": "paprika", "qty": 2, "raw": "2 tsp paprika", "unit": "tsp"}, {"item": "onion powder", "qty": 1, "raw": "1 tsp onion powder", "unit": "tsp"}, {"item": "Dijon mustard", "qty": 1, "raw": "1 Tbsp Dijon mustard", "unit": "tbsp"}, {"item": "Red Wine Vinegar", "qty": 2, "raw": "2 Tbsp Red Wine Vinegar", "unit": "tbsp"}, {"item": "heavy cream", "qty": 1, "raw": "1 L heavy cream", "unit": "L"}, {"item": "chicken stock", "qty": 2.5, "raw": "2 ½ cups chicken stock", "unit": "cup"}, {"item": "cream cheese, softened", "qty": 250, "raw": "250 g cream cheese, softened", "unit": "g"}, {"item": "freshly grated Parmesan", "qty": 2, "raw": "2 cups freshly grated Parmesan", "unit": "cup"}, {"item": "sliced sun-dried tomatoes (drained)", "qty": 1.5, "raw": "1½ cups sliced sun-dried tomatoes (drained)", "unit": "cup"}, {"item": "garlic, minced", "qty": 5, "qtyMax": 6, "raw": "5–6 cloves garlic, minced", "unit": "clove"}, {"item": "Italian seasoning", "qty": 2, "raw": "2 tsp Italian seasoning", "unit": "tsp"}, {"item": "dried oregano", "qty": 1, "raw": "1 tsp dried oregano", "unit": "tsp"}, {"item": "red pepper flakes (optional)", "qty": 0.5, "raw": "½ tsp red pepper flakes (optional)", "unit": "tsp"}, {"item": "Better Than Bouillon chicken base", "qty": 2, "raw": "2 tbsp Better Than Bouillon chicken base", "unit": "tbsp"}, {"item": "butter", "qty": 2, "raw": "2 tbsp butter", "unit": "tbsp"}, {"item": "Fresh basil, chopped", "qty": null, "raw": "Fresh basil, chopped", "unit": null}, {"item": "Step 1 – Pan Fry (Friday)", "qty": null, "raw": "Step 1 – Pan Fry (Friday)", "unit": null}]'::jsonb, '', 'Marry Me Chicken

Serves: 10–12

Chicken - original (wedding 65 kg)

5kg boneless, skinless chicken thighs

6 tbsp olive oil

2 tbsp kosher salt

1 tbsp black pepper

2 tbsp paprika

2 tbsp Italian seasoning

1 tbsp garlic powder (optional)

Garlic Free (wedding 5 kg - 3x original recipe))

2 kg chicken
2 tbsp olive oil

3 tsp kosher salt

1 tsp black pepper

2 tsp paprika
1 tsp onion powder
1 Tbsp Dijon mustard

2 Tbsp Red Wine Vinegar

Sauce - original (wedding 14 times for 65 kg of chicken) - should this be 13x?

1 L heavy cream

2 ½ cups chicken stock

250 g cream cheese, softened

2 cups freshly grated Parmesan

1½ cups sliced sun-dried tomatoes (drained)

5–6 cloves garlic, minced

2 tsp Italian seasoning

1 tsp dried oregano

½ tsp red pepper flakes (optional)

2 tbsp Better Than Bouillon chicken base

2 tbsp butter

Fresh basil, chopped

Step 1 – Pan Fry (Friday)

-   toss the thighs with olive oil and seasonings

-   select: panfry

Step 2 – Make the Sauce (Friday)

-   melt butter and sauté the garlic

-   add chicken stock and Better Than Bouillon

-   whisk in the cream cheese until smooth

-   add the cream

-   stir in the parmesan

-   add the sun-dried tomatoes, Italian seasoning, oregano, and red pepper flakes

-   simmer until slightly thickened

-   let cool slightly

Step 3 – Finish in the iCombi

-   arrange the browned thighs in shallow hotel pans

-   spoon the sauce over the chicken

-   cover tightly with lid

-   refrigerate promptly

Reheat (Saturday)

-   place covered hotel pans in the iCombi: select Heat Through (20-30% humidity)

Holding

-   Hold at 65-70 F for 1-2 hours

Marry Me Chicken Groceries

Chicken

65 kg thighs (+6 kg dairy & garlic free) (make 13 pkgs for 5 kg chicken of regular recipe seasonings)

-   5 cups olive oil

-   1 ⅔ cup kosher salt

-   1 cup black pepper

-   2 cups paprika

-   2 cups Italian seasoning

-   1 cup garlic powder (optional)

Sauce (14x original recipe)

-   9 L chicken stock

-   14 L whipping cream

-   14 x 250g cream cheese

-   28 cups parm cheese, grated (4 Costco jars)

-   3 L (Costco jars) sliced sun-dried tomatoes

-   1 cup minced garlic

-   2/3 cups Italian seasoning

-   14 tsp dried oregano

-   2 cup Better Than Bouillon (2 Costco jars)

-   1 lb butter', 'Marry Me Chicken.docx', false),
('mediterranean-chicken-thighs', 'Mediterranean Chicken Thighs', 'Protein', 'Recipe per pkg of chicken:', null, '{}'::jsonb, '[{"item": "pieces chicken thighs, Bone in, skin on", "qty": 22, "raw": "22 pieces chicken thighs, Bone in, skin on", "unit": null}, {"item": "thinly sliced (purple) onion (about 2 onions)", "qty": 2, "raw": "2 cups thinly sliced (purple) onion (about 2 onions)", "unit": "cup"}, {"item": "good quality crushed tomatoes", "qty": 0.75, "raw": "¾ cup good quality crushed tomatoes", "unit": "cup"}, {"item": "fresh lemon juice", "qty": 6, "raw": "6 Tbsp fresh lemon juice", "unit": "tbsp"}, {"item": "sprigs fresh rosemary", "qty": 4, "raw": "4 sprigs fresh rosemary", "unit": null}, {"item": "minced garlic", "qty": 5, "raw": "5 tsp minced garlic", "unit": "tsp"}, {"item": "oregano", "qty": 3, "raw": "3 tsp oregano", "unit": "tsp"}, {"item": "smoked paprika", "qty": 3, "raw": "3 tsp smoked paprika", "unit": "tsp"}, {"item": "cumin", "qty": 3, "raw": "3 tsp cumin", "unit": "tsp"}, {"item": "onion powder", "qty": 3, "raw": "3 tsp onion powder", "unit": "tsp"}, {"item": "white pepper", "qty": 1.5, "raw": "1½ tsp white pepper", "unit": "tsp"}, {"item": "salt (add more to taste)", "qty": 1, "raw": "1 tbsp salt (add more to taste)", "unit": "tbsp"}]'::jsonb, '', 'Mediterranean Chicken Thighs (Liz’s)

Plan for 5 cases of Chicken Thighs. Each case has 6 flats (30 pkgs). Each pkg is about 22 pieces = total 660 pieces. (Makes about 27.5 pans of chicken)

Recipe per pkg of chicken:

22 pieces chicken thighs, Bone in, skin on

2 cups thinly sliced (purple) onion (about 2 onions)

¾ cup good quality crushed tomatoes

6 Tbsp fresh lemon juice

4 sprigs fresh rosemary

5 tsp minced garlic

3 tsp oregano

3 tsp smoked paprika

3 tsp cumin

3 tsp onion powder

1½ tsp white pepper

1 tbsp salt (add more to taste)

1.  Premix spices per flat of chicken (30 bags)

2.  Slice onions

3.  Season/Rub one flat at a time and set into serving pans (upside-down) 24 pieces per pan. Add onions on top. Cover, refrigerate overnight.

4.  Morning of: Mix in tomatoes, lemon and rosemary. Cover.

5.  Pathway: manual at 350. 2 hours. Then uncover, preheat to 400. Cook 10 min more.

6.  Take out chicken, flip each piece and cook another 10 min', 'Mediterranean Chicken Thighs.docx', false),
('mediterranean-lamb-and-pork-meatballs-with-lemon-herb-sauce', 'Mediterranean Lamb and Pork Meatballs with Lemon Herb Sauce', 'Protein', '', null, '{}'::jsonb, '[{"item": "ground lamb", "qty": 0.5, "raw": "½ lb ground lamb", "unit": "lb"}, {"item": "ground pork", "qty": 0.5, "raw": "½ lb ground pork", "unit": "lb"}, {"item": "panko breadcrumbs", "qty": 0.5, "raw": "½ cup panko breadcrumbs", "unit": "cup"}, {"item": "olive oil", "qty": 1, "raw": "1 tbsp olive oil", "unit": "tbsp"}, {"item": "finely diced onion", "qty": 0.25, "raw": "¼ cup finely diced onion", "unit": "cup"}, {"item": "minced garlic", "qty": 2, "raw": "2 tsp minced garlic", "unit": "tsp"}, {"item": "finely chopped parsley", "qty": 0.125, "raw": "⅛ cup finely chopped parsley", "unit": "cup"}, {"item": "dried oregano", "qty": 1, "raw": "1 tsp dried oregano", "unit": "tsp"}, {"item": "cumin", "qty": 1, "raw": "1 tsp cumin", "unit": "tsp"}, {"item": "gr coriander", "qty": 1, "raw": "1 tsp gr coriander", "unit": "tsp"}, {"item": "salt", "qty": 1, "raw": "1 tsp salt", "unit": "tsp"}, {"item": "black pepper", "qty": 0.5, "raw": "½ tsp black pepper", "unit": "tsp"}, {"item": "egg beaten with 2 tbsp water", "qty": 1, "raw": "1 egg beaten with 2 tbsp water", "unit": null}]'::jsonb, '', 'Mediterranean Lamb and Pork Meatballs with Lemon Herb Sauce

Meatballs: (makes 60, 1.5” balls) made 1500 meatballs

½ lb ground lamb

½ lb ground pork

½ cup panko breadcrumbs

1 tbsp olive oil

¼ cup finely diced onion

2 tsp minced garlic

⅛ cup finely chopped parsley

1 tsp dried oregano

1 tsp cumin

1 tsp gr coriander

1 tsp salt

½ tsp black pepper

1 egg beaten with 2 tbsp water

PREP AHEAD:

Saute onion in olive oil until tender, add garlic and cook for 1 more minute

Add spices to the egg mixture and mix well. Add all ingredients together and gently mix until combined.

Roll meatballs. Freeze.

DAY AHEAD: **Thaw meatballs

DAY OF:

Icombi: meat “panfry” setting. Medium browning. Small size until internal temp is 160F, about 6 min

Meditterranean Meatball Sauce (1 batch per 60 meatballs) -Sauce is served on the side

1 cup Greek yogurt

+-----------------------------------------------------------------------+
| Meatball Sauce Groceries - 38x original recipe + 2x garlic free       |
|                                                                       |
| 30 cup Greek yogurt                                                   |
|                                                                       |
| 2 cups lemon juice                                                    |
|                                                                       |
| 1 cup lemon zest                                                      |
|                                                                       |
| 4 cups fresh mint, finely chopped                                     |
|                                                                       |
| 4 cups fresh parsley, finely chopped                                  |
|                                                                       |
| 1 cup minced garlic                                                   |
|                                                                       |
| ½ cup salt                                                            |
|                                                                       |
| ¼ cup pepper                                                          |
+=======================================================================+
+-----------------------------------------------------------------------+

1 tbsp lemon juice

1 tsp lemon zest

2 tbsp fresh mint, finely chopped

2 tbsp fresh parsley, finely chopped

1 tsp minced garlic

½ tsp salt

¼ tsp pepper

PREP 2 DAYS AHEAD

1.  Zest and juice lemons, chop herbs, mix well and refrigerate.

2.  Stir before serving.', 'Mediterranean Lamb and Pork Meatballs with Lemon Herb Sauce.docx', false),
('mustard-glazed-meatballs', 'Mustard Glazed Meatballs', 'Protein', '', null, '{}'::jsonb, '[{"item": "ground beef (80/20 or 85/15 for flavor & moisture)", "qty": 2, "raw": "2 lb ground beef (80/20 or 85/15 for flavor & moisture)", "unit": "lb"}, {"item": "ground pork", "qty": 1, "raw": "1 lb ground pork", "unit": "lb"}, {"item": "oats, pulsed but not powder", "qty": 1, "raw": "1 cup oats, pulsed but not powder", "unit": "cup"}, {"item": "milk", "qty": 1, "qtyMax": 1.25, "raw": "1-1¼ cup milk", "unit": "cup"}, {"item": "grated parm", "qty": 0.5, "raw": "½ cup grated parm", "unit": "cup"}, {"item": "eggs, lightly beaten, room temp", "qty": 2, "raw": "2 eggs, lightly beaten, room temp", "unit": null}, {"item": "fresh parsley, chopped", "qty": 3, "raw": "3 Tbsp fresh parsley, chopped", "unit": "tbsp"}, {"item": "fresh basil, chopped", "qty": 1, "raw": "1 Tbsp fresh basil, chopped", "unit": "tbsp"}, {"item": "salt", "qty": 1.5, "raw": "1½ tsp salt", "unit": "tsp"}, {"item": "pepper", "qty": 0.5, "raw": "½ tsp pepper", "unit": "tsp"}, {"item": "dijon mustard", "qty": 1, "raw": "1 tsp dijon mustard", "unit": "tsp"}]'::jsonb, '', 'Meatballs

Original recipe: makes about 58 meatballs (small cookie scoop size)

2 lb ground beef (80/20 or 85/15 for flavor & moisture)

1 lb ground pork

1 cup oats, pulsed but not powder

1-1¼ cup milk

½ cup grated parm

2 eggs, lightly beaten, room temp

3 Tbsp fresh parsley, chopped

1 Tbsp fresh basil, chopped

1½ tsp salt

½ tsp pepper

1 tsp dijon mustard

Method:

1.  Soak pulsed oats in milk, 10-15 min, until fluffy

2.  Mix all meat ingredients gently, don’t overwork

3.  Roll 1½ balls (small cookie scoops), place on parchment on cookie sheets, don’t overcrowd

4.  Cooking Pathway: Manual Combi oven 338ºF, Humidity 30%, Fan Speed: Med, Probe 165º. Takes about 10-12 minutes.

5.  Chill quickly, transfer to steam pans, freeze if needed.

6. Make preferred Sauce or Glaze

Reheat:

1.  Toss frozen meatballs with glaze, return to steam pans, uncovered.

2.  Reheat pathway: Manual Combi 320ºF, Humidity 40%-50% , Probe 165º (about 20 min? Depending how frozen)

3.  Optional Shine Finish: Manual Dry Heat 356ºF, Humidity 0%, Fan Speed: Low, Time: 2-3 min to caramelize glaze and give a glossy look

Dijon -Wine Glaze - Base Recipe (for about 40 meatballs) (makes ~1-1¼ cups)

⅔ cup brown sugar, packed

3 tsp GF flour (Bob’s red mill)

2 tsp dry mustard

¼ cup dijon mustard

¼ cup Sauvignon Blanc

¼ cup white vinegar

¼ cup water

½ tsp kosher salt

⅓ tsp black pepper

Directions:

1.  Combine dry ingredients. Add wet. Heat to thicken.

2.  Pour over meatballs, toss to coat.

3.  Fill steam pans, up to 3 layers deep (too deep will cause uneven reheating). Cover pans,

1.  Pathway: Manual combi 285ºF, Humidity 35%, Fan speed 2. With Probe 165ºF. basting/stirring once to redistribute heat and glaze, allow~ 45 min. Remove lids for last 5-8 mins.', 'Mustard Glazed Meatballs.docx', false),
('olive-garden-salad', 'Olive Garden Salad', 'Salad', 'Wedding Quantity: 9 large serving bowls/ or 4 lg crystal bowls', null, '{}'::jsonb, '[{"item": "iceberg lettuce (24 heads/ box)", "qty": 36, "raw": "36 heads of iceberg lettuce (24 heads/ box)", "unit": "head"}, {"item": "Roma tomatoes", "qty": 6, "raw": "6 packages Roma tomatoes", "unit": "pkg"}, {"item": "lg jar Pepperoncini peppers (Business Center)", "qty": 1, "raw": "1 lg jar Pepperoncini peppers (Business Center)", "unit": null}, {"item": "jars kalmata olives", "qty": 1, "qtyMax": 3, "raw": "1 - 3L jars kalmata olives", "unit": "L"}, {"item": "purple onion", "qty": 1, "raw": "1 bag purple onion", "unit": "bag"}, {"item": "parm petals", "qty": 2, "qtyMax": 3, "raw": "2-3 jars parm petals", "unit": "jar"}, {"item": "Olive Garden Dressing", "qty": 6, "qtyMax": 7, "raw": "6-7 bottles Olive Garden Dressing", "unit": "bottle"}]'::jsonb, '', 'Olive Garden Salad

Wedding Quantity: 9 large serving bowls/ or 4 lg crystal bowls

36 heads of iceberg lettuce (24 heads/ box)

6 packages Roma tomatoes

1 lg jar Pepperoncini peppers (Business Center)

1 - 3L jars kalmata olives

1 bag purple onion

2-3 jars parm petals

6-7 bottles Olive Garden Dressing

Prep ahead:

-   tomatoes: wedge/drain

-   Purple onion sliced

Day of:

-   iceberg: chopped

-   Pepperoncini: drain

-   Olives: drain

-   Tomatoes: wedged

-   Prep salad, Parm petals, toss before serving', 'Olive Garden Salad.docx', false),
('oven-roasted-veg-medley', 'Oven Roasted Veg Medley', 'Vegetable', 'Wedding: Plan for 9 serving pans', null, '{}'::jsonb, '[{"item": "bags cauliflower", "qty": 3, "qtyMax": 2, "raw": "3 - 2lb bags cauliflower", "unit": "lb"}, {"item": "bag zucchini", "qty": 1, "qtyMax": 2, "raw": "1 - 2lb bag zucchini", "unit": "lb"}, {"item": "bell peppers (about 3.5lbs or 1.5 kg)", "qty": 10, "raw": "10 bell peppers (about 3.5lbs or 1.5 kg)", "unit": null}, {"item": "oil (more for cauliflower)", "qty": 0.75, "raw": "¾ cup oil (more for cauliflower)", "unit": "cup"}, {"item": "dried thyme", "qty": 3, "raw": "3 tsp dried thyme", "unit": "tsp"}, {"item": "dried oregano", "qty": 3, "raw": "3 tsp dried oregano", "unit": "tsp"}, {"item": "dried basil", "qty": 3, "raw": "3 tsp dried basil", "unit": "tsp"}, {"item": "garlic powder", "qty": 3, "raw": "3 tsp garlic powder", "unit": "tsp"}, {"item": "crumbled feta cheese", "qty": 1, "raw": "1 cup crumbled feta cheese", "unit": "cup"}, {"item": "Fresh basil to garnish", "qty": null, "raw": "Fresh basil to garnish", "unit": null}]'::jsonb, '', 'Oven Roasted Veg Medley

Wedding: Plan for 9 serving pans

Single pan Recipe (fills two cookie sheets)

3 - 2lb bags cauliflower

1 - 2lb bag zucchini

10 bell peppers (about 3.5lbs or 1.5 kg)

¾ cup oil (more for cauliflower)

3 tsp dried thyme

3 tsp dried oregano

3 tsp dried basil

3 tsp garlic powder

Kosher Salt and pepper to taste (add salt day of cooking so the zucchini doesn’t get watery)

1 cup crumbled feta cheese

Fresh basil to garnish

1.  Chop veggies to even sizes. Mix with marinade but omit salt if its being refrigerated overnight.

2.  Day of: Salt before cooking.

3.  Pathway: Cauliflower Sautéed: Roasted: 9 min: (its the same as peppers)', 'Oven Roasted Veggies.docx', false),
('potato-au-gratin', 'Potato Au Gratin', 'Starch', '', null, '{}'::jsonb, '[{"item": "Yukon potatoes", "qty": 12, "raw": "12lb Yukon potatoes", "unit": "lb"}, {"item": "onions, minced", "qty": 3, "raw": "3 onions, minced", "unit": null}, {"item": "butter - plus more for onions (1lb=456g)", "qty": 240, "raw": "240g butter - plus more for onions (1lb=456g)", "unit": "g"}, {"item": "potato starch", "qty": 0.75, "raw": "¾ cup potato starch", "unit": "cup"}, {"item": "chicken broth", "qty": 2, "raw": "2 L chicken broth", "unit": "L"}, {"item": "milk", "qty": 6, "raw": "6 cups milk", "unit": "cup"}, {"item": "cream cheese, cubed", "qty": 1.5, "raw": "1½ pkg cream cheese, cubed", "unit": "pkg"}, {"item": "dry mustard", "qty": 7, "raw": "7 tsp dry mustard", "unit": "tsp"}, {"item": "cayenne pepper", "qty": 0.75, "raw": "¾ tsp cayenne pepper", "unit": "tsp"}, {"item": "salt", "qty": 5, "raw": "5 tsp salt", "unit": "tsp"}, {"item": "black pepper", "qty": 1, "raw": "1 tsp black pepper", "unit": "tsp"}, {"item": "cheddar cheese, shredded (Costco 1.15kg=11 cups shredded)", "qty": 4.5, "raw": "4½ cup cheddar cheese, shredded (Costco 1.15kg=11 cups shredded)", "unit": "cup"}, {"item": "parm, fine shred", "qty": 1.5, "raw": "1 ½ cup parm, fine shred", "unit": "cup"}]'::jsonb, '', 'Potato Au Gratin

+--------------------------------------------------------------------------------------------------+
| Potato Au Gratin - 10 pans (wedding : original 5x potatoes, 6x sauce for buffer )                |
|                                                                                                  |
| 60lb Yukon potatoes                                                                              |
|                                                                                                  |
| 18 onions, minced                                                                                |
|                                                                                                  |
| 6lb butter - for sauce and onions                                                                |
|                                                                                                  |
| 5 cups potato starch                                                                             |
|                                                                                                  |
| 12 L chicken broth (2 cases)                                                                     |
|                                                                                                  |
| 9 L milk                                                                                         |
|                                                                                                  |
| 9 pkg cream cheese                                                                               |
|                                                                                                  |
| 1 cup dry mustard                                                                                |
|                                                                                                  |
| 5 tsp cayenne pepper                                                                             |
|                                                                                                  |
| ¾ cup salt                                                                                       |
|                                                                                                  |
| 6 tsp black pepper                                                                               |
|                                                                                                  |
| 4 x 1.15kg blocks cheddar cheese                                                                 |
|                                                                                                  |
| 15 cup parm, fine shred (each Costco tin can is ~9 cups) (enough leftover from previous wedding) |
|                                                                                                  |
| Chives/green onion for garnish                                                                   |
+==================================================================================================+
+--------------------------------------------------------------------------------------------------+

Recipe / 2 pans (made about 4 L)

12lb Yukon potatoes

3 onions, minced

240g butter - plus more for onions (1lb=456g)

¾ cup potato starch

2 L chicken broth

6 cups milk

1½ pkg cream cheese, cubed

7 tsp dry mustard

¾ tsp cayenne pepper

5 tsp salt

1 tsp black pepper

4½ cup cheddar cheese, shredded (Costco 1.15kg=11 cups shredded)

1 ½ cup parm, fine shred

Topping:

2 cups cheddar cheese, shredded

1 cup parm cheese, shredded

Chives for garnish

Prepare:

1.  Mince onion in food processor, saute until soft, set aside.

2.  Wash and prep potatoes, slice with electric slicer with the thickest blade (¼“). Fill perforated steam pans with 6lb potatoes/pan.

3.  Preheat oven using “Boiled Potatoes” setting. Steam potatoes for 6 minutes (set your own timer?). When they are parboiled, cool potatoes in the fridge. (Do not layer potatoes with sauce while they are still hot.)

4.  SAUCE: (use both sides of ivario) Melt butter, add potato starch and whisk until smooth. It will thicken very quickly if the pan is too hot. Whisk in the milk, chicken stock and cream cheese. Reduce heat, whisk until smooth, and allow it to thicken slightly. Add mustard, cayenne, salt and pepper. Turn off heat and add cheeses, stir until smooth. Add sauteed onions. Taste for seasoning.

5.  LAYERING: Start with 2 cups sauce on the bottom of the pan. Single layer potatoes and sauce, alternating until 6lb potatoes are in the pan, and pans are no fuller than 2-2½” deep. The top layer should be sauce. Then sprinkle with cheese topping. Saran wrap each pan and refrigerate up to two days (even three?)

6.  Serving Day: Use Potato Gratin setting, Long (~1h 30min). Cook potatoes uncovered. If they get too brown before cooking is complete, add lids.', 'Potato Au Gratin.docx', false),
('potato-dill-soup', 'Potato Dill Soup', 'Soup', '1 roaster is 14 L — 5x original recipe is about 11L', null, '{}'::jsonb, '[{"item": "roaster is 14 L — 5x original recipe is about 11L", "qty": 1, "raw": "1 roaster is 14 L — 5x original recipe is about 11L", "unit": null}, {"item": "— 6x original recipe is about 13 L", "qty": null, "raw": "— 6x original recipe is about 13 L", "unit": null}, {"item": "x original recipe", "qty": 5, "raw": "*5x original recipe", "unit": null}, {"item": "butter", "qty": 10, "raw": "10 Tbsp butter", "unit": "tbsp"}, {"item": "onion, diced, about 5 med", "qty": 2.5, "raw": "2½ cup onion, diced, about 5 med", "unit": "cup"}, {"item": "carrot, grated, well packed, about 5 large carrots", "qty": 5, "raw": "5 cups carrot, grated, well packed, about 5 large carrots", "unit": "cup"}, {"item": "russet potatoes, peeled and chopped", "qty": 15, "raw": "15 cups russet potatoes, peeled and chopped", "unit": "cup"}, {"item": "fine salt", "qty": 2.5, "raw": "2½ tsp fine salt", "unit": "tsp"}, {"item": "black pepper", "qty": 1.25, "raw": "1¼ tsp black pepper", "unit": "tsp"}, {"item": "chicken or veg broth", "qty": 5, "raw": "5 L chicken or veg broth", "unit": "L"}, {"item": "dill pickle brine", "qty": 1, "qtyMax": 1.25, "raw": "1-1¼ cup dill pickle brine", "unit": "cup"}, {"item": "full fat sour cream, at room temp", "qty": 2.5, "raw": "2½ cup full fat sour cream, at room temp", "unit": "cup"}, {"item": "flour", "qty": 10, "raw": "10 Tbsp flour", "unit": "tbsp"}, {"item": "dill pickles, grated", "qty": 1.6666666666666665, "raw": "1⅔ cup dill pickles, grated", "unit": "cup"}, {"item": "fresh dill", "qty": 2.5, "raw": "2½ Tbsp fresh dill", "unit": "tbsp"}]'::jsonb, '', 'Potato Dill Soup

Quantities:

1 roaster is 14 L — 5x original recipe is about 11L

— 6x original recipe is about 13 L

Shower quantities (225 ppl) - 4 roasters at *5x original recipe each

*5x original recipe

10 Tbsp butter

2½ cup onion, diced, about 5 med

5 cups carrot, grated, well packed, about 5 large carrots

15 cups russet potatoes, peeled and chopped

2½ tsp fine salt

1¼ tsp black pepper

5 L chicken or veg broth

1-1¼ cup dill pickle brine

2½ cup full fat sour cream, at room temp

10 Tbsp flour

1⅔ cup dill pickles, grated

2½ Tbsp fresh dill

Garnish:

1¼ cup dill pickle, finely diced

2½ Tbsp fresh dill

Sour cream

1.  Take sour cream out of fridge before starting to bring it to room temp.

2.  In a large pot over med heat, melt butter, then add onions and carrot. Saute for about 4-5 min until softened. Add potatoes and salt and pepper. Cook, stirring for about 2 minutes.

3.  Add broth and dill pickle brine. Bring to a boil, then reduce heat to med-low and simmer gently for about 20-30 min or until potatoes are very soft.

4.  Use an immersion blender in the pot to puree about half the soup, leaving some chunks (or transfer about half the soup in batches to a blender and puree until smooth, then return to the pot).

5.  In a smaller bowl, whisk together the sour cream and flour. Drizzle in about 1 Tbsp of the warm soup and whisk in (to warm the sour cream mixture a bit). Gradually add dollops of the sour cream mixture into the soup whisking really well after each addition until blended, until all the sour cream mixture has been added. Stir in the shredded pickles. Cook over med-low heat, stirring often, for 5-10 min or until warmed and slightly thickened. Stir in fresh dill. Taste and season to taste with additional salt and pepper.

6.  Notes: if using dried dill use about ⅓ of the amount. Refrigerate up to 3 days, freeze unto 3 months', 'Potato Dill Soup.docx', false),
('quinoa-tabbouleh', 'Quinoa Tabbouleh', 'Salad', '', null, '{}'::jsonb, '[{"item": "quinoa, rinsed well and drained", "qty": 0.5, "raw": "½ cup quinoa, rinsed well and drained", "unit": "cup"}, {"item": "water", "qty": 1, "raw": "1 cup water", "unit": "cup"}, {"item": "cucumber, diced", "qty": 1, "raw": "1 cup cucumber, diced", "unit": "cup"}, {"item": "tomato, seeds removed and diced", "qty": 1, "raw": "1 cup tomato, seeds removed and diced", "unit": "cup"}, {"item": "parsley, chopped", "qty": 0.5, "raw": "½ cup parsley, chopped", "unit": "cup"}, {"item": "mint leaves, chopped", "qty": 0.25, "raw": "¼ cup mint leaves, chopped", "unit": "cup"}, {"item": "green onions, thinly sliced", "qty": 0.3333333333333333, "raw": "1/3 cup green onions, thinly sliced", "unit": "cup"}, {"item": "canned chickpeas, drained and rinsed well", "qty": 1, "raw": "1 cup canned chickpeas, drained and rinsed well", "unit": "cup"}, {"item": "dry, crumbled feta", "qty": 0.25, "raw": "¼ cup dry, crumbled feta", "unit": "cup"}]'::jsonb, '', 'Quinoa Tabbouleh
(adapted from cookieandkate.come) makes ~5 cups

½ cup quinoa, rinsed well and drained
1 cup water

1 cup cucumber, diced
1 cup tomato, seeds removed and diced
½ cup parsley, chopped
¼ cup mint leaves, chopped
1/3 cup green onions, thinly sliced
1 cup canned chickpeas, drained and rinsed well
¼ cup dry, crumbled feta

Dressing:
1/3 cup olive oil
3 Tbsp lemon juice
1 tsp minced garlic

TWO DAYS AHEAD:

1.  Cook quinoa: Rinse well; quantity per steam pan

  4¼ cups (850g)

  7 ½ cups water

  ¾ tsp salt

a.  Pathway: Steam 100% humidity, 212F, 25-35 min, covered tightly

b.  After cooking, rest covered for 5 min, then fluff.

c.  Cool

ONE DAY AHEAD:

2.  Chop: cucumber, tomatoes, parsley, green onion, mint leaves

3.  Combine tomato and cucumber with ½ tsp salt in colander and set aside to drain excess moisture overnight.

4.  Drain chickpeas

5.  Premake dressing ahead of time.

DAY OF:

6.  Toss all ingredients together in a serving bowl.

7.  Dress about an hour before serving.

Quinoa Tabbouleh Groceries- 20x original recipe: makes ~100 cups (allows roughly 70% of guests to take a modest portion)

1.7kg (8½ cups) dry quinoa
20 cups (3.5 kg) cucumber (9-11 english cucumbers)
20 cups (4.5 kg) Roma tomatoes
10 cups (10-12 bunches) flat-leaf Italian parsley
5 cups (8-10 bunches) mint
6.5 cups (8-10 bunches) green onion
3.3 kg chickpeas
750 g feta cheese

Dressing:

2L olive oil
900 mL lemon juice
7 Tbsp minced garlic
10 tsp salt', 'Quinoa Tabbouleh.docx', false),
('sarah-s-sauerkraut-rice', 'Sarah’s Sauerkraut Rice', 'Starch', 'Wedding Quantity: 7 pans of 7 cups of rice (includes 1 GF pan)', null, '{}'::jsonb, '[{"item": "(1.26 kg) basmati rice (Costco pink bag)", "qty": 6, "raw": "-   6 cups (1.26 kg) basmati rice (Costco pink bag)", "unit": "cup"}, {"item": "bacon (costco red pkg)", "qty": 2, "raw": "-   2 lb bacon (costco red pkg)", "unit": "lb"}, {"item": "onions, minced", "qty": 4, "raw": "-   4 onions, minced", "unit": null}]'::jsonb, '', 'Sarah’s Sauerkraut Rice

Wedding Quantity: 7 pans of 7 cups of rice (includes 1 GF pan)

*This recipe has 6 cups rice, so make 8 pans of rice

Prep day before the event:

Rice Ingredients:

-   6 cups (1.26 kg) basmati rice (Costco pink bag)

-   2 lb bacon (costco red pkg)

-   4 onions, minced

-   (cooked in ½+ cup butter)

-   4 Tbsp minced garlic

-   1 package of costco mushrooms, sliced, sauté in more butter

-   ½ jar of sauerkraut (glass jar at costco)

-   1 cup Bragg’s liquid seasoning sauce

Rice

-   Rinse rice well and add to serving pan

-   Add 9 cups water, cover (or 12 cups water uncovered?)

-   Load oven trolley

    -   Pathway: Select “Basmati Rice 1:1.5” (20 min)

Bacon

-   Chop bacon, spread 2lb onto each cookie sheet (with parchment paper)

-   Load oven trolley

    -   Pathway: Select: “Bacon Panfry” (8 min)

        -   Reserve fat

Onions, Garlic

-   In Ivario: 250º melt butter and saute onions and garlic, should be buttery

Mushrooms

-   In Ivario: saute mushrooms with butter, until no liquid

Method:

-   Add sauerkraut, bacon with fat, onions, garlic, mushrooms and cooked rice to large mixing bowl, gently stir

-   Add Bragg’s seasoning, gently stir

-   Return mixture to serving pan

-   Pathway: Select: “Fried Rice”, Select: “Long” (20 min) = allow 1.5-2 hours

    -   Cook uncovered on this setting 4-5 times, stirring in between for a fried rice texture

REHEAT DAY

Pathway

Select: “Heat Through” (plan for at least 2 hours”

Select: “Normal” (not Gentle). Heat along with the sausage

-   Use probe in the rice if not being used in a meat dish

-   Reheat with lids', 'Sarah_s Sauerkraut Rice.docx', false),
('sask-noodles', 'Sask Noodles', 'Starch', 'Each serving pan holds 2 pkg = 10-12 serving pans of noodles', null, '{}'::jsonb, '[{"item": "pasta in each strainer", "qty": 1, "raw": "-   1 kg pasta in each strainer", "unit": "kg"}]'::jsonb, '', 'Sask Noodles

Wedding Quantity: 20-25 pkg of ~1kg dry pasta

Each serving pan holds 2 pkg = 10-12 serving pans of noodles

Prep day of event:

-   Need 14 sets: strainer pan insert, 4” serving pan, and lid (per oven load)

-   1 kg pasta in each strainer

-   Cover pasta with water (break it down a little to be sure it’s all immersed, and “stir”)

-   Load oven trolley with 14 pans with lids

-   20 - 25 pans to cook; Plan time to reload oven (two batches)

PATHWAY

Select: “Pasta in Sauce”

Select: “Long” (30 min) per oven load; max 14 pans (plan for two batches)

-   Immerse probe in the water of one pan, cover

-   Roll trolley into oven and start

Once cooked:

-   Strain pasta ( a little water left over is ok, do not rinse)

-   Fill serving pans with 2 kgs pasta

-   Pour 1 cup of salted butter, melted, over 2 kg pasta and stir

-   Cover well and place in warmers', 'Sask Noodles.docx', false),
('savory-celery-sage-rice', 'Savory Celery & Sage Rice', 'Starch', 'Single Steam Pan - Plan 7 + 1 GF pans for wedding', null, '{}'::jsonb, '[{"item": "rice", "qty": 6, "raw": "6 cup rice", "unit": "cup"}, {"item": "water", "qty": 12, "raw": "12 cup water", "unit": "cup"}, {"item": "med/lg onions, diced", "qty": 2, "raw": "2 med/lg onions, diced", "unit": null}, {"item": "celery, diced", "qty": 4, "raw": "4 cups celery, diced", "unit": "cup"}, {"item": "salted butter", "qty": 1, "raw": "1 cup salted butter", "unit": "cup"}, {"item": "Lipton soup mix", "qty": 2, "raw": "2 packages Lipton soup mix", "unit": "pkg"}, {"item": "poultry seasoning", "qty": 2, "raw": "2 tbsp poultry seasoning", "unit": "tbsp"}]'::jsonb, '', 'Savory Celery & Sage RIce

Single Steam Pan - Plan 7 + 1 GF pans for wedding

+-----------------------------------------------------------------------+
| Savory RIce (7 pans)                                                  |
|                                                                       |
| 42 cups rice (4 bags Tilda)                                           |
|                                                                       |
| 14 med/lg onions, diced                                               |
|                                                                       |
| 2 pkgs celery, Costco                                                 |
|                                                                       |
| 7 cup salted butter                                                   |
|                                                                       |
| 14 packages Lipton soup mix                                           |
|                                                                       |
| 1 cup poultry seasoning                                               |
+=======================================================================+
+-----------------------------------------------------------------------+

6 cup rice

12 cup water

2 med/lg onions, diced

4 cups celery, diced

1 cup salted butter

2 packages Lipton soup mix

2 tbsp poultry seasoning

Prep Ahead: Saute onions and celery until golden brown.

Day Of:

-   Steam rice.

-   Rewarm Onion/ Celery

-   Mix cooked aromatics with the steamed rice. Add soup mix and poultry seasoning.', 'Savory Celery & Sage RIce.docx', false),
('seasoned-potato-wedges', 'Seasoned Potato Wedges', 'Starch', '', null, '{}'::jsonb, '[{"item": "yellow potatoes", "qty": 10, "raw": "10 lbs yellow potatoes", "unit": "lb"}, {"item": "light olive oil", "qty": 0.5, "raw": "½ cup light olive oil", "unit": "cup"}, {"item": "kosher salt", "qty": 2.5, "raw": "2½ tbsp kosher salt", "unit": "tbsp"}, {"item": "pepper", "qty": 2, "raw": "2 tsp pepper", "unit": "tsp"}, {"item": "onion powder", "qty": 1, "raw": "1 tbsp onion powder", "unit": "tbsp"}, {"item": "paprika", "qty": 1, "raw": "1 tbsp paprika", "unit": "tbsp"}, {"item": "dried rosemary, crushed fairly fine", "qty": 1, "raw": "1 tbsp dried rosemary, crushed fairly fine", "unit": "tbsp"}, {"item": "dried parsley", "qty": 1, "raw": "1 tbsp dried parsley", "unit": "tbsp"}]'::jsonb, '', 'Seasoned Potato Wedges

+-----------------------------------------------------------------------+
| Potato Wedges Grocery List                                            |
|                                                                       |
| SLW 2026                                                              |
|                                                                       |
| 150lbs yellow potatoes                                                |
|                                                                       |
| 7½ cup light olive oil                                                |
|                                                                       |
| 2⅓ cups kosher salt                                                   |
|                                                                       |
| ⅔ cups pepper                                                         |
|                                                                       |
| 1 cup onion powder                                                    |
|                                                                       |
| 1 cup paprika                                                         |
|                                                                       |
| *1 cup dried rosemary, crushed fairly fine                            |
|                                                                       |
| 1 cup dried parsley                                                   |
+=======================================================================+
+-----------------------------------------------------------------------+

Recipe per Steam Pan

10 lbs yellow potatoes

½ cup light olive oil

2½ tbsp kosher salt

2 tsp pepper

1 tbsp onion powder

1 tbsp paprika

1 tbsp dried rosemary, crushed fairly fine

1 tbsp dried parsley

Pathway: 400 F, 0% humidity, Fan: hi, about 35-45 min, stir, add 20-25 min

Don’t cover the pans immediately - let them steam off for about 5 min before covering and putting in the warming ovens.', 'Seasoned Potato Wedges.docx', false),
('seven-layer-salad', 'Seven Layer Salad', 'Salad', 'Ingredients per pan:', null, '{}'::jsonb, '[{"item": "Hellman’s mayonaise", "qty": 4, "raw": "4 cups Hellman’s mayonaise", "unit": "cup"}, {"item": "sour cream", "qty": 4, "raw": "4 cups sour cream", "unit": "cup"}, {"item": "sugar", "plus": {"qty": 3, "unit": "tbsp"}, "qty": 0.25, "raw": "¼ cup + 3 Tbsp sugar", "unit": "cup"}]'::jsonb, '', 'Seven Layer Salad

Prepare 6 rectangle salad pans for a wedding.

Ingredients per pan:

Dressing:

4 cups Hellman’s mayonaise

4 cups sour cream

¼ cup + 3 Tbsp sugar

Layers:

2 kg iceberg lettuce, chopped small (about 2.5 heads)

2 doz hardboiled eggs, chopped small

4 cups red pepper, chopped small (about 3 peppers, or .5kg)

2 bunches of green onion thinly sliced (about 1½ cups, or 3.2 oz)

4 lbs thick cut bacon, chopped and fried

750 grams frozen peas, thawed and drained on paper towel

2½ cups sharp cheddar cheese, shredded

Micro greens for garnish

Instructions:

1.  Cook bacon in skillet over medium heat unto crispy. Drain on paper towels. (Can be done ahead and frozen.)

2.  Hard boil eggs, cool in icebath. (Can be bought or done ahead.)

3.  Dice eggs and peppers. Shred cheese. Chop green onion.

4.  Remove outer layers from iceberg lettuce, chop small size for spooning out of dish, rinse in colander.

1.  **Fill salad spinner about an inch below the ridge. Spin for 3 min, fluff and spin another 3 min.

2.  Fill rectangle salad bowls with 2 kg chopped lettuce

Next: chopped eggs

Then: red pepper, green onions, bacon, and peas

Top: Spread dressing evenly and garnish with cheese and micro greens

7. Chill: cover and refrigerate for at least 4 hours before serving.', 'Seven Layer Salad.docx', false),
('sharon-s-greek-salad', 'Sharon’s Greek Salad', 'Salad', '', null, '{}'::jsonb, '[{"item": "cucumbers, diced", "qty": 3, "raw": "3 cucumbers, diced", "unit": null}, {"item": "bell peppers (assorted colours)", "qty": 4, "raw": "4 bell peppers (assorted colours)", "unit": null}, {"item": "cherry tomatoes, halved", "qty": 2, "raw": "2 cups cherry tomatoes, halved", "unit": "cup"}, {"item": "snap peas, diced", "qty": 2, "raw": "2 cups snap peas, diced", "unit": "cup"}, {"item": "green olives, sliced", "qty": 1, "raw": "1 cup green olives, sliced", "unit": "cup"}, {"item": "kalamata olives, quartered", "qty": 0.75, "raw": "¾ cup kalamata olives, quartered", "unit": "cup"}, {"item": "fresh dill, chopped", "qty": 1, "raw": "1 cup fresh dill, chopped", "unit": "cup"}, {"item": "feta, diced", "qty": 2, "raw": "2 cups feta, diced", "unit": "cup"}, {"item": "Creamy Greek Renee’s dressing", "qty": null, "raw": "Creamy Greek Renee’s dressing", "unit": null}]'::jsonb, '', 'Sharon’s Greek Salad
(all vegetables are diced small)

Original recipe makes 18-20 cups

3 cucumbers, diced
4 bell peppers (assorted colours)
2 cups cherry tomatoes, halved
2 cups snap peas, diced
1 cup green olives, sliced
¾ cup kalamata olives, quartered
1 cup fresh dill, chopped
2 cups feta, diced
Creamy Greek Renee’s dressing

Garnish with: shaved parmesan, ¾ cup sliced almonds, toasted and balsamic glaze

Prep:

Thursday: Chop into separate bowls: slice green olives, quarter kalamata; dice peppers, snap peas, feta, dill; toast almonds

Friday: dice cucumber, halve tomatoes: drain
Saturday: combine ingredients and serve in shallow square bowls

Wedding Quantity: 12x original recipe

Sharon’s Greek Salad Groceries

36 cucumbers
48 bell peppers
24 cups cherry tomatoes
24 cups snap peas
2L green olives
2.25L kalamata olives
12 cups dill
3.6 kg feta
4-5L greek dressing
8-10 cups sliced almonds, toasted
750g parm petals

1 bottle balsamic glaze', 'Sharon_s Greek Salad.docx', false),
('sheet-pan-kebabs-koftas', 'Sheet Pan Kebabs / Koftas', 'Protein', '', null, '{}'::jsonb, '[{"item": "gr beef", "qty": 1, "raw": "1 lb gr beef", "unit": "lb"}, {"item": "gr. pork", "qty": 0.5, "raw": "½ lb gr. pork", "unit": "lb"}, {"item": "parsley", "qty": 1, "raw": "1 bunch parsley", "unit": "bunch"}, {"item": "lg onion", "qty": 1, "raw": "1 lg onion", "unit": null}, {"item": "red pepper", "qty": 1, "raw": "1 red pepper", "unit": null}, {"item": "garlic", "qty": 1.5, "raw": "1½ tsp garlic", "unit": "tsp"}, {"item": "tomato paste", "qty": 0.25, "raw": "¼ cup tomato paste", "unit": "cup"}, {"item": "salt", "qty": 1, "raw": "1 tsp salt", "unit": "tsp"}, {"item": "black pepper", "qty": 1, "raw": "1 tsp black pepper", "unit": "tsp"}, {"item": "paprika", "qty": 2, "raw": "2 tsp paprika", "unit": "tsp"}, {"item": "turmeric", "qty": 1, "raw": "1 tsp turmeric", "unit": "tsp"}]'::jsonb, '', 'Sheet Pan Kebab/Koftas - Sivan’s Kitchen

Original Recipe - makes 20-22 meatballs

1 lb gr beef

½ lb gr. pork

1 bunch parsley

1 lg onion

1 red pepper

1½ tsp garlic

¼ cup tomato paste

1 tsp salt

1 tsp black pepper

2 tsp paprika

1 tsp turmeric

1.  Blend parsley, onion, pepper, garlic until mushy. Strain well. Mix with meat, tomato paste and spices.

2.  Spread onto oiled parchment paper, ½” thick. Score into strips/squares or meatballs. Bake 15 min at 425º, then broil 3-5 min. (Icombi Pathway: Panfry, Dark #4; about 8 min)', 'Sheet Pan Kebabs_Koftas.docx', false),
('sis-kim-s-alfredo-sauce', 'Sis Kim’s Alfredo Sauce', 'Sauce & dressing', '', null, '{}'::jsonb, '[{"item": "whipping cream", "qty": 1, "raw": "1 L whipping cream", "unit": "L"}, {"item": "milk (2%)", "qty": 1, "raw": "1 cup milk (2%)", "unit": "cup"}, {"item": "butter", "qty": 0.5, "raw": "½ butter", "unit": null}, {"item": "garlic plus", "qty": 3, "raw": "3 tsp garlic plus", "unit": "tsp"}, {"item": "Better than Bouillon", "qty": 0.25, "raw": "¼ cup Better than Bouillon", "unit": "cup"}, {"item": "cream cheese", "qty": 8, "raw": "8 ounce cream cheese", "unit": "oz"}]'::jsonb, '', 'Sis Kim’s Alfredo Sauce

1 L whipping cream
1 cup milk (2%)
½ butter
3 tsp garlic plus
¼ cup Better than Bouillon
8 ounce cream cheese

Cook until almost boiling then add:

1 cup mozzarella cheese, grated
1 cup marble cheese, grated

Cook until well blended and mixed.

625 ppl: 30 times original recipe (58-60 L)

Grocery Order

30 L cream
7.1 L 2% milk
7.5 lbs butter
2 cups garlic plus
7.5 cups Better than Bouillon
30x 8oz cream cheese
3.4 kg mozzarella cheese
3.4 kg marble cheese (+ 1 extra for a cushion)', 'Sis Kim_s Alfredo Sauce.docx', false),
('sloppy-joes', 'Sloppy Joes', 'Protein', '', null, '{}'::jsonb, '[{"item": "ground beef", "qty": 10, "raw": "10 lb ground beef", "unit": "lb"}, {"item": "green bell pepper, minced", "qty": 3, "raw": "3 green bell pepper, minced", "unit": null}, {"item": "lg yellow onion, mince", "qty": 5, "raw": "5 lg yellow onion, mince", "unit": null}, {"item": "garlic, minced", "qty": 5, "raw": "5 Tbsp garlic, minced", "unit": "tbsp"}, {"item": "tomato paste", "plus": {"qty": 2, "unit": "tbsp"}, "qty": 0.5, "raw": "½ cup + 2 Tbsp tomato paste", "unit": "cup"}, {"item": "ketchup", "qty": 6.666666666666667, "raw": "6⅔ cup ketchup", "unit": "cup"}, {"item": "water", "qty": 3.3333333333333335, "raw": "3⅓ cup water", "unit": "cup"}, {"item": "brown sugar (or less if perferred)", "plus": {"qty": 2, "unit": "tbsp"}, "qty": 0.5, "raw": "½ cup + 2 Tbsp brown sugar (or less if perferred)", "unit": "cup"}, {"item": "yellow mustard", "qty": 5, "raw": "5 Tbsp yellow mustard", "unit": "tbsp"}, {"item": "chili powder", "qty": 2.5, "raw": "2½ Tbsp chili powder", "unit": "tbsp"}, {"item": "Worcestershire sauce", "qty": 3.3333333333333335, "raw": "3⅓ Tbsp Worcestershire sauce", "unit": "tbsp"}, {"item": "kosher salt", "qty": 5, "raw": "5 tsp kosher salt", "unit": "tsp"}, {"item": "red pepper flakes (opt)", "qty": 2.5, "raw": "2½ tsp red pepper flakes (opt)", "unit": "tsp"}, {"item": "black pepper", "qty": 2.5, "raw": "2½ tsp black pepper", "unit": "tsp"}, {"item": "hot sauce", "qty": 10, "raw": "10 Dash of hot sauce", "unit": "dash"}]'::jsonb, '', 'Sloppy Joes

original

10 lb ground beef

3 green bell pepper, minced

5 lg yellow onion, mince

5 Tbsp garlic, minced

½ cup + 2 Tbsp tomato paste

6⅔ cup ketchup

3⅓ cup water

½ cup + 2 Tbsp brown sugar (or less if perferred)

5 Tbsp yellow mustard

2½ Tbsp chili powder

3⅓ Tbsp Worcestershire sauce

5 tsp kosher salt

2½ tsp red pepper flakes (opt)

2½ tsp black pepper

10 Dash of hot sauce

1.  (Skip for icombi) Heat butter and oil, add beef and brown, breaking apart.

2.  Pam Spray steam pans with holes. Place 10 lb beef in steam pan with holes, and place that pan into another 4” steam pan to catch the grease. Break apart the beef well with gloved hands. Add minced onion, green peppers, and garlic, mix by hand.

3.  Pathway: Steam on high heat ground beef setting for 20 min, break up meat with mincer, return to oven for another 20 min, break up again, quite small.

4.  Transfer to serving pans or roasting ovens (new ones should fit 15lb meat each plus other ingredients), add tomatoe paste, ketchup, water, brown sugar, mustard, chili powder, Worcestershire sauce, salt, red pepper flakes, and black pepper', 'Sloppy Joes.docx', false),
('smokey-pulled-pork', 'Smokey Pulled Pork', 'Protein', '', null, '{}'::jsonb, '[{"item": "oil", "qty": 2, "raw": "2 Tbsp oil", "unit": "tbsp"}, {"item": "pork shoulder", "qty": 4, "raw": "4lb pork shoulder", "unit": "lb"}, {"item": "Kosher salt (1½ tbs if using table salt)", "qty": 3, "raw": "3 Tbsp Kosher salt (1½ tbs if using table salt)", "unit": "tbsp"}, {"item": "low sodium beef broth", "qty": 2, "raw": "2 cups low sodium beef broth", "unit": "cup"}, {"item": "small yellow onion, diced", "qty": 1, "raw": "1 small yellow onion, diced", "unit": null}, {"item": "minced garlic", "qty": 3, "raw": "3 tsp minced garlic", "unit": "tsp"}, {"item": "chipotle peppers in adobo sauce", "qty": 4, "raw": "4 chipotle peppers in adobo sauce", "unit": null}, {"item": "lime juice", "qty": 3, "raw": "3 tbs lime juice", "unit": "tbsp"}, {"item": "chili powder", "qty": 2, "raw": "2 tbs chili powder", "unit": "tbsp"}, {"item": "brown sugar", "qty": 1, "raw": "1 tbs brown sugar", "unit": "tbsp"}, {"item": "cumin", "qty": 2, "raw": "2 tsp cumin", "unit": "tsp"}, {"item": "paprika", "qty": 1, "raw": "1 tsp paprika", "unit": "tsp"}, {"item": "ground cayenne", "qty": 0.5, "raw": "½ tsp ground cayenne", "unit": "tsp"}]'::jsonb, '', 'Smokey Pulled Pork

Original Recipe: (serves 10-15)

2 Tbsp oil

4lb pork shoulder

3 Tbsp Kosher salt (1½ tbs if using table salt)

2 cups low sodium beef broth

1 small yellow onion, diced

3 tsp minced garlic

4 chipotle peppers in adobo sauce

3 tbs lime juice

2 tbs chili powder

1 tbs brown sugar

2 tsp cumin

1 tsp paprika

½ tsp ground cayenne

Serve with: corn tortillas, cotija cheese, pickled red onions,

cilantro, diced tomatoes, sour cream?

Pickled red onions:

¼ cup apple cider vinegar

¼ cup white vinegar

1 cup water

1-2 tbs sugar

1 tsp salt

Instructions:

1.  Heat oil in heavy pan.

2.  Season the pork with the slt and brown it in the hot oil, making sure to get each side.

3.  In the bottom of the slow cooker, combine the beef broth onion , garlic, chipotle peppers, lime juice, chili powder, brown sugar, cumin , paprika, dried oregano and cayenne.

4.  Add the pork to the slow cooker. Cook on low for 8 to 10 hours or until the pork falls apart easily with a fork. (Do not cook on high)

5.  Remove pork from the slow cooker, and remove any large pieces of fat. Shred with two forks and return to the slow cooker for serving

6.  Can be frozen, keep the liquids to cover the meat while freezing, upto 3 mths', 'Smokey Pulled Pork_.docx', false),
('smoky-chicken-dry-rub', 'Smoky Chicken Dry Rub', 'Sauce & dressing', '', null, '{}'::jsonb, '[{"item": "/ 5kg chicken - 1kg box", "qty": 11, "raw": "11lb / 5kg chicken - 1kg box", "unit": "lb"}, {"item": "brown sugar", "qty": 5.5, "raw": "5½ tbsp brown sugar", "unit": "tbsp"}, {"item": "smoked paprika", "qty": 5.5, "raw": "5½ tbsp smoked paprika", "unit": "tbsp"}, {"item": "kosher salt", "qty": 8.25, "raw": "8¼ tsp kosher salt", "unit": "tsp"}, {"item": "chili powder", "qty": 5.5, "raw": "5½ tsp chili powder", "unit": "tsp"}, {"item": "oregano", "qty": 5.5, "raw": "5½ tsp oregano", "unit": "tsp"}, {"item": "garlic powder", "qty": 5.5, "raw": "5½ tsp garlic powder", "unit": "tsp"}, {"item": "onion powder", "qty": 5.5, "raw": "5½ tsp onion powder", "unit": "tsp"}, {"item": "pepper", "qty": 5.5, "raw": "5½ tsp pepper", "unit": "tsp"}]'::jsonb, '', 'Smoky Chicken Dry Rub

Original serves 11lbs chicken (breast, thigh, or wings)

Original

11lb / 5kg chicken - 1kg box

5½ tbsp brown sugar

5½ tbsp smoked paprika

8¼ tsp kosher salt

5½ tsp chili powder

5½ tsp oregano

5½ tsp garlic powder

5½ tsp onion powder

5½ tsp pepper

Pathway: “Panfry”', 'Smokey Chicken Dry Rub.docx', false),
('street-corn', 'Street Corn', 'Vegetable', 'Recipe Per Full Size Steam Pan', null, '{}'::jsonb, '[{"item": "olive oil", "qty": 1, "raw": "1 cup olive oil", "unit": "cup"}, {"item": "corn, frozen", "qty": 6, "raw": "6kg corn, frozen", "unit": "kg"}, {"item": "salt", "qty": 3, "raw": "3 tbsp salt", "unit": "tbsp"}, {"item": "pepper", "qty": 3, "raw": "3 tsp pepper", "unit": "tsp"}, {"item": "butter", "qty": 1, "raw": "1 cup butter", "unit": "cup"}, {"item": "garlic, minced", "qty": 0.5, "raw": "½ cup garlic, minced", "unit": "cup"}, {"item": "jalepeno, deseed and remove most membranes", "qty": 10, "raw": "10 jalepeno, deseed and remove most membranes", "unit": null}, {"item": "mayonnaise", "qty": 3.5, "qtyMax": 4, "raw": "3½-4 cups mayonnaise", "unit": "cup"}, {"item": "chili powder", "qty": 2, "qtyMax": 3, "raw": "2-3 Tbsp chili powder", "unit": "tbsp"}, {"item": "smoked paprika", "qty": 4, "raw": "4 tbsp smoked paprika", "unit": "tbsp"}, {"item": "chopped cilantro", "qty": 1, "raw": "1 cup chopped cilantro", "unit": "cup"}, {"item": "lime juice", "qty": 0.75, "raw": "¾ cup lime juice", "unit": "cup"}, {"item": "shredded cotija cheese (2 bricks)", "qty": 3.5, "raw": "3½ cups shredded cotija cheese (2 bricks)", "unit": "cup"}]'::jsonb, '', 'STREET CORN

Recipe Per Full Size Steam Pan

1 cup olive oil

6kg corn, frozen

3 tbsp salt

3 tsp pepper

1 cup butter

½ cup garlic, minced

10 jalepeno, deseed and remove most membranes

3½-4 cups mayonnaise

2-3 Tbsp chili powder

4 tbsp smoked paprika

1 cup chopped cilantro

¾ cup lime juice

3½ cups shredded cotija cheese (2 bricks)

Pre Prep:

-   Shred cojita cheese, divvy by wieght, into number of pans

-   Jalepenos: wash, deseed and remove most membranes. Halve and pulse in food processor to quite fine.

-   Pre fry with butter: jalepenos and garlic, just until tender - cool in fridge, take out to come to room temp the day of ( or even warm it)

-   Pre mix: Mayonnaise, chili powder and smoked paprika into portioned bowls per pan; set aside in the fridge

Day of:

- Toss 2kg frozen corn (1 bag) with:

⅓ olive oil

1 tbsp salt

1 tsp pepper

- spread 1 bag/sheet pan

- Pathway: Vegetables, Grill; 7-8 mins

Mix: mayonnaise mixture with jalepeno mixture and 1 cup melted butter.

Toss: 3 pans (6kg) grilled corn with each sauce bowl, and then into warmers. Garnish with extra cilantro before serving.', 'Street Corn.docx', false),
('stuffed-mushrooms', 'Stuffed Mushrooms', 'Vegetable', '', null, '{}'::jsonb, '[{"item": "whole fresh mushrooms (half a costco pkg)", "qty": 12, "raw": "12 whole fresh mushrooms (half a costco pkg)", "unit": null}, {"item": "extra vergin olive oil", "qty": 1, "raw": "1 Tbsp extra vergin olive oil", "unit": "tbsp"}, {"item": "minced garlic", "qty": 2, "raw": "2 tbsp minced garlic", "unit": "tbsp"}, {"item": "minced onion", "qty": 2, "raw": "2 tbsp minced onion", "unit": "tbsp"}, {"item": "block cream cheese, softened", "qty": 1, "qtyMax": 8, "raw": "1 - 8 oz block cream cheese, softened", "unit": "oz"}, {"item": "grated parm", "qty": 0.25, "raw": "¼ cup grated parm", "unit": "cup"}, {"item": "black pepper", "qty": 0.25, "raw": "¼ tsp black pepper", "unit": "tsp"}, {"item": "cayenne (or less to taste)", "qty": 0.25, "raw": "¼ tsp cayenne (or less to taste)", "unit": "tsp"}]'::jsonb, '', 'Stuffed Mushrooms

Original Recipe:

12 whole fresh mushrooms (half a costco pkg)

1 Tbsp extra vergin olive oil

2 tbsp minced garlic

2 tbsp minced onion

1 - 8 oz block cream cheese, softened

¼ cup grated parm

¼ tsp black pepper

¼ tsp cayenne (or less to taste)

1.  Break off mushroom stems, and clean & dry mushrooms,

2.  Dice mushroom stems very fine, add garlic and onion: heat oil and saute veg until moisture has dissappeared - set aside to cool.

3.  When the garlic and mushroom is cool enough, stir in cream cheese, parm, pepper, ionion powder and cayenne.

4.  Use a little spoon to fill each mushroom cap with a generous amount of stuffing.

5.  Arrange mushroom caps on prepared cookie sheet.

6.  Bake for 20 minutes in a preheated oven or until mushrooms are piping hot and liquid starts to form under caps.', 'Stuffed Mushrooms_.docx', false),
('sweet-and-sour-meatballs', 'Sweet and Sour Meatballs', 'Protein', '', null, '{}'::jsonb, '[{"item": "lean ground beef", "qty": 3, "raw": "3 lbs lean ground beef", "unit": "lb"}, {"item": "ground pork", "qty": 1, "raw": "1 lb ground pork", "unit": "lb"}, {"item": "med onion, finely minced", "qty": 1, "raw": "1 med onion, finely minced", "unit": null}, {"item": "med green pepper, finely minced", "qty": 1, "raw": "1 med green pepper, finely minced", "unit": null}, {"item": "large eggs", "qty": 2, "raw": "2 large eggs", "unit": null}, {"item": "grated fresh ginger", "qty": 2, "raw": "2 Tbsp grated fresh ginger", "unit": "tbsp"}, {"item": "garlic powder", "qty": 0.5, "raw": "½ tsp garlic powder", "unit": "tsp"}, {"item": "kosher salt", "qty": 2, "raw": "2 tsp kosher salt", "unit": "tsp"}, {"item": "black pepper", "qty": 1, "raw": "1 tsp black pepper", "unit": "tsp"}]'::jsonb, '', 'Sweet and Sour Meatballs – (wedding 22 x recipe)
(2-4 weeks in advance)

3 lbs lean ground beef

1 lb ground pork

1 med onion, finely minced

1 med green pepper, finely minced

2 large eggs

2 Tbsp grated fresh ginger

½ tsp garlic powder

2 tsp kosher salt

1 tsp black pepper

1.  Finely blend or mince the onion and green pepper until very small (avoid making them completely liquid)

2.  Combine all ingredients in a large bowl

3.  Mix gently until just combined

4.  Roll into 40-45g meatballs

5.  Arrange on parchment-lined baking trays

6.  Bake at 400F for 15-18 min

7.  Cool completely

8.  Freeze in single layers on baking sheets, then transfer to hotel pans with parchment between layers

Sweet and Sour Sauce - (wedding 40 x recipe)

(1-2 days before)

1 cup ketchup

¾ cup packed brown sugar

3 Tbsp white vinegar

1 tsp dry mustard
1 tsp Worcestershire sauce

¼ cup water

1.  Whisk all ingredients together

2.  Bring just to a simmer until sugar dissolves

3.  Cool and refrigerate

Serving Day

1.  Combine frozen meatballs with the sauce in hotel pans

2.  Pour the chilled sauce evenly over them

3.  Cover tightly

4.  Use Heat Through with target core temp at 165F

*When you make sauce ahead of time, taste after reheating. Cold storage can slightly mute the sweetness and acidity, so if needed, a tablespoon or two of ketchup or a splash of vinegar per large batch will brighten it back up.

Quantities for 425 people

S&S Grocery List

Meatballs

-   66 lbs lean ground beef

-   22 lbs ground pork

-   22 med onions

-   22 med green peppers

-   44 large eggs

-   2 ¾ cups grated fresh ginger

-   1 cup kosher salt

-   ½ cup black pepper

Sauce

-   10 L ketchup

-   30 cups packed brown sugar

-   7.5 cups white vinegar

-   I cup dry mustard

-   1 cup Worcestershire sauce (French’s)', 'Sweet and Sour Meatballs.docx', false),
('sweet-sour-sausage', 'Sweet & Sour Sausage', 'Protein', '4 packs (or 8 links per pan) = 13 pans of sausage with sauce', null, '{}'::jsonb, '[{"item": "or 1lb minced onion", "qty": 2.5, "raw": "2 ½ cups or 1lb minced onion", "unit": "cup"}, {"item": "or 2-3 stalks chopped celery", "qty": 2, "raw": "2 cups or 2-3 stalks chopped celery", "unit": "cup"}, {"item": "butter", "qty": 0.3333333333333333, "raw": "⅓ cup butter", "unit": "cup"}, {"item": "(1.5 L) water", "qty": 6, "raw": "6 cups (1.5 L) water", "unit": "cup"}, {"item": "(1.5 L) ketchup", "qty": 6, "raw": "6 cups (1.5 L) ketchup", "unit": "cup"}, {"item": "sugar", "qty": 4, "raw": "4 cups sugar", "unit": "cup"}, {"item": "prepared mustard", "qty": 6, "raw": "6 tsp prepared mustard", "unit": "tsp"}, {"item": "Worcestershire sauce", "qty": 6, "raw": "6 tsp Worcestershire sauce", "unit": "tsp"}, {"item": "tobasco sauce", "qty": 0.25, "raw": "¼ tsp tobasco sauce", "unit": "tsp"}, {"item": "cornstarch (opt)", "qty": 5, "raw": "5 Tbsp cornstarch (opt)", "unit": "tbsp"}]'::jsonb, '', 'Sweet & Sour Sausage

Wedding Quantity: 52 double packs (44 Reg/ 8 GF)

4 packs (or 8 links per pan) = 13 pans of sausage with sauce

Prep 3-4 days before event:

-   Peel sausage while still frozen

-   Cut into 1.5” pieces, spread on cookie sheets to thaw *until able to insert the probe (never insert probe into frozen meat!)

PATHWAY

Select: “Sausage with temperature probe” (8:45 m/s)

-   Insert probe into multiple pieces of sausage to cover the full length of the probe

-   Do not cover

-   Once cooked, transfer into serving pans (11 pans of Reg / 2 pans GF)

-   Top with sautéd celery and onions

SAUCE: (makes enough for one pan plus extra)

2 ½ cups or 1lb minced onion

2 cups or 2-3 stalks chopped celery

⅓ cup butter

6 cups (1.5 L) water

6 cups (1.5 L) ketchup

4 cups sugar

6 tsp prepared mustard

6 tsp Worcestershire sauce

¼ tsp tobasco sauce

5 Tbsp cornstarch (opt)

-   Ivario: sauté onion and celery in butter

-   Whisk ingredients together and pour over each pan of sausage (not too full)

-   Cool, cover and refrigerate

REHEAT DAY

PATHWAY

Select: “Heat Through” (plan for at least 2 hours)

Select “Normal” (not Gentle)

-   Fill oven trolley with serving pans (the day before if possible)

-   Insert probe into multiple pieces of sausage (Covered pans)', 'Sweet & Sour Sausage.docx', false),
('taco-burrito-beef', 'Taco/Burrito Beef', 'Protein', '', null, '{}'::jsonb, '[{"item": "cumin", "qty": 1.5, "raw": "1½ tsp cumin", "unit": "tsp"}, {"item": "paprika", "qty": 1, "raw": "1 tsp paprika", "unit": "tsp"}, {"item": "sugar", "qty": 1, "raw": "1 tsp sugar", "unit": "tsp"}, {"item": "seasoning salt", "qty": 0.5, "raw": "½ tsp seasoning salt", "unit": "tsp"}, {"item": "black pepper", "qty": 0.5, "raw": "½ tsp black pepper", "unit": "tsp"}, {"item": "garlic powder (omit for garlic-free)", "qty": 0.5, "raw": "½ tsp garlic powder (omit for garlic-free)", "unit": "tsp"}, {"item": "ground coriander", "qty": 0.5, "raw": "½ tsp ground coriander", "unit": "tsp"}, {"item": "onion powder", "qty": 0.25, "raw": "¼ tsp onion powder", "unit": "tsp"}, {"item": "Spiced Beef", "qty": null, "raw": "Spiced Beef", "unit": null}, {"item": "lean ground beef", "qty": 1.25, "raw": "1¼ lb lean ground beef", "unit": "lb"}, {"item": "diced onions", "qty": 0.5, "raw": "½ cup diced onions", "unit": "cup"}, {"item": "minced garlic (omit for garlic-free)", "qty": 1, "raw": "1 tsp minced garlic (omit for garlic-free)", "unit": "tsp"}, {"item": "ketchup", "qty": 0.25, "raw": "¼ cup ketchup", "unit": "cup"}, {"item": "water", "qty": 0.25, "raw": "¼ cup water", "unit": "cup"}, {"item": "*Taco seasoning", "qty": 2, "raw": "2 Tbsp *Taco seasoning", "unit": "tbsp"}]'::jsonb, '', 'Taco/Burrito Beef

Original Recipe

*Taco Seasoning

4 tsp chili powder (*for garlic-free: replace with 4 tsp paprika + ~¼ tsp cayenne pepper)

1½ tsp cumin

1 tsp paprika

1 tsp sugar

½ tsp seasoning salt

½ tsp black pepper

½ tsp garlic powder (omit for garlic-free)

½ tsp ground coriander

¼ tsp onion powder

Spiced Beef

1¼ lb lean ground beef

½ cup diced onions

1 tsp minced garlic (omit for garlic-free)

¼ cup ketchup

¼ cup water

2 Tbsp *Taco seasoning

8x recipe per 10lb tube ground beef

*Taco Seasoning Mix

16 Tbsp chili powder
(*for garlic-free: replace with 4 tsp paprika + ~¼ tsp cayenne pepper)

3 Tbsp cumin

8 tsp paprika

2 Tbsp + 2 tsp sugar

4 tsp seasoning salt

4 tsp black pepper

4 tsp garlic powder (omit for garlic-free)

4 tsp ground coriander

2 tsp onion powder

Spiced Beef - 10lb tube

10 lb ground beef

4 cups onions diced

2 Tbsp + 2 tsp garlic minced

2 cups ketchup

2 cups water

1 cup taco seasoning mix

Method:

-   spray steam pans with holes with Pam Spray

-   Add 10lbs beef to one pan

-   Break up the beef with your hands

-   Add diced onion and minced garlic, mix by hand

-   Insert steam pan into deep hotel pan

-   Pathway: Steam on 265 high heat for 20 min: break up meat with mincer: return to oven for another 20 min

-   Transfer to serving pans: add seasonings, ketchup and water, and break up further and mix all together

-   Serving pans can then be topped up to each hold 15 lbs (or 1½ pans)

Reheat:

Pathway: Heat through with probe; about 1 hour', 'Taco Beef.docx', false),
('the-ultimate-lasagna', 'The Ultimate Lasagna', 'Starch', 'Recipe for 1 Hotel serving pan size:', null, '{}'::jsonb, '[{"item": "ricotta cheese", "qty": 1, "raw": "1 kg ricotta cheese", "unit": "kg"}, {"item": "(200g) grated parmesan cheese", "qty": 2, "raw": "2 cups (200g) grated parmesan cheese", "unit": "cup"}, {"item": "eggs", "qty": 2, "raw": "2 eggs", "unit": null}, {"item": "dried basil", "qty": 5, "raw": "5 Tbsp dried basil", "unit": "tbsp"}, {"item": "minced garlic", "qty": 1, "raw": "1 tsp minced garlic", "unit": "tsp"}, {"item": "salt", "qty": 0.5, "raw": "½ tsp salt", "unit": "tsp"}, {"item": "pepper", "qty": 0.5, "raw": "½ tsp pepper", "unit": "tsp"}, {"item": "mozzarella cheese shredded (a separate layer)", "qty": 1.5, "raw": "1.5kg mozzarella cheese shredded (a separate layer)", "unit": "kg"}]'::jsonb, '', 'The Ultimate Lasagna

Church Quantity (600 people): (we made 38 reg & 2 GF; we had leftover 15 regular & 1 GF, served with wings and caesar salad)

Next time make: 1 GF + 26 Regular

Recipe for 1 Hotel serving pan size:

1 ¼ boxes lasagna noodles

Cheese Mixture:

1 kg ricotta cheese

2 cups (200g) grated parmesan cheese

2 eggs

5 Tbsp dried basil

1 tsp minced garlic

½ tsp salt

½ tsp pepper

1.5kg mozzarella cheese shredded (a separate layer)

Tomato Meat Sauce:

¼ cup olive oil

4 cups onions, diced (about 2 onions)

1 cup celery, diced (*1 Costco pack of celery = 20 cups chopped)

1 cup carrots, diced (buy frozen)

4 tsp minced garlic

4 cans (156ml each = 624ml) tomato paste

3 lbs lean gr beef

4 cans (796ml each = 3.184 L) diced tomatoes

2 cups red wine (merlot)

4 bay leaves

4 tsp dried oregano

2 tsp salt (taste, possibly increase)

1½ tsp pepper

Tomato Meat Sauce

- dice onions, slice celery ( buy carrots already chopped, frozen aisle)

- In Ivario, heat oil over med heat: cook onions, celery, carrot and garlic, stirring occasionally, until softened, about 5 min.

-   Stir in tomato paste.

-   - Add beef: cook, breaking up evenly, until no longer pink

-   Add tomatoes, wine, bay leaeves, oregano, salt and pepper: reduce heat and simmer stirring occasionally, until slightly thickened, about 40 min.

-   Discard bay leaves.

-   Meanwhile, if needed, cook noodles for 2 minutes less than package directions for al dente. Drain: lay noodles, without touching in single layer on tea towel.

-   Stir together ricotta cheese, Parmesan cheese, egg, basil, garlic, salt and pepper.

-   Shred mozzarella cheese

-   Layer lasagna:

-   Leave off top layer of cheese and bake:

-   Cooking Pathway: “Lasagna” setting: covered, with Probe (about 38-40 min)

-   Cool completely and freeze.

-   Thawing: take out of freezer on racks for a day (about 8 hours?) and then into the fridge overnight

-   Add shredded cheese

Reheat Pathway: “Heat Through” with probe, not covered for the first 30-45 mins, then loosely lay tin lids over pans. Plan for 2.5-3 hours.

-   Let lasagnas rest in warmers for 20-30 mins or more.

-   Allow 45 min for 5 ladies to cut lasagnas into 24-28 pieces', 'The Ulitmate Lasagna.docx', false),
('top-sirloin-roast', 'Top Sirloin Roast', 'Protein', '', null, '{}'::jsonb, '[{"item": "or 1.36 kg sirloin top roast, trimmed", "qty": 3, "raw": "3 lb or 1.36 kg sirloin top roast, trimmed", "unit": "lb"}, {"item": "olive oil", "qty": 1, "raw": "1 Tbsp olive oil", "unit": "tbsp"}, {"item": "salt", "qty": 2, "raw": "2 tsp salt", "unit": "tsp"}, {"item": "pepper", "qty": 1, "raw": "1 tsp pepper", "unit": "tsp"}, {"item": "parsley", "qty": 2, "raw": "2 Tbsp parsley", "unit": "tbsp"}, {"item": "dried thyme", "qty": 1, "raw": "1 Tbsp dried thyme", "unit": "tbsp"}, {"item": "dried rosemary (lightly minced through a food processor)", "qty": 1, "raw": "1 Tbsp dried rosemary (lightly minced through a food processor)", "unit": "tbsp"}, {"item": "minced garlic (or 5 cloves minced)", "qty": 1.5, "raw": "1½ tsp minced garlic (or 5 cloves minced)", "unit": "tsp"}]'::jsonb, '', 'Top Sirloin Roast

Serving Size: 4-5 oz of trimmed and cooked/person.

(Wedding quantity 425 people = 78-80 kg raw, untrimmed)

(NYE quantity with carving stations: 150-180 lbs trimmed roasts, ~12lb each from Butcher Block 275lb = ~23 Roasts ordered)

Single recipe:

3 lb or 1.36 kg sirloin top roast, trimmed

1 Tbsp olive oil

2 tsp salt

1 tsp pepper

2 Tbsp parsley

1 Tbsp dried thyme

1 Tbsp dried rosemary (lightly minced through a food processor)

1½ tsp minced garlic (or 5 cloves minced)

Directions:

Steps 1-4 can be done 24-48hr ahead of time)

1.  Trim the meat if it hasn’t been.

2.  Mix the rub ingredients together.

3.  Rub it all over the beef.

4.  Stack the sirloin cap, fat side up, on top of the larger centre cut piece, tie snug, but not tight to restrict the meat at 1-2” spacing.

(Oven fits using every 3rd shelf, holds total of 14 pans)

(Let meat rest at room temp for 30 min prior to cooking)

5. Pathway: Low Temp Roasting: Set Probe to 135. Insert probe from the top into the thickest part. (Allow 7.5-8 hrs) (cold ~12lb roast took 7½ hrs)

6. Let roast stay in “Holding” until ready to Rest. “Rest” covered at least 15-20 minutes before carving.

If using the meat slicer, set it at #6 or larger, and it takes 10-15 min to slice a large roast. Carve against the grain.

To reheat: Transfer leftovers to a baking dish and heat, uncovered at 250º F, until the roast has fully warmed through and the internal temperature of the thickest part reaches 120º F.', 'Top Sirloin Roast.docx', false)
on conflict (id) do update set name = excluded.name, category = excluded.category, batch_label = excluded.batch_label, servings_per_batch = excluded.servings_per_batch, tags = excluded.tags, ingredients = excluded.ingredients, notes = excluded.notes, source_text = excluded.source_text, source_file = excluded.source_file, reviewed = excluded.reviewed;

insert into public.reference_notes (id, title, body, sort) values
('ref-1', 'Church quantity reference (Sis. Denise)', 'Church function: 600 · Wedding: 450 · Choir: 3 pans
Sunday "Lunch": increase quantities by 10%

PROTEIN
• Chicken thighs: 2 per person
• Salmon: 6 oz per person
• Wings: 5 per person
• Ribs: 9 pans
• Chili: 100 lb ground beef = 12 roasters
• Tacos: 120 lb ground beef and 180 lb chicken

SOUPS
• About 12 roasters (add extra if more than two varieties)

STARCH
• Baby potatoes: 100 lb
• Scalloped potatoes: 12 pans
• Rice: 7 pans with 7 cups rice (one of those is GF)
• Pasta: 3 pans per buffet table (36 bags of 900 g) = 9 pans total
• Buns: 360

KIDS TABLE
• Plan for 1 pan of each item
• Mac & cheese: 2 pans

SALADS
• Caesar: 2 cases romaine + 3 more packs (wedding: just 2 cases); makes 6 large bowls
• Olive Garden: approx 24 heads iceberg; makes 6 large bowls
• Greek or layer salads: 9 fluted bowls

HOT VEG
• Enough to fill 8–9 serving pans (picture 4 big pots)

FRIES
• 18 bags Cavendish for the whole church', 0),
('ref-2', 'Our quantities', '• Parmesan: Tre Stelle Grana Padano 1 kg can ≈ 8 cups; 1 kg solid block ≈ 8 cups
• Rice: Costco pink bag is 5 kg ≈ 24 cups raw
• Chicken broth cartons: 946 ml, 6 per box
• Chicken thighs: a Costco flat has ~20–24 bone-in thighs; 100 kg ≈ 650 average thighs
• Roaster: holds 14 L', 1)
on conflict (id) do update set title = excluded.title, body = excluded.body, sort = excluded.sort;

commit;
