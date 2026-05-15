# Phase 3 — FastAPI Backend

**Duration:** 6 weeks
**Prerequisites:** Phase 2 gate passed.

## Why this phase exists

This is the first "real" backend phase. By the end, the learner has built an authenticated REST API with a relational database, real tests, structured logging, and a Dockerfile that runs anywhere. Everything in Phases 4–7 builds on this.

## Learning objectives

By the end of this phase, the learner can:

1. Design and build a FastAPI app with clean routing, dependency injection, and Pydantic models.
2. Use SQLAlchemy 2.0 with proper async patterns and avoid N+1 queries.
3. Write Alembic migrations and roll forward/back safely.
4. Implement password-hashing-based auth from scratch, then refactor to a library.
5. Issue and verify JWTs, with proper expiry, refresh, and revocation strategy.
6. Write integration tests with `httpx` against a real test database.
7. Structure logs so they're useful in production.
8. Containerize the app with a multi-stage Dockerfile.

## Week structure

| Week | Topic | Output |
|------|-------|--------|
| 1 | FastAPI fundamentals, Pydantic, routing | Hello-world API with validated endpoints |
| 2 | Async Python, SQLAlchemy 2.0, Alembic | API persisting to Postgres |
| 3 | Auth from scratch, then with a library | Login, register, protected endpoints |
| 4 | Testing: pytest + httpx + test DB | Full test suite with >80% coverage |
| 5 | Logging, error handling, observability, rate limiting | Production-ready error surface |
| 6 | Dockerize, polish, ship | Container builds; full CRUD app |

See [lessons.md](lessons.md).

## Gate criteria

See [../assessments/gate-criteria.md#phase-3-gate-fastapi](../assessments/gate-criteria.md). Summary: add an authenticated endpoint live with a passing test in under 45 min; explain auth flow end-to-end; read an EXPLAIN plan.

## Project

[project.md](project.md) — **`questly`**, a small habits-and-quests tracker API. Users register, log in, create quests, complete them, view stats. Postgres-backed, JWT auth, dockerized, tested.

## Quiz

End of Week 4. See [quiz.md](quiz.md).

## Tools added this phase

- **FastAPI** + **uvicorn**
- **SQLAlchemy 2.0** (with async)
- **Alembic** for migrations
- **`httpx`** for tests
- **`argon2-cffi`** for password hashing
- **`PyJWT`** for tokens
- **Docker** + `docker-compose`

## What the mentor watches for

- Are they reading the `422` response body to understand validation failures, or guessing?
- Did they hash the password? (Demand to see it.)
- Are they catching exceptions to silence them, or to handle them?
- Do they understand the difference between "the request was bad" (4xx) and "the server is broken" (5xx)?
