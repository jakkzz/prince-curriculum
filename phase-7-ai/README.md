# Phase 7 — AI Integration (Capstone)

**Duration:** 4 weeks
**Prerequisites:** Phase 6 gate passed.

## Why this phase exists

By now the learner can build real software. This phase teaches them to add AI features **responsibly** — with evaluations, cost awareness, prompt injection thinking, and judgment about when an LLM is the right tool vs. wrong tool.

**This is the first phase where AI coding tools are also unlocked.** The learner is finally ready to use them as a tool, not a crutch.

## Learning objectives

By the end of this phase, the learner can:

1. Call an LLM API (Claude) directly, with prompt caching, streaming, and structured output.
2. Design and run **evaluations** for an AI feature — knowing if it works isn't enough; *proving* it works is the skill.
3. Build a Retrieval-Augmented Generation (RAG) pipeline with pgvector.
4. Implement tool use / function calling.
5. Reason about cost and latency — and instrument both.
6. Recognize and defend against prompt injection.
7. Use AI coding assistants effectively — explaining every accepted line.
8. Write a substantive design doc and ship the capstone.

## Week structure

| Week | Topic | Output |
|------|-------|--------|
| 1 | LLM basics, prompt engineering, caching | First AI feature end-to-end |
| 2 | RAG, embeddings, pgvector | Working RAG over a real corpus |
| 3 | Tool use, evals, observability | Production-grade AI feature with evals |
| 4 | Ship + capstone polish | Live with real users; design doc complete |

See [lessons.md](lessons.md).

## Gate criteria

See [../assessments/gate-criteria.md#phase-7-gate-ai-capstone](../assessments/gate-criteria.md). Summary: demo end-to-end, show evals + cost numbers, walk through design doc.

**Gate passed = MacBook Air shipped.**

## Project

[project.md](project.md) — The **Capstone**: either deeply extend the Phase 6 product with AI, or build a new AI-first app. Either way: real users, evals, cost discipline.

## Final reflection

End of Phase 7 is also the end of the course. See [retrospective.md](retrospective.md) — a written reflection on the whole journey.

## Tools added this phase

- **Anthropic API** (Claude) — primary LLM.
- **Anthropic Python SDK** with prompt caching enabled by default.
- **pgvector** for embeddings.
- **`braintrust`** or hand-rolled evals.
- **Claude Code / Cursor / etc.** — AI coding assistant (FINALLY unlocked).

## What the mentor watches for

- Do they understand the LLM is non-deterministic? Are evals real?
- Are they instrumenting cost from day 1?
- Do they treat the AI feature as a feature, or as the entire product?
- Can they explain every line of AI-assisted code they shipped?
- Do they handle the "AI hallucinated" case gracefully in the UI?

## Weekly quizzes

| Week | Topic | Quiz |
|------|-------|------|
| 1 | LLM basics | [week-1-llm-basics-quiz.md](quizzes/week-1-llm-basics-quiz.md) |
| 2 | RAG | [week-2-rag-quiz.md](quizzes/week-2-rag-quiz.md) |
| 3 | Tools, evals, safety | [week-3-tools-evals-safety-quiz.md](quizzes/week-3-tools-evals-safety-quiz.md) |
| 4 | Capstone ship | [week-4-capstone-ship-quiz.md](quizzes/week-4-capstone-ship-quiz.md) |

Each week: 20–28 questions in 5 sections (MCQ, predict output, fill in code, debug, write code). Self-grading rubric at the end. Take at end of each week before moving to the next.
