# Phase 5 Week 4 Quiz — Production polish + runbook

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** log aggregation, metrics, runbook, monitoring, on-call mindset.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 16 / 22.

## Section A — Multiple choice

**A1.** Why a runbook?

**A2.** First 5 minutes of 'site is down' — what?

**A3.** What's a postmortem?

**A4.** Sentry vs log aggregator?

**A5.** Why log aggregation matters at scale?

**A6.** What's an SLO?

**A7.** Tradeoff of alerts: too many vs too few?

**A8.** What's a 'dead-man's switch'?

**A9.** Why structured logs?

**A10.** When use Cloudflare Tunnels?

## Section B — Predict the output

**B1.**

```
# A user reports 'I can't log in'
# uptime monitor: all green
```

**B2.**

```
# 3am alert: 502 errors
# Last deploy: 3 days ago
# Recent change: nothing
```

**B3.**

```
# After upgrade: new feature works, old feature broken
# Test suite is green
```

**B4.**

```
# Disk filling up at 50MB/day
# Mostly /var/log/journal
```

**B5.**

```
# Backup script runs nightly. One day it fails. No notification.
```

## Section C — Fill in the missing code

**C1.** Runbook section: deploy.

**C2.** Postmortem template.

**C3.** Send a Sentry capture from FastAPI on unhandled exception.

**C4.** UptimeRobot setup commands (web-based).

**C5.** Loki + Promtail config (or simpler alternative).

## Section D — Find the bug

**D1.**

```
# Alerts ringing for 10 minutes
# You're not sure what to do
```

**D2.**

```
# Postmortem suggests 'be more careful'
```

**D3.**

```
# Alert pages you for a non-urgent issue at 3am
```

## Section E — Write the code

**E1.** Full runbook outline.

**E2.** Alerting policy.

**E3.** Phase 5 gate prep checklist.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 22**

Log score in `learning-log/`. 16+ to advance.
