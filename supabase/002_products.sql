-- WOLT Kitchen — products (what the kitchen buys) + which ingredient each one covers.
-- Run once in the SQL Editor. Item numbers and prices are left for the organizers to fill in.

create table public.products (
  id           uuid primary key default gen_random_uuid(),
  name         text not null,
  store        text not null default 'Costco',
  item_number  text not null default '',
  pack_qty     numeric not null check (pack_qty > 0),
  pack_unit    text not null default '',
  pack_label   text not null default '',
  equiv_qty    numeric,             -- the same pack in another unit, e.g. 5 kg rice ≈ 24 cup
  equiv_unit   text,
  price        numeric,
  notes        text not null default '',
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now()
);
create trigger products_touch before update on public.products for each row execute function public.touch_updated_at();

create table public.ingredient_products (
  item_key   text primary key,       -- the ingredient name as the grocery list shows it
  product_id uuid not null references public.products(id) on delete cascade
);

alter table public.products enable row level security;
alter table public.ingredient_products enable row level security;
create policy "signed in read" on public.products for select to authenticated using (true);
create policy "signed in read" on public.ingredient_products for select to authenticated using (true);
create policy "organizers write" on public.products for all to authenticated using (public.is_organizer()) with check (public.is_organizer());
create policy "organizers write" on public.ingredient_products for all to authenticated using (public.is_organizer()) with check (public.is_organizer());

-- Starter list, from pack sizes written in the kitchen's own recipes and plans
insert into public.products (id, name, store, pack_qty, pack_unit, pack_label, equiv_qty, equiv_unit, notes) values
('b62d93c6-fba0-56bc-a1a1-734145f615c7', 'Basmati rice (pink bag)', 'Costco', 5, 'kg', '5 kg pink bag', 24, 'cup', '~24 cups raw per bag'),
('5aa90e6e-b6b9-505f-8d9d-c09920e31d24', 'Chicken broth, case of 6', 'Costco', 5.676, 'L', '6 × 946 ml cartons', null, null, 'Add salt if using the unsalted one'),
('7a546a13-675f-50c9-969d-9570d61112a2', 'Bacon, Olymel 14/16', 'Costco', 5, 'kg', '5 kg box', null, null, '14/16 is thicker; ~2 lb per Caesar bowl'),
('ec064c6a-e325-52a3-86aa-cec8e191b791', 'Lean ground beef, tube', 'Costco', 10, 'lb', '10 lb tube', null, null, 'Case is 8 tubes'),
('d19cb21e-3bc2-5f79-af7e-da9110591abf', 'Chicken thighs, boneless (flat)', 'Costco', 2, 'kg', '~2 kg flat (20–24 pieces)', null, null, 'Case is 6 flats'),
('c1740f65-cfbe-5f64-ac66-02ed6b0ee8e2', 'Feta, crumbled', 'Costco', 900, 'g', '900 g tub', null, null, ''),
('c800d6d2-41a5-5c43-abb5-c1a4b7f64871', 'Kalamata olives', 'Costco', 3, 'L', '3 L jar', null, null, ''),
('ab25c8da-bf79-5047-b92e-eb1e1aebc277', 'Sour cream, Kirkland', 'Costco', 1, 'L', '1 L tub', null, null, ''),
('8a8930d5-1862-596e-a662-7f481fefc9e0', 'Parmesan, Grana Padano', 'Costco', 1, 'kg', '1 kg can or block', 8, 'cup', '~8 cups grated'),
('6e05180b-9b32-5d4a-a61e-ed45f896853c', 'Celery', 'Costco', 1, 'pkg', '1 pack', 20, 'cup', '~20 cups chopped per pack'),
('5d01c9a7-4d03-584c-9181-10b24947730e', 'Beets', 'Costco', 18, '', 'bag of ~18', null, null, ''),
('8947a287-e53c-5b9d-9d16-e1af932cc7d5', 'Grape tomatoes', 'Costco', 907, 'g', '907 g clamshell', null, null, ''),
('6612d8f5-fcb5-5915-8c27-9a2545425f57', 'Roma tomatoes, box', 'Costco', 25, 'lb', '25 lb box', null, null, ''),
('3ac7ab58-af3b-551f-ac97-79739be4fa50', 'Romaine hearts, case', 'Costco', 6, 'pkg', 'case of 6 packs', null, null, '2 cases for a wedding Caesar'),
('41a1ca98-6888-5c40-9ded-f0148269f886', 'Bella mushrooms', 'Costco', 24, 'oz', '24 oz pack', 8, 'cup', '~8 cups per pack'),
('0c327af5-d29a-5d8e-8dbd-ce40d1227832', 'Green beans, frozen', 'Costco', 7, 'kg', '7 kg box (2 × 3.5 kg)', null, null, 'Church quantity: 6 boxes'),
('824d1f8a-d1ff-535c-9146-dae9d4f3cf56', 'Renée’s Caesar dressing', 'Costco', 1.4, 'L', '1.4 L jug', null, null, ''),
('60afcc16-f4f9-5d37-830b-b99ae1aed2be', 'Kraft Greek dressing', 'Costco', 4, 'L', '4 L jug', null, null, 'Not the Select Mediterranean')
on conflict (id) do nothing;

insert into public.ingredient_products (item_key, product_id) values
('basmati rice', 'b62d93c6-fba0-56bc-a1a1-734145f615c7'),
('chicken broth', '5aa90e6e-b6b9-505f-8d9d-c09920e31d24'),
('kirkland organic chicken broth', '5aa90e6e-b6b9-505f-8d9d-c09920e31d24'),
('bacon', '7a546a13-675f-50c9-969d-9570d61112a2'),
('ground beef', 'ec064c6a-e325-52a3-86aa-cec8e191b791'),
('lean ground beef', 'ec064c6a-e325-52a3-86aa-cec8e191b791'),
('chicken thighs', 'd19cb21e-3bc2-5f79-af7e-da9110591abf'),
('feta', 'c1740f65-cfbe-5f64-ac66-02ed6b0ee8e2'),
('feta cheese', 'c1740f65-cfbe-5f64-ac66-02ed6b0ee8e2'),
('crumbled feta', 'c1740f65-cfbe-5f64-ac66-02ed6b0ee8e2'),
('crumbled feta cheese', 'c1740f65-cfbe-5f64-ac66-02ed6b0ee8e2'),
('kalamata olives', 'c800d6d2-41a5-5c43-abb5-c1a4b7f64871'),
('kalmata olives', 'c800d6d2-41a5-5c43-abb5-c1a4b7f64871'),
('sour cream', 'ab25c8da-bf79-5047-b92e-eb1e1aebc277'),
('full fat sour cream', 'ab25c8da-bf79-5047-b92e-eb1e1aebc277'),
('parm', '8a8930d5-1862-596e-a662-7f481fefc9e0'),
('parmesan', '8a8930d5-1862-596e-a662-7f481fefc9e0'),
('parmesan cheese', '8a8930d5-1862-596e-a662-7f481fefc9e0'),
('parmesean', '8a8930d5-1862-596e-a662-7f481fefc9e0'),
('celery', '6e05180b-9b32-5d4a-a61e-ed45f896853c'),
('beets', '5d01c9a7-4d03-584c-9181-10b24947730e'),
('grape tomatoes', '8947a287-e53c-5b9d-9d16-e1af932cc7d5'),
('romaine lettuce', '3ac7ab58-af3b-551f-ac97-79739be4fa50'),
('whole mushrooms', '41a1ca98-6888-5c40-9ded-f0148269f886')
on conflict (item_key) do nothing;
