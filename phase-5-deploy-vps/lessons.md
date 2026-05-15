# Phase 5 Lessons

---

## Week 1 — VPS and Linux fundamentals

### Day 1 — Pick a VPS, ssh in

Recommended: **Hetzner CX11** (Germany or Finland) or **DigitalOcean basic droplet**. Both ~$4–6/mo.

- Create an account.
- Add your existing SSH public key (from Phase 0).
- Spin up an Ubuntu 24.04 LTS instance.
- ssh in as `root@<ip>`. You're on a real server.

```bash
ssh root@<ip>
uname -a            # what am I running?
df -h               # disk space
free -m             # memory
top                 # processes
```

### Day 2 — Stop being root

Never operate as root. Create a real user with sudo:

```bash
adduser deploy                       # create user, set password
usermod -aG sudo deploy
mkdir -p /home/deploy/.ssh
cp ~/.ssh/authorized_keys /home/deploy/.ssh/
chown -R deploy:deploy /home/deploy/.ssh
chmod 700 /home/deploy/.ssh
chmod 600 /home/deploy/.ssh/authorized_keys
```

ssh out, ssh back in as `deploy@<ip>`. Test sudo: `sudo whoami` → root.

Disable root ssh and password auth. Edit `/etc/ssh/sshd_config`:

```
PermitRootLogin no
PasswordAuthentication no
```

```bash
sudo systemctl restart ssh
```

**Before you close this terminal:** open a SECOND ssh session as `deploy` to confirm it works. If both are open and `deploy` ssh works, you're safe.

### Day 3 — The firewall

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw enable        # ufw warns about ssh — make sure ssh is allowed first
sudo ufw status verbose
```

You can now reach the server only on ports 22, 80, 443.

Add `fail2ban` for ssh brute-force protection:

```bash
sudo apt install fail2ban
# defaults are sane; nothing else needed
sudo systemctl status fail2ban
```

### Day 4 — systemd

`systemd` runs services on Linux. Every long-running process should be a systemd unit.

A minimal unit (for now — a placeholder echo loop):

```ini
# /etc/systemd/system/hello.service
[Unit]
Description=hello world

[Service]
ExecStart=/bin/sh -c 'while true; do date; sleep 5; done'
Restart=always
User=deploy

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now hello.service
sudo journalctl -u hello.service -f       # follow logs
sudo systemctl stop hello.service
```

Master `systemctl` (start, stop, status, restart, enable, disable) and `journalctl` (`-u`, `-f`, `-n 100`, `--since`).

### Day 5 — Run the API on the server

Manually get `questly` running on the VPS via Docker (no domain yet):

```bash
sudo apt install docker.io docker-compose-plugin
sudo usermod -aG docker deploy
# log out and back in for group change

git clone git@github.com:you/questly.git
cd questly
docker compose up -d
```

Reach the API via ssh tunnel from your laptop:
```bash
ssh -L 8000:localhost:8000 deploy@<ip>
# now http://localhost:8000 on your laptop hits the server's API
```

This proves the app runs. Next week, expose it to the public web.

---

## Week 2 — Domain, DNS, nginx, TLS

### Day 1 — Buy a domain

Pick a registrar. Cloudflare Registrar is cheapest if you'll use Cloudflare DNS (which we will). Porkbun is also fine.

Buy a domain you can live with for a year. Mentor approval first — picking a forever-name takes thought.

### Day 2 — Cloudflare DNS

Add your domain to Cloudflare (free plan):
- They give you nameservers.
- Update your registrar to use them.
- Wait for propagation (minutes to hours).

Add an `A` record: `@` (or `api`) → your VPS IP. **Set proxy mode to DNS-only (gray cloud) for now** — we'll deal with proxy mode later.

Verify:
```bash
dig +short api.your-domain.com
```
Should return the VPS IP.

### Day 3 — nginx as a reverse proxy

```bash
sudo apt install nginx
sudo systemctl enable --now nginx
```

Visit `http://api.your-domain.com` — you should see the nginx default page.

Configure:
```nginx
# /etc/nginx/sites-available/questly-api
server {
    listen 80;
    server_name api.your-domain.com;

    location / {
        proxy_pass http://localhost:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

```bash
sudo ln -s /etc/nginx/sites-available/questly-api /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

Visit `http://api.your-domain.com` — now you reach FastAPI.

### Day 4 — TLS with certbot

```bash
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d api.your-domain.com
```

Walk through the prompts. certbot edits your nginx config to add the cert and redirect HTTP→HTTPS.

Verify auto-renew is set:
```bash
sudo systemctl list-timers | grep certbot
sudo certbot renew --dry-run
```

Visit `https://api.your-domain.com` — green lock.

### Day 5 — Cloudflare proxy mode

Flip the DNS record to proxy mode (orange cloud). Now traffic passes through Cloudflare.

