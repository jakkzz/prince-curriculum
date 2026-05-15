# Phase 5 Resources

## Required reading

- [DigitalOcean — Initial Server Setup with Ubuntu](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-22-04) — applies to Hetzner too.
- [Mozilla SSL Configuration Generator](https://ssl-config.mozilla.org/) — use the "Modern" config for nginx.
- [Cloudflare Learning Center — DNS](https://www.cloudflare.com/learning/dns/what-is-dns/)
- [Let's Encrypt — Getting Started](https://letsencrypt.org/getting-started/)
- [12-Factor App](https://12factor.net/) — read the whole thing. Takes 30 min, lasts a career.

## Recommended

- [The Modern Way to Deploy Web Apps (fly.io blog)](https://fly.io/blog/) — opinionated and good.
- [systemd by example](https://systemd-by-example.com/)
- [PostgreSQL Backup Best Practices](https://www.postgresql.org/docs/current/backup.html) — official, dense but accurate.

## Reference

- [`ufw` cheat sheet](https://help.ubuntu.com/community/UFW)
- [`fail2ban` quick start](https://www.fail2ban.org/wiki/index.php/Manual)
- [Cloudflare DNS records reference](https://developers.cloudflare.com/dns/manage-dns-records/reference/dns-record-types/)
- [GitHub Actions docs](https://docs.github.com/en/actions)

## Tools you'll actually use

- [Hetzner Cloud](https://www.hetzner.com/cloud) or [DigitalOcean](https://www.digitalocean.com/) — your VPS.
- [Cloudflare](https://www.cloudflare.com/) — DNS, CDN, certs.
- [Cloudflare R2](https://www.cloudflare.com/developer-platform/products/r2/) or [Backblaze B2](https://www.backblaze.com/cloud-storage) — backup storage.
- [UptimeRobot](https://uptimerobot.com/) — free uptime monitoring.
- [Healthchecks.io](https://healthchecks.io/) — free cron monitoring.

## Skip these for now

- Kubernetes. You have one server. K8s is for many.
- Terraform. Worth learning, not yet. Phase 6 if it comes up.
- Helm. Same.
- Service meshes. No.
- DataDog/New Relic at $$. Free tools suffice for this scale.

## When stuck

- `sudo journalctl -xe` — tells you most things.
- `nginx -t` — tests config before reload.
- `curl -v https://your-domain.com` — shows the TLS handshake and headers.
- [resources/troubleshooting.md](../resources/troubleshooting.md) — Phase 5 section especially.
