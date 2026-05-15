# Day 2 — Terminal basics

**Goal:** Be comfortable navigating, creating, and inspecting files from the terminal — without a mouse.

## The mental model

The terminal feels intimidating because nothing happens visually until you press Enter. But it's actually simpler than a GUI: every command does one specific thing, and you can chain them.

The terminal is **not** "a way to do GUI things faster." It's the only interface that exists for many of the things you'll do later (servers, CI, debugging). Learn it now.

## The commands you must know cold

| Command | What it does | Try it |
|---------|--------------|--------|
| `pwd` | Print working directory | `pwd` |
| `ls` | List files | `ls`, `ls -la`, `ls -lh` |
| `cd` | Change directory | `cd ~`, `cd ..`, `cd -` |
| `mkdir` | Make directory | `mkdir test`, `mkdir -p a/b/c` |
| `touch` | Create empty file | `touch hello.txt` |
| `cat` | Print file contents | `cat hello.txt` |
| `cp` | Copy | `cp a.txt b.txt`, `cp -r dir1 dir2` |
| `mv` | Move or rename | `mv a.txt b.txt` |
| `rm` | Delete (no undo!) | `rm file.txt`, `rm -r dir` |
| `echo` | Print | `echo "hello"` |
| `which` | Where's this command? | `which git` |
| `man` | Manual page | `man ls` (press `q` to quit) |

## Concepts you must understand

### 1. The home directory

`~` is your home directory. Always. On macOS it's `/Users/yourname`. On Linux it's `/home/yourname`.

```bash
cd ~        # go home
echo $HOME  # print home path
```

### 2. Absolute vs relative paths

- **Absolute** starts with `/` — full path from the root.
- **Relative** does not — it's relative to where you currently are.

```bash
cd /Users/yourname/Desktop   # absolute
cd Desktop                   # relative (only works if Desktop is in current dir)
```

### 3. The shell expands things

When you type a command, the shell expands certain characters before running it:

- `~` → home directory
- `*` → matches any filename (`*.txt` = all .txt files)
- `$VAR` → the value of environment variable `VAR`
- Backticks or `$(...)` → run the command inside, substitute the output

```bash
ls *.md            # all markdown files
echo $HOME         # your home path
echo "Today is $(date)"   # today's date
```

### 4. Standard input, output, and error

Every program has 3 streams:
- **stdin** (input)
- **stdout** (normal output)
- **stderr** (error output)

You can redirect them:

```bash
echo "hello" > file.txt        # stdout to file (overwrite)
echo "world" >> file.txt       # stdout to file (append)
ls /nonexistent 2> errors.txt  # stderr to file
ls | wc -l                     # stdout of ls into stdin of wc -l (counts lines)
```

The pipe (`|`) is the killer feature. Each tool does one thing; pipes compose them.

### 5. The keyboard shortcuts that matter

| Shortcut | What it does |
|----------|--------------|
| `Ctrl-C` | Kill the current command |
| `Ctrl-D` | Send end-of-input (exit a shell, end input to a program) |
| `Ctrl-L` | Clear screen (same as `clear`) |
| `Ctrl-R` | Search command history |
| `Ctrl-A` / `Ctrl-E` | Jump to start / end of line |
| `Ctrl-U` | Clear the current line |
| `↑` / `↓` | Previous / next command in history |
| `Tab` | Autocomplete |
| `Tab Tab` | Show all completions |

The `Tab` key is your single biggest productivity tool. Use it constantly.

## Exercises

Do all of these in your terminal. Take notes on anything you don't understand.

### Exercise 1 — Navigate
1. Print your home directory.
2. Go to your Desktop.
3. Go up one level. Print where you are.
4. Go back to the previous directory you were in (without typing its name).

### Exercise 2 — Create and inspect
1. In your home directory, make a folder called `prince`.
2. Inside `prince`, make `notes`, `code`, and `archive` folders.
3. Inside `notes`, create a file called `day-2.txt` containing the text "I learned the terminal today."
4. Print the contents of `day-2.txt`.
5. Show a tree of `~/prince` (Google: how to do this — `tree`, or `find prince`).

### Exercise 3 — Pipes and redirection
1. Count the number of files in `/usr/bin` (hint: `ls /usr/bin | wc -l`).
2. List all files in `/usr/bin` that contain "git" in the name (hint: pipe into `grep`).
3. Save the output of the previous step to a file called `git-tools.txt` in `~/prince/notes/`.

### Exercise 4 — Read a manual page
1. `man ls`
2. Find the flag that sorts by modification time (newest first).
3. Find the flag that prints sizes in human-readable form.
4. Combine them and use them.

### Exercise 5 — Search your history
1. Press `Ctrl-R`. Type `mkdir`. What appears?
2. Press `Ctrl-R` again. What appears now?
3. Press Enter to run it.

## Self-check — can you answer these without looking up?

1. What does `cd -` do?
2. What's the difference between `>` and `>>`?
3. What's the difference between a relative path and an absolute path? Give an example of each.
4. If I run `rm *.txt`, what happens? What about `rm -rf /`? (DO NOT RUN THE SECOND ONE.)
5. What does `Ctrl-C` do? What about `Ctrl-D`?

## Tomorrow

Git. The thing you've heard about for years. It's actually simpler than it sounds.
