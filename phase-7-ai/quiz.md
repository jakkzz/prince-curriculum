# Phase 7 Quiz

End of Week 3. 60 min. Section E live.

## Section A — LLM fundamentals (10)

1. What's a token?
2. Roughly how many tokens in 1000 English words?
3. What's the difference between input and output tokens, in cost?
4. What's a context window?
5. What's the difference between a system prompt and a user message?
6. What does `max_tokens` do?
7. What's prompt caching? What's the typical cost ratio of a cache hit vs a cache miss?
8. What's streaming, and why use it?
9. Why is the LLM's output non-deterministic even with `temperature=0`?
10. When should you use a smaller model vs a larger one?

## Section B — RAG (8)

1. What problem does RAG solve that fine-tuning doesn't?
2. What's an embedding?
3. Why must the same embedding model embed both docs AND queries?
4. What's chunk size, and what trade-off does it have?
5. What's "cosine similarity" vs "L2 distance"?
6. What's an ivfflat index in pgvector?
7. How would you tell if retrieval was bad vs generation was bad?
8. What's "context stuffing" and why is it bad?

## Section C — Tool use, evals, safety (10)

1. What's tool use / function calling?
2. When would you use tool use instead of just asking for JSON?
3. What does the LLM return when it wants to call a tool?
4. Why are evals more important for AI features than for normal features?
5. What's a "ground truth" in an eval?
6. Give an example of a deterministic eval and a fuzzy eval.
7. What's prompt injection?
8. How does an attacker exploit your app if your prompt is `f"Answer this question from a user: {user_input}"`?
9. Name 2 defenses against prompt injection.
10. Why should a tool that DELETEs require explicit confirmation, not just LLM judgment?

## Section D — Cost & latency (5)

1. What does p95 latency mean?
2. Why do we care about first-token latency vs total latency?
3. If your feature costs $0.01/call and 100 users use it 10x/day, what's the monthly cost?
4. Name 3 ways to reduce per-call cost without changing UX.
5. Why might you NOT want to use the largest model even if it gives better answers?

## Section E — Live (60 min)

Mentor gives you a sample dataset (a CSV or markdown corpus) and asks you to:

1. Build a small RAG-based question-answering CLI over the dataset.
2. Write 5 evals.
3. Demo it, including one query that fails an eval.
4. Show the cost per query.

You can use any AI assistant (this is Phase 7).

You will be evaluated on:
- Sensible chunking.
- Sensible embedding choice.
- Eval cases that actually exercise the system.
- Cost instrumentation visible.
- A graceful failure case (no docs found, hallucination caught).

---

**Scoring:**
- A–D: 33 questions, 1 each. Need 26+.
- E: pass/fail.
