# Phase 7 Capstone Project

The final project. A meaningful AI feature integrated into a real product, with evals, cost discipline, and a real design doc.

## Two paths

**Path A — Extend Phase 6.** Add a substantial AI feature to the product you built in Phase 6. Real users already use it.

**Path B — New AI-first product.** Build a new product where AI is core (not bolt-on). Onboard ≥3 real users during Phase 7.

Path A is easier (existing users, infra, code). Path B is more ambitious. Both are valid.

## Deliverable

1. **The product** — deployed, working, used by ≥3 real users.
2. **The AI feature** — meets the requirements below.
3. **`DESIGN.md`** — covers all 10 sections from [lessons.md](lessons.md) Week 4 Day 4.
4. **Eval suite** — 20+ test cases, runnable on demand, current pass rate ≥ 80%.
5. **Cost dashboard or report** — daily cost broken down by feature.
6. **Source code** — public or shared, with tests + CI.

## Functional requirements

- [ ] The AI feature is **useful** — users actually use it (verified by analytics).
- [ ] **Streaming** in the UI for any response > 2 seconds.
- [ ] **Prompt caching** enabled on system prompts ≥ 1024 tokens.
- [ ] **Cost logging** per request, queryable.
- [ ] **Eval suite** with ≥ 20 cases, runnable as `uv run evals` or equivalent.
- [ ] **Failure handling** — when the LLM is unavailable, slow, or wrong, the UX is graceful.
- [ ] **Rate limiting** on the AI endpoint specifically (LLMs are expensive to abuse).
- [ ] **Prompt injection defenses** — input sanitization or output validation, documented.
- [ ] If using RAG: retrieval evals separate from generation evals.
- [ ] If using tools: tool calls logged with arguments + results.

## Non-functional

- [ ] Total monthly AI cost < $20 at expected user count, OR a written justification.
- [ ] p50 first-token latency < 2 seconds; p95 < 5 seconds.
- [ ] No API keys in code or git history.
- [ ] Tests + CI still green.
- [ ] Phase 5 deploy pipeline still working.

## DESIGN.md required

Sections:
1. Problem and why AI.
2. Model choice and rationale.
3. Prompt strategy.
4. (If RAG) Retrieval design.
5. (If tools) Tool design.
6. Eval methodology + current results.
7. Cost analysis.
8. Failure modes and graceful UX.
9. Prompt injection defenses.
10. What you considered and rejected.

## Grading rubric — final

This is the capstone. The bar is the highest in the course. Pass = ≥ 14 twos out of 18.

| # | Category | "2" |
|---|----------|-----|
| 1 | **Feature is real** | Used by ≥3 real users; metrics show repeat use |
| 2 | **Feature is useful** | A user can describe why they use it (mentor will ask) |
| 3 | **DESIGN.md** | All 10 sections, substantive, shows judgment |
| 4 | **Model choice** | Justified, with awareness of cost / latency tradeoffs |
| 5 | **Prompt design** | Caching, structure, output validation |
| 6 | **Retrieval (if RAG)** | Chunking and ranking thought through; retrieval evals |
| 7 | **Tools (if used)** | Schemas, safety, logging |
| 8 | **Eval suite** | 20+ cases, pass rate ≥ 80%, runnable |
| 9 | **Eval discipline** | Showed a regression caught by evals during development |
| 10 | **Cost instrumentation** | Per-feature daily cost visible |
| 11 | **Streaming** | Implemented where it improves perceived latency |
| 12 | **Graceful failure** | LLM down / slow / hallucinating — UX still ok |
| 13 | **Prompt injection** | At least one attack tested, defense documented |
| 14 | **Code quality** | Standards from Phase 3+4 maintained |
| 15 | **AI assistant use** | Used responsibly; can explain every accepted line |
| 16 | **Capstone polish** | Doesn't feel like a demo; feels like a product |
| 17 | **Honesty** | Limits documented; unknowns acknowledged |
| 18 | **Retrospective** | Final retrospective written (see [retrospective.md](retrospective.md)) |

## Adversarial review

The mentor will:

1. Use the AI feature like a real user.
2. Try to break it: empty input, very long input, attempts at prompt injection, gibberish, non-English.
3. Ask: "Show me the eval that would have caught the bug I just hit."
4. Watch the cost dashboard for a few minutes of use.
5. Ask one of your real users (with permission): "What does the AI part do for you?"
6. Read the DESIGN.md and ask about a section.

## Award trigger

Capstone gate passed → the MacBook Air ships.

This is the only milestone reward in the course tied to hardware purchase.

## Submission

PR with the capstone, DESIGN.md, eval results screenshot, cost dashboard screenshot, 5-minute demo video, and the final retrospective.
