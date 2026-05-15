# Troubleshooting Guide

When stuck, read this first. Many things that feel like programming problems are environment problems.

## Before asking for help

Run through this list. ~80% of issues resolve here.

1. **Read the actual error message.** All of it. Including the last 5 lines you skipped.
2. **What did you change last?** Revert it. Does the problem go away?
3. **Restart the thing.** Dev server, terminal, Docker, your computer.
4. **Check the obvious.** Is the server running? Are you on the right branch? Are you in the right directory? Did you save the file?
5. **Search for the error message in quotes.** Not your interpretation of it — the literal string.
6. **Diff against a known-working commit.** `git diff HEAD~1`.

If you're still stuck after 30 minutes, write up the issue as below, *then* ask.

## How to ask for help (the template)

```
**What I'm trying to do:** one sentence.
**What I expected:** one sentence.
**What actually happened:** one sentence + the literal error message.
**Minimal repro:** the smallest code that triggers it.
**What I tried:** bulleted list.
**Versions:** OS, Python/Node, relevant package versions.
```

If writing this up makes you realize the answer, that's the point.

## Common gotchas by phase

### Phase 0–1 (Python)

- **`command not found: python`** — On macOS the binary is `python3`, not `python`. Use `uv run python` once you have `uv` set up.
- **`ModuleNotFoundError`** — You probably aren't in your virtualenv. `which python` and check.
- **"It works in the REPL but not in the script"** — You're importing from the wrong place, or your file shadows a stdlib name (don't name a file `email.py`).
- **`pip install` permission errors** — You're installing globally. Use `uv` or activate a venv first.

### Phase 2 (Web)

- **CSS not applying** — Hard reload (`Cmd+Shift+R`). Or your selector is more specific than you think; check devtools.
- **Form submits and reloads the page** — `event.preventDefault()` missing.
- **CORS error** — The browser is blocking; the server has to send `Access-Control-Allow-Origin`. Not a client fix.
- **"Why is my SQL slow?"** — `EXPLAIN ANALYZE`. Look for `Seq Scan` on a large table = missing index.

### Phase 3 (FastAPI)

- **`422 Unprocessable Entity`** — Your request body doesn't match the Pydantic model. The response tells you which field.
- **`401` on a request that should be authenticated** — `Authorization: Bearer <token>` header missing or malformed.
- **`Address already in use`** — Another process is on port 8000. `lsof -i :8000` and kill it.
- **Tests pass locally, fail in CI** — Almost always database state, env vars, or timezone.

### Phase 4 (Next.js)

- **"Hydration mismatch"** — Server rendered one thing, client rendered another. Usually a `Date.now()`, `Math.random()`, or `window` reference in a server component.
- **`useState` is not a function** — You forgot `"use client"` at the top of the file.
- **API calls work in dev, fail in prod** — Hardcoded `localhost` URL. Use an env var.
- **Tailwind classes don't apply** — Class name was constructed dynamically (`bg-${color}-500`). Tailwind can't see it. Use a full class name or safelist.

### Phase 5 (VPS / DNS)

- **`ssh: connection refused`** — Server isn't running, or firewall blocks the port, or you're using the wrong port.
- **DNS changes "aren't working"** — Propagation. Check with `dig +trace your-domain.com` not your browser.
- **HTTPS shows a warning** — Certificate is for the wrong name, or expired, or Cloudflare is set to "Flexible" mode (which is misconfigured — use "Full (strict)").
- **502 Bad Gateway** — nginx is up, your app is down. `journalctl -u your-app -f`.
- **App "uses 100% CPU" after deploy** — Probably an infinite loop on startup, or it's actually fine and `top` lied to you. Check `journalctl`.

### Phase 6 (Production)

- **"It works for me but a user says it's broken"** — Different timezone, different browser, different network, different account state. Get a screenshot AND the time AND their user ID.
- **Database disk filling up** — Logs in the database. Move logs to a file or a service.
- **Cron job didn't run** — Check `journalctl -u cron` (or `systemctl list-timers` if you're on `systemd` timers).

### Phase 7 (AI)

- **LLM "ignored my instructions"** — Your system prompt is being overridden by user content. Reorder. Use stronger delimiters.
- **Costs spiraling** — Caching disabled, or you're not measuring. Add a per-request cost log on day 1.
- **Eval set is "100% passing" but real users complain** — Your eval set isn't representative. Add the user's actual failed input to the eval set.
- **Vector search returns garbage** — Chunk size is wrong, or you're embedding queries with one model and docs with another.

## When to escalate to the mentor

- After you've gone through this doc.
- After you've spent 30+ minutes on a single error.
- After you've written the help template above and it didn't unblock you.
- If you're about to do something destructive (`git reset --hard`, `DROP TABLE`, `rm -rf`) and you're not 100% sure.
