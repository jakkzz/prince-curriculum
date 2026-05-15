# Phase 4 Project — `questly-web`

The Next.js frontend for the Phase 3 `questly` API.

## Deliverable

- Public GitHub repo `questly-web`.
- Deployed to a custom subdomain over HTTPS.
- Hooks up to the Phase 3 `questly` API (which is still running locally during dev; Phase 5 will deploy that backend).

## Pages required

| Route | Purpose |
|-------|---------|
| `/` | Landing page — pitch + CTA |
| `/login` | Login form |
| `/register` | Register form |
| `/quests` | List quests, with filters and create form |
| `/quests/[id]` | Quest detail |
| `/stats` | XP, streaks, completion chart |
| `/settings` | Change password, log out |
| `/404` | Custom 404 |

## Functional requirements

- [ ] Register, login, logout work end-to-end against the real API.
- [ ] Unauthenticated users redirect to `/login` for protected routes.
- [ ] Refresh tokens kept in HttpOnly cookie; transparent refresh on expired access token.
- [ ] Create quest, complete quest, edit, delete — with optimistic UI.
- [ ] Filters on `/quests` (completed / tag / date range) — driven by URL search params.
- [ ] Stats page shows real numbers from `/stats/me`, with a chart (lib of choice — Recharts, visx, or your own SVG).
- [ ] All forms validated client AND server.
- [ ] All forms show server-side validation errors per field.
- [ ] Loading, empty, error states on every data-driven page.
- [ ] 404 page for missing quests.
- [ ] No "flash of unauthenticated content" — middleware handles it.

## Non-functional

- [ ] TypeScript strict, no `any`, no `// @ts-ignore` without comment.
- [ ] Lighthouse ≥ 95 on every page (Performance, A11y, Best Practices, SEO).
- [ ] Works at 360px width.
- [ ] Keyboard-only navigation works for every action.
- [ ] Playwright covers ≥ 6 critical paths, runs in CI against docker compose.
- [ ] `pnpm build` produces a clean prod build with no warnings.
- [ ] No console errors / warnings in dev or prod.
- [ ] Deployed to a real domain over HTTPS.

## DESIGN.md required

Before any code:

1. Sitemap.
2. Data fetching strategy per page (server component? client + react-query? server action?).
3. Auth flow on the client (sequence diagram).
4. Form validation strategy.
5. Component organization (where do shared components live?).
6. What's out of scope.

## Grading rubric

Pass = no zeros, ≥ 14 twos.

| # | Category | "2" |
|---|----------|-----|
| 1 | **Routing** | Correct App Router structure, layouts used appropriately |
| 2 | **Server vs client** | Right choice at each boundary, justified in PRs |
| 3 | **Auth UX** | No flash, refresh works, errors clear |
| 4 | **Forms** | RHF + zod, server-side error mapping per field |
| 5 | **Data** | React Query / server components used appropriately, no waterfalls |
| 6 | **Optimistic UI** | Quest completion feels instant; rolls back on error |
| 7 | **Styling** | Consistent, deliberate, looks designed |
| 8 | **shadcn/ui** | Used and customized, not pasted verbatim |
| 9 | **A11y** | Keyboard works, focus visible, screen reader passes |
| 10 | **Mobile** | 360px page works for every screen |
| 11 | **TypeScript** | Strict mode, no `any`, generics used where they help |
| 12 | **Performance** | Lighthouse ≥ 95 on every page |
| 13 | **Tests** | Playwright covers critical paths, runs in CI |
| 14 | **Deploy** | Live at custom subdomain, HTTPS, push-to-deploy works |
| 15 | **Error handling** | 4xx vs 5xx surfaced differently to the user |
| 16 | **Empty states** | Thoughtful copy + CTA, not just "no data" |
| 17 | **README** | Setup, env vars, dev/prod commands, screenshots |
| 18 | **DESIGN.md** | Real, pre-code thinking |
| 19 | **Git/CI** | Green, descriptive commits, PRs with descriptions |
| 20 | **Honesty** | Known limitations called out, TODOs link to issues |

## Adversarial review

The mentor will:

1. Submit a form with one valid and one invalid field. Expect: per-field error mapping.
2. Open the app on a slow 3G connection in devtools. Expect: loading states, not blank screens.
3. Tab through `/quests`. Expect: every interactive element reachable, focus visible.
4. View the page source on a server component. Expect: real HTML, not just JS.
5. Log in, then expire the access token (delete cookie). Refresh page. Expect: transparent token refresh OR clean redirect.
6. Try to access `/quests` in a private window. Expect: redirected to login.
7. Resize to 360px. Try to use every feature. Expect: works.

## Common ways this goes wrong

- **`"use client"` on the root layout.** Suddenly nothing is a server component. Cancel.
- **Hydration errors hidden by suppressHydrationWarning.** That's not a fix.
- **Refresh token in localStorage.** No.
- **Forms only validated on the server.** UX is bad. Both sides.
- **Lighthouse 100 on a blank page.** Doesn't count. Test the actual app.
- **Playwright tests that only test the happy path.** Add at least one failure case per critical flow.

## Submission

PR with v0.1.0 tag, deployed URL, plus a 90-second screen recording walking through register → login → create quest → complete → stats. Recording is mandatory.
