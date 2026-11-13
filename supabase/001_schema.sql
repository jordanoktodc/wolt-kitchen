-- WOLT Kitchen — schema v1 (project nzkkilmmmqcofjndfzog)
-- Roles: organizer = full edit; volunteer = read everything, tick prep tasks,
-- tick the safety checklist, log temperatures.

-- ---------- people ----------
create table public.profiles (
  id          uuid primary key references auth.users(id) on delete cascade,
  full_name   text not null default '',
  email       text,
  role        text not null default 'volunteer' check (role in ('organizer','volunteer')),
  created_at  timestamptz not null default now()
);

create or replace function public.is_organizer() returns boolean
language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.profiles where id = auth.uid() and role = 'organizer');
$$;

create or replace function public.handle_new_user() returns trigger
language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, email, full_name)
  values (new.id, new.email, coalesce(new.raw_user_meta_data->>'full_name', ''))
  on conflict (id) do nothing;
  return new;
end $$;
create trigger on_auth_user_created after insert on auth.users
  for each row execute function public.handle_new_user();

create or replace function public.touch_updated_at() returns trigger
language plpgsql as $$ begin new.updated_at = now(); return new; end $$;

-- ---------- recipes ----------
create table public.recipes (
  id                 text primary key,              -- slug, e.g. 'creamy-tuscan-chicken'
  name               text not null,
  category           text not null default 'Other',
  batch_label        text not null default '',
  servings_per_batch numeric,
  tags               jsonb not null default '{}',   -- {gf, df, garlicFree, containsNuts}
  ingredients        jsonb not null default '[]',   -- [{qty, qtyMax, unit, item, plus:{qty,unit}}]
  notes              text not null default '',
  source_text        text not null default '',      -- original doc text (method, oven pathway)
  source_file        text,
  reviewed           boolean not null default false,
  created_at         timestamptz not null default now(),
  updated_at         timestamptz not null default now()
);
create trigger recipes_touch before update on public.recipes for each row execute function public.touch_updated_at();

-- ---------- events ----------
create table public.events (
  id          text primary key default gen_random_uuid()::text,
  name        text not null,
  event_date  date,
  guests      integer not null default 0,
  notes       text not null default '',
  extras      jsonb not null default '[]',   -- extra grocery items [{id, text, store, done}]
  grocery_checked jsonb not null default '{}',
  grocery_stores  jsonb not null default '{}',
  imported    boolean not null default false,
  source_file text,
  plan_text   text,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);
create trigger events_touch before update on public.events for each row execute function public.touch_updated_at();

create table public.event_dishes (
  id           uuid primary key default gen_random_uuid(),
  event_id     text not null references public.events(id) on delete cascade,
  buffet       text not null default 'regular' check (buffet in ('regular','allergy')),
  name         text not null,
  recipe_id    text references public.recipes(id) on delete set null,
  batches      numeric not null default 0,
  tags         jsonb not null default '{}',
  label_copies integer not null default 1,
  sort         integer not null default 0
);
create index on public.event_dishes (event_id);

-- ---------- prep days ----------
create table public.prep_days (
  id        uuid primary key default gen_random_uuid(),
  event_id  text not null references public.events(id) on delete cascade,
  day_date  date,
  title     text not null default '',
  crew      text not null default '',
  sort      integer not null default 0
);
create index on public.prep_days (event_id);

create table public.prep_tasks (
  id          uuid primary key default gen_random_uuid(),
  prep_day_id uuid not null references public.prep_days(id) on delete cascade,
  event_id    text not null references public.events(id) on delete cascade,
  text        text not null,
  done        boolean not null default false,
  done_by     uuid references public.profiles(id) on delete set null,
  done_at     timestamptz,
  sort        integer not null default 0
);
create index on public.prep_tasks (prep_day_id);

-- volunteers may only change done/done_by/done_at
create or replace function public.guard_prep_task() returns trigger
language plpgsql security definer set search_path = public as $$
begin
  if not public.is_organizer() then
    if new.text is distinct from old.text or new.prep_day_id is distinct from old.prep_day_id
       or new.event_id is distinct from old.event_id or new.sort is distinct from old.sort then
      raise exception 'Only organizers can change task details';
    end if;
  end if;
  if new.done and not coalesce(old.done, false) then
    new.done_by := auth.uid(); new.done_at := now();
  elsif not new.done then
    new.done_by := null; new.done_at := null;
  end if;
  return new;
