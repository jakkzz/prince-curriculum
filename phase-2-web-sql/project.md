# Phase 2 Projects

Two deliverables this phase. Both required.

---

## Project A — `portfolio`

A deployed personal portfolio site at a real subdomain on the learner's own domain.

### Deliverable

- A public GitHub repo named `portfolio`.
- Built with **Astro** (or 11ty / SvelteKit if mentor approves).
- Deployed to **Cloudflare Pages**.
- Reachable at a custom subdomain (e.g., `portfolio.<your-domain>.com`).

### Pages required

- [ ] **Home.** Name, photo (optional), one paragraph, link to GitHub, link to learning log.
- [ ] **About.** Who they are, what they're learning, what they want to build. Real writing — minimum 200 words.
- [ ] **Projects.** At least Phase 0 (learning log) and Phase 1 (`pomo`), with screenshots and short descriptions. README-style.
- [ ] **Now.** What they're working on this week (auto-pulled from the learning log if they can, or manually updated).
- [ ] **Contact / 404.** A contact page (form is optional; email link is enough) + a 404 page.

### Quality requirements

- [ ] Lighthouse score ≥ 90 on Performance, Accessibility, Best Practices, SEO.
- [ ] Works on mobile (360px) without horizontal scrolling.
- [ ] Keyboard-navigable (tab through every interactive element).
- [ ] Color contrast passes WCAG AA.
- [ ] HTTPS works at the custom domain.
- [ ] A real `<title>` and meta description per page.
- [ ] A real OG image (any 1200x630 PNG).
- [ ] A favicon.

### Grading rubric

| # | Category | What "2" looks like |
|---|----------|---------------------|
| 1 | **Semantic HTML** | Real tags, not `<div>` soup |
| 2 | **CSS quality** | Consistent spacing/typography, looks intentional |
| 3 | **Responsive** | Works mobile/tablet/desktop without weird gaps |
| 4 | **Accessibility** | Lighthouse ≥ 90, real-world keyboard test passes |
| 5 | **Performance** | Lighthouse ≥ 90, no obvious "wait what's loading" |
| 6 | **Content** | Written by them, real specifics, not "lorem ipsum" |
| 7 | **Deploy** | Lives at the real subdomain over HTTPS |
| 8 | **Git/CI** | Push-to-deploy works, commits are clean |

---

## Project B — `sql-katas`

50 SQL exercises solved against a non-trivial seed dataset.

### Deliverable

A public GitHub repo named `sql-katas` containing:

```
sql-katas/
├── README.md
├── schema.sql            # the dataset's CREATE TABLE statements
├── seed.sql              # at least 1000 rows of plausible data
├── solutions/
│   ├── 01-basic-select.sql
│   ├── 02-where-clauses.sql
│   ├── ...
│   └── 50-window-functions.sql
├── docker-compose.yml    # spins up postgres for testing
└── verify.sh             # runs all solutions and prints pass/fail
```

### Topic distribution

| # | Topic | Count |
|---|-------|-------|
| 1–5 | Basic SELECT, WHERE, ORDER BY, LIMIT | 5 |
| 6–10 | Aggregates: COUNT, SUM, AVG, GROUP BY, HAVING | 5 |
| 11–18 | Joins: INNER, LEFT, RIGHT, FULL, self-join | 8 |
| 19–24 | Subqueries and CTEs | 6 |
| 25–30 | INSERT, UPDATE, DELETE, transactions | 6 |
| 31–35 | Indexes & EXPLAIN ANALYZE | 5 |
| 36–40 | Views, constraints, schema modification | 5 |
| 41–45 | Date/time and string functions | 5 |
| 46–50 | Window functions (LAG, LEAD, ROW_NUMBER, etc.) | 5 |

### The dataset

Pick or build a domain with 5–7 tables. Reasonable choices: library, ticket-tracker, e-commerce, recipe-app, fitness-tracker.

The seed data should be **non-trivial**: at least 1000 rows total, with realistic relationships. Don't use ChatGPT to generate it — use `faker` or grab a real dataset and adapt.

### Quality requirements

- [ ] Every solution file starts with the **problem statement** as a comment.
- [ ] Every solution ends with the **expected output** in a comment (first 5 rows).
- [ ] Every solution is verified to produce the expected output (`verify.sh` is green).
- [ ] At least 5 solutions include an `EXPLAIN ANALYZE` and a written observation.
- [ ] At least 5 solutions include a "what I tried first that didn't work" note.

### Grading rubric

| # | Category | What "2" looks like |
|---|----------|---------------------|
| 1 | **Schema design** | Sensible types, constraints, foreign keys |
| 2 | **Seed data** | Plausible, varied, enough to make queries interesting |
| 3 | **Coverage** | All 9 topic areas, ≥ 50 katas total |
| 4 | **Correctness** | Every solution produces the documented output |
| 5 | **Query quality** | Idiomatic SQL, no avoidable subselects, joins instead of multiple queries |
| 6 | **EXPLAIN notes** | Shows real understanding, not just pasted output |
| 7 | **Failure notes** | "What didn't work" notes show learning |
| 8 | **Verifier** | `verify.sh` actually runs and reports per-kata pass/fail |

---

## Combined gate

To pass Phase 2 you need both projects shipped AND the gate exercise (see [../assessments/gate-criteria.md](../assessments/gate-criteria.md)) passed live.

## Common ways this goes wrong

- **Portfolio looks generic.** They used a template and didn't customize. Re-do.
- **Tailwind classes are inconsistent** (`p-3`, `p-5`, `p-7` randomly). Either commit to the scale or you're not using the system.
- **SQL solutions are right but bad** — using a subquery where a JOIN would do, or fetching the whole table then filtering in code. Reject.
- **EXPLAIN observations are "Seq Scan."** That's not an observation, that's a label. What does it mean here? What would help?

## What submission looks like

Two PRs. Two URLs (portfolio site live + sql-katas repo). Message to mentor includes both, plus the gate-exercise time slot.
