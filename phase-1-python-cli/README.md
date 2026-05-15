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

## Lesson order — all 25 days complete ✅

### Week 1 — Language basics (Days 1–5)

| # | Day | Mini-project | Lesson | Quiz |
|---|-----|-------------|--------|------|
| 0 | Setup | `uv init english-helper` | [00-setup-environment.md](lessons/00-setup-environment.md) | — |
| 1 | `vocab_card.py` | f-strings, math | [01](lessons/01-hello-python.ipynb) | [Q](lessons/01-hello-python-quiz.ipynb) |
| 2 | `word_list.py` | types, type hints | [02](lessons/02-types-and-values.ipynb) | [Q](lessons/02-types-and-values-quiz.ipynb) |
| 3 | `pronunciation_quiz.py` | if/for/while, input | [03](lessons/03-control-flow.ipynb) | [Q](lessons/03-control-flow-quiz.ipynb) |
| 4 | `dictionary.py` | functions, errors | [04](lessons/04-functions.ipynb) | [Q](lessons/04-functions-quiz.ipynb) |
| 5 | `vocab_app.py` (persistent) | dicts, sets, JSON | [05](lessons/05-lists-dicts-sets.ipynb) | [Q](lessons/05-lists-dicts-sets-quiz.ipynb) |

### Week 2 — Going online (Days 6–10)

| # | Topic | Lesson | Quiz |
|---|-------|--------|------|
| 6 | Modules & package structure | [06](lessons/06-modules.ipynb) | [Q](lessons/06-modules-quiz.ipynb) |
| 7 | HTTP & `requests` | [07](lessons/07-http-requests.ipynb) | [Q](lessons/07-http-requests-quiz.ipynb) |
| 8 | JSON parsing, defensive code | [08](lessons/08-json-parsing.ipynb) | [Q](lessons/08-json-parsing-quiz.ipynb) |
| 9 | File caching | [09](lessons/09-caching.ipynb) | [Q](lessons/09-caching-quiz.ipynb) |
| 10 | Wire it all together — Free Dictionary API live | [10](lessons/10-wire-it-together.ipynb) | [Q](lessons/10-wire-it-together-quiz.ipynb) |

### Week 3 — OOP refactor (Days 11–15)

| # | Topic | Lesson | Quiz |
|---|-------|--------|------|
| 11 | Classes basics, dunder methods | [11](lessons/11-classes-basics.ipynb) | [Q](lessons/11-classes-basics-quiz.ipynb) |
| 12 | `@dataclass`, frozen, field | [12](lessons/12-dataclasses.ipynb) | [Q](lessons/12-dataclasses-quiz.ipynb) |
| 13 | Properties, inheritance, ABCs | [13](lessons/13-properties-inheritance.ipynb) | [Q](lessons/13-properties-inheritance-quiz.ipynb) |
| 14 | Full OOP refactor of english-helper | [14](lessons/14-oop-refactor.ipynb) | [Q](lessons/14-oop-refactor-quiz.ipynb) |
| 15 | Spaced repetition scheduler | [15](lessons/15-spaced-repetition.ipynb) | [Q](lessons/15-spaced-repetition-quiz.ipynb) |

### Week 4 — Testing & TDD (Days 16–20)

| # | Topic | Lesson | Quiz |
|---|-------|--------|------|
| 16 | pytest basics | [16](lessons/16-pytest-basics.ipynb) | [Q](lessons/16-pytest-basics-quiz.ipynb) |
| 17 | TDD — red/green/refactor | [17](lessons/17-tdd.ipynb) | [Q](lessons/17-tdd-quiz.ipynb) |
| 18 | Fixtures, conftest.py | [18](lessons/18-fixtures.ipynb) | [Q](lessons/18-fixtures-quiz.ipynb) |
| 19 | Mocking (monkeypatch, MagicMock) | [19](lessons/19-mocks.ipynb) | [Q](lessons/19-mocks-quiz.ipynb) |
| 20 | Coverage + CI (GitHub Actions) | [20](lessons/20-coverage.ipynb) | [Q](lessons/20-coverage-quiz.ipynb) |

### Week 5 — Ship (Days 21–25)

| # | Topic | Lesson | Quiz |
|---|-------|--------|------|
| 21 | argparse, CLI design | [21](lessons/21-argparse.ipynb) | [Q](lessons/21-argparse-quiz.ipynb) |
| 22 | Packaging, `uv tool install` | [22](lessons/22-packaging.ipynb) | [Q](lessons/22-packaging-quiz.ipynb) |
| 23 | Pomo capstone — design & storage (SQLite) | [23](lessons/23-pomo-capstone-design.ipynb) | [Q](lessons/23-pomo-capstone-design-quiz.ipynb) |
| 24 | Pomo capstone — CLI & ship | [24](lessons/24-pomo-capstone-ship.ipynb) | [Q](lessons/24-pomo-capstone-ship-quiz.ipynb) |
| 25 | Phase 1 retrospective + gate prep | [25](lessons/25-phase-1-retro.ipynb) | — |

**Total:** 25 lesson notebooks + 24 quizzes × 35 questions = **840 quiz questions** across Phase 1. Each day ships one piece of `english-helper`. Day 23-24 build `pomo` (the capstone). Day 25 is retrospective + gate prep.

### Format

Notebook lessons open in **VS Code** (built-in support), **Jupyter Lab** (`uv run --with jupyter jupyter lab`), or **Google Colab** (badge at top of each notebook).

**Quiz separation:** student quizzes (`*-quiz.ipynb`) have questions only. Mentor-only answer notebooks (`*-quiz-answers.ipynb`) live in the mentor repo and are auto-stripped by `publish-learner-repo.sh`. Generated via `instructor-guide/tools/strip-quiz-answers.py`.

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
