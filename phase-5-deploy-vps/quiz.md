# Phase 5 Quiz

End of Week 3. 60 min. Section E live.

## Section A — Linux & ssh (10)

1. What's the difference between `~/.ssh/id_ed25519` and `~/.ssh/id_ed25519.pub`?
2. What does `chmod 600 file` mean?
3. What's the difference between a user and a group? What does `usermod -aG sudo deploy` do?
4. What does `sudo` need to be configured to allow?
5. How do you set up passwordless ssh between two machines?
6. What does `ufw allow ssh` do?
7. What's `systemd`? What does `systemctl enable --now foo` do?
8. How do you see the last 200 log lines for a service called `nginx`?
9. What does `journalctl --since "1 hour ago"` show?
10. If `df -h` shows your `/` filesystem is 100% full, what are the first three places to look for the culprit?

## Section B — Networking & DNS (10)

1. Walk through DNS resolution for `api.example.com`. Name at least 4 steps.
2. What's an A record? A CNAME? When does each apply?
3. What's a nameserver? Who hosts yours?
4. What's TLS, and what does a certificate prove?
5. What's the difference between Cloudflare DNS-only mode and proxy mode?
6. What does Cloudflare "Full (strict)" SSL mode require on your origin?
7. What does HSTS do?
8. What's a reverse proxy? Why do we put nginx in front of FastAPI?
9. What's an MX record?
10. What does `dig +trace example.com` show that `dig example.com` doesn't?

## Section C — Deployment (10)

1. What's a "blue/green" deploy?
2. What's a rolling deploy?
3. What's the safest way to run a DB migration during a deploy?
4. Why use systemd over `nohup` or `tmux`?
5. What's a Docker layer cache? How do you write a Dockerfile that uses it well?
6. What does `docker compose up -d` do? Why `-d`?
7. What's a healthcheck in Docker / compose?
8. Why have a separate `deploy` user from the user running the app?
9. What's a Twelve-Factor app principle relevant to config?
10. Why store the deploy script in the repo, not just on the server?

## Section D — Backups & monitoring (5)

1. What's a "tested backup"? What's an untested backup?
2. What's the difference between an alert and a metric?
3. What does Healthchecks.io watch for, vs UptimeRobot?
4. RTO vs RPO — define each in one sentence.
5. Where should backups NOT be stored?

## Section E — Live (90 min)

The mentor watches as you:

1. Provision a fresh VPS (from a clean Ubuntu image).
2. Create the deploy user, disable root, harden ssh.
3. Configure ufw + fail2ban.
4. Install nginx + docker.
5. Pull and run `questly`.
6. Configure DNS for a test subdomain (mentor-provided).
7. Issue a TLS cert.
8. Reach the API via the public subdomain over HTTPS.

Time limit: 2 hours. Mentor doesn't help. You can read docs but not pre-written notes.

If you finish faster: also demo a backup-restore.

---

**Scoring:**
- A–D: 35 questions, 1 each. Need 28+.
- E: pass/fail.
