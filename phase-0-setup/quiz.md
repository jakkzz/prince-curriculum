# Phase 0 Quiz

Take this **after Day 4**. No looking things up. 30 minutes. Open book is fine for the conceptual questions but you should know the answers.

## Section A — Terminal (10 questions)

1. What does `pwd` print?
2. What's the difference between `cd ..` and `cd -`?
3. What does `ls -la` show that `ls` doesn't?
4. What does the `~` character expand to?
5. What's the difference between `>` and `>>` in shell redirection?
6. What does the `|` (pipe) character do?
7. Write a single command that lists all files in `/etc` whose name contains the word "host".
8. What does `Ctrl-C` do? What about `Ctrl-D`?
9. Write a command that creates a directory called `a` with a subdirectory `b` and a sub-subdirectory `c`, in one command.
10. What's the difference between an absolute and a relative path?

## Section B — Git (10 questions)

1. What is a git commit, conceptually?
2. What does `git status` show you?
3. What's the difference between the working directory, staging area, and commit history?
4. After running `git add file.txt`, what state is the file in?
5. What does `HEAD` refer to?
6. What's a branch, conceptually?
7. You ran `git commit -m "wip"` and want to change the message. What command?
8. You modified `file.txt` but want to throw away your changes. What command?
9. What's the difference between `git merge` and `git rebase`, in one sentence each?
10. If `git status` shows "Your branch is ahead of 'origin/main' by 2 commits," what does that mean?

## Section C — GitHub workflow (5 questions)

1. What's the difference between git and GitHub?
2. What does `git push` do? What does `git pull` do?
3. What does `origin` mean in `git push origin main`?
4. Why use a pull request instead of just pushing to main?
5. Why use SSH instead of HTTPS for the GitHub remote?

## Section D — Habits & process (5 questions)

1. What's the minimum viable day on this course?
2. Why do we commit even on days with no real code changes?
3. What does "100 words per minute" actually mean? Is your current baseline above or below?
4. Why is the AI policy in Phases 0–5 "no AI assistants"?
5. What time block did you set aside daily for this course?

## Section E — Practical (10 minutes, live)

The mentor will watch you do these. No notes.

1. Open a terminal. Go to your home directory. Make a new folder called `quiz-test`. `cd` into it.
2. Initialize a git repo. Create a `hello.txt` file. Commit it with a meaningful message.
3. Make a new branch `feature`. Add another file. Commit it.
4. Switch back to `main`. Show that the new file isn't there.
5. Merge `feature` into `main`. Show the file appears.
6. Push the repo to GitHub. (You'll need to create the repo on GitHub first.)
7. On GitHub, open the repo in the browser. Edit the README. Commit via the web UI.
8. Pull the change locally.

If steps 1–8 take you more than 15 minutes or you needed to look anything up: re-do Day 3 and Day 4.

---

**Scoring:**
- Section A–D: 30 questions, 1 point each.
- Section E: pass/fail (must pass to move on).
- 24+ on A–D AND pass on E → ready for Phase 1.
- Under 24 OR fail E → re-do the lesson(s) you struggled with, retake.
