# Phase 2 Lessons

4 weeks. Each week is broken into daily blocks; do them in order.

---

## Week 1 — HTML & CSS

### Day 1 — The document

- Anatomy: `<!doctype html>`, `<html>`, `<head>`, `<body>`.
- The block/inline distinction.
- Semantic tags: `<header>`, `<nav>`, `<main>`, `<article>`, `<section>`, `<aside>`, `<footer>`.
- Why semantic matters: screen readers, SEO, future-you reading your own code.

**Exercise:** Mark up a real blog post you found online — title, byline, paragraphs, headings, footnotes, related links — using semantic tags only. No CSS yet.

### Day 2 — Forms and inputs

- `<form>`, `<input>`, `<label>`, `<button>`, `<select>`, `<textarea>`.
- Input types: `text`, `email`, `password`, `number`, `date`, `checkbox`, `radio`, `file`.
- Why every input needs a `<label>` (accessibility, click target).
- Native validation: `required`, `type`, `pattern`, `min`/`max`.
- The form submission lifecycle (default behavior + `event.preventDefault()`).

**Exercise:** Build a contact form with name, email, message, a checkbox, and a category dropdown. Validate with HTML attributes only — no JS yet.

### Day 3 — CSS basics & the box model

- Selectors: element, class, id, descendant, child, attribute, pseudo (`:hover`, `:focus`, `:nth-child`).
- The cascade and specificity.
- The box model: content, padding, border, margin. `box-sizing: border-box`.
- Inline vs block vs inline-block.

**Exercise:** Style your blog post from Day 1. Margins, padding, font sizes, line height, link styling. No frameworks.

### Day 4 — Flexbox & grid

- **Flexbox** for one-dimensional layout (row OR column).
- **Grid** for two-dimensional layout (rows AND columns).
- When to use which.

**Exercise:** Recreate three real layouts from screenshots:
1. A navbar with logo left, links right.
2. A card grid (3 columns desktop, 2 tablet, 1 mobile).
3. A two-column blog page (article + sidebar).

### Day 5 — Accessibility basics

- Color contrast (WCAG AA = 4.5:1 for normal text).
- Keyboard navigation: every interactive element must be reachable.
- Focus visible.
- Alt text on images.
- `aria-label` when there's no visible text (icon buttons).
- Skip-to-content links.

**Exercise:** Audit one of your Day 4 layouts. Run [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/) and Chrome Lighthouse. Fix anything below A11y 90.

---

## Week 2 — Tailwind, design, deploy

### Day 1 — Why Tailwind

The argument: writing CSS classes vs writing CSS files. Tailwind isn't "the right way" — it's *a* way. Learn it because it's industry standard now.

- Utility classes (`flex`, `gap-4`, `text-xl`, `bg-slate-900`).
- The design tokens (spacing scale, color palette, font sizes).
- Responsive variants (`md:flex-row`).
- State variants (`hover:bg-slate-800`, `focus-visible:ring-2`).

**Exercise:** Rebuild your three layouts from Week 1 Day 4 in Tailwind. Notice what's faster and what's harder.

### Day 2 — Design fundamentals (1 day, intense)

You won't become a designer. But you can become "not bad," and that's enough.

- **Spacing.** Use a scale (4, 8, 16, 24, 32, 48, 64). Don't use 13 then 17 then 19.
- **Typography.** One sans-serif + one serif/mono. Two weights. Three sizes max for body content.
- **Color.** One brand color, one accent, one neutral scale (slate is fine). Stop.
- **Hierarchy.** What's most important? Make it bigger / bolder / higher / earlier.

**Exercise:** Take a website you find ugly. Make a Tailwind version that's nicer. Don't change the words. Just the design.

### Day 3 — Responsive design

- Mobile-first vs desktop-first. We do mobile-first.
- Breakpoints: don't memorize pixel values. Tailwind's defaults are fine (`sm`, `md`, `lg`, `xl`, `2xl`).
- Fluid typography (`clamp()` if needed).
- Images: `srcset`, lazy loading, `object-fit`.

**Exercise:** Take any of your previous layouts. Make it actually good at 360px wide, 768px wide, and 1440px wide. Use Chrome devtools' device toolbar.

### Day 4 — A static site builder (Astro or 11ty)

We need a way to make multi-page sites without copy-pasting `<header>` 50 times. Use **Astro** — it's the right amount of magic for the right amount of work.

```bash
npm create astro@latest portfolio
cd portfolio
npm run dev
```

- Pages directory.
- Components.
- Layouts.
- Markdown content collections (for blog posts).

**Exercise:** Set up the portfolio project. Get a homepage and an `/about` page rendering.

### Day 5 — Deploy to Cloudflare Pages

- Push the portfolio to GitHub.
- Connect to Cloudflare Pages.
- First deploy.
- Add a custom subdomain (free Cloudflare DNS).

This is the first time their work is on the public internet. Celebrate it.

**Exercise:** Get `portfolio.your-domain.com` to load with HTTPS, custom domain, and a real homepage. Share the URL with someone outside the course.

---

