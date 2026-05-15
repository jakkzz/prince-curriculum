# Phase 5 Week 3 Quiz — Deploy automation, CI/CD, backups

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** git tag releases, GitHub Actions deploy, pg_dump + S3, restore drills.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** Why tag releases?

**A2.** GitHub Actions deploy step uses what for ssh?

**A3.** Why a deploy-only ssh key?

**A4.** Where store secrets for CI?

**A5.** Why backup off-server?

**A6.** What's RPO?

**A7.** What's RTO?

**A8.** Why test restores?

**A9.** What's `pg_dump`?

**A10.** Why migrations during deploy?

## Section B — Predict the output

**B1.**

```
git tag -a v0.1.0 -m 'First release'
git push origin v0.1.0
```

**B2.**

```
on:
  push:
    tags: ['v*']
```

**B3.**

```
docker compose exec -T db pg_dump -U app app | gzip > backup-$(date +%F).sql.gz
```

**B4.**

```
aws --endpoint-url $R2_ENDPOINT s3 cp backup.sql.gz s3://my-bucket/
```

**B5.**

```
gunzip -c backup.sql.gz | psql -h db -U app app
```

## Section C — Fill in the missing code

**C1.** GitHub Actions deploy workflow.

**C2.** Server-side deploy script.

**C3.** Hourly backup cron entry.

**C4.** Backup script that uploads to R2.

**C5.** Healthchecks.io ping (dead-man's switch).

## Section D — Find the bug

**D1.**

```
# Backup runs daily but produces 0-byte files
```

**D2.**

```
Deploy succeeds; app shows old version
```

**D3.**

```
Cert auto-renew failed silently
```

## Section E — Write the code

**E1.** End-to-end restore drill.

**E2.** Document rollback procedure.

**E3.** Add uptime monitoring.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
