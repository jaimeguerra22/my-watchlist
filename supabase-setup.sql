-- Run this once in Supabase Dashboard > SQL Editor.
create table if not exists public.warwatch_library (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{"items":[],"activity":[],"folders":[],"history":[]}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.warwatch_library enable row level security;

drop policy if exists "Users can read their own WARWATCH library" on public.warwatch_library;
create policy "Users can read their own WARWATCH library"
  on public.warwatch_library for select
  to authenticated
  using (auth.uid() = user_id);

drop policy if exists "Users can insert their own WARWATCH library" on public.warwatch_library;
create policy "Users can insert their own WARWATCH library"
  on public.warwatch_library for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "Users can update their own WARWATCH library" on public.warwatch_library;
create policy "Users can update their own WARWATCH library"
  on public.warwatch_library for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- No public/anonymous access. Every account can only access its own row.
