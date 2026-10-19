-- Charmed Hold'em online leaderboard.
-- Paste this whole file into Supabase: SQL Editor > New query > Run.

create table if not exists public.scores (
  id         bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  name       text not null check (char_length(name) between 1 and 18),
  mode       text not null check (mode in ('table', 'duel')),
  tables     int  not null check (tables between 0 and 8),
  victory    boolean not null default false,
  chips      int  not null check (chips between 0 and 100000),
  charms     int  not null default 0 check (charms between 0 and 5),
  -- A run only counts as a victory if all 8 tables were cleared.
  check (not victory or tables = 8)
);

-- Fast "top 10 for a mode" lookups.
create index if not exists scores_rank on public.scores (mode, tables desc, chips desc, created_at);

-- Row level security: the website can read every score and add new ones,
-- but it can never edit or delete scores.
alter table public.scores enable row level security;

drop policy if exists "Anyone can read scores" on public.scores;
create policy "Anyone can read scores" on public.scores
  for select to anon using (true);

drop policy if exists "Anyone can add a score" on public.scores;
create policy "Anyone can add a score" on public.scores
  for insert to anon with check (true);

grant select, insert on public.scores to anon;