In Cloudflare SSL/TLS settings:
- **Mode:** Full (strict). NOT "Flexible" — that's a security antipattern.
- Generate an **Origin Certificate** (lasts 15 years, only valid for Cloudflare → your origin).
- Replace certbot's cert with the Cloudflare origin cert on the server (optional but cleaner).

You now have:
- End-to-end TLS (laptop → Cloudflare → origin).
- Cloudflare absorbing DDoS and bot traffic for free.
- Caching for static assets (set up rules in Cloudflare).

---

## Week 3 — Deployment, CI, backups

### Day 1 — A real deploy script

`bin/deploy.sh` on the server:

```bash
#!/usr/bin/env bash
set -euo pipefail
cd /home/deploy/questly
git fetch --tags
git checkout "$1"            # version tag, e.g. v0.2.0
docker compose pull
docker compose up -d --build
docker compose exec -T api alembic upgrade head
docker compose ps
```

Run manually from the server first. Verify it works.

### Day 2 — GitHub Actions deploy

```yaml
# .github/workflows/deploy.yml
name: deploy

on:
  push:
    tags: ['v*']

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: appleboy/ssh-action@v1.0.3
        with:
          host: ${{ secrets.DEPLOY_HOST }}
          username: deploy
          key: ${{ secrets.DEPLOY_KEY }}
          script: bash /home/deploy/questly/bin/deploy.sh ${{ github.ref_name }}
```

Create a dedicated **deploy SSH key**, put the public half in `~deploy/.ssh/authorized_keys` on the server (restricted to running the deploy script via `command="..."` if you want), private half in GitHub Actions secrets.

`git tag v0.2.0 && git push origin v0.2.0` → site updates.

### Day 3 — Database backups

Hourly `pg_dump`, daily upload to a cloud bucket. Use Cloudflare R2 (cheap, S3-compatible).

```bash
#!/usr/bin/env bash
# /home/deploy/bin/backup.sh
set -euo pipefail
TS=$(date -u +%Y%m%dT%H%M%S)
docker compose exec -T db pg_dump -U questly -d questly | gzip > "/tmp/questly-$TS.sql.gz"
aws --endpoint-url $R2_ENDPOINT s3 cp "/tmp/questly-$TS.sql.gz" "s3://my-bucket/questly/"
rm "/tmp/questly-$TS.sql.gz"
```

Cron:
```cron
0 * * * * /home/deploy/bin/backup.sh >> /home/deploy/backup.log 2>&1
```

### Day 4 — RESTORE the backup

This is the part everyone skips. Don't.

1. Pick a backup file.
2. Spin up a second `db` container locally.
3. Restore the file: `gunzip -c file.sql.gz | psql -h ... -U questly questly`
4. Connect with `psql` and `SELECT count(*) FROM users;` — does the count match what you expect?
5. Document the steps in `runbooks/restore-from-backup.md`.

**A backup you haven't tested is not a backup.** Test it now and at least every 3 months thereafter.

### Day 5 — Status page and uptime

Sign up for [Healthchecks.io](https://healthchecks.io/) (free tier). Configure your backup cron to ping it on success. If the ping doesn't come in, you get an email.

Sign up for [UptimeRobot](https://uptimerobot.com/) (free). Add monitors for:
- `https://api.your-domain.com/health` — 1 min interval.
- `https://your-domain.com` (the Next.js frontend, deployed to Vercel/CF).

---

## Week 4 — Production polish

### Day 1 — Log aggregation

You don't need to install Loki/Grafana right now, but you do need to make logs queryable.

Option A: keep things simple — `journalctl -u nginx`, `docker logs questly-api`. Document the most common queries in the runbook.

Option B (stretch): pipe logs into [Better Stack Logtail](https://betterstack.com/logtail) (free tier) or similar.

### Day 2 — Metrics and dashboards

Stretch — add Prometheus scrape and a simple Grafana dashboard, or use a hosted equivalent. Don't over-invest; you have one server.

### Day 3 — A runbook

Write `runbook.md` covering:
1. **Common operations:** deploy a version, roll back, view logs, restart a service.
2. **Outage playbook:** "API is down, what do I check?" — 5 numbered steps.
3. **Backup operations:** how to take an ad-hoc backup, how to restore.
4. **Adding capacity:** when to upgrade VPS size, how to migrate DB.
5. **Emergency contacts:** who to call (mentor) for a 3am outage.

This is what makes you ready for Phase 6.

### Day 4 — Frontend deploy

Connect the Phase 4 frontend to the now-public API. Update the production env var `NEXT_PUBLIC_API_URL=https://api.your-domain.com`. Redeploy on Vercel/CF Pages.

The full app is live. Send the URL to a friend. Get them to register.

### Day 5 — Gate prep

Practice the gate flow. Be ready to:
1. Provision a fresh VPS while the mentor watches and have it serving HTTPS in under 2 hours.
2. Take a backup, blow away the DB, restore from the backup.
3. `git tag` a release and watch it deploy.
