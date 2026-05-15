# Phase 5 — Deployment & Networking

**Duration:** 4 weeks
**Prerequisites:** Phase 4 gate passed.

## Why this phase exists

A working app on your laptop helps nobody. This phase takes the `questly` API + frontend from Phases 3 and 4 and puts them on the public internet — on infrastructure you provisioned, configured, and can debug. By the end the learner can ssh to a server, deploy with `git push`, restore a corrupted database from backup, and explain DNS.

## Learning objectives

By the end of this phase, the learner can:

1. Provision an Ubuntu VPS from a clean image and harden it.
2. Run a production-grade stack: nginx + uvicorn + Postgres + their app, all systemd-managed.
3. Configure DNS records and Cloudflare without breaking anything.
4. Issue TLS certificates and deal with renewal.
5. Set up CI/CD: `git push` to a tagged release → production deploy.
6. Restore from backup. Practice it. Don't trust untested backups.
7. Read system logs with `journalctl` and diagnose a real outage.
8. Reason about cost, uptime, and what to monitor.

## Week structure

| Week | Topic | Output |
|------|-------|--------|
| 1 | VPS, ssh, Linux fundamentals | App running on a server via ssh tunnel |
| 2 | nginx, TLS, domains, Cloudflare | App on public domain with HTTPS |
| 3 | Deployment, CI/CD, backups | Push-to-deploy + tested backups |
| 4 | Monitoring, runbooks, hardening | Production-ready with paging |

See [lessons.md](lessons.md).

## Gate criteria

See [../assessments/gate-criteria.md#phase-5-gate-deployment](../assessments/gate-criteria.md). Summary: fresh VPS, hardened, deployed, HTTPS at a real domain — under 2 hours. Live backup-restore. Push-to-deploy demo.

## Project

[project.md](project.md) — get the `questly` stack from Phase 3+4 live in production. Plus a written **runbook**.

## Quiz

End of Week 3. See [quiz.md](quiz.md).

## Tools added this phase

- A real **VPS** (Hetzner, DigitalOcean, Linode — pick one).
- A real **domain** (any registrar — namecheap, porkbun, cloudflare registrar).
- **nginx** as the reverse proxy.
- **certbot** or Cloudflare origin certs for TLS.
- **systemd** for service management.
- **`ufw`** for the firewall.
- **`fail2ban`** for brute-force protection.
- **`pg_dump`** + a cloud bucket for backups (S3, B2, or Cloudflare R2).
- A status page or uptime monitor (UptimeRobot, Healthchecks.io).

## Cost (real, monthly)

- VPS: $4–6/mo (Hetzner CX11, DO basic droplet).
- Domain: ~$1/mo (annual billed).
- Cloudflare DNS: free.
- Backup storage: ~$0.10/mo for the data sizes here.

**Total: under $10/mo.** Provisioned at the start of the phase, kept running.

## What the mentor watches for

- Did they ssh as root and never set up a user? (Common mistake.)
- Did they actually test the backup restore, or just configure it?
- Did they install the firewall AFTER blocking themselves out of ssh? (You will.)
- Did they set up systemd correctly, or just `nohup`/`tmux` it?
- Can they read journalctl output and find the real error?

## Weekly quizzes

| Week | Topic | Quiz |
|------|-------|------|
| 1 | VPS & Linux fundamentals | [week-1-vps-linux-quiz.md](quizzes/week-1-vps-linux-quiz.md) |
| 2 | DNS, nginx, TLS, Cloudflare | [week-2-dns-nginx-tls-quiz.md](quizzes/week-2-dns-nginx-tls-quiz.md) |
| 3 | Deploy, CI/CD, backups | [week-3-deploy-ci-backups-quiz.md](quizzes/week-3-deploy-ci-backups-quiz.md) |
| 4 | Production polish & runbook | [week-4-production-runbook-quiz.md](quizzes/week-4-production-runbook-quiz.md) |

Each week: 20–28 questions in 5 sections (MCQ, predict output, fill in code, debug, write code). Self-grading rubric at the end. Take at end of each week before moving to the next.