end $$;
create trigger prep_tasks_guard before update on public.prep_tasks
  for each row execute function public.guard_prep_task();

-- ---------- oven schedule ----------
create table public.oven_schedules (
  id           uuid primary key default gen_random_uuid(),
  event_id     text not null references public.events(id) on delete cascade,
  title        text not null default 'Event day',
  service_time time,
  sort         integer not null default 0
);
create index on public.oven_schedules (event_id);

create table public.oven_slots (
  id          uuid primary key default gen_random_uuid(),
  schedule_id uuid not null references public.oven_schedules(id) on delete cascade,
  lane        text not null check (lane in ('ovenA','ovenB','ivario','prep')),
  start_time  time not null,
  minutes     integer not null default 60 check (minutes > 0),
  label       text not null default '',
  dish_id     uuid references public.event_dishes(id) on delete set null
);
create index on public.oven_slots (schedule_id);

-- ---------- safety ----------
create table public.event_checks (
  event_id  text not null references public.events(id) on delete cascade,
  item      text not null,
  done      boolean not null default false,
  done_by   uuid references public.profiles(id) on delete set null,
  done_at   timestamptz,
  primary key (event_id, item)
);

create table public.temp_logs (
  id         uuid primary key default gen_random_uuid(),
  event_id   text not null references public.events(id) on delete cascade,
  logged_at  time not null,
  item       text not null,
  stage      text not null check (stage in ('cook-poultry','cook-ground','cook-roast','reheat','hot-hold','cold-hold','cool-2','cool-6','freezer')),
  temp_f     numeric not null,
  initials   text not null default '',
  action     text not null default '',
  created_by uuid default auth.uid() references public.profiles(id) on delete set null,
  created_at timestamptz not null default now()
);
create index on public.temp_logs (event_id);

-- ---------- reference ----------
create table public.reference_notes (
  id    text primary key,
  title text not null,
  body  text not null default '',
  sort  integer not null default 0
);

-- ---------- row level security ----------
alter table public.profiles        enable row level security;
alter table public.recipes         enable row level security;
alter table public.events          enable row level security;
alter table public.event_dishes    enable row level security;
alter table public.prep_days       enable row level security;
alter table public.prep_tasks      enable row level security;
alter table public.oven_schedules  enable row level security;
alter table public.oven_slots      enable row level security;
alter table public.event_checks    enable row level security;
alter table public.temp_logs       enable row level security;
alter table public.reference_notes enable row level security;

-- everyone signed in reads everything
do $$ declare t text; begin
  foreach t in array array['profiles','recipes','events','event_dishes','prep_days','prep_tasks',
                           'oven_schedules','oven_slots','event_checks','temp_logs','reference_notes'] loop
    execute format('create policy "signed in read" on public.%I for select to authenticated using (true)', t);
  end loop;
end $$;

-- organizers write everything
do $$ declare t text; begin
  foreach t in array array['recipes','events','event_dishes','prep_days','prep_tasks',
                           'oven_schedules','oven_slots','event_checks','temp_logs','reference_notes'] loop
    execute format('create policy "organizers write" on public.%I for all to authenticated using (public.is_organizer()) with check (public.is_organizer())', t);
  end loop;
end $$;

-- organizers manage people; everyone can fix their own name
create policy "organizers manage profiles" on public.profiles for update to authenticated
  using (public.is_organizer()) with check (public.is_organizer());
create policy "own name" on public.profiles for update to authenticated
  using (id = auth.uid()) with check (id = auth.uid() and role = (select p.role from public.profiles p where p.id = auth.uid()));

-- volunteers: tick tasks, tick checklist, log temperatures (and fix their own entries)
create policy "volunteers tick tasks" on public.prep_tasks for update to authenticated using (true) with check (true);
create policy "volunteers tick checks" on public.event_checks for insert to authenticated with check (done_by is null or done_by = auth.uid());
create policy "volunteers update checks" on public.event_checks for update to authenticated using (true) with check (true);
create policy "volunteers log temps" on public.temp_logs for insert to authenticated with check (created_by = auth.uid());
create policy "volunteers fix own temps" on public.temp_logs for update to authenticated using (created_by = auth.uid()) with check (created_by = auth.uid());
