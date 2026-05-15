# Phase 1 Resources

## Required reading

- [Python tutorial — sections 1–9](https://docs.python.org/3/tutorial/) — official, well-written.
- [`uv` docs — Getting Started](https://docs.astral.sh/uv/) — read it end to end. It's short.
- [pytest — Get Started](https://docs.pytest.org/en/stable/getting-started.html)
- [argparse tutorial](https://docs.python.org/3/howto/argparse.html)

## Recommended reading

- [Refactoring Python Applications for Simplicity](https://realpython.com/python-refactoring/)
- [Logging in Python (Real Python)](https://realpython.com/python-logging/)
- [Hypermodern Python (the series)](https://cjolowicz.github.io/posts/hypermodern-python-01-setup/) — slightly opinionated but covers modern tooling well.

## Books worth reading slowly

- *Fluent Python* by Luciano Ramalho — when you've finished Phase 1 and want to go deeper. Don't read in Phase 1, it'll overwhelm.
- *Python Tricks* by Dan Bader — short, useful idioms.

## Reference

- [Python standard library](https://docs.python.org/3/library/) — bookmark it. You'll come back to `pathlib`, `json`, `datetime`, `collections`, `itertools`, `subprocess`, `logging` a lot.
- [PEP 8](https://peps.python.org/pep-0008/) — style guide. `ruff` enforces most of it for you.
- [PEP 257](https://peps.python.org/pep-0257/) — docstring conventions.

## Videos (optional)

- [Corey Schafer's Python tutorials](https://www.youtube.com/playlist?list=PL-osiE80TeTskrapNbzXhwoFUiLCjGgY7) — best free Python video series on YouTube.
- [Anthony Sottile's pytest videos](https://www.youtube.com/@anthonywritescode) — short, practical.

## Skip these for now

- Async Python. Phase 3.
- Decorators (beyond `@dataclass` and `@pytest.fixture`). They confuse before they help.
- Metaclasses. You will likely never need these.
- "Pythonic patterns" articles. Most are cargo-culted. Focus on clarity.

## When stuck

1. The error message in quotes on Google.
2. [resources/troubleshooting.md](../resources/troubleshooting.md).
3. Stack Overflow — but read the *highest-voted* answer, not the accepted one. They diverge surprisingly often.
4. Mentor.
