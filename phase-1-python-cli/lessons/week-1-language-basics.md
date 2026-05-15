# Week 1 — Python language basics

**Goal:** Read and write Python that uses variables, types, control flow, functions, and basic I/O. Be comfortable with the REPL.

## Day 1 — Setup and the REPL

### Install `uv`

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
exec $SHELL          # restart shell so uv is on PATH
uv --version
```

### Install Python via `uv`

```bash
uv python install 3.13
uv python list       # show installed versions
```

### Create your first project

```bash
cd ~/prince
mkdir python-warmup
cd python-warmup
uv init
```

This generates `pyproject.toml`, `.python-version`, `main.py`, and `README.md`. Inspect each one.

### Run code

```bash
uv run python main.py            # run the file
uv run python                    # start the REPL
```

In the REPL:

```python
>>> 2 + 2
4
>>> name = "Prince"
>>> print(f"Hello, {name}")
Hello, Prince
>>> exit()
```

The REPL (Read-Eval-Print Loop) is your friend. When you're not sure what something does, try it there first.

### Tasks
- Make a new project. Modify `main.py` to print your name, today's date, and the time.
- Use a virtualenv (`uv` did this automatically — find the `.venv` folder).
- Run `which python` from inside the project (after `uv run` once) — note the path.

## Day 2 — Variables and types

### Built-in types you must know

| Type | Example | Notes |
|------|---------|-------|
| `int` | `42` | Arbitrary precision in Python |
| `float` | `3.14` | IEEE 754, imprecise |
| `str` | `"hello"` | Immutable, Unicode |
| `bool` | `True`, `False` | Subclass of `int` |
| `list` | `[1, 2, 3]` | Ordered, mutable |
| `tuple` | `(1, 2, 3)` | Ordered, immutable |
| `dict` | `{"a": 1}` | Key-value, ordered (since 3.7) |
| `set` | `{1, 2, 3}` | Unique values, unordered |
| `None` | `None` | The absence of a value |

### Type hints (use them from day 1)

```python
name: str = "Prince"
age: int = 16
scores: list[int] = [85, 92, 77]
profile: dict[str, str | int] = {"name": "Prince", "age": 16}

def greet(name: str) -> str:
    return f"Hello, {name}"
```

Type hints are **optional at runtime** but checked by `mypy`. We use them always.

Install `mypy` and `ruff`:

```bash
uv add --dev mypy ruff
uv run mypy main.py
uv run ruff check .
uv run ruff format .
```

### Tasks
- Write a script `temperature.py` that has variables for Celsius and Fahrenheit, with type hints, and prints both with f-strings.
- Run `mypy` on it. Make sure there are no errors.
- Run `ruff format .` and notice what changes.

## Day 3 — Control flow

### `if`/`elif`/`else`

```python
def grade(score: int) -> str:
    if score >= 90:
        return "A"
    elif score >= 80:
        return "B"
    elif score >= 70:
        return "C"
    else:
        return "F"
```

### Loops

```python
# for
for i in range(5):
    print(i)

# for with index
for i, name in enumerate(["a", "b", "c"]):
    print(i, name)

# while
n = 10
while n > 0:
    print(n)
    n -= 1

# break and continue
for i in range(20):
    if i % 2 == 0:
        continue          # skip even
    if i > 15:
        break             # stop
    print(i)
```

### Comprehensions

The Python-y way:

```python
squares = [x * x for x in range(10)]
evens = [x for x in range(20) if x % 2 == 0]
mapping = {x: x * x for x in range(5)}
```

Comprehensions are great. Don't nest them more than 2 levels — at that point, a `for` loop is clearer.

### Tasks
- Write `fizzbuzz.py`. For numbers 1–100: print "Fizz" for multiples of 3, "Buzz" for multiples of 5, "FizzBuzz" for both, else the number.
- Write `evens_squared.py` that returns a list of squared even numbers from 1 to 20, using a comprehension.

## Day 4 — Functions

```python
def add(a: int, b: int) -> int:
    return a + b


def greet(name: str, *, greeting: str = "Hello") -> str:
    """Return a friendly greeting. `greeting` is keyword-only."""
    return f"{greeting}, {name}"


print(greet("Prince"))
print(greet("Prince", greeting="Hi"))
```

### Key concepts
- **Positional vs keyword arguments.** `*` in the signature forces what follows to be keyword-only.
- **Default values.** Never use a mutable default (`def f(items=[])` is a trap — Google "Python mutable default argument").
- **Docstrings.** Triple-quoted string at the top of a function. Tools like IDEs and `help()` use them.
- **One job per function.** If you can't name it in 3 words, it does too much.

### Tasks
- Write a function `most_common(words: list[str]) -> str` that returns the most common word in a list. Ties broken alphabetically.
- Write a docstring explaining inputs, outputs, and one example.
- Test it manually with several inputs.

## Day 5 — Lists, dicts, sets in depth

### Lists

```python
xs = [3, 1, 4, 1, 5, 9, 2, 6]
xs.append(5)
xs.sort()                  # in-place
sorted_xs = sorted(xs)     # returns new
xs.reverse()
len(xs)
xs[0], xs[-1]              # first, last
xs[2:5]                    # slice
xs[::-1]                   # reversed copy
```

### Dicts

```python
d = {"a": 1, "b": 2}
d["c"] = 3
d.get("d", 0)              # default if missing
"a" in d
for key, value in d.items():
    print(key, value)
```

### Sets

```python
s = {1, 2, 3}
s.add(4)
s.discard(99)              # no error if missing
1 in s                     # O(1)
a = {1, 2, 3}
b = {2, 3, 4}
a & b                      # intersection
a | b                      # union
a - b                      # difference
```

### Complexity intuition

| Operation | List | Dict | Set |
|-----------|------|------|-----|
| Lookup by key/index | O(1) | O(1) | O(1) |
| Lookup by value | O(n) | O(n) | O(1) |
| Append/insert end | O(1) | O(1) | O(1) |
| Insert/remove at start | O(n) | — | — |
| Delete by key | O(n) | O(1) | O(1) |

Rule of thumb: if you're going to do `if x in collection` a lot, use a `set` or `dict`, not a `list`.

### Tasks
- Write `word_frequencies(text: str) -> dict[str, int]`.
- Write `unique_chars(text: str) -> set[str]`.
- Write `flatten(lists: list[list[int]]) -> list[int]` without using anything from `itertools`.

## End of week — self-check

You should be able to, without looking up:
- Write FizzBuzz from a blank file.
- Iterate over a dictionary's items.
- Use a list comprehension with a filter.
- Explain why dict lookup is faster than list `in`.

If any of these are shaky: re-do the relevant day before moving to Week 2.
