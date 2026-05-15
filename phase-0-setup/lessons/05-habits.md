# Day 5 — Habits & typing

**Goal:** Establish a daily routine you can sustain for 35 weeks. Get typing speed to a baseline.

## Why this matters more than the technical stuff

There are kids who started this course with weak math skills who shipped real apps. There are kids who started with a perfect SAT score who quit at month 3. The difference is **whether they kept showing up**.

The habit is the moat. The skills are downstream.

## The daily routine

We're going to establish a routine that takes ~45 minutes minimum, ~3 hours typical, ~5 hours when motivated. It looks like this:

| Block | Duration | What |
|-------|----------|------|
| **Warm-up** | 10 min | Typing practice |
| **Review** | 5 min | Re-read yesterday's log entry. Decide today's one main goal. |
| **Deep work** | 60–180 min | The thing you said you'd do. No phone. No social media. |
| **Log entry** | 10 min | Write what you learned, what was hard, what's next. |
| **Commit** | 2 min | At least one commit pushed to GitHub. Even if it's just the log entry. |

The minimum viable day is warm-up + 30 min deep work + log + commit. Don't break the chain.

## Typing — the unglamorous superpower

**Target:** 60 wpm by end of Phase 2. 80+ wpm by end of course.

If you type 30 wpm, you're going to spend 2x as long on every exercise. Worse: you'll think slower, because typing friction will make you avoid trying things.

### Where to practice

Pick one. Use it every day for 10 minutes.

- [Monkeytype](https://monkeytype.com/) — clean, customizable, time-based.
- [keybr.com](https://www.keybr.com/) — focuses on your weak letters first.
- [typing.club](https://www.typing.club/) — more curriculum-driven, good if you need to relearn from scratch.

### How to actually improve

1. **Touch type or learn to.** No looking at the keyboard. Yes, even for `;` and `'`.
2. **Accuracy first, speed second.** Aim for 97%+ accuracy. Speed comes from low error rate, not from going faster.
3. **Don't watch the cursor.** Look 5 characters ahead.
4. **10 minutes a day, every day, for a year.** That's it. People who do this hit 80 wpm. People who don't, don't.

### Track it

Add a `typing-progress.md` to your learning-log repo:

```markdown
# Typing Progress

| Date       | Source     | wpm | accuracy |
|------------|------------|-----|----------|
| 2026-XX-XX | Monkeytype | 38  | 94%      |
```

Update once a week. Aim to see the wpm number trend up.

## The learning log

This is your single most important habit. Every day, write 3 bullets in `learning-log/log/YYYY-MM-DD.md`:

```markdown
# 2026-XX-XX

## What I worked on
- ...

## What I learned
- ...

## What I'm stuck on / what's next
- ...
```

**Rules:**

1. **Write it the same day.** Backfilling a week of logs on Sunday defeats the point.
2. **Be honest.** "Got distracted, only did 20 minutes" is more useful than "Made great progress."
3. **Specifics, not vibes.** "Learned how `git rebase --interactive` works" beats "learned more about git."
4. **Re-read last week's logs at the start of the week.** You'll notice patterns — what topics you keep returning to, where you're avoiding.

## The commit habit

**One commit per day. Minimum. No exceptions.**

It doesn't have to be code. It can be:
- Today's learning log entry.
- A fix to a typo in your README.
- A note about something you want to remember.

Why? Because skipping one day makes it easier to skip two, which makes a week, which makes a quit. The streak is the structure.

Look at this graph at the end of the course:

> GitHub will show a green square for every day you committed. After 35 weeks, that graph will look like a wall of green. **That graph is your resume.** It says "this person shows up."

## Distraction protocol

Programming requires sustained attention. You will fail to develop it if you're checking your phone every 5 minutes.

Non-negotiable, during deep work blocks:

1. **Phone in another room.** Not face-down. Not on Do Not Disturb. Another room.
2. **No social media tabs open.** Close them before you start.
3. **One thing at a time.** Stuck on a Python problem? Don't "take a quick break" to do typing practice. Push through or take a real break (walk outside).
4. **A timer running.** Pomodoro (25/5) is fine. So is a 60-minute block. The point is the block has a start and an end.

If you can't do 25 minutes uncomfortable without checking your phone, your first month of programming is going to be miserable. Train this muscle.

## The weekend question

Two schools of thought. Pick one and stick with it.

**Six days a week, one day off.**
Pro: prevents burnout. Con: the rest day breaks momentum.

**Every day, light on weekends.**
Pro: never breaks the streak. Con: easier to over-do and burn out.

For most learners on this course, **six days on, Sunday off** works best. Sunday is for re-reading the week's logs and planning next week. No coding.

## The mentor weekly check-in

Friday, 30 minutes, hard stop. You demo what you built that week. The mentor asks questions. You schedule next week.

Show up to it ready. If you don't have a demo, lead with that, don't bury it.

## Exercises

### Exercise 1 — Set up the structure
1. In your `learning-log` repo, create:
   - `log/` directory
   - `log/2026-XX-XX.md` for today
   - `typing-progress.md` at the root
   - `goals.md` at the root, with 3 things you want to learn this year and 1 thing you're scared of
2. Commit. Push.

### Exercise 2 — Typing baseline
1. Take a 5-minute test on Monkeytype with default settings.
2. Record your wpm and accuracy in `typing-progress.md`.
3. This is your "before" number. Take a screenshot.

### Exercise 3 — Schedule
1. Open a calendar app (Google Calendar, paper, whatever).
2. Block your daily work time for the next 4 weeks.
3. Block your Friday mentor check-ins.
4. **Treat these blocks as real meetings.** If something would conflict, you'd reschedule a meeting; reschedule the block too.

## Self-check

1. What's the minimum viable day on this course?
2. Why do we commit even when there's no code change?
3. What's your typing baseline (wpm + accuracy)?
4. Where is your phone during deep work blocks?
5. Have you re-read this lesson once? Read it again next Sunday.

## Tomorrow

Phase 1 starts. Python.
