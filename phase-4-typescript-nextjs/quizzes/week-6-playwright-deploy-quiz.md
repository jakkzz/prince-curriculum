# Phase 4 Week 6 Quiz — Playwright & Deploy

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Playwright E2E tests, role-based selectors, CI for frontends, Vercel/Cloudflare Pages deploy.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** What's Playwright?

**A2.** Why prefer role selectors over CSS?

**A3.** What's an integration test vs E2E?

**A4.** Why test 'critical paths' first?

**A5.** Vercel vs Cloudflare Pages for Next.js?

**A6.** What's `expect(page).toHaveURL('/dashboard')`?

**A7.** Why auto-wait in Playwright?

**A8.** When does Playwright run tests in parallel?

**A9.** `data-testid` attributes — when use them?

**A10.** Should you run Playwright in CI?

## Section B — Predict the output

**B1.**

```
await page.goto('/login');
await page.getByLabel('Email').fill('a@b.c');
await page.getByLabel('Password').fill('pw12345678');
await page.getByRole('button', { name: 'Log in' }).click();
await expect(page).toHaveURL('/dashboard');
```

**B2.**

```
await page.getByText('No quests yet').waitFor();
```

**B3.**

```
test('mobile view', async ({ page }) => {
  await page.setViewportSize({ width: 360, height: 800 });
  ...
})
```

**B4.**

```
await expect(page.locator('button')).toHaveCount(3);
```

**B5.**

```
test('serial', async ({ page }) => { /* test 1 */ });
test('parallel', async ({ page }) => { /* test 2 */ });
```

## Section C — Fill in the missing code

**C1.** Login test.

**C2.** Setup with API spun up via docker compose.

**C3.** Test that mocks API responses.

**C4.** GitHub Actions for Playwright.

**C5.** Set custom subdomain on Vercel.

## Section D — Find the bug

**D1.**

```
// flaky test:
await page.click('button');
await page.waitForTimeout(1000);
await expect(page.getByText('saved')).toBeVisible();
```

**D2.**

```
// Selector breaks when CSS classes change:
await page.click('.btn-primary');
```

**D3.**

```
// Test passes locally, fails in CI
```

## Section E — Write the code

**E1.** Full E2E test: register → login → create quest → log out.

**E2.** Test that handles a 401 by redirecting to login.

**E3.** Vercel deploy hook for production.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
