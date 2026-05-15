# Phase 6 Lessons

This phase is less about lessons and more about doing the thing. Each week has a small set of new concepts but most of the time is **building**.

---

## Week 1 — Pick, design, line up users

### Day 1 — Pick the idea

- Talk to 3 people in your life. Ask: "What's a recurring annoyance you'd pay $0 to solve?" Listen for repeated patterns. Don't pitch — listen.
- Pick from the catalog OR propose your own.
- Get mentor sign-off **before** writing any code.

### Day 2–3 — Design doc

`DESIGN.md`, written before any code. Sections (each ~3–5 paragraphs):

1. **Problem.** Whose problem. What they currently do. Why it's annoying. **Specific quotes** from your 3 conversations.
2. **Users.** Name names. Who will use this? How many? When?
3. **MVP scope.** The smallest thing you can ship in **2 weeks** that solves enough of the problem to be worth using. **One sentence:** "Users can do X." Cut everything else.
4. **Out of scope.** What you are deliberately NOT building. Be specific. The list should hurt.
5. **Data model.** Tables, fields, relationships.
6. **API surface.** Endpoints, request/response shapes.
7. **Auth & permissions.** Public? Private? Roles?
8. **Open questions.** Things you don't know yet. List them honestly.

Mentor reviews. **Half a day on the design saves a week of refactoring.**

### Day 4 — Stack decisions

You've earned the right to choose. Start from the Phase 3/4 stack as the default; deviate only with a reason.

- Backend: FastAPI + Postgres (probably).
- Frontend: Next.js + Tailwind + shadcn.
- Deploy: VPS (from Phase 5) or stay on managed (Render, Railway) if it's simpler. Be honest about why.

### Day 5 — Repo + skeleton

- New monorepo or two repos? Either is fine. Document the choice in DESIGN.md.
- CI + deploy pipelines from day 1.
- Health endpoint deployed and reachable before any feature code.

---

## Week 2 — Ship the MVP

The rule for this week: **deployed end-of-week, no exceptions.**

You will be tempted to make things nicer. Don't. Ship the ugliest version that works.

### Days 1–4 — Build

- Smallest schema that solves the problem.
- Smallest API surface.
- Smallest UI.
- Ship to the prod URL daily, even if it's broken.

### Day 5 — Ship

- Deployed.
- One real user (you don't count) logged in and did the thing.
- Bug list documented as GitHub issues.

You will discover: your design doc was wrong about 30% of things. That's fine. Update it.

---

## Week 3 — Real users + iterate

### Day 1 — Onboarding

- Send to 3 actual users. Watch them use it (in person, on a call, recorded — any of these).
- **Do not help them.** Watch. Take notes. Don't say "oh you just need to click here."
- Write up what confused them.

### Days 2–4 — Fix

- Triage: confusion bugs first (UX), actual bugs second, missing features third.
- One feature per branch, one PR each, deploy when merged.
- Keep changelog / release notes if it makes sense for your app.

### Day 5 — Add real-feature 1

Pick one from this list, learn it, ship it:

- **Email sending** — transactional email via Resend or Postmark. Welcome email, password reset.
- **File uploads** — to R2/S3, served via signed URL. Profile pictures, attachments, exports.
- **Background jobs** — `arq` or `RQ` for things that shouldn't block the request (sending emails, generating reports).

Whichever you pick: write tests, document in the runbook, ship.

---

## Week 4 — More real features

Pick at least **two more** from the list above (or below). At least one must involve **shared state** or **multiple users**.

### Additional real-features menu

- **Rate limiting** scaled up (per-user, per-endpoint).
- **Webhook receiving** — let third parties notify you.
- **Webhook sending** — notify your users' systems.
- **Real-time updates** — Server-Sent Events or WebSockets.
- **CSV / PDF export** — useful for many domains.
- **Audit log** — every state change recorded, queryable.
- **Multi-user roles** — owners, members, viewers.
- **Search** — Postgres full-text search is enough.
- **Scheduled jobs** — daily summaries, weekly reports.

### The constraint

After every feature ship: **does a real user notice / use it?** If no, why are you building it? Write the answer down.

---

## Week 5 — Polish and write it up

### Day 1 — Polish pass

- Loading and error states everywhere.
- Empty states with helpful copy and a CTA.
- Forms: validation, success feedback.
- Mobile pass.
- A11y pass.

### Day 2 — Retro doc

`retro.md` in the repo, ~3 pages:

1. **What I shipped.** Bulleted list with dates.
2. **What I cut from the original design.** Why.
3. **What I added that wasn't in the original design.** Why.
4. **What surprised me.** Be specific.
5. **What broke in production.** Each incident with timeline.
6. **What I'd do differently.** Honestly.

### Day 3 — Post-mortem (if applicable)

If you had a real outage or incident, write a post-mortem. Template:

```markdown
# Post-mortem: [thing that happened] — YYYY-MM-DD

## Summary
One paragraph.

## Timeline
- HH:MM — first user report
- HH:MM — investigated, found root cause
- HH:MM — deployed fix
- HH:MM — verified

## Impact
Number of users affected, what data was at risk, downtime duration.

## Root cause
Specific. "Bug in migration" is not specific. "The migration script ran ALTER TABLE without a transaction, so a partial apply left the DB in an inconsistent state" is.

## What went well
- The alert fired within 90 seconds.
- The fix was identified in 6 minutes.

## What went poorly
- I didn't have a runbook for "DB inconsistent after migration."
- I had no monitoring on migration success.

## Action items
- [ ] Wrap migrations in transactions where possible.
- [ ] Add a post-deploy SQL invariant check.
- [ ] Update runbook with this scenario.
```

### Day 4–5 — Gate prep + small fixes

Walk through the gate criteria. Make sure:
- ≥3 active users in the last 7 days (analytics screenshot ready).
- Retro is solid.
- One real bug report to walk through.
- The app actually works.
