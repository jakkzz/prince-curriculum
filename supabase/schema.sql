-- =============================================================
-- Project Prince — Progress tracker schema
-- =============================================================
-- Paste this into Supabase → SQL Editor → New Query → Run.
-- Idempotent: safe to run multiple times.
-- =============================================================

-- 1. Progress table — one row per (user, item)
create table if not exists public.progress (
    id              uuid primary key default gen_random_uuid(),
    user_id         uuid not null references auth.users(id) on delete cascade,
    item_id         text not null,                    -- e.g. "phase-1/lesson/01-hello-python"
    item_type       text not null check (item_type in ('lesson', 'quiz', 'project')),
    completed_at    timestamptz not null default now(),
    quiz_score      int,                              -- optional, only for quizzes (0-100)
    notes           text,                             -- optional, learner's notes
    constraint progress_user_item_unique unique (user_id, item_id)
);

create index if not exists idx_progress_user on public.progress(user_id);
create index if not exists idx_progress_user_completed on public.progress(user_id, completed_at desc);

-- 2. Row Level Security — users can only access their own rows
alter table public.progress enable row level security;

drop policy if exists "users select own progress"   on public.progress;
drop policy if exists "users insert own progress"   on public.progress;
drop policy if exists "users update own progress"   on public.progress;
drop policy if exists "users delete own progress"   on public.progress;

create policy "users select own progress"
    on public.progress for select
    using (auth.uid() = user_id);

create policy "users insert own progress"
    on public.progress for insert
    with check (auth.uid() = user_id);

create policy "users update own progress"
    on public.progress for update
    using (auth.uid() = user_id);

create policy "users delete own progress"
    on public.progress for delete
    using (auth.uid() = user_id);

-- 3. (Optional) Profiles table — learner-facing display data
-- Useful when you let the mentor view your progress, OR when multiple learners use one instance.
create table if not exists public.profiles (
    id              uuid primary key references auth.users(id) on delete cascade,
    username        text unique,
    full_name       text,
    avatar_url      text,
    started_at      timestamptz default now()
);

alter table public.profiles enable row level security;

drop policy if exists "profiles are readable by self" on public.profiles;
drop policy if exists "profiles are writable by self" on public.profiles;

create policy "profiles are readable by self"
    on public.profiles for select
    using (auth.uid() = id);

create policy "profiles are writable by self"
    on public.profiles for all
    using (auth.uid() = id);

-- 4. Auto-create profile row on sign-up via a trigger
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
    insert into public.profiles (id, username, full_name, avatar_url)
    values (
        new.id,
        coalesce(new.raw_user_meta_data->>'user_name', split_part(new.email, '@', 1)),
        coalesce(new.raw_user_meta_data->>'full_name', new.raw_user_meta_data->>'name'),
        new.raw_user_meta_data->>'avatar_url'
    )
    on conflict (id) do nothing;
    return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
    after insert on auth.users
    for each row execute procedure public.handle_new_user();

-- =============================================================
-- Done. Check by running:
--   select * from public.progress;
-- (Empty until you log a completion from the app.)
-- =============================================================
