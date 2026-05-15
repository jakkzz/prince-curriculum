# Phase 0 Project — The Learning Log

## Overview

Build the `learning-log` repository you'll commit to every day for the rest of the course.

This is intentionally simple. The project is the **habit**, not the artifact.

## Deliverable

A public GitHub repo named `learning-log` containing:

```
learning-log/
├── README.md                # Project intro
├── goals.md                 # What you want to learn this year
├── typing-progress.md       # Weekly typing test results
├── log/
│   └── 2026-MM-DD.md        # One per working day
└── .gitignore
```

## Requirements

### Functional
- [ ] Repo exists on GitHub, is **public**, and you can `git clone` it via SSH.
- [ ] `README.md` introduces the project in your own words — what is it, what's it for, who are you.
- [ ] `goals.md` has at least 3 specific learning goals and 1 honest worry.
- [ ] `typing-progress.md` has at least your Day 5 baseline result.
- [ ] `log/` has 5 entries — one per day this week.
- [ ] `.gitignore` is present and includes the basics from [lesson 4](lessons/04-github.md).

### Process
- [ ] At least 5 commits across at least 3 different days (no commit dumping at end of week).
- [ ] At least one pull request opened, reviewed, and merged — not a direct push to main.
- [ ] All commits have meaningful messages (no "stuff", "wip", "asdf").

### Stretch (optional)
- [ ] Add a `tools.md` documenting the exact terminal, editor, and shell you set up.
- [ ] Add a profile README to your GitHub account (a special repo named the same as your username, with a `README.md` at the root — it appears on your profile page).

## Grading rubric

Score 0/1/2 per row. Pass = no zeros, ≥6 twos.

| # | Category | What "2" looks like |
|---|----------|---------------------|
| 1 | **Repo structure** | All required files and folders present, correctly named |
| 2 | **README quality** | A stranger could understand what this repo is in 30 seconds |
| 3 | **Goals doc** | Specific, honest, more than a paragraph |
| 4 | **Daily logs** | 5 distinct days, written same-day, with real specifics not vibes |
| 5 | **Git hygiene** | Atomic commits, real messages, no force-pushes |
| 6 | **PR workflow** | Opened a PR with description, addressed any review comments, merged cleanly |
| 7 | **`.gitignore`** | Present and prevents OS junk from being committed |
| 8 | **Honesty** | The logs show real struggles, not a sanitized highlight reel |
| 9 | **Typing baseline** | Recorded with date, wpm, and accuracy. No bullshit numbers |
| 10 | **README of self** | Stretch: profile README done well |

## What "done" feels like

You should be able to, in front of your mentor:

1. Open a terminal.
2. `git clone` your own repo into a temp dir.
3. Open it in VS Code.
4. Show the daily log entries.
5. Walk through the commit history with `git log --oneline`.
6. Explain, in your own words, what each commit was for.

If you can do all that without hesitation, you pass the project.

The **gate** is a separate exercise — see [assessments/gate-criteria.md](../assessments/gate-criteria.md#phase-0-gate-setup-habits).

## Common ways this goes wrong

- **All commits on the same day.** You wrote it Sunday night. We can tell. Re-do the week.
- **Logs that say "learned Python."** No you didn't. Be specific.
- **README that's two sentences.** Try harder. This is your face on the internet.
- **Force-pushed to fix something.** Don't. Make a new commit.
- **Used AI to write the goals doc.** It reads like marketing copy. Write it yourself.

## What submission looks like

There's no submission portal. The mentor reviews the repo directly. Send a Slack/email/message with the repo URL and a one-line summary:

> "Phase 0 ready for review: https://github.com/me/learning-log. Took ~14 hours over 5 days. Stuck on the merge conflict exercise for a while — wrote it up in log/day-4.md."

That message itself is part of the assessment. It signals whether you communicate like an engineer or not.
