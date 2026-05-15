# Day 4 — GitHub workflow

**Goal:** Push a repo to GitHub. Make a pull request. Get it reviewed.

## What GitHub is (and isn't)

GitHub is a website that hosts git repositories. **Git is the tool; GitHub is one place to store repos.** Other places: GitLab, Bitbucket, your own server. We're using GitHub because that's where the world is.

You can use git without GitHub. But the whole "pull request" workflow we use as a team is a GitHub thing on top of git.

## The workflow

```
GitHub repo (origin)
       ↑
    git push
       |
    git pull
       ↓
Local repo (your machine)
```

You make commits locally. You **push** them to GitHub. You **pull** to get other people's commits. That's it.

## Tasks

### 1. Create a repo on GitHub

Go to [github.com/new](https://github.com/new).

- **Name:** `learning-log`
- **Description:** "My daily learning log for Project Prince."
- **Public.** Yes, public. Future employers will read it.
- **Do NOT initialize** with a README, license, or .gitignore. We'll do that locally.

Click "Create repository."

GitHub will show you commands. Don't copy them yet — we'll do it ourselves.

### 2. Connect your local repo to GitHub

```bash
cd ~/prince
mkdir learning-log
cd learning-log
git init
```

Create a `README.md`:

```markdown
# Learning Log

My daily learning log for Project Prince.

Started: 2026-XX-XX
```

Commit it:

```bash
git add README.md
git commit -m "Initial commit"
```

Now connect to GitHub. **Use the SSH URL**, not HTTPS:

```bash
git remote add origin git@github.com:YOUR_USERNAME/learning-log.git
git branch -M main
git push -u origin main
```

Open GitHub. Refresh. You should see your README.

### 3. The push/pull cycle

Add another line to `README.md`. Commit. Then:

```bash
git push
```

That's it for ongoing pushes. The `-u` flag in the first push set up tracking.

Now go to GitHub and edit the README directly in the browser (pencil icon → make a change → commit). Then locally:

```bash
git pull
```

Your local copy now has the change.

**Always pull before you start working.** Forgetting this is the #1 cause of merge conflicts.

### 4. The pull request workflow

This is how teams work. Even on solo projects, you'll use this — it gives you a place for the mentor to leave review comments.

```bash
git switch -c add-goals
```

Add a `GOALS.md` file. Commit. Push the branch:

```bash
git push -u origin add-goals
```

GitHub will print a URL like `https://github.com/you/learning-log/pull/new/add-goals`. Open it.

Fill in:
- **Title:** "Add goals doc"
- **Description:** "Outlines what I want to learn this year and what I'm worried about."

Click "Create pull request."

You now have a PR. The mentor will review it. After approval:
- Click "Merge pull request" → "Confirm merge."
- Locally: `git switch main && git pull`. The change is now in `main`.

### 5. The `.gitignore` file

Some files should never be committed: secrets, generated artifacts, OS junk.

Create `.gitignore` in the repo root:

```
.DS_Store
Thumbs.db
*.log
.env
.env.local
node_modules/
__pycache__/
.venv/
venv/
dist/
build/
.idea/
.vscode/*
!.vscode/extensions.json
```

Commit it as its own PR. (Yes, make a branch, push, open the PR. Practice the workflow.)

## Anatomy of a good commit message

Convention: **imperative mood**, like you're giving the code an order.

✅ Good:
- `Add login page`
- `Fix off-by-one in pagination`
- `Refactor user service to use new auth flow`

❌ Bad:
- `added stuff` — what stuff?
- `fix` — fix what?
- `WIP` — fine for a draft, never for a merged commit
- `Updated user.py to handle the case where the user is null because previously it would crash and we'd see an error in the logs that said NoneType has no attribute name which is super annoying` — break it up

**The format:**

```
Short summary (50 chars or fewer)

Optional longer description if needed. Wrap at 72 chars.
Explain WHY, not WHAT — the diff shows what.

- Bullet points OK
- Reference issues if relevant: #42
```

## The PR description

Your PR description is a **note to your future self** (and your reviewer). It should answer:

1. **What does this change?** One sentence.
2. **Why?** What problem does it solve?
3. **How did you test it?** Or "untested."
4. **Anything tricky?** Edge cases, things you considered.

Example:

```markdown
## What
Adds a goals doc to outline what I want to learn this year.

## Why
The mentor asked me to write down learning goals so we can revisit them
quarterly and check if I'm drifting.

## How tested
Read it through and confirmed it renders correctly on GitHub.

## Notes
The "future goals" section is intentionally vague — I'll refine it after
Phase 2 when I have a better sense of what's possible.
```

## Exercises

### Exercise 1 — The whole loop
1. Make a branch `add-typing-results`.
2. Add a file `typing-progress.md` listing your current wpm and error rate.
3. Push the branch.
4. Open a PR with a good description.
5. Wait for mentor review.
6. Address any feedback (push more commits to the same branch — the PR updates automatically).
7. Merge after approval.
8. Locally, switch to main and pull.
9. Delete the local branch: `git branch -d add-typing-results`.

### Exercise 2 — Rejected PR
1. Make a branch with a deliberately bad commit message ("stuff").
2. Push and open a PR.
3. The mentor will reject it.
4. **Do not** force-push to fix the message. Instead, make a new commit with a fix-up.
   - This teaches that history is real.

### Exercise 3 — Merge conflict
1. Edit the README on GitHub directly (in the browser). Commit.
2. Locally, *without* pulling, edit the same line of the README. Commit.
3. Try to push. It'll fail.
4. `git pull --rebase`. You'll get a conflict.
5. Open the file, see the conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`). Fix it manually.
6. `git add README.md`, `git rebase --continue`, then push.

This will probably feel awful. Good. Merge conflicts are a real skill.

## Self-check

1. What does `git push` do?
2. What's the difference between `git pull` and `git fetch`?
3. What's an "origin"?
4. Why use a pull request instead of just committing to main?
5. What does the `-u` flag in `git push -u origin branch-name` do?

## Tomorrow

Habits. The thing that determines whether you finish this course or quit at month 4.
