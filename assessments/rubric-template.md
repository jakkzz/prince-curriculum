# Grading Rubric Template

Every milestone project uses a variant of this rubric. Each category is scored 0/1/2:

- **0 — Not met.** Missing or broken.
- **1 — Partially met.** Works but with notable gaps.
- **2 — Fully met.** Works and is well-executed.

A phase gate requires **all categories at 1+ and at least 70% of categories at 2**. Anything below is a re-do, not a fail.

## Universal categories (every project)

| # | Category | What "2" looks like |
|---|----------|---------------------|
| 1 | **Correctness** | All required features work for the happy path AND documented edge cases |
| 2 | **Tests** | Tests exist, pass, and cover behavior (not just lines). Failing tests fail loudly |
| 3 | **Code quality** | Clear names, no dead code, no commented-out blocks, formatter clean |
| 4 | **Git hygiene** | Atomic commits, clear messages, no force-pushes, PR has description |
| 5 | **README** | Someone unfamiliar can run the project in under 10 minutes following the README |
| 6 | **Honesty** | Acknowledges what's incomplete or known-broken. No false claims of "works" |

## Phase-specific categories

Added on top of the universal six. See each phase's `project.md` for its full rubric.

## Anti-patterns that drop a category to 0

- Tests that don't actually assert anything.
- "Fixed by deleting the failing test."
- Secrets committed to the repo.
- Code that was clearly AI-generated and not understood (before Phase 7).
- README claims that don't match reality.
