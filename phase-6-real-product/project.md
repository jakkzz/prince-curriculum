# Phase 6 Project — A Real Product

A real app, real users, real lifecycle. Idea picked by the learner; mentor-approved.

## Deliverable

1. **The app** — deployed at a real domain over HTTPS.
2. **DESIGN.md** — written before code, updated mid-project.
3. **`retro.md`** — written end of phase.
4. **At least one post-mortem** (real or near-miss).
5. **3+ active users** in the last 7 days (not the learner, mentor, or close family).
6. **A bug report from a real user** — walked through with the mentor.
7. **Source code** — public or shared with mentor, with tests + CI.

## Functional requirements

These vary by idea, but every project must include:

- [ ] Authenticated users (re-using Phase 3 patterns or a library — your call).
- [ ] Some form of multi-user / shared state.
- [ ] At least 3 of: email sending, file uploads, background jobs, webhooks, real-time updates, scheduled jobs.
- [ ] CSV or PDF export of user data (right-to-data).
- [ ] An admin or owner role with elevated permissions.
- [ ] Some form of basic analytics (Plausible, Umami, or your own page-view table).
- [ ] A landing page that explains what it does in 1 sentence + 3 bullets.

## Non-functional

- [ ] Production environment is on the VPS or a managed equivalent. Domain + HTTPS.
- [ ] CI runs on every PR. Lint, type-check, test. No reds on main.
- [ ] Backups configured, restore tested.
- [ ] Uptime monitor configured.
- [ ] Error tracking (Sentry, GlitchTip, or rolled-your-own log query).
- [ ] Runbook updated.

## DESIGN.md required (before code)

See [lessons.md](lessons.md) Week 1 for the template. Mentor reviews before code.

## Grading rubric

This phase is judged on outcomes and process, not just artifacts. Pass = no zeros, ≥ 12 twos out of 16.

| # | Category | "2" |
|---|----------|-----|
| 1 | **Real users** | ≥3 distinct users active in the last 7 days, not connected to you. Analytics screenshot. |
| 2 | **User feedback loop** | You can recount what real users said. Specific quotes. |
| 3 | **Shipped on time** | MVP deployed end of week 2. |
| 4 | **DESIGN.md** | Real, pre-code, includes problem/user/scope/out-of-scope sections. |
| 5 | **Scope discipline** | What you cut hurt; what you shipped works. |
| 6 | **Code quality** | Standards from Phase 3+4 maintained. Tests still exist. |
| 7 | **Feature: shared state** | Multi-user feature actually works under contention. |
| 8 | **Feature: extras** | At least 3 from the menu, each integrated end-to-end. |
| 9 | **Reliability** | No outage longer than 30 min unattended in last 2 weeks. |
| 10 | **Runbook + ops** | Updated, real, useful. |
| 11 | **Retro doc** | Honest, specific, has "what I'd do differently." |
| 12 | **Post-mortem** | At least one, with timeline, root cause, action items. |
| 13 | **Analytics** | You know your DAU/WAU. You know top pages. |
| 14 | **Cost** | Total monthly cost still under $25 (incl. emails, file storage). |
| 15 | **Landing page** | Clear, accurate, not generic. |
| 16 | **Git/CI** | Clean, descriptive PR history. |

## What "real users" actually means

- They are not you.
- They are not the mentor.
- They are not your parent or sibling pressed into service.
- They use the app **because it's useful to them**, not because they're being nice.

Acceptable: a friend's friend who has the problem. A small club. A teacher you've onboarded. A few classmates.

Not acceptable: 3 alt accounts. Your friend Bob who logged in once.

## Adversarial review

The mentor will:

1. Use the app as a brand-new user. Note every paper cut.
2. Look at the analytics — verify user counts are real and recent.
3. Walk through your post-mortem and ask "and what's the test that prevents this regression?"
4. Look at the design doc vs. what shipped. Discrepancies = a conversation about scope discipline.
5. Ask one of your real users (with permission) what they think.

## Submission

PR with everything, written-up retro, and a 90-second video tour. Mentor schedules the gate review.
