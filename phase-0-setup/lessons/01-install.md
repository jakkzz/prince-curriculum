# Day 1 — Install everything

**Goal:** End the day with a terminal you like, VS Code, git, and an SSH key registered with GitHub.

## The mental model

A "development environment" is just a collection of programs that let you write and run code. We're going to install the minimum we need to start. We will *not* install Python or Node yet — those come in Phase 1.

## Tasks

### 1. Pick a terminal

A terminal is the program that runs a shell (`bash`, `zsh`, etc.) — it's where you'll spend most of your time.

- **macOS:** install [iTerm2](https://iterm2.com/) or [Warp](https://www.warp.dev/). The built-in Terminal works but iTerm2 is nicer.
- **Windows:** install [Windows Terminal](https://aka.ms/terminal) from the Microsoft Store, plus [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) with Ubuntu. **You will do all your work inside WSL.** Trust me.
- **Linux:** you already have one.

Open it. Take a screenshot. Save it to your learning log later.

### 2. Install VS Code

Download from [code.visualstudio.com](https://code.visualstudio.com/). Install. Open it. Close it. We'll come back.

Install **only** these extensions for now:
- **GitLens** — git superpowers in the editor.
- **Markdown All in One** — for the learning log.

**Do not** install Copilot, Claude, Cursor, or any AI extension. Not yet. See [resources/ai-policy.md](../../resources/ai-policy.md).

### 3. Install git

```bash
# macOS — git ships with Xcode Command Line Tools
xcode-select --install

# Ubuntu/WSL
sudo apt update && sudo apt install git

# Verify
git --version
```

Should print `git version 2.something`.

### 4. Configure git

These are global settings. Use **your real name** and a working email.

```bash
git config --global user.name "Your Real Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global core.editor "code --wait"
```

Verify:

```bash
git config --global --list
```

### 5. Generate an SSH key

This is how your computer proves it's you when talking to GitHub.

```bash
ssh-keygen -t ed25519 -C "you@example.com"
```

Press Enter for the default location. **Set a passphrase you'll remember.** Yes, even though it's annoying. The passphrase is the difference between "lost laptop" and "lost laptop + compromised GitHub account."

### 6. Create a GitHub account

If you don't have one: [github.com/signup](https://github.com/signup). Use a real-looking username — it'll be on your resume someday.

### 7. Register your SSH key with GitHub

Copy the **public** key (not the one without `.pub` — the one with):

```bash
# macOS
pbcopy < ~/.ssh/id_ed25519.pub

# Linux/WSL
cat ~/.ssh/id_ed25519.pub
# then select and copy
```

Then: [github.com/settings/keys](https://github.com/settings/keys) → "New SSH key" → paste → save.

### 8. Test the connection

```bash
ssh -T git@github.com
```

If it says `Hi yourusername! You've successfully authenticated…`, you're done.

If it says "permission denied," your key isn't registered. Go back.

## Common problems

See [resources/troubleshooting.md](../../resources/troubleshooting.md).

## What you should be able to do at the end of Day 1

- Open a terminal, type `git --version`, see a version number.
- Type `ssh -T git@github.com`, see a greeting with your username.
- Open VS Code from the terminal by typing `code .` in any directory.

## Tomorrow

We learn the terminal itself. The thing you opened today, but actually use it.
