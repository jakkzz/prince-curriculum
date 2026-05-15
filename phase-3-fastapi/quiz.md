# Phase 3 Quiz

End of Week 4. 60 minutes. Section E is live.

## Section A — FastAPI (10)

1. What does `@app.get("/items/{id}")` do with the `{id}` part?
2. What's the difference between a Pydantic model used as a request body vs a response model?
3. What does `Depends(get_db)` give you?
4. What HTTP status code does FastAPI return when Pydantic validation fails?
5. What does `response_model=Item` do that just `-> Item` doesn't?
6. What's the difference between `@app.get` on the main app vs on an `APIRouter`?
7. How do you make a parameter keyword-only in FastAPI (in the path)?
8. What's the purpose of `tags=["..."]`?
9. What does `status_code=201` change about the response?
10. What URL does `/docs` show, and what's at `/openapi.json`?

## Section B — SQLAlchemy & DB (10)

1. What's the difference between SQLAlchemy Core and ORM?
2. What's the 2.0-style typed mapping syntax look like?
3. What's a Session, and why do you close it?
4. What's the difference between `session.add()` and `session.commit()`?
5. What's an N+1 query problem? Example?
6. What does `selectinload(User.quests)` do?
7. What's a migration?
8. What's `--autogenerate` in Alembic and what does it miss?
9. What's `EXPLAIN ANALYZE` and what should you look for?
10. When would you add a composite index `(user_id, completed_at)` vs two separate indexes?

## Section C — Auth (10)

1. Why hash passwords instead of storing them?
2. Why argon2id over MD5 or SHA256?
3. What's a salt? Does argon2 handle it for you?
4. What's a JWT made of?
5. Why is it dangerous to accept algorithm `none` in JWTs?
6. What's the difference between an access token and a refresh token?
7. Why store refresh tokens hashed in the DB?
8. What does `HttpOnly` on a cookie do? Why might you want it for auth?
9. What's the difference between authentication and authorization?
10. If someone steals an access token, how long can they use it?

## Section D — Testing & errors (5)

1. Why use a separate test database?
2. What does `pytest-asyncio` add?
3. What's the difference between a unit test and an integration test, in your project?
4. When you catch an exception, what should you usually do?
5. What's the difference between a 4xx and a 5xx response?

## Section E — Live (45 min)

The mentor gives you a brief: "Add an endpoint `POST /quests/{id}/clone` that creates a copy of a quest in the same user's account. Include a test."

You have 45 minutes. You can:
- Read your own code.
- Read the FastAPI / SQLAlchemy docs.
- Run your tests as often as you want.
- Not use any AI tool. Not search Stack Overflow for the answer.

The mentor watches you do it and grades on:
- Did you write a test first?
- Did you handle "quest not found" and "not yours" cases?
- Did you commit the change as a feature branch with a real PR?
- Did the test actually exercise the endpoint?
- Did your CI run and pass before claiming done?

---

**Scoring:**
- A–D: 35 questions, 1 each. Need 28+.
- E: pass/fail.
- Failing either → re-do relevant week(s), retake.
