# Phase 3 Week 5 Quiz — Production Concerns

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Structured logging, exception handlers, rate limiting, health/readiness, observability.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** Why structured (JSON) logs in production?

**A2.** `/health` vs `/ready`?

**A3.** What does `slowapi` do?

**A4.** When use `@app.exception_handler(MyError)`?

**A5.** Why log request IDs?

**A6.** Sentry — what does it do?

**A7.** Why never log passwords/tokens?

**A8.** What's `logger.exception()` vs `logger.error()`?

**A9.** When should a 500 NOT be returned?

**A10.** Prometheus metrics — what's a counter vs gauge?

## Section B — Predict the output

**B1.**

```
logger.info('quest created', extra={'user_id': u.id, 'quest_id': q.id})
```

**B2.**

```
@app.exception_handler(Exception)
async def handle_all(req, exc):
    logger.exception('unhandled', extra={'path': req.url.path})
    return JSONResponse({'detail': 'Internal error'}, 500)
```

**B3.**

```
@router.post('/login')
@limiter.limit('5/minute')
async def login(request: Request, ...):  # note: must accept Request arg
```

**B4.**

```
@app.get('/ready')
async def ready(db: AsyncSession = Depends(get_db)):
    await db.execute(text('SELECT 1'))
    return {'status': 'ready'}
```

**B5.**

```
logger.error('failed', extra={'password': '...'})
```

## Section C — Fill in the missing code

**C1.** Structured logger setup.

**C2.** Global exception handler.

**C3.** Domain-specific exception handler.

**C4.** Setup slowapi rate limiter.

**C5.** Request ID middleware.

## Section D — Find the bug

**D1.**

```
try:
    do_thing()
except Exception as e:
    logger.error(f'failed: {e}')
```

**D2.**

```
@app.get('/health')
async def health(db: AsyncSession = Depends(get_db)):
    await db.execute(text('SELECT 1'))
    return {'status': 'ok'}
```

**D3.**

```
logger.info(f'login: user={user.email} password={password}')
```

## Section E — Write the code

**E1.** Full logging setup with request IDs.

**E2.** Health and Readiness endpoints.

**E3.** Custom error with handler.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
