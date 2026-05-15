# Phase 3 Week 2 Quiz — SQLAlchemy & Database

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** SQLAlchemy 2.0 mapping, async sessions, Alembic migrations, N+1 problem.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** SQLAlchemy 2.0 typed mapping syntax?

**A2.** What's a Session?

**A3.** `session.add()` vs `session.commit()`?

**A4.** N+1 problem?

**A5.** What's `selectinload(User.quests)`?

**A6.** Alembic — what's a migration?

**A7.** `--autogenerate` in alembic revision?

**A8.** Why async SQLAlchemy?

**A9.** What does `expire_on_commit=False` on session?

**A10.** Composite index for `(user_id, completed_at)` — useful for?

## Section B — Predict the output

**B1.**

```
stmt = select(User).where(User.email == 'a@b.c')
result = await session.execute(stmt)
user = result.scalar_one_or_none()
```

**B2.**

```
user = User(email='a@b.c')
session.add(user)
await session.commit()
print(user.id)
```

**B3.**

```
users = (await session.execute(select(User))).scalars().all()
for user in users:
    print(user.quests)
```

**B4.**

```
alembic revision --autogenerate -m 'add tag column'
```

**B5.**

```
await session.execute(text('SELECT 1'))
```

## Section C — Fill in the missing code

**C1.** Define a User model with email (unique) and hashed_password.

**C2.** Async session dependency.

**C3.** Eager-load quests when listing users.

**C4.** Alembic upgrade to latest.

**C5.** Add an index in a model.

## Section D — Find the bug

**D1.**

```
engine = create_engine('postgresql://...')
# Then in async code:
await engine.connect()
```

**D2.**

```
user = User(email='a@b.c')
session.add(user)
# Forgot commit
print(user.id)
```

**D3.**

```
session.add(user)
await session.commit()
print(user.email)  # error?
```

## Section E — Write the code

**E1.** Full User model with relationship to quests.

**E2.** Async function to find user by email with their quests pre-loaded.

**E3.** Setup Alembic in a project.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
