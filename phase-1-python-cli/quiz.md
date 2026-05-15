# Phase 1 Quiz

End of Week 3. 45 minutes. No looking up. Section E is live.

## Section A — Language fundamentals (10)

1. What's the difference between a `list` and a `tuple`?
2. What's a mutable default argument and why is it dangerous?
3. What does this print?
   ```python
   xs = [1, 2, 3]
   ys = xs
   ys.append(4)
   print(xs)
   ```
4. What's the difference between `is` and `==`?
5. What does `None` mean? When would you return it vs raise an exception?
6. What's a list comprehension? Write one that returns the squares of odd numbers from 1–20.
7. What does `enumerate` do? Show an example.
8. Why is `dict` lookup O(1) but `if x in some_list` O(n)?
9. What does `*args` mean in a function signature? What about `**kwargs`?
10. What's the difference between `str.split()` and `str.split(" ")`? (Try them.)

## Section B — Types and tooling (5)

1. What's a type hint? Are they enforced at runtime?
2. What does `list[int]` mean? What about `dict[str, list[int]]`?
3. What's `Optional[str]` (or `str | None`) and when do you use it?
4. What does `uv sync` do? What does it not do?
5. What's a virtualenv and why do we use one per project?

## Section C — Classes and structure (5)

1. When should you use a `@dataclass` vs a regular class?
2. When should you NOT use a class at all?
3. What goes in `pyproject.toml`?
4. What's the difference between `from foo import bar` and `import foo`?
5. Why do we put production code in `src/` and tests in `tests/`?

## Section D — Errors (5)

1. What does this code do?
   ```python
   try:
       result = risky()
   except Exception:
       pass
   ```
2. What's wrong with it?
3. When should you define a custom exception class?
4. What does `raise` (with no argument) do inside an except block?
5. What's the difference between `logger.error("x")` and `logger.exception("x")`?

## Section E — Live coding (45 min, mentor watching)

The mentor will give you a small problem. You'll write it with tests. Examples (you'll get one of these or similar):

1. **Word frequency**: function that takes text, returns the 5 most-frequent words, lowercased, excluding common stopwords. With tests including: empty input, all stopwords, ties.

2. **Schedule overlap**: given a list of `(start_min, end_min)` tuples, return True if any two overlap. With tests including: empty, one item, no overlaps, touching but not overlapping, full overlap.

3. **CSV transformer**: read a CSV file, sum a numeric column grouped by a string column, output as JSON to stdout. With tests using temp files.

You will be evaluated on:
- Did you write a test FIRST?
- Are your function and variable names good?
- Did you use type hints?
- Did you handle edge cases?
- Did you run `ruff` and `mypy` before declaring done?

---

**Scoring:**
- A–D: 25 questions, 1 each. Need 20+.
- E: pass/fail. Must pass.
- Failing either → re-do the relevant week and retake.
