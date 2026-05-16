# Supabase setup — real progress tracking

One-time setup. ~10 minutes.

## 1. Create the Supabase project

1. Go to [supabase.com](https://supabase.com/) → **Sign up** (GitHub login is easiest).
2. **New project**:
   - Organization: your default (or create one)
   - Name: `prince-curriculum`
   - Database password: generate a strong one and save it somewhere (you'll rarely need it)
   - Region: closest to you (Singapore is good for Thailand)
   - Plan: Free
3. Wait ~1 minute for provisioning.

## 2. Run the schema

Once the project is ready:

1. Open **SQL Editor** in the left sidebar.
2. Click **New query**.
3. Paste the entire contents of [`schema.sql`](schema.sql).
4. Click **Run** (or `Cmd+Enter`).
5. Confirm: bottom panel says "Success. No rows returned."

You now have a `progress` table (lessons + quizzes tracked) AND a `profiles` table (per-user preferences like theme), both with Row Level Security on. Each user only sees their own data.

> **Updating from an older schema?** Just re-run [`schema.sql`](schema.sql). Every statement is idempotent (`if not exists`, `or replace`, `drop … if exists`). Safe to run as many times as you like; safe to deploy as schema evolves.

## 3. Set up GitHub OAuth (the sign-in method)

Why GitHub: the learner already has a GitHub account from Phase 0. One-click sign-in.

### a) Create a GitHub OAuth App

1. Go to [github.com/settings/developers](https://github.com/settings/developers) → **New OAuth App**.
2. Fill in:
   - **Application name:** Project Prince
   - **Homepage URL:** `https://jakkzz.github.io/prince-curriculum/` (or your custom domain)
   - **Authorization callback URL:** copy this from Supabase — see below
3. Don't submit yet — first get the callback URL.

### b) Get the callback URL from Supabase

1. In Supabase, go to **Authentication → Providers → GitHub**.
2. The page shows you a **Callback URL** like:
   ```
   https://abcdefghij.supabase.co/auth/v1/callback
   ```
3. Copy it.

### c) Finish the GitHub OAuth App

1. Back on the GitHub OAuth App form, paste the callback URL.
2. Click **Register application**.
3. On the resulting page, copy **Client ID** and click **Generate a new client secret** → copy that too.

### d) Plug them into Supabase

1. Back in Supabase **Authentication → Providers → GitHub**:
2. Toggle **Enable GitHub provider** on.
3. Paste **Client ID** and **Client Secret**.
4. **Save**.

## 4. Add the Supabase URL + anon key to the landing page

Both values are safe to commit publicly — the anon key is designed to be public, and the schema's RLS policies enforce security.

1. In Supabase, go to **Settings → API**.
2. Copy:
   - **Project URL** (e.g. `https://abcdefghij.supabase.co`)
   - **`anon` `public` key** (a long string starting with `eyJ...`)
3. Open `index.html` near the top of the `<script>` block, find this block:
   ```js
   const SUPABASE_CONFIG = {
     url:     'YOUR_SUPABASE_URL',
     anonKey: 'YOUR_SUPABASE_ANON_KEY',
   };
   ```
4. Paste your values in.
5. Commit + push. GitHub Pages re-deploys within a minute.

## 5. Set the redirect URL on Supabase

Critical step or auth redirects will fail.

1. In Supabase: **Authentication → URL Configuration**.
2. Set **Site URL** to your live page URL: `https://jakkzz.github.io/prince-curriculum/`.
3. Add to **Redirect URLs** (one per line):
   ```
   https://jakkzz.github.io/prince-curriculum/
   http://localhost:8000/
   ```
   The localhost line lets you test locally with `python3 -m http.server`.
4. Save.

## 6. Try it

1. Open `https://jakkzz.github.io/prince-curriculum/`.
2. Click **Sign in** (top right).
3. GitHub prompts you to authorize.
4. Redirected back, now signed in.
5. Check off a lesson — refresh the page — it stayed checked.

If something doesn't work, see [troubleshooting](#troubleshooting) below.

## What you get

- Multi-device: sign in on phone, laptop, library computer — same progress.
- Multi-user: if you add a friend, you each see your own progress only.
- Free forever for your scale: Supabase's free tier covers 50K monthly users and 500MB database. You'll use approximately 0.001% of that.
- Real database he'll read in Phase 3 — that's the same Postgres, the same RLS policies, the same Auth tables. Pedagogically beautiful.

## What it stores

Schema:

```
progress
├── id (uuid)
├── user_id (uuid) → auth.users.id
├── item_id (text) — e.g. "phase-1/lesson/01-hello-python"
├── item_type (text) — "lesson" | "quiz" | "project"
├── completed_at (timestamptz)
├── quiz_score (int, nullable)
└── notes (text, nullable)
```

One row per (user, item). The item ID is stable across the curriculum's lifetime.

## Troubleshooting

### "Sign in" button doesn't do anything
- Open browser devtools → Console. Look for errors mentioning `SUPABASE_CONFIG`. Have you pasted your real URL + anon key?

### Auth redirects to a Supabase error page
- Check **Authentication → URL Configuration** in Supabase. Site URL + Redirect URLs must match your live page URL exactly (including trailing `/`).

### "Invalid request — callback URL doesn't match"
- The Authorization Callback URL on the **GitHub** OAuth App must match the **Supabase** callback URL exactly (`https://abc.supabase.co/auth/v1/callback`). Re-check.

### Checkboxes don't save
- Open devtools → Network tab. Try checking a lesson. Look for a request to `supabase.co/rest/v1/progress` — what status code?
  - **401:** auth not set up correctly on RLS policies. Re-run [schema.sql](schema.sql).
  - **404:** the `progress` table doesn't exist. Re-run [schema.sql](schema.sql).
  - **CORS error:** add your domain to **Settings → API → CORS** in Supabase.

### Want to wipe your progress and start over
```sql
-- In Supabase SQL Editor:
delete from public.progress where user_id = (select auth.uid());
```

Or just delete the user from **Authentication → Users**.

## Cost monitoring

Free tier:
- 50,000 monthly active users
- 500MB database
- 2GB egress
- 1GB file storage
- 7-day project pause (if inactive)

For one (or a few) learners, you'll never approach these limits. Set a monthly billing alert anyway in **Settings → Billing**.
