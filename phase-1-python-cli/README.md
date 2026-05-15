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

### Week 1 — Language basics (complete ✅)

| # | Day | Lesson | Mini-project | Quiz (student) |
|---|-----|--------|--------------|----------------|
| 0 | Setup | [00-setup-environment.md](lessons/00-setup-environment.md) | (`uv init english-helper`) | — |
| 1 | Hello Python | [01-hello-python.ipynb](lessons/01-hello-python.ipynb) | `vocab_card.py` | [Day 1 Quiz](lessons/01-hello-python-quiz.ipynb) (35 Q) |
| 2 | Types & values | [02-types-and-values.ipynb](lessons/02-types-and-values.ipynb) | `word_list.py` | [Day 2 Quiz](lessons/02-types-and-values-quiz.ipynb) (36 Q) |
| 3 | Control flow | [03-control-flow.ipynb](lessons/03-control-flow.ipynb) | `pronunciation_quiz.py` | [Day 3 Quiz](lessons/03-control-flow-quiz.ipynb) (35 Q) |
| 4 | Functions | [04-functions.ipynb](lessons/04-functions.ipynb) | `dictionary.py` | [Day 4 Quiz](lessons/04-functions-quiz.ipynb) (35 Q) |
| 5 | Lists, dicts, sets, JSON | [05-lists-dicts-sets.ipynb](lessons/05-lists-dicts-sets.ipynb) | `vocab_app.py` (first persistent build) | [Day 5 Quiz](lessons/05-lists-dicts-sets-quiz.ipynb) (35 Q) |

### Weeks 2–5 — Pending rewrite into new format

| # | Week | Topic | Legacy file | Outcome |
|---|------|-------|-------------|---------|
| 6–10 | 2 | `requests`, JSON, files, modules | [week-2-functions-data.md](lessons/week-2-functions-data.md) | english-helper hits Free Dictionary API for real definitions |
| 11–15 | 3 | Classes, dataclasses, modules | [week-3-classes-modules.md](lessons/week-3-classes-modules.md) | Refactor to OOP — `Word`, `WordStore`, `SRSScheduler` |
| 16–20 | 4 | Testing with pytest, TDD | [week-4-testing-tdd.md](lessons/week-4-testing-tdd.md) | 80%+ coverage on english-helper |
| 21–25 | 5 | Build & ship | [week-5-build-project.md](lessons/week-5-build-project.md) | Ship `english-helper` AND the `pomo` capstone |

> **Format notes.** Notebook lessons open in VS Code (built-in `.ipynb` support), Jupyter Lab (`uv run --with jupyter jupyter lab`), or Google Colab (badge at top of each notebook).
>
> **Quiz separation.** Student quizzes (`*-quiz.ipynb`) have questions only. Mentor-only answer notebooks (`*-quiz-answers.ipynb`) live in the mentor repo and are stripped automatically by `publish-learner-repo.sh`. Auto-generated via `instructor-guide/tools/strip-quiz-answers.py`.

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
