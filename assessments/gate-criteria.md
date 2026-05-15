# Gate Criteria — "Can I move to the next phase?"

A *gate* is a live demonstration with the mentor. The learner cannot move on until they pass.

The principle: **they must be able to do this unaided, today, without notes from yesterday.**

## Phase 0 gate — Setup & Habits

The learner, in front of the mentor:

1. Opens a terminal, creates a new repo, pushes it to GitHub via SSH, with no Googling.
2. Explains what each of these does in their own words: `git status`, `git add`, `git commit`, `git push`, `git pull --rebase`, `git log`.
3. Types 200 characters of English text with at least 40 wpm and ≤2 errors.

## Phase 1 gate — Python & CLI

The learner, given a blank file:

1. Writes a Python function that takes a list of strings and returns the most common one, with a tie broken alphabetically. With a unit test. In under 15 minutes.
2. Explains, looking at their own CLI tool's source, where the entry point is, how arguments are parsed, and how errors are surfaced to the user.
3. Adds a new subcommand to their CLI live, with a passing test, in under 30 minutes.

## Phase 2 gate — Web & SQL

The learner:

1. Writes a SQL query against a 4-table schema involving a JOIN, a GROUP BY, and a filter, in under 10 minutes. Explains the query plan if asked.
2. Builds a responsive 2-column layout in HTML+Tailwind from a screenshot, in under 30 minutes.
3. Explains the difference between `200`, `301`, `400`, `401`, `403`, `404`, `500`, `503` — and gives a real example of each from a project they've used.

## Phase 3 gate — FastAPI

The learner:

1. Adds a new authenticated endpoint to their API live, with input validation, a database write, and a passing test, in under 45 minutes.
2. Explains their auth flow end-to-end: where the password is hashed, what a JWT contains, where it's stored, how it's verified.
3. Reads a Postgres EXPLAIN plan and identifies one missing index in a query the mentor provides.

## Phase 4 gate — TypeScript & Next.js

The learner:

1. Builds a new page in their Next.js app: route, server component fetching from the API, client form, optimistic update, error state — in under 60 minutes.
2. Explains the difference between server and client components, and gives a concrete example from their own code where each is appropriate.
3. Writes a Playwright test that drives the login flow and asserts on the resulting page state.

## Phase 5 gate — Deployment

The learner:

1. Provisions a fresh Ubuntu VPS, hardens SSH, installs Docker, deploys their app, and reaches it via HTTPS at a real domain — in under 2 hours. Mentor watches.
2. Demonstrates a backup-and-restore cycle on the production database.
3. Triggers a deployment via `git push` to main and shows it landing on the server.

## Phase 6 gate — Real Product

The learner:

1. Has 3+ users who are not them, the mentor, or their parents — who have used the app in the last week. Show analytics.
2. Walks the mentor through one bug report from a real user: how it came in, how they reproduced it, what they fixed, what they shipped.
3. Presents a written retro: what shipped, what didn't, what they'd do differently.

## Phase 7 gate — AI Capstone

The learner:

1. Demos the AI feature end-to-end to the mentor, with both a successful and a deliberately-failed input. Explains what failed and why.
2. Shows their eval set, eval results, and cost-per-request numbers.
3. Walks through their design doc: what they considered, what they chose, what they rejected.
4. **Award trigger:** capstone gate passed → MacBook Air shipped.

## Re-do policy

A failed gate is not a failure. It means "do that part again." There is no record kept of failed attempts — only of passed gates. The goal is competence, not throughput.
