-- Charmed Hold'em analytics: anonymous play events for the analytics page.
-- Paste this whole file into Supabase: SQL Editor > New query > Run. Safe to run again.

create table if not exists public.events (
  id         bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  -- A random id stored in the player's browser, so visitors can be counted. No names or personal details.
  sid        text not null check (char_length(sid) between 8 and 40),
  kind       text not null check (kind in (
    'visit', 'run_start', 'table_clear', 'run_end', 'charm_buy', 'level_buy', 'case_open',
    'tutorial_start', 'tutorial_end', 'lang_change', 'augie_start', 'augie_end',
    'mp_open', 'mp_join', 'mp_start'
  )),
  mode       text check (mode is null or mode in ('table', 'duel')),
  data       jsonb not null default '{}'::jsonb check (jsonb_typeof(data) = 'object' and pg_column_size(data) < 2000)
);

create index if not exists events_time on public.events (created_at);

-- Row level security: the game can add events and the analytics page can read them,
-- but nobody can edit or delete them through the website.
alter table public.events enable row level security;

drop policy if exists "Anyone can read events" on public.events;
create policy "Anyone can read events" on public.events
  for select to anon using (true);

drop policy if exists "Anyone can add events" on public.events;
create policy "Anyone can add events" on public.events
  for insert to anon with check (true);

-- The website may only fill in these columns: the time and id always come from the database.
revoke all on public.events from anon;
grant select on public.events to anon;
grant insert (sid, kind, mode, data) on public.events to anon;
