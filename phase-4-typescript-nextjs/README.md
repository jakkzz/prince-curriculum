# Phase 4 — TypeScript & Next.js

**Duration:** 6 weeks
**Prerequisites:** Phase 3 gate passed.

## Why this phase exists

A backend without a frontend is a tool, not a product. This phase builds a fully-typed, server-rendered, accessible Next.js frontend that talks to the FastAPI backend from Phase 3. By the end, the learner has built a complete full-stack app.

## Learning objectives

By the end of this phase, the learner can:

1. Write TypeScript with strict mode enabled, including generics and narrowing.
2. Build React components — server, client, server actions — and know when each applies.
3. Use Next.js App Router: layouts, routes, loading/error boundaries, server actions.
4. Wire auth across server + client: cookies, refresh, protected routes.
5. Style with Tailwind + shadcn/ui consistently.
6. Validate forms client-side (zod) and server-side, with good UX.
7. Write Playwright tests for the critical user flows.
8. Deploy a Next.js app behind a custom domain.

## Week structure

| Week | Topic | Output |
|------|-------|--------|
| 1 | TypeScript fundamentals | Standalone TS, no React yet |
| 2 | React fundamentals | Components, hooks, forms |
| 3 | Next.js App Router | Multi-page app with API integration |
| 4 | Auth + state + forms | Full auth flow, protected pages |
| 5 | shadcn/ui, design polish | UI library wired in, design consistent |
| 6 | Playwright tests, deploy | E2E tested, deployed to Vercel/CF Pages |

See [lessons.md](lessons.md).

## Gate criteria

See [../assessments/gate-criteria.md#phase-4-gate-typescript-nextjs](../assessments/gate-criteria.md). Summary: build a new page live with route + server component + form + optimistic update + error state in under 60 min.

## Project

[project.md](project.md) — **`questly-web`**, the frontend for the Phase 3 `questly` API.

## Quiz

End of Week 4. See [quiz.md](quiz.md).

## Tools added this phase

- **TypeScript** (strict)
- **Next.js** (App Router)
- **React** + **React Query** (or SWR)
- **zod** for validation
- **shadcn/ui** components
- **Playwright** for E2E
- **pnpm** package manager

## What the mentor watches for

- Did they actually understand the server-vs-client component model, or do they slap `"use client"` everywhere?
- Are they fighting hydration errors or preventing them?
- Are forms validated on both client AND server?
- Does the app work without JavaScript (where reasonable)?
- Is loading + error + empty state handled, or just the happy path?
