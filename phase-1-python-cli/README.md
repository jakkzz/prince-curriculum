# Phase 1 — Python & CLI Foundations

**Duration:** 5 weeks
**Prerequisites:** Phase 0 gate passed.

## Why this phase exists

Python is the world's best first language to be *productive* in. We use it to:
1. Build solid fundamentals (variables, control flow, functions, data structures, classes, errors).
2. Learn to think about programs at the scale of a few hundred lines.
3. Ship a real command-line tool with tests — proving you can build software, not just write code.

## Learning objectives

By the end of this phase, the learner can:

1. Write Python that someone else can read without confusion.
2. Use type hints (`mypy`-strict mode).
3. Manage Python projects with `uv` — virtualenvs, dependencies, lockfiles.
4. Write unit tests with `pytest` and use TDD on small features.
5. Use `argparse` (or `click`) to build a usable CLI.
6. Handle errors deliberately — knowing when to catch, when to let propagate.
7. Read a stack trace and explain what each frame did.
8. Reason about list/dict/set time complexity (Big-O intuition).

## Lesson order

| # | Day | File | Format | Status |
|---|-----|------|--------|--------|
| 0 | Setup | [00-setup-environment.md](lessons/00-setup-environment.md) | Markdown | ✅ New format |
| 1 | Hello Python | [01-hello-python.ipynb](lessons/01-hello-python.ipynb) | Jupyter notebook | ✅ New format |
| 2 | Types and values | [02-types-and-values.ipynb](lessons/02-types-and-values.ipynb) | Jupyter notebook | ✅ New format |
| 3 | Control flow | _coming soon_ | Jupyter notebook | 🛠️ In progress |
| 4 | Functions | _coming soon_ | Jupyter notebook | 🛠️ In progress |
| 5 | Lists, dicts, sets | _coming soon_ | Jupyter notebook | 🛠️ In progress |
| 6–10 | Week 2 — Functions, data | [week-2-functions-data.md](lessons/week-2-functions-data.md) | Markdown | 📜 Legacy — pending rewrite |
| 11–15 | Week 3 — Classes, modules | [week-3-classes-modules.md](lessons/week-3-classes-modules.md) | Markdown | 📜 Legacy — pending rewrite |
| 16–20 | Week 4 — Testing, TDD | [week-4-testing-tdd.md](lessons/week-4-testing-tdd.md) | Markdown | 📜 Legacy — pending rewrite |
| 21–25 | Week 5 — Build the project | [week-5-build-project.md](lessons/week-5-build-project.md) | Markdown | 📜 Legacy — pending rewrite |

> **Note on format:** Lessons 01–05 are Jupyter notebooks — runnable, with pre-rendered output. Open in **VS Code** (has built-in notebook support), **Jupyter Lab** (`uv run --with jupyter jupyter lab`), or **Google Colab** (badge in each notebook).
>
> Lessons 06+ are still in the older single-file-per-week format. They'll be rewritten in the same notebook style soon.

## Gate criteria

See [../assessments/gate-criteria.md#phase-1-gate-python-cli](../assessments/gate-criteria.md). Summary: write a small function with a test from scratch in 15 minutes; explain your own CLI codebase; add a new subcommand live.

## Project

[project.md](project.md) — **`pomo`**, a personal Pomodoro tracker CLI. Tracks sessions, generates reports, persists to a local SQLite file. Tested. Documented. Installable.

## Quiz

End of Week 3. See [quiz.md](quiz.md).

## Tools added this phase

- `uv` — fast Python project manager.
- `ruff` — linter + formatter.
- `pytest` — test framework.
- `mypy` — static type checker.

That's it. Resist installing 17 packages "just in case."

## What the mentor watches for

- Are functions short, named for what they do, and one job each?
- Do tests assert behavior or just "ran without crashing"?
- Are commit messages still meaningful?
- Did they actually understand `pdb`, or do they keep adding `print` everywhere?
- Are they reading stack traces top-down (their code) or bottom-up (library noise)?
