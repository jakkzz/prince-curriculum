# Phase 2 Week 3 Quiz — HTTP, fetch, devtools

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** HTTP methods, status codes, CORS, cookies, fetch API, browser devtools.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 20 / 25.

## Section A — Multiple choice

**A1.** Method to create a new resource on the server?

**A2.** Status 201 means?

**A3.** Difference between 401 and 403?

**A4.** What's CORS?

**A5.** Preflight request — when?

**A6.** What's `HttpOnly` on a cookie for?

**A7.** localStorage vs cookies for auth tokens?

**A8.** What does `Cache-Control: no-store` mean?

**A9.** A network request shows status 0 — what?

**A10.** Devtools — where to view all requests with timing?

## Section B — Predict the output

**B1.** `await fetch('/api/users')` — what does it return?

**B2.** What does `response.ok` return for status 404?

**B3.** What's the result of this?

```
const r = await fetch('/api/users');
const data = await r.json();
```

**B4.** A page at `https://app.com` calls `fetch('https://api.app.com/users')`.

**B5.** `document.cookie` returns?

## Section C — Fill in the missing code

**C1.** Make a POST request with JSON body.

```
const r = await fetch('/api/users', ???);
```

**C2.** Handle a fetch error properly.

```
try {
  const r = await fetch('/api/users');
  ???
} catch (e) {
  console.error(e);
}
```

**C3.** Read query params in URL `?word=thorough&limit=5`.

```
const params = new URL(window.location).searchParams;
???
```

**C4.** Set a cookie that JS can't read.

```
Set-Cookie: token=abc123; ???
```

**C5.** Devtools console: filter requests for failed (4xx/5xx).

## Section D — Find the bug

**D1.** Fetch fails with 'CORS error' in browser.

```
fetch('https://other-domain.com/api')
```

**D2.** POST with form data sends nothing.

```
fetch('/submit', {method: 'POST', body: {name: 'Prince'}})
```

**D3.** Logged-in user gets 401 on every API call.

## Section E — Write the code

**E1.** A function that fetches user data and handles errors gracefully.

**E2.** Track a button click count, posting each to /analytics.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 2

**Total: __ / 25**

Log score in `learning-log/`. 20+ to advance.
