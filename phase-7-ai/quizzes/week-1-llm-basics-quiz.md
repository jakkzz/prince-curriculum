# Phase 7 Week 1 Quiz — LLM Basics

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Tokens, models, system prompts, prompt caching, streaming, structured output.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** What's a token?

**A2.** Cost: input tokens vs output tokens?

**A3.** What does prompt caching save?

**A4.** Why stream responses?

**A5.** Why use tool use for structured output?

**A6.** When use the smallest model (Haiku)?

**A7.** Why is LLM output non-deterministic at temp=0?

**A8.** What's the context window?

**A9.** Why set `max_tokens`?

**A10.** Difference between system prompt and user message?

## Section B — Predict the output

**B1.**

```
from anthropic import Anthropic
client = Anthropic()
response = client.messages.create(model='claude-sonnet-4-6', max_tokens=100, messages=[{'role': 'user', 'content': 'Hi'}])
response.content[0].text
```

**B2.**

```
response.usage
```

**B3.**

```
with client.messages.stream(...) as stream:
    for chunk in stream.text_stream:
        print(chunk, end='', flush=True)
```

**B4.**

```
system = [{'type': 'text', 'text': LONG_PROMPT, 'cache_control': {'type': 'ephemeral'}}]
```

**B5.**

```
response.stop_reason
```

## Section C — Fill in the missing code

**C1.** Basic Anthropic API call.

**C2.** Enable prompt caching.

**C3.** Stream responses.

**C4.** Use tool use for structured output.

**C5.** Log cost per call.

## Section D — Find the bug

**D1.**

```
# Cost is high; tokens look normal
# No prompt caching configured
```

**D2.**

```
# Output sometimes JSON, sometimes prose despite instructions
```

**D3.**

```
# Cost climbed 10× overnight
```

## Section E — Write the code

**E1.** Wrap LLM call with cost logging and error handling.

**E2.** Streaming with first-token latency tracking.

**E3.** Tool use for structured extraction.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
