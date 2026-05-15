# Week 3 — Classes, modules, and project structure

**Goal:** Organize code into modules. Use classes when they help. Know when they don't.

## Day 1 — Classes basics

```python
from dataclasses import dataclass

@dataclass
class Session:
    started_at: str
    duration_min: int
    tag: str = ""

    def is_long(self) -> bool:
        return self.duration_min >= 25


s = Session(started_at="2026-01-01T10:00", duration_min=25, tag="reading")
print(s.is_long())
```

### Dataclasses vs regular classes

Use `@dataclass` for **value objects** — bundles of related data with maybe a few methods. They give you `__init__`, `__repr__`, and `__eq__` for free.

Use regular classes when you have **behavior with state** — a long-lived object with complex interactions.

If you find yourself writing 80% getters/setters with no real logic, you probably wanted a dataclass.

### When NOT to use a class

This is more important than how to use one. Don't reach for a class when a function would do.

Bad:
```python
class FormatterUtil:
    def format(self, text: str) -> str:
        return text.upper()

result = FormatterUtil().format("hello")
```

Good:
```python
def shout(text: str) -> str:
    return text.upper()

result = shout("hello")
```

Classes are for **state**. If there's no state, it's just a function in a costume.

## Day 2 — Modules and packages

A **module** is a `.py` file. A **package** is a directory of modules (with an `__init__.py` if you're being strict — Python 3 doesn't require it for "namespace packages").

```
pomo/
├── pyproject.toml
├── src/
│   └── pomo/
│       ├── __init__.py
│       ├── cli.py
│       ├── storage.py
│       ├── timer.py
│       └── report.py
└── tests/
    ├── test_storage.py
    └── test_timer.py
```

### `pyproject.toml`

The single source of truth for a Python project. Replaces `setup.py`, `setup.cfg`, and `requirements.txt`.

```toml
[project]
name = "pomo"
version = "0.1.0"
requires-python = ">=3.13"
dependencies = []

[project.scripts]
pomo = "pomo.cli:main"

[dependency-groups]
dev = ["pytest", "ruff", "mypy"]

[tool.ruff]
line-length = 100

[tool.mypy]
strict = true
```

### Importing

```python
# pomo/cli.py
from pomo.timer import Timer
from pomo.storage import Storage

# Avoid:
from pomo.timer import *      # imports everything; later code becomes mysterious
import pomo.timer as t        # one-letter aliases are unreadable
```

### Tasks
- Create a `pomo/` project skeleton like above (use `uv init pomo --package`).
- Write a `Timer` dataclass in `timer.py`.
- Write a `Storage` class in `storage.py` that just has `save(item)` and `load() -> list` methods, in-memory for now (a list attribute).
- Import them into `cli.py` and use them.

## Day 3 — Error handling in larger programs

### Defining your own exceptions

```python
class PomoError(Exception):
    """Base for all pomo errors."""

class SessionNotFoundError(PomoError):
    pass

class InvalidDurationError(PomoError, ValueError):
    pass
```

Why? So your CLI's top-level `try/except` can distinguish:

```python
def main() -> int:
    try:
        run()
        return 0
    except PomoError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except KeyboardInterrupt:
        print("Interrupted.", file=sys.stderr)
        return 130
```

That way unexpected exceptions still bubble up (with a real stack trace), but expected error conditions print a friendly message.

### Exit codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | General error |
| 2 | Misuse (bad args) |
| 130 | Killed by Ctrl-C |

POSIX convention. Tools like shell scripts depend on these.

## Day 4 — Logging vs print

```python
import logging

logger = logging.getLogger(__name__)

def do_work() -> None:
    logger.info("Starting work")
    try:
        ...
    except Exception:
        logger.exception("Work failed")     # includes stack trace
        raise
```

In `cli.py`:
```python
def main() -> int:
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s %(levelname)-7s %(name)s: %(message)s",
    )
    ...
```

### Why logging > print

- **Levels.** `DEBUG`, `INFO`, `WARNING`, `ERROR`, `CRITICAL`. Filter at runtime.
- **Routing.** Output to stderr, a file, syslog, an HTTP endpoint — without changing the call sites.
- **Structured.** Add fields, parse later.

For user-facing CLI messages, `print` to stdout is fine. For everything else, use logging.

## Day 5 — Project structure rehearsal

This is a synthesis day. Build a small thing using everything from Week 3.

**Task:** Build a `notes` CLI (mini-version, not the full project) with this structure:

```
notes/
├── pyproject.toml
├── src/
│   └── notes/
│       ├── __init__.py
│       ├── cli.py
│       ├── note.py        # Note dataclass
│       └── store.py       # FileStore class — JSON file
└── tests/
```

Commands the user can run:
```
uv run notes add "buy milk"
uv run notes list
uv run notes done 3
```

Requirements:
- `note.py` defines `Note(id: int, text: str, done: bool, created_at: str)`.
- `store.py` defines `FileStore(path: Path)` with `.add()`, `.list()`, `.mark_done(id)`.
- `cli.py` uses `sys.argv` for now (we'll replace with `argparse` in week 4).
- Custom exceptions (`NoteNotFoundError`).
- Proper exit codes.
- Logging set up but minimal.

This is the rehearsal for the real project. Get it cleaner before scaling up.

## End of week — quiz

Take [the quiz](../quiz.md) before moving to Week 4.
