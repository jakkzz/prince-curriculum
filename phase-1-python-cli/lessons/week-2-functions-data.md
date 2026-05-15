# Week 2 — Working with data and functions

**Goal:** Write programs that compose small, well-named functions. Be comfortable enough that the language fades into the background.

## Day 1 — Refactoring practice

You're going to take a "bad" script and refactor it.

Take this script and improve it. Save it as `before.py`, then make `after.py`.

```python
# before.py — refactor me
import json

def do(f):
    d = json.load(open(f))
    r = []
    for x in d:
        if x['s'] > 0:
            r.append(x['n'] + ' ' + str(x['s']))
    print('\n'.join(r))

do('data.json')
```

Issues to fix:
- Function name says nothing.
- Variable names say nothing.
- Resource leak (`open` without `with`).
- No type hints.
- Mixed responsibilities (loading, filtering, formatting, printing).
- No docstring.

Your `after.py` should:
- Use type hints.
- Be split into at least 3 functions (load, filter, format, print).
- Use `with open(...)`.
- Have docstrings on each function.
- Have a `if __name__ == "__main__":` block.

Sample `data.json`:
```json
[
  {"n": "Alice", "s": 92},
  {"n": "Bob", "s": -3},
  {"n": "Carol", "s": 78}
]
```

## Day 2 — Iteration and `itertools`

Some standard library tools that make everything easier:

```python
from itertools import chain, groupby, islice, accumulate

# chain — flatten one level
list(chain([1, 2], [3, 4], [5]))    # [1, 2, 3, 4, 5]

# islice — take a slice of an iterator
list(islice(range(100), 5, 15))      # [5, 6, ..., 14]

# accumulate — running totals (or any binary fold)
list(accumulate([1, 2, 3, 4]))       # [1, 3, 6, 10]

# groupby — group consecutive equal items
for key, group in groupby(sorted("mississippi")):
    print(key, list(group))
```

The lazy-evaluation point: these return **iterators**, not lists. You can chain them efficiently. Wrap with `list(...)` only when you actually need a list.

### Tasks
- Write `chunks(xs: list[int], n: int) -> list[list[int]]` that splits a list into chunks of size `n`. Last chunk may be smaller.
- Write `running_max(xs: list[int]) -> list[int]` — for each position, the max so far.

## Day 3 — Working with files

```python
from pathlib import Path

# Read
text = Path("data.txt").read_text()
lines = Path("data.txt").read_text().splitlines()

# Write
Path("out.txt").write_text("hello\n")

# Append (need context manager)
with open("log.txt", "a") as f:
    f.write("entry\n")

# JSON
import json
data = json.loads(Path("config.json").read_text())
Path("config.json").write_text(json.dumps(data, indent=2))

# Iterate over a directory
for path in Path(".").rglob("*.py"):
    print(path)
```

**Always use `pathlib.Path`, never raw string concatenation for paths.** Cross-platform, less buggy, more readable.

### Tasks
- Write a script that walks a directory and prints the 5 largest files by size.
- Write a script that reads a CSV-like text file (one record per line, comma-separated) and prints column averages.

## Day 4 — Errors and exceptions

```python
def safe_divide(a: int, b: int) -> float:
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b


# Catching
try:
    result = safe_divide(10, 0)
except ValueError as e:
    print(f"Whoops: {e}")
```

### Rules

1. **Don't catch what you can't handle.** `except Exception: pass` is the worst possible code in the language.
2. **Catch the specific exception, not `Exception`.** `except ValueError:` not `except:`.
3. **Always re-raise or log.** If you catch, do something. If "doing something" is "ignore it," ask yourself why this isn't a bug.
4. **Use exceptions for exceptional cases, not control flow.** Don't use a `try`/`except` to check if a key is in a dict — use `in` or `.get()`.

### Tasks
- Write `parse_age(text: str) -> int`. Raise `ValueError` if it's not a number or it's outside 0–150.
- Write tests (without pytest yet — just `assert` statements at the bottom of the file).
- Run your script. Run it with a bad input. Read the stack trace.

## Day 5 — Putting it together: A small data tool

Build a complete script: `report.py` that:

1. Takes a path to a JSON file as a command-line argument (use `sys.argv` for now; `argparse` comes next week).
2. Loads it. Each item has `{"date": "YYYY-MM-DD", "category": str, "amount": float}`.
3. Prints a per-category total.
4. Handles missing file, malformed JSON, and missing keys with clear error messages.

Requirements:
- At least 4 functions: `load`, `aggregate`, `format`, `main`.
- Type hints on everything.
- Docstrings on each function.
- Errors that print a useful message and exit with status code 1.

Test data:

```json
[
  {"date": "2026-01-01", "category": "food", "amount": 12.50},
  {"date": "2026-01-02", "category": "transit", "amount": 3.00},
  {"date": "2026-01-02", "category": "food", "amount": 8.25}
]
```

Expected output:

```
food      20.75
transit    3.00
```

## End of week — self-check

- Can you write a 50-line script with clean function decomposition without thinking about syntax?
- Can you read a stack trace and say which line of *your* code caused the error?
- Can you read someone else's small Python script and explain it in plain English?

If yes — Week 3.
