# Week 5 — Build the `pomo` CLI

**Goal:** Ship the project. Installable, tested, documented, CI green.

This week is mostly building. The lesson is short — most of your time goes into the project itself.

## Day 1 — Plan it

Before you write code, write a `DESIGN.md` in the repo. It should answer:

1. **What does the tool do?** (Pomodoro tracker — start, stop, list, report sessions.)
2. **What's a session?** (Fields, types, constraints.)
3. **How is data stored?** (SQLite file at `~/.pomo/pomo.db`.)
4. **What are the commands?** (List them with example invocations.)
5. **What are the error cases?** (No active session when stopping. Invalid duration. DB file unreadable.)
6. **What's out of scope?** (Sync, accounts, web UI.)

Get the mentor to read it before you code. **Half an hour on the design saves 5 hours of refactoring.**

## Day 2 — Skeleton + storage

Implement the SQLite-backed storage layer. TDD:

1. Write `tests/test_storage.py` first.
2. Implement `storage.py` to make tests pass.
3. Refactor.

The schema you start with:

```sql
CREATE TABLE IF NOT EXISTS sessions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    started_at TEXT NOT NULL,        -- ISO 8601
    ended_at TEXT,                   -- NULL = still running
    duration_min INTEGER NOT NULL,
    tag TEXT
);
```

Use the stdlib `sqlite3` — no ORM yet. ORMs come in Phase 3.

## Day 3 — CLI surface

Implement the CLI with `argparse`:

```bash
pomo start --duration 25 --tag reading
pomo stop
pomo list --since today
pomo report --since "7 days ago"
```

Use `argparse.ArgumentParser` with subparsers. Read the [argparse tutorial](https://docs.python.org/3/howto/argparse.html) if you haven't.

## Day 4 — Polish

Things that turn a script into a tool:

- **`--help` for every subcommand.** Test it. Read what it says. Is it useful?
- **Exit codes.** Success = 0. Errors = 1+. Document them in the README.
- **`--version`.** Should print the version from `pyproject.toml`.
- **Color output** *(stretch)*. Use `rich` if you want — but make it opt-in / TTY-detected.
- **A README** that shows install + 3 example sessions.

## Day 5 — Ship it

Make it installable globally:

```bash
uv tool install --from . pomo
pomo --help            # from anywhere on your system
```

(`uv tool install` is uv's `pipx`.)

Confirm:
- It works in a fresh terminal.
- It works in a directory that isn't your project.
- It still works if you `rm -rf` your project (the install is independent).

Re-publish to GitHub with a v0.1.0 tag:

```bash
git tag -a v0.1.0 -m "First release"
git push origin v0.1.0
```

Then submit for the gate review.

## Stretch challenges (only if Days 1–5 done with time to spare)

- Add an `export` command: dumps sessions to JSON or CSV.
- Add a `today` shortcut: `pomo today` shows sessions started today.
- Add a TUI dashboard with `rich.live` showing a live timer.
- Distribute via PyPI: `uv publish`.

## What "done" feels like

```bash
$ pomo start --duration 25 --tag "phase-1 review"
Started session #14 — 25 min — tag: phase-1 review

$ pomo stop
Stopped session #14 — duration: 25 min

$ pomo report --since today
Today:
  reading       50 min
  phase-1 review  25 min
  ---
  total          75 min  (3 sessions)
```

When you can do that, in a fresh terminal, on someone else's machine if needed — you've finished Phase 1.
