# Phase 6 Resources

## Required reading

- [Shape Up (Basecamp, free online)](https://basecamp.com/shapeup) — chapters 1–4 on shaping problems. Counter to "write user stories until you die."
- [The Mom Test](https://www.momtestbook.com/) — short book on talking to users without leading them. Read in one sitting.
- [12-Factor App](https://12factor.net/) — re-read with Phase 6 eyes.

## On shipping

- [Stop building software like a perfectionist (Jason Cohen)](https://longform.asmartbear.com/) — many short posts. Bookmark this site.
- [On shipping incomplete things (Jonathan Blow / others)](https://news.ycombinator.com/) — find a discussion and skim.
- ["Ship fast, learn fast" — the only real meta-lesson.

## On operations

- [SRE Workbook (Google, free online)](https://sre.google/workbook/table-of-contents/) — chapters on SLOs, alerting, on-call. Skim, don't memorize.
- [Postmortem template (Google SRE)](https://sre.google/sre-book/example-postmortem/) — copy the format.

## Real tools you might add this phase

- [Resend](https://resend.com/) — transactional email, generous free tier.
- [Postmark](https://postmarkapp.com/) — alternative; better deliverability historically.
- [arq](https://arq-docs.helpmanual.io/) — Python task queue, async.
- [RQ](https://python-rq.org/) — simpler task queue, sync.
- [Plausible](https://plausible.io/) or [Umami](https://umami.is/) — privacy-friendly analytics.
- [Sentry](https://sentry.io/) — error tracking, free tier sufficient.
- [PostHog](https://posthog.com/) — product analytics if you need user flows / funnels.

## Stuff to NOT install in Phase 6

- A new ORM "because Prisma looks cool."
- A new framework "because you want to try Svelte."
- Kubernetes.
- A microservice architecture.
- LaunchDarkly or any feature-flag SaaS — env-var flags are fine for this scale.

## When stuck

- **Stuck on what to build**: talk to a user. Not engineer-think; ask them what they did last week.
- **Stuck on design**: write the design doc longer. The act of writing forces the decision.
- **Stuck on a bug**: bisect. `git log` what changed recently.
- **Stuck on motivation**: re-read your goals.md from Phase 0. Are you still solving for what you said you wanted?
