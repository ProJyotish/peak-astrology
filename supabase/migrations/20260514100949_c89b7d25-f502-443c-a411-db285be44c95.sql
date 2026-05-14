ALTER TABLE public.waitlist ADD COLUMN IF NOT EXISTS phone TEXT;
ALTER TABLE public.waitlist ALTER COLUMN email DROP NOT NULL;

DROP POLICY IF EXISTS "anyone can join waitlist with valid email" ON public.waitlist;

CREATE POLICY "anyone can join waitlist with valid phone"
ON public.waitlist
FOR INSERT
TO anon, authenticated
WITH CHECK (
  phone IS NOT NULL
  AND length(phone) BETWEEN 7 AND 20
  AND phone ~ '^\+?[0-9 ()-]{7,20}$'
);