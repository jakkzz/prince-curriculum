# Phase 3 Resources

## Required reading

- [FastAPI Tutorial](https://fastapi.tiangolo.com/tutorial/) — sections 1–8 minimum.
- [SQLAlchemy 2.0 Tutorial](https://docs.sqlalchemy.org/en/20/tutorial/index.html) — the unified tutorial.
- [Alembic Tutorial](https://alembic.sqlalchemy.org/en/latest/tutorial.html)
- [OWASP Authentication Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html)
- [JWT.io — Introduction to JSON Web Tokens](https://jwt.io/introduction)

## Recommended

- [FastAPI Best Practices (Zhanymkanov)](https://github.com/zhanymkanov/fastapi-best-practices) — opinionated but accurate.
- [Practical SQL Performance](https://use-the-index-luke.com/) — the right level of "indexes are not magic."
- [The PostgreSQL Manual — Chapter 11: Indexes](https://www.postgresql.org/docs/current/indexes.html)
- [Real Python — Async IO in Python: A Complete Walkthrough](https://realpython.com/async-io-python/)
- [Pydantic v2 docs](https://docs.pydantic.dev/latest/)

## Security reading

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [The Tangled Web (Michał Zalewski)](https://lcamtuf.coredump.cx/tangled/) — older but the fundamentals haven't changed.
- [Have I Been Pwned — Password Hashing](https://www.troyhunt.com/our-password-hashing-has-no-clothes/) — Troy Hunt is excellent.

## Reference

- [HTTPie](https://httpie.io/) — friendlier than `curl` for poking at APIs. `httpie cli` install.
- [DBeaver](https://dbeaver.io/) — Postgres GUI if you want one.
- [SQLAlchemy 2.0 cheatsheet](https://docs.sqlalchemy.org/en/20/orm/queryguide/select.html) — bookmark this.

## Skip these for now

- Celery / RQ. Phase 6 if needed.
- WebSockets. Phase 6.
- GraphQL. Out of scope for this course.
- Microservices. Definitely not.
- "FastAPI vs Flask vs Django." It doesn't matter. You're using FastAPI.

## When stuck

1. The 422 response body. Read it. It tells you exactly which field failed.
2. `EXPLAIN ANALYZE` for slow queries.
3. Engine `echo=True` to see all SQL.
4. [resources/troubleshooting.md](../resources/troubleshooting.md).
5. Mentor.
