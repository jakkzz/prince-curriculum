# Phase 2 — Web Fundamentals & SQL

**Duration:** 4 weeks
**Prerequisites:** Phase 1 gate passed.

## Why this phase exists

Before we build a backend (Phase 3) or a frontend (Phase 4), the learner needs to understand the layer underneath both: **HTTP, HTML/CSS, and SQL**. Skip this and they'll be debugging mysteries forever — "why doesn't the cookie work?", "why is the layout broken?", "why is this query slow?".

## Learning objectives

By the end of this phase, the learner can:

1. Write semantic, accessible HTML.
2. Build responsive layouts with CSS (flexbox + grid + Tailwind).
3. Explain what happens when you type a URL and press Enter — at least 8 distinct steps.
4. Read HTTP request/response headers and explain each common one.
5. Write SQL with JOINs, GROUP BY, indexes, and transactions.
6. Read an EXPLAIN plan and identify a missing index.
7. Design a normalized schema for a small domain.
8. Use the browser devtools competently (elements, network, console, sources).

## Week structure

| Week | Topic | Output |
|------|-------|--------|
| 1 | HTML, CSS, accessibility | A handful of small static pages |
| 2 | Tailwind, responsive layout, design systems | Static portfolio site |
| 3 | HTTP, fetch, JSON, browser devtools | A page that talks to a public API |
| 4 | SQL fundamentals, schema design, EXPLAIN | 50 SQL exercises mastered |

See [lessons.md](lessons.md) for the full curriculum.

## Gate criteria

See [../assessments/gate-criteria.md#phase-2-gate-web-sql](../assessments/gate-criteria.md). Summary: SQL query under timer, layout from screenshot, HTTP status code explanation.

## Project

[project.md](project.md) — **Two deliverables this phase:**
1. **`portfolio`** — a deployed static site at a real subdomain.
2. **`sql-katas`** — a repo with 50 SQL exercises solved against a real dataset.

## Quiz

End of Week 3. See [quiz.md](quiz.md).

## Tools added this phase

- **PostgreSQL** (via Docker) — for SQL practice.
- **`psql`** — the Postgres CLI.
- **Tailwind CSS** + a simple build pipeline.
- **Cloudflare Pages** account for portfolio deploy.

## What the mentor watches for

- Are they using semantic tags (`<nav>`, `<article>`, etc.) or just `<div>` everywhere?
- Are they reading the network tab when an API call fails — or just guessing?
- Can they write a JOIN without copying from a previous query?
- Do they understand "an index is a tree, not magic"?
