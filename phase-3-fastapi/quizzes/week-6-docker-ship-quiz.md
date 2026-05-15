# Phase 3 Week 6 Quiz — Docker & Ship

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Multi-stage Dockerfiles, docker compose, environment config (Pydantic Settings), OpenAPI docs, shipping.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** Why multi-stage Dockerfile?

**A2.** Why run as non-root in containers?

**A3.** Why `COPY pyproject.toml uv.lock` BEFORE `COPY src/`?

**A4.** What's `docker compose up -d`?

**A5.** Pydantic Settings vs `os.environ`?

**A6.** `.env.example` — why commit?

**A7.** What's a healthcheck in compose.yml?

**A8.** Why is `/docs` (OpenAPI/Swagger UI) free with FastAPI?

**A9.** What does `--no-dev` do in `uv sync`?

**A10.** Should you build a Docker image as part of CI?

## Section B — Predict the output

**B1.**

```
FROM python:3.13-slim
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
CMD ['python', 'main.py']
```

**B2.**

```
services:
  api:
    build: .
    ports: ['8000:8000']
    environment:
      DATABASE_URL: postgresql+asyncpg://...
```

**B3.**

```
from pydantic_settings import BaseSettings
class Settings(BaseSettings):
    database_url: str
    debug: bool = False
    class Config:
        env_file = '.env'
```

**B4.**

```
USER appuser
CMD ['uvicorn', 'app.main:app', '--host', '0.0.0.0']
```

**B5.**

```
depends_on:
  db:
    condition: service_healthy
```

## Section C — Fill in the missing code

**C1.** Multi-stage Dockerfile.

**C2.** compose.yml for api + db.

**C3.** Pydantic Settings.

**C4.** .env.example template.

**C5.** Healthcheck in Dockerfile.

## Section D — Find the bug

**D1.**

```
FROM python:3.13
COPY . /app
```

**D2.**

```
FROM python:3.13-slim
COPY . /app
RUN pip install -r requirements.txt
```

**D3.**

```
USER root
CMD ['uvicorn', ...]
```

## Section E — Write the code

**E1.** Production-ready Dockerfile for FastAPI.

**E2.** Settings class with full validation.

**E3.** README quickstart for the api.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
