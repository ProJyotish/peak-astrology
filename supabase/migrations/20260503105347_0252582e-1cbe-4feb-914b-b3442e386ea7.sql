drop policy "anyone can join waitlist" on public.waitlist;
create policy "anyone can join waitlist with valid email"
  on public.waitlist for insert
  to anon, authenticated
  with check (email ~* '^[^@\s]+@[^@\s]+\.[^@\s]+$' and length(email) <= 255);
