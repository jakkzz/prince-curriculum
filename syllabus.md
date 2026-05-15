# Syllabus

A complete topic list for the 35-week curriculum. Each item is reinforced by an exercise, project, or quiz somewhere in the course.

## Core programming
- Python: types, control flow, functions, classes, exceptions, modules
- Python tooling: `uv`, virtualenvs, `ruff`, `pytest`
- Type hints and `mypy`
- TypeScript: types, generics, narrowing, utility types
- JavaScript: ES modules, async/await, fetch, DOM
- Node.js + `pnpm`

## Web fundamentals
- HTML5, semantic markup, accessibility (a11y) basics
- CSS: box model, flexbox, grid, responsive design
- Tailwind CSS
- HTTP: methods, status codes, headers, caching, CORS, cookies
- REST API design conventions
- Browser devtools

## Databases & data
- SQL: SELECT, JOIN, WHERE, GROUP BY, indexes, transactions
- Schema design and normalization
- SQLite (development), PostgreSQL (production)
- ORMs: SQLAlchemy 2.0, Alembic migrations
- N+1 problem and how to avoid it
- Backups and restores

## Backend (FastAPI)
- Routing, dependency injection, Pydantic models
- Async Python basics
- Authentication: password hashing (argon2), JWT, refresh tokens, OAuth2
- Authorization: RBAC
- OpenAPI docs
- Background jobs (arq or RQ)
- Rate limiting
- File uploads
- Email sending
- Structured logging and error tracking (Sentry)

## Frontend (Next.js)
- React: components, hooks, state, effects, forms, error boundaries
- Next.js App Router: server vs client components, server actions, routing, layouts
- Data fetching patterns (SWR / TanStack Query)
- Auth flows in the browser
- shadcn/ui component library
- Form handling and validation (zod)
- Loading and error states, optimistic UI

## Testing
- pytest, fixtures, parametrization
- httpx test client for FastAPI
- Vitest for unit tests
- Playwright for end-to-end tests
- TDD discipline
- Coverage as a signal, not a goal

## Linux & VPS
- File system, permissions, processes, `systemd`, `journalctl`
- SSH, key management, jump hosts
- `ufw`, `fail2ban`, server hardening
- `nginx` as a reverse proxy
- TLS with Let's Encrypt and Cloudflare origin certs
- Log rotation, disk monitoring
- Postgres on the VPS vs managed Postgres — tradeoffs
- Backup strategy (`pg_dump`, off-site copies)

## Networking & DNS
- The DNS resolution chain
- A, AAAA, CNAME, MX, TXT, SRV records
- Nameserver delegation
- Cloudflare: proxy vs DNS-only, page rules, caching, WAF, tunnels
- HTTPS, certificates, mixed content
- Subdomains and zone management

## DevOps
- Docker basics, Dockerfile authoring
- docker-compose for local dev and small prod
- GitHub Actions: matrix builds, secrets, deploy on tag
- Environment variables, `.env` files, secrets managers
- Semver, changelogs, releases

## Security
- OWASP Top 10 (the relevant subset for web apps)
- SQL injection, XSS, CSRF, SSRF
- Secrets management
- HTTPS everywhere
- Password hashing (argon2id, never MD5/SHA1)
- JWT pitfalls (alg confusion, no expiry, storing in localStorage)
- Rate limiting and abuse prevention
- Dependency scanning

## AI integration
- LLM API basics: tokens, context windows, cost, latency
- Prompt design and prompt caching
- Streaming responses
- Tool use / function calling
- RAG: embeddings, vector stores (pgvector), retrieval strategies
- Evals: how to know your AI feature works
- Prompt injection awareness
- Cost monitoring

## Engineering practice
- Git: branches, rebase, conflict resolution, bisect, blame
- GitHub: PRs, reviews, draft PRs, issue templates
- Commit message conventions (Conventional Commits)
- Code review — giving and receiving
- Writing READMEs, design docs, runbooks
- Asking good questions (minimal repro)
- Time estimation and breaking down work
- Touch typing (60+ wpm target)

## Why this list

Every topic appears in at least one project. Topics that don't appear in a project are not on this list — the curriculum is project-driven, not lecture-driven.
