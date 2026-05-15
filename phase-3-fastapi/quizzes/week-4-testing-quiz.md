# Phase 3 Week 4 Quiz — Testing FastAPI

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** pytest + httpx for FastAPI, test DB, fixtures, mocking external services.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** Why httpx for FastAPI tests instead of requests?

**A2.** Why a SEPARATE test database?

**A3.** Per-test DB cleanup pattern?

**A4.** `pytest-asyncio` — what does it add?

**A5.** Best way to fake DB-loaded auth user in test?

**A6.** Why coverage isn't the goal?

**A7.** Where do fixtures live for cross-file sharing?

**A8.** factory_boy with SQLAlchemy?

**A9.** Mocking `requests` for tests?

**A10.** Testing error paths — important?

## Section B — Predict the output

**B1.**

```
async def test_health(client):
    r = await client.get('/health')
    assert r.status_code == 200
    assert r.json() == {'status': 'ok'}
```

**B2.**

```
async def test_create_quest(client, auth_token):
    r = await client.post('/quests', json={'title': 'read'}, headers={'authorization': f'Bearer {auth_token}'})
    assert r.status_code == 201
```

**B3.**

```
async def test_unauthorized(client):
    r = await client.post('/quests', json={'title': 'x'})
    assert r.status_code == 401
```

**B4.**

```
@pytest.fixture(autouse=True)
async def reset_db():
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.drop_all)
        await conn.run_sync(Base.metadata.create_all)
```

**B5.**

```
app.dependency_overrides[get_current_user] = lambda: fake_user
client.post('/quests', json={...})
app.dependency_overrides.clear()
```

## Section C — Fill in the missing code

**C1.** conftest.py with client + DB fixtures.

**C2.** Override auth in a test.

**C3.** Test 422 on invalid body.

**C4.** Mock an external API call.

**C5.** Pytest config in pyproject.toml.

## Section D — Find the bug

**D1.**

```
async def test_x(client):
    r = await client.get('/users/1')
    # but users table has rows from a previous test
```

**D2.**

```
def test_create(client):
    r = await client.post(...)  # 'await' in sync function
```

**D3.**

```
Tests pass locally but fail in CI
```

## Section E — Write the code

**E1.** Test full register→login→use-token flow.

**E2.** Test that cross-user access fails.

**E3.** Test rate limiting (6 logins in a minute should fail).

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
