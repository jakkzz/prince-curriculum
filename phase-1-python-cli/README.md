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

## The running project — `english-helper`

Phase 1 has a single tool you build piece by piece, one mini-project per day. By Week 5 you have a real CLI for studying English: vocabulary cards, IPA pronunciation, audio playback, daily quizzes, real definitions from the Free Dictionary API.

📖 **See [lessons/RUNNING-PROJECT.md](lessons/RUNNING-PROJECT.md)** for the full arc.

## Daily structure

Each day has three pieces:

1. **Lesson** — concepts (`.ipynb` notebook or `.md`, ~90 min)
2. **Mini-project** — a chunk of `english-helper` you ship (~45 min)
3. **Quiz** — 30+ questions to confirm fluency (~45 min)

You can't move to tomorrow until today's mini-project is committed and the quiz is passed.

## Lesson order

| # | Day | Lesson | Mini-project | Quiz |
|---|-----|--------|--------------|------|
| 0 | Setup | [00-setup-environment.md](lessons/00-setup-environment.md) | (`uv init english-helper`) | — |
| 1 | Hello Python | [01-hello-python.ipynb](lessons/01-hello-python.ipynb) | `vocab_card.py` | [01-quiz](lessons/01-hello-python-quiz.ipynb) (35 Q) |
| 2 | Types & values | [02-types-and-values.ipynb](lessons/02-types-and-values.ipynb) | `word_list.py` | [02-quiz](lessons/02-types-and-values-quiz.ipynb) (36 Q) |
| 3 | Control flow | _coming soon_ | `pronunciation_quiz.py` | _coming soon_ |
| 4 | Functions | _coming soon_ | `dictionary.py` | _coming soon_ |
| 5 | Lists, dicts, sets | _coming soon_ | `vocab_app.py` | _coming soon_ |
| 6–10 | Week 2 — `requests`, JSON, files | [week-2-functions-data.md](lessons/week-2-functions-data.md) (legacy) | Free Dictionary API integration | — |
| 11–15 | Week 3 — Classes, modules | [week-3-classes-modules.md](lessons/week-3-classes-modules.md) (legacy) | Refactor with dataclasses + classes | — |
| 16–20 | Week 4 — Testing & TDD | [week-4-testing-tdd.md](lessons/week-4-testing-tdd.md) (legacy) | Test the whole tool | — |
| 21–25 | Week 5 — Build & ship | [week-5-build-project.md](lessons/week-5-build-project.md) (legacy) | Ship `english-helper` + `pomo` | — |

> **Format notes.** Notebook lessons open in VS Code (built-in support), Jupyter Lab (`uv run --with jupyter jupyter lab`), or Google Colab (badge at top of each notebook). Days 3–5 lessons + quizzes are still being converted; for now, follow the legacy `week-N-*.md` files at the bottom of the table.

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
