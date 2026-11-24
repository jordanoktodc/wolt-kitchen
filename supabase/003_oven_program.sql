-- WOLT Kitchen — oven program per recipe.
-- Adds two recipe fields and fills them from the oven settings already written in each recipe.
-- Only fills recipes that don't have a program yet, so it is safe to run again.

alter table public.recipes add column if not exists oven_program text not null default '';
alter table public.recipes add column if not exists oven_minutes integer check (oven_minutes is null or oven_minutes > 0);

update public.recipes r set oven_program = v.program, oven_minutes = coalesce(r.oven_minutes, v.minutes)
from (values
  ('alfredo-pasta', 'iVario, both pans', null::integer),
  ('applewood-smoked-ham', 'Manual 250°F, 80% humidity, fan low, lid on (reheat)', null::integer),
  ('baby-roasted-potatoes', 'Manual combi 425°F, 1 hr, then 20 min uncovered', 80::integer),
  ('baked-chicken-and-vegetables', 'Manual combi 350°F', 120::integer),
  ('baked-potato', 'Baked potato preset with probe (or combi 10–20% at 375°F)', 60::integer),
  ('balsamic-fig-chicken', 'Poultry › Roast, probe 170°F, browning: 2nd setting', 26::integer),
  ('bbq-baby-back-ribs', 'Low Temp Roasting with probe (or Manual bake 70%, 275°F, 3 hr); finish Pan Fry 5 min', 420::integer),
  ('bbq-grilled-chicken', 'Grill Chicken, with probe', 8::integer),
  ('bbq-shredded-chicken', 'Combi steam 200°F, 70% humidity, probe 165°F', 45::integer),
  ('beet-feta-salad', 'Combi 356°F, 25% humidity, fan medium (roast beets in foil)', 75::integer),
  ('blackened-salmon', 'Pan Fry', 8::integer),
  ('brown-sugar-glazed-carrots', 'Vegetables › Roasting (or 170°F 40% 10 min, then 210°F 0% 10–15 min)', 25::integer),
  ('cajun-chicken', 'Chicken › Pan Fry, probe, Dark #3', 12::integer),
  ('chicken-with-garlic-parmesan-cream-sauce', 'Chicken with probe (thin side toward thick); sauce in iVario at 250°F', null::integer),
  ('chipotle-chili', 'Steam 265°F high, 20 min (break up meat), then Heat Through with probe', 60::integer),
  ('cream-gravy', 'iVario › Reheat', null::integer),
  ('creamy-mashed-potatoes', 'Potatoes › Steam › Soft, with probe; reheat: Heat Through, gentle, probe', 45::integer),
  ('creamy-sweet-potatoes-with-pumpkin-seeds', 'Vegetables › Side dishes › Steam, no probe, 212°F', 30::integer),
  ('creamy-tuscan-chicken', 'Chicken › Pan Fry, probe 165°F; reheat: Container reheat, probe 165°F', 90::integer),
  ('earl-s-creamy-potatoes', 'Corn: Vegetables › Grill', null::integer),
  ('fajita-chicken', 'Chicken › Pan Fry (or combi steam 200°F 70%, probe 165°F); reheat with probe to 160°F', 45::integer),
  ('greek-chicken-marinade', 'Chicken › Grill, with probe', 8::integer),
  ('greek-style-roasted-cauliflower', 'Grill', 10::integer),
  ('grilled-corn', 'Vegetables › Grill', 8::integer),
  ('grilled-green-beans', 'Vegetables › Grill › Roasted', 8::integer),
  ('herbed-lemon-rice', 'Basmati Rice 1:1.5', 20::integer),
  ('herbed-rice', 'Dry heat 355°F, fan 2, covered', 65::integer),
  ('herbes-de-provence-chicken', 'Grill, with probe', null::integer),
  ('honey-roasted-brussels-sprouts-with-greek-drizzle', 'Manual roast 425°F, 15–20% humidity', 6::integer),
  ('lemon-herb-rice', '266°F, 100% humidity, fan low', 75::integer),
  ('marry-me-chicken', 'Heat Through, 20–30% humidity, covered', null::integer),
  ('mediterranean-chicken-thighs', 'Manual 350°F 2 hr covered, then uncovered at 400°F 10 min', 130::integer),
  ('mediterranean-lamb-and-pork-meatballs-with-lemon-herb-sauce', 'Meat › Pan Fry, medium browning, small, to 160°F', null::integer),
  ('mustard-glazed-meatballs', 'Manual combi 338°F, 30% humidity, fan medium, probe 165°F; reheat: combi 320°F, 40–50%, probe 165°F', 20::integer),
  ('oven-roasted-veg-medley', 'Vegetables › Roasted (cauliflower / peppers setting)', 9::integer),
  ('potato-au-gratin', 'Sauce in iVario (both sides)', null::integer),
  ('quinoa-tabbouleh', 'Steam 212°F, 100% humidity, covered tightly', 30::integer),
  ('sarah-s-sauerkraut-rice', 'Basmati Rice 1:1.5 (bacon: Bacon Pan Fry 8 min)', 20::integer),
  ('seasoned-potato-wedges', '400°F, 0% humidity, fan high', 60::integer),
  ('sloppy-joes', 'Steam high, ground beef setting, 20 min (break up meat)', 20::integer),
  ('smoky-chicken-dry-rub', 'Pan Fry', null::integer),
  ('street-corn', 'Vegetables › Grill', 8::integer),
  ('sweet-sour-sausage', 'Sausage with temperature probe', 9::integer),
  ('taco-burrito-beef', 'Steam 265°F high, 20 min (break up meat), then Heat Through with probe', 60::integer),
  ('the-ultimate-lasagna', 'Lasagna setting, covered, with probe; reheat: Heat Through with probe', 40::integer),
  ('top-sirloin-roast', 'Low Temp Roasting, probe 135°F', null::integer)
) as v(id, program, minutes)
where r.id = v.id and r.oven_program = '';
