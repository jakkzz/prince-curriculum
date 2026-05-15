# AI Policy

A clear, enforceable policy for AI tool use across the course.

## The rule

**You cannot use AI to write code you don't understand. Ever. Including after this course ends.**

That's the whole rule. The phase-by-phase policy below is just how we get the learner ready to actually follow it.

## Phase-by-phase

| Phase | Coding assistant | Concept explanations | Search engines |
|-------|------------------|----------------------|----------------|
| 0     | ❌ Off            | ❌ Off                | ✅ Allowed       |
| 1     | ❌ Off            | ❌ Off                | ✅ Allowed       |
| 2     | ❌ Off            | ❌ Off                | ✅ Allowed       |
| 3     | ❌ Off            | ✅ Allowed (post-attempt) | ✅ Allowed   |
| 4     | ❌ Off            | ✅ Allowed (post-attempt) | ✅ Allowed   |
| 5     | ❌ Off            | ✅ Allowed (post-attempt) | ✅ Allowed   |
| 6     | ⚠️  Limited       | ✅ Allowed              | ✅ Allowed       |
| 7     | ✅ Allowed         | ✅ Allowed              | ✅ Allowed       |

**"Post-attempt"** means: try first, fail, write down what you tried and what you don't understand, then ask the AI. Not the other way around.

**"Limited" in Phase 6** means: AI can help with boilerplate they've already written 5 times (a CRUD form, a migration, a `useEffect` hook). It cannot write the novel parts of the product.

## Why

The skill being built is **judgment** — knowing when generated code is wrong. That judgment only forms when you've personally hit the rake enough times.

A learner who uses AI from day one will:

- Ship code that almost works.
- Not know why it broke when it breaks.
- Plateau at the level of "can prompt for boilerplate" and never get past it.
- Be replaceable by the next person who can also prompt for boilerplate.

A learner who delays AI until Phase 7 will:

- Understand every line of code they accept from a model.
- Recognize bullshit (hallucinated APIs, deprecated patterns, plausible-but-wrong code).
- Use AI as a force multiplier, not a crutch.

That's the difference between someone you'd hire and someone you wouldn't.

## How the mentor enforces this

- **PR review check.** If the mentor reads a PR and sees code the learner cannot explain *in their own words, line by line, on the spot*, the PR is rejected. Doesn't matter if it works.
- **Random pop-quizzes during gate reviews.** "Walk me through this file." Hesitation or hand-waving is a fail.
- **Browser history is fair game.** This is an honor-system course with verification. Trust but verify.

## What the learner is told on Day 1

> "You can use AI later. You will use AI later. But if you use it now, you won't get the skill. The skill is the prize, not the laptop. The laptop is just the receipt."