## Week 3 — HTTP, fetch, devtools

### Day 1 — HTTP fundamentals

- The request: method, path, version, headers, body.
- The response: status code, headers, body.
- Methods: GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD.
- Status codes: 1xx (info, rare), 2xx (success), 3xx (redirect), 4xx (client error), 5xx (server error). Memorize: 200, 201, 204, 301, 302, 304, 400, 401, 403, 404, 409, 422, 429, 500, 502, 503.
- Headers: `Content-Type`, `Authorization`, `Cookie`, `Set-Cookie`, `Cache-Control`, `Origin`, `Referer`, `User-Agent`.

**Exercise:** Use `curl -v` to make a GET request to 5 different APIs. Read the response headers. Explain each one.

### Day 2 — `fetch` in the browser

```javascript
const response = await fetch("https://api.github.com/users/torvalds");
const data = await response.json();
console.log(data);
```

- Promises and `await`.
- Reading `response.status`, `response.ok`, `response.headers`.
- POST with JSON body.
- Error handling: network errors vs 4xx vs 5xx.

**Exercise:** Add a small `/playground` page to your portfolio. On the page, fetch from a free public API (GitHub users, OpenWeather, etc.) and display results.

### Day 3 — JSON, CORS, cookies

- JSON: what it is, what it isn't (no comments, no trailing commas, strings only with `"`).
- CORS: the browser security rule. What it blocks and what it doesn't. Why your fetch fails with "blocked by CORS policy."
- Cookies: `Set-Cookie` from server, `Cookie` from browser. `HttpOnly`, `Secure`, `SameSite`.
- Storing tokens: cookies vs localStorage tradeoffs.

**Exercise:** Cause a CORS error deliberately. Read the message. Explain why it happened.

### Day 4 — Browser devtools deep dive

The single most underused developer tool. Spend a full day on it.

- **Elements:** inspect, edit, see computed styles, find layout issues.
- **Network:** see every request, filter, throttle, replay.
- **Console:** log, error, monitor events, eval expressions.
- **Sources:** breakpoints in JS, step through, watch variables.
- **Application:** local storage, session storage, cookies, service workers.
- **Lighthouse:** performance, accessibility, SEO scores.

**Exercise:** Pick a real website. Use devtools to answer: How big is the homepage? How many requests does it make? Are there layout shifts? What's the LCP element? Does it pass accessibility?

### Day 5 — A page that uses an API end-to-end

**Exercise:** Build `/weather` on your portfolio. User types a city, page calls a weather API, shows the result with a nice card. Handle: loading state, error state, empty state (no city typed). All in plain HTML + Tailwind + a tiny bit of JS. No framework yet.

---

## Week 4 — SQL

### Day 1 — Setup and basics

```bash
docker run --name pg -e POSTGRES_PASSWORD=devpass -p 5432:5432 -d postgres:16
docker exec -it pg psql -U postgres
```

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

INSERT INTO users (email, name) VALUES
  ('alice@example.com', 'Alice'),
  ('bob@example.com', 'Bob');

SELECT * FROM users;
```

Concepts:
- Tables, rows, columns, types.
- Primary keys (artificial vs natural).
- `NOT NULL`, `UNIQUE`, `DEFAULT`, `CHECK`.
- `INSERT`, `SELECT`, `UPDATE`, `DELETE`.

### Day 2 — Filtering, sorting, aggregating

- `WHERE` clauses, operators (`=`, `<>`, `<`, `>`, `LIKE`, `IN`, `BETWEEN`, `IS NULL`).
- `ORDER BY`, `LIMIT`, `OFFSET`.
- Aggregates: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`.
- `GROUP BY` and `HAVING`.
- `DISTINCT`.

### Day 3 — Joins and relationships

- Foreign keys.
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`.
- Many-to-many via a join table.
- Self-joins.
- N+1 problem and what it looks like in SQL.

### Day 4 — Indexes, transactions, and EXPLAIN

- What an index is (a B-tree, sorted on the column(s)).
- Trade-offs: faster reads, slower writes, more disk.
- `EXPLAIN ANALYZE` — read the plan.
- `Seq Scan` vs `Index Scan` — what triggers each.
- Transactions: `BEGIN`, `COMMIT`, `ROLLBACK`. Why they matter.
- Isolation levels (just `READ COMMITTED` for now).

### Day 5 — Schema design

Designing well is more important than knowing every keyword.

- **Normalization:** First, second, third normal form — what they mean in practice.
- **When to denormalize:** when query patterns demand it. Not by default.
- **Naming:** singular vs plural tables, snake_case columns, foreign key conventions (`<table>_id`).
- **Soft delete vs hard delete:** `deleted_at` column vs row removal.
- **Timestamps:** always `created_at` and `updated_at`. Always `TIMESTAMPTZ`, never `TIMESTAMP` (the latter has no timezone, which is a bug waiting).

**Capstone exercise:** Design a schema for a small library app — users, books, copies, loans, reservations, librarians. Write the `CREATE TABLE` statements. Justify every choice.

See [project.md](project.md) for the 50-kata practice set.
