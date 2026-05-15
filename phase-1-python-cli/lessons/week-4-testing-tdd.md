# Week 4 — Testing and TDD

**Goal:** Write tests as a habit. Use TDD on new features. Use `pdb` instead of `print` when stuck.

## Day 1 — pytest fundamentals

Install:
```bash
uv add --dev pytest
```

Layout:
```
tests/
├── test_timer.py
└── test_storage.py
```

A test:
```python
# tests/test_timer.py
from pomo.timer import Timer

def test_default_duration_is_25_minutes():
    t = Timer()
    assert t.duration_min == 25


def test_custom_duration():
    t = Timer(duration_min=15)
    assert t.duration_min == 15
```

Run:
```bash
uv run pytest
uv run pytest -v              # verbose
uv run pytest tests/test_timer.py::test_custom_duration   # one test
uv run pytest -k "duration"   # tests matching
uv run pytest --pdb           # drop into debugger on failure
```

### Good test names

Tests are docs. Name them like sentences:

✅ `test_finished_session_has_an_end_time`
✅ `test_save_creates_file_if_missing`
✅ `test_load_returns_empty_list_when_file_missing`
❌ `test_1`
❌ `test_storage`
❌ `test_works`

### What to test

- **Behavior, not implementation.** "Returns the right answer" not "calls X with Y."
- **Edges.** Empty input. One element. Very large. Invalid.
- **Errors.** Confirm bad input raises the right exception.

```python
import pytest

def test_invalid_duration_raises():
    with pytest.raises(InvalidDurationError):
        Timer(duration_min=-5)
```

### What NOT to test

- **The standard library.** Don't test that `int("5")` returns `5`.
- **Trivial getters.** `assert obj.x == x_value_you_just_passed` adds nothing.
- **Implementation details.** "It uses a list internally" is not a test.

## Day 2 — Fixtures

Fixtures are reusable test setup:

```python
import pytest
from pathlib import Path
from pomo.storage import Storage


@pytest.fixture
def storage(tmp_path: Path) -> Storage:
    return Storage(path=tmp_path / "data.json")


def test_save_and_load_roundtrip(storage: Storage):
    storage.save({"a": 1})
    assert storage.load() == [{"a": 1}]


def test_load_returns_empty_when_file_missing(storage: Storage):
    assert storage.load() == []
```

`tmp_path` is a built-in pytest fixture — a fresh empty directory for each test.

### Parametrize

```python
import pytest

@pytest.mark.parametrize("score,expected", [
    (95, "A"),
    (85, "B"),
    (75, "C"),
    (60, "F"),
    (0, "F"),
])
def test_grade(score: int, expected: str):
    assert grade(score) == expected
```

One test, many cases. Use it.

## Day 3 — Test-Driven Development

The cycle: **Red → Green → Refactor.**

1. **Red.** Write a failing test for behavior that doesn't exist yet.
2. **Green.** Write the minimum code to make it pass.
3. **Refactor.** Clean up. Tests still pass.

Repeat.

### TDD demo — implement `most_common`

**Red:**
```python
# tests/test_most_common.py
def test_most_common_single_winner():
    from pomo.text import most_common
    assert most_common(["a", "b", "a"]) == "a"
```

Run pytest — fails (function doesn't exist).

**Green (minimum):**
```python
# pomo/text.py
def most_common(words: list[str]) -> str:
    return "a"
```

Test passes. Yes, this is silly. The point is to confirm the test actually fails first.

**Red again:**
```python
def test_most_common_different_winner():
    from pomo.text import most_common
    assert most_common(["b", "b", "a"]) == "b"
```

Now the first implementation fails. Time to actually code.

**Green:**
```python
from collections import Counter

def most_common(words: list[str]) -> str:
    return Counter(words).most_common(1)[0][0]
```

Both pass.

**Red:**
```python
def test_most_common_ties_broken_alphabetically():
    from pomo.text import most_common
    assert most_common(["b", "a", "b", "a"]) == "a"
```

Fails — `Counter` doesn't promise alphabetical tie-breaking.

**Green:**
```python
def most_common(words: list[str]) -> str:
    counts = Counter(words)
    max_count = max(counts.values())
    return min(word for word, c in counts.items() if c == max_count)
```

All pass. Refactor if needed. Move on.

### Why this matters

You'll roll your eyes at TDD for the first 50 hours. Then you'll roll your eyes at code that doesn't have tests. The transition is real and it changes how you write code.

## Day 4 — Debugging with `pdb`

`print` debugging works for tiny scripts. For anything else, learn `pdb`.

### Drop in from anywhere

```python
def buggy_function(items: list[int]) -> int:
    total = 0
    for x in items:
        breakpoint()           # drops you into pdb here
        total += x
    return total
```

Run normally. Hits `breakpoint()`. You're in the debugger.

### Commands

| Command | What it does |
|---------|--------------|
| `n` | Next line (step over) |
| `s` | Step into |
| `c` | Continue (until next breakpoint or end) |
| `l` | List source around here |
| `p x` | Print `x` |
| `pp x` | Pretty-print |
| `w` | Show stack trace |
| `u` / `d` | Up / down the stack |
| `q` | Quit |

### From a failing test

```bash
uv run pytest --pdb
```

Drops you into the debugger at the moment of failure. You can inspect every variable in scope. This is a superpower.

## Day 5 — Continuous Integration

Set up GitHub Actions for your `pomo` project.

`.github/workflows/test.yml`:

```yaml
name: tests

on:
  push:
    branches: [main]
  pull_request:

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Set up uv
        uses: astral-sh/setup-uv@v3
        with:
          version: latest

      - name: Set up Python
        run: uv python install

      - name: Install deps
        run: uv sync --frozen

      - name: Lint
        run: uv run ruff check .

      - name: Format check
        run: uv run ruff format --check .

      - name: Type check
        run: uv run mypy src

      - name: Test
        run: uv run pytest
```

Commit this. Open a PR. Watch GitHub run your tests.

**From now on: every PR must have green CI. No exceptions.**

## End of week — assignment

Add a test suite to your `notes` mini-project from Week 3:
- At least one test per public method.
- At least one parametrized test.
- At least one test using a fixture.
- All passing in CI.

Then start Week 5 — the real project.
