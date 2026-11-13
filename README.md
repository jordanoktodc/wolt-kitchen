# WOLT Kitchen

Recipes, event menus, grocery lists, prep days, oven schedules and safety logs for the WOLT kitchen.
Vite + React + Supabase, deployed on Vercel. Built from the claude.ai prototype.

## Stack

| Piece | Where |
|---|---|
| Code | `jordanoktodc/wolt-kitchen` (GitHub) |
| Hosting | Vercel (SPA rewrite in `vercel.json`) |
| Database + auth | Supabase project `nzkkilmmmqcofjndfzog` (in Jordan's organization, separate from Okto) |

## Environment variables (Vercel → Project → Settings → Environment Variables)

```
VITE_SUPABASE_URL=https://nzkkilmmmqcofjndfzog.supabase.co
VITE_SUPABASE_ANON_KEY=<publishable key from Supabase → Project Settings → API>
```

## Database

1. `supabase/001_schema.sql` — tables, roles, row level security. Run once in the SQL editor.
2. `supabase/seed/01_recipes.sql`, `02_events.sql`, `03_events.sql` — the data from the prototype
   (72 recipes, 31 events with dishes, prep days and oven schedules). Run in order. They are safe to
   re-run: rows are matched by id and updated.
3. `supabase/make_seed.py` rebuilds the seed files from a prototype export, if ever needed.

Roles (`profiles.role`):

- **organizer**: edits everything, manages people on the People page.
- **volunteer** (default for anyone invited): reads everything, ticks prep tasks and the safety
  checklist, logs temperatures. A database trigger stops volunteers changing task text.

People join by invitation only (Supabase → Authentication → Users → Invite user). The invite link
lands on a "set up your account" screen where they choose a name and password.

## Supabase Auth settings

- Sign In / Providers: **Allow new users to sign up** = off.
- URL Configuration: **Site URL** = the live Vercel address; add it (and `http://localhost:5173`) to
  **Redirect URLs** so invite and password-reset links come back to the app.

## Local development

```
npm install
cp .env.example .env.local   # then fill in the key
npm run dev
```

## Rules carried over from the Okto app

- Dates and times are America/Edmonton, never UTC.
- Event edits save automatically (debounced) and only changed rows are written.
- Temperatures are °F to match the kitchen's recipes and ovens.
