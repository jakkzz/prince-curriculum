# Phase 5 Project — Production Deploy

Get the `questly` API + frontend live on the public internet, on infrastructure the learner provisioned. Plus a written runbook.

## Deliverable

1. **`questly` API** running at `https://api.<your-domain>.com` on the learner's VPS.
2. **`questly-web` frontend** at `https://<your-domain>.com` on Vercel or Cloudflare Pages.
3. **`runbook.md`** in the `questly` repo.
4. **GitHub Actions workflow** that deploys on tagged release.
5. **Hourly database backup** to Cloudflare R2 / S3 / B2.
6. **A successfully restored test backup**, documented.
7. **Uptime monitoring** with email alerts.

## Functional requirements

- [ ] Fresh `ssh deploy@<ip>` works; root ssh is disabled; password auth is disabled.
- [ ] `ufw` enabled, allows 22/80/443 only.
- [ ] `fail2ban` active.
- [ ] nginx reverse-proxies to the FastAPI container.
- [ ] HTTPS works at both subdomain and apex (or `www` redirect).
- [ ] Cloudflare proxy is on, in Full (strict) SSL mode.
- [ ] `git tag v...` → automatic deploy via GitHub Actions.
- [ ] `pg_dump` runs hourly, uploads to R2/S3, retains 7 days locally + 30 days remote.
- [ ] Healthchecks.io pings on successful backup.
- [ ] UptimeRobot monitors `/health` at 1-min interval.
- [ ] Restore tested at least once, documented.

## runbook.md required

Real, written before the gate. Must cover:

1. **Deploying.** Commands, one-line "what could go wrong."
2. **Rolling back.** What's the exact tag command? Test it.
3. **"The site is down" — first 5 minutes.** Checklist, ordered.
4. **DB restore from backup.** Step-by-step, tested.
5. **Adding a new env var.** Where, how, restart what?
6. **Adding a new subdomain.** DNS, nginx, cert.
7. **Emergency contacts.** Mentor info.

## Grading rubric

Pass = no zeros, ≥ 14 twos.

| # | Category | "2" |
|---|----------|-----|
| 1 | **VPS hardening** | Non-root user, no password ssh, ufw + fail2ban active |
| 2 | **systemd** | Services managed properly, restart on failure |
| 3 | **nginx config** | Clean, with security headers, no defaults left |
| 4 | **TLS** | Auto-renew works, Cloudflare Full (strict) |
| 5 | **DNS** | A/CNAME/MX as needed, propagation verified |
| 6 | **Cloudflare** | Proxy mode, security level set, basic WAF rule |
| 7 | **Deploy automation** | `git tag` → live, with migrations |
| 8 | **Rollback** | Can roll back to previous tag with one command |
| 9 | **Backups** | Hourly, encrypted at rest, off-server |
| 10 | **Restore tested** | Done, documented, recent |
| 11 | **Monitoring** | UptimeRobot + Healthchecks set up, alerts confirmed working (test page) |
| 12 | **Logs** | journalctl + docker logs documented; can find an error fast |
| 13 | **Runbook** | Written, real, would help someone unfamiliar |
| 14 | **Secret hygiene** | No secrets in git or in shell history |
| 15 | **Frontend live** | Deployed, talks to prod API, HTTPS |
| 16 | **Cost discipline** | Total monthly cost < $15 |
| 17 | **Resilience demo** | Mentor stops the API container; alerts fire; learner notices and recovers |
| 18 | **DESIGN/runbook** | Real, pre-deploy thinking visible |
| 19 | **Git/CI** | Workflow is in version control; deploys reproducible |
| 20 | **Honesty** | Known gaps documented, not hidden |

## Adversarial review

The mentor will:

1. Try to ssh as root. Should fail.
2. Try password auth. Should fail.
3. Hit port 8000 directly (bypassing nginx). Should fail (firewall).
4. Stop the API container. Wait. Did the learner notice via alert? How fast did they recover?
5. Modify a backup file to be invalid. Trigger restore. Does the runbook actually work?
6. Ask: "If I `rm -rf` the VPS, how long until you have a working app again?" — they should have an answer.

## Common ways this goes wrong

- **Backup script writes to the VPS disk only.** Disk dies → backups gone. Off-server is mandatory.
- **`certbot` cert installed but auto-renew not tested.** Will expire silently.
- **Cloudflare set to "Flexible" SSL mode.** Means traffic between Cloudflare and origin is HTTP. Treat as a fail.
- **Deploy script doesn't run migrations.** First migration after deploy = outage.
- **Healthchecks.io configured but never tested.** Mentor will pause backups for a day; the alert better fire.

## Submission

Three URLs (API, frontend, runbook) + a 5-minute screen recording of the deploy gate exercise.
