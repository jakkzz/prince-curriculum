# Day 3 — Git fundamentals

**Goal:** Understand what git actually is, and use it without copy-pasting from Stack Overflow.

## The mental model

Git tracks the **history of your project**. Every time you "commit," you take a snapshot. Branches let you have multiple parallel timelines. That's the whole concept.

You can — and many people do — use git for years without understanding what it's actually doing. Don't be one of them. The 30 minutes you spend on the model below saves you 30 hours over your career.

## What is a commit?

A commit is a **snapshot of every file** in your project at a moment in time, plus:
- A message you wrote.
- The previous commit (the "parent").
- The author and timestamp.
- A unique hash (the "commit SHA") that identifies it forever.

A branch is a **movable pointer** to a commit. When you commit, the branch pointer moves forward.

`HEAD` is the pointer to "where you currently are." Usually it points to a branch, which points to a commit.

## The three states of a file

This trips up everyone. Learn it now.

```
working directory   →   staging area   →   commit history
   (what you see)        (git add)          (git commit)
```

- **Working directory**: the actual files on disk.
- **Staging area** (also called "index"): files you've marked as "include in the next commit."
- **Commit history**: snapshots that are permanent.

`git status` shows you the state of all three.

## The commands you must know cold

| Command | What it does |
|---------|--------------|
| `git init` | Make this directory a git repo |
| `git status` | Show working/staging/commit state |
| `git add file.txt` | Stage a file |
| `git add .` | Stage everything in current directory (use with care) |
| `git commit -m "message"` | Snapshot the staged stuff |
| `git log` | Show history |
| `git log --oneline` | One line per commit |
| `git diff` | What changed in the working dir, not yet staged |
| `git diff --staged` | What's staged, not yet committed |
| `git restore file.txt` | Revert a file in working dir to last commit |
| `git restore --staged file.txt` | Unstage |

## Workflow — make your first repo

Do these in the terminal. Don't copy-paste.

```bash
cd ~
mkdir hello-git
cd hello-git
git init
```

You just made an empty repo. Inspect:

```bash
ls -la
```

You'll see a `.git/` folder. **That folder is the repo.** The files alongside it are just files. Don't touch `.git/` directly.

```bash
git status
```

It'll say something like "On branch main / No commits yet". Good.

Now make a file:

```bash
echo "# Hello git" > README.md
git status
```

Notice: `README.md` is "untracked." Git sees the file but won't include it unless you tell it to.

```bash
git add README.md
git status
```

Now it's "staged." Last step:

```bash
git commit -m "Initial commit"
git log
```

You have a one-commit history. Congratulations, you're using git.

## Make a few more commits

```bash
echo "This is my first git project." >> README.md
git status              # README.md is "modified"
git diff                # see what changed
git add README.md
git commit -m "Add description"

echo "Day 3 of Project Prince" >> README.md
git add README.md
git commit -m "Add project context"

git log --oneline       # three commits
```

## Branches

```bash
git branch              # show branches (you're on main)
git switch -c feature   # create and switch to a new branch
echo "experimental" > experiment.txt
git add experiment.txt
git commit -m "Try an experiment"

git switch main         # back to main — experiment.txt disappears
ls                      # confirm
git switch feature      # back to feature — experiment.txt is back
ls
```

This is the core idea: branches are parallel timelines.

## Merging

```bash
git switch main
git merge feature       # bring feature's changes into main
git log --oneline       # now main has the experiment commit too
```

## Common mistakes (and the right fix)

### "I made a commit and want to change the message"
```bash
git commit --amend -m "Better message"
```
*Only do this if you haven't pushed yet.* Amending rewrites history.

### "I staged a file I didn't mean to"
```bash
git restore --staged file.txt
```

### "I modified a file and want to throw away my changes"
```bash
git restore file.txt
```
**This is destructive. Your changes are gone.** Use carefully.

### "I deleted a file by accident"
If you'd already committed it: `git checkout HEAD -- file.txt`.
If you hadn't: it might be gone forever. Lesson learned: commit often.

### "I committed to the wrong branch"
```bash
git log         # find the commit hash of what you want to move
git switch correct-branch
git cherry-pick <hash>
git switch wrong-branch
git reset --hard HEAD~1   # only if you haven't pushed!
```

## Exercises

### Exercise 1 — Make and inspect commits
1. Create `~/prince-test-repo`, init it.
2. Make 5 commits, each adding or changing something. Use real messages.
3. `git log` — read your history. Can you tell what each commit did from the message alone? If not, your messages are too vague.

### Exercise 2 — Branches and merging
1. From `main`, create a branch `feature-greeting`.
2. Add a `greeting.txt` file. Commit.
3. Switch back to `main`. Confirm `greeting.txt` is gone.
4. Merge `feature-greeting` into `main`. Confirm it's back.

### Exercise 3 — Read someone else's history
1. Clone a real project: `git clone https://github.com/python/cpython.git`. *(This will take a few minutes; it's a big repo.)*
2. `cd cpython`
3. `git log --oneline | head -20` — read the last 20 commits.
4. Pick one. `git show <commit-hash>` — read the actual diff.
5. In your own words, what changed?

## Self-check

1. What's the difference between `git add` and `git commit`?
2. What's the difference between a branch and a commit?
3. What does `HEAD` mean?
4. If you run `git restore file.txt`, what happens to changes you'd made to that file?
5. If you run `git status` and see "modified: foo.py" in red, then run `git add foo.py`, what changes about the next `git status` output?

## Tomorrow

GitHub. Putting your repo on the internet, making pull requests.
