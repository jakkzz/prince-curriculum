# Phase 7 Resources

## Required

- [Anthropic API docs](https://docs.claude.com/) — Getting Started, Prompt Caching, Tool Use, Streaming.
- [Anthropic prompt engineering guide](https://docs.claude.com/en/docs/build-with-claude/prompt-engineering/overview)
- [Anthropic evaluation guide](https://docs.claude.com/en/docs/test-and-evaluate/develop-tests)
- [pgvector docs](https://github.com/pgvector/pgvector)

## Recommended

- [LLM University (Cohere, free)](https://docs.cohere.com/docs/llmu) — solid conceptual foundations.
- [How to Build LLM Apps That Don't Suck (Patrick Loeber)](https://www.youtube.com/) — pragmatic.
- [Prompt Injection: What's the worst that can happen (Simon Willison)](https://simonwillison.net/2023/Apr/14/worst-that-can-happen/) — the canonical posts.
- [Evals are everything (hamel.dev)](https://hamel.dev/blog/posts/evals/) — short and excellent.

## Reading order — when you have time

- [Attention Is All You Need](https://arxiv.org/abs/1706.03762) — the Transformers paper. Skim once. You don't need to understand it deeply for this phase.
- [Language Models are Few-Shot Learners (GPT-3 paper)](https://arxiv.org/abs/2005.14165) — historical context.

## Tools

- [Anthropic Python SDK](https://github.com/anthropics/anthropic-sdk-python)
- [Anthropic TS SDK](https://github.com/anthropics/anthropic-sdk-typescript) — if you're doing client-side
- [Voyage AI embeddings](https://www.voyageai.com/) — recommended embedding provider with Anthropic
- [pgvector](https://github.com/pgvector/pgvector) — vector search in Postgres
- [Braintrust](https://www.braintrust.dev/) — eval platform, generous free tier
- [Claude Code](https://www.anthropic.com/claude-code) — your AI coding assistant for this phase

## Skip for now

- Fine-tuning. Almost never the right answer for app developers.
- Training your own model. No.
- Multi-agent frameworks (CrewAI, LangGraph) until you've built something simpler.
- "Prompt engineering courses" with elaborate frameworks. Most reduce to "say what you want clearly."

## On using AI assistants responsibly

Now that you can use AI tools:

1. **Explain every line you accept.** If you can't, reject it.
2. **AI-write the test first, you write the implementation.** Reverses the usual flow; forces thinking.
3. **AI as a rubber duck, not a hand.** Talk through your problem before pasting code at it.
4. **Don't trust generated tests.** Read them. A passing test that doesn't actually exercise the change is worse than no test.
5. **No paste-without-read.** Ever.

See [resources/ai-policy.md](../resources/ai-policy.md) for the full policy.
