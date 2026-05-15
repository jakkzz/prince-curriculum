# Phase 1 Project — `pomo`

A Pomodoro tracker CLI you'll actually use during the rest of the course.

## Deliverable

A public GitHub repo named `pomo` containing a working CLI tool, installable via `uv tool install`, with tests and CI.

## Required commands

```bash
pomo start [--duration MIN] [--tag TAG]
pomo stop
pomo list [--since RANGE]
pomo report [--since RANGE]
pomo --version
pomo --help
```

`RANGE` can be: `today`, `yesterday`, `this-week`, or an ISO date like `2026-01-15`.

## Functional requirements

- [ ] **Start session.** Records `started_at`, `duration_min`, `tag`. Refuses if a session is already running.
- [ ] **Stop session.** Records `ended_at`. Refuses if no session is running. Computes actual duration.
- [ ] **List sessions** in a date range. Output is human-readable, aligned columns.
- [ ] **Report** aggregates sessions by tag, shows totals and counts.
- [ ] **Errors** print to stderr with a useful message and exit non-zero.
- [ ] **Help text** is helpful: a stranger should be able to use the tool from `--help` alone.
- [ ] **Version** prints from `pyproject.toml`, not hardcoded.
- [ ] **SQLite** is at `~/.pomo/pomo.db`. The directory is created if missing.

## Technical requirements

- [ ] Python 3.13+, managed by `uv`.
- [ ] All public functions have type hints. `mypy --strict` passes.
- [ ] `ruff check` and `ruff format --check` pass.
- [ ] `pytest` runs ≥ 20 tests, all pass.
- [ ] Coverage ≥ 80% on the storage and timer modules. Use `coverage` or `pytest-cov`.
- [ ] Tests use fixtures and at least one parametrize.
- [ ] CI runs lint, format-check, type-check, and tests on every PR. All green.
- [ ] `uv tool install --from . pomo` makes `pomo` available globally.
- [ ] README has: install, usage, examples, troubleshooting.
- [ ] `DESIGN.md` written before code, reviewed by mentor.

## Grading rubric

Score 0/1/2 per row. Pass = no zeros, ≥10 twos.

| # | Category | What "2" looks like |
|---|----------|---------------------|
| 1 | **Correctness — happy path** | All commands work end-to-end without errors |
| 2 | **Correctness — error cases** | Invalid inputs handled with friendly messages, not stack traces |
| 3 | **Test coverage** | ≥80% on storage + timer, tests assert behavior |
| 4 | **Test quality** | Good names, fixtures used, edge cases covered |
| 5 | **CI** | Green on every commit on main, blocking merges when red |
| 6 | **Type safety** | `mypy --strict` clean, no `# type: ignore` without comment |
| 7 | **Code organization** | Logical module split, clear responsibilities |
| 8 | **CLI ergonomics** | `--help` is helpful, output is readable, exit codes correct |
| 9 | **Storage** | Schema sensible, no SQL injection, transactional |
| 10 | **README** | A stranger installs and uses the tool from the README alone |
| 11 | **DESIGN.md** | Real design thinking, not retrofitted notes |
| 12 | **Git hygiene** | Atomic commits, branches per feature, PRs reviewed |
| 13 | **Installability** | `uv tool install` actually works, on a fresh machine if needed |
| 14 | **Honesty** | Open issues/TODOs for known limits, no hidden bugs |

## Demo script for the gate

The mentor will ask you to demo this exact flow, with their machine if possible:

```bash
# Fresh install
git clone git@github.com:you/pomo.git
cd pomo
uv tool install --from . pomo

# Use it
pomo --version
pomo start --duration 1 --tag demo
sleep 65
pomo stop
pomo list --since today
pomo report --since today

# Force an error
pomo stop                      # should say "no active session"
pomo start --duration -5       # should say "invalid duration"
```

Each step should work. The error messages should be useful, not stack traces.

## Bonus (not required, +1 to "twos" count)

- Color output via `rich`.
- A `pomo today` shortcut.
- Export to JSON / CSV.
- Published to PyPI.
- A demo gif in the README.

## Common ways this goes wrong

- **No DESIGN.md, or written after.** This is a process check, not a deliverable check. Skipping it means re-doing it.
- **Tests that don't test anything.** `def test_works(): assert True` is a fail.
- **Hidden `subprocess` calls or shell escapes.** Use stdlib `sqlite3` and `pathlib`. No `os.system`.
- **`requirements.txt` instead of `pyproject.toml`.** Phase 1 uses modern tooling.
- **AI-generated code.** See [resources/ai-policy.md](../resources/ai-policy.md). Mentor will ask you to walk the code line by line.

## What submission looks like

PR with the v0.1.0 tag. Message to mentor:

> "`pomo` v0.1.0 ready for gate review. Total ~40 hours over 5 weeks. The trickiest part was getting the SQLite connection handling right — I had a bug where the test DB wasn't being cleaned up, which I wrote up in log/2026-XX-XX.md. Available for live review anytime this week."
