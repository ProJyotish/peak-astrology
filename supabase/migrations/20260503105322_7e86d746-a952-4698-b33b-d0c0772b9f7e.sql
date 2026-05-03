create table public.waitlist (
  id uuid primary key default gen_random_uuid(),
  email text not null unique,
  source text not null default 'landing',
  created_at timestamptz not null default now()
);
alter table public.waitlist enable row level security;
create policy "anyone can join waitlist"
  on public.waitlist for insert
  to anon, authenticated
  with check (true);
