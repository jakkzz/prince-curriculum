# Phase 2 Week 2 Quiz — Tailwind, Design, Deploy

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Tailwind utility classes, design tokens, responsive design, Astro/static site deploy.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 20 / 25.

## Section A — Multiple choice

**A1.** Tailwind's `p-4` means what in CSS?

**A2.** Why use a design token system (4, 8, 16, 24, 32)?

**A3.** `md:flex-row` — when does this apply?

**A4.** What's `hover:bg-blue-700` in Tailwind?

**A5.** What does `focus-visible:ring-2` do?

**A6.** Three weights, three sizes — why this rule?

**A7.** What does mobile-first design mean?

**A8.** Astro vs Next.js for a static site?

**A9.** Cloudflare Pages auto-deploy on git push — how?

**A10.** Lighthouse score ≥90 means what?

## Section B — Predict the output

**B1.** What's this render?

```
<div class="flex justify-center items-center h-screen">Hello</div>
```

**B2.** What's the padding here?

```
<button class="px-4 py-2">
```

**B3.** What's the layout at 800px width?

```
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
```

**B4.** Dark mode — what does `dark:bg-slate-900` do?

**B5.** Typography scale — what's `text-xl` vs `text-2xl`?

## Section C — Fill in the missing code

**C1.** Center a div vertically + horizontally with Tailwind.

```
<div class="???">centered</div>
```

**C2.** A button with rounded corners + hover state.

```
<button class="???">
```

**C3.** Make text larger on desktop only.

```
<h1 class="text-2xl ???">
```

**C4.** Astro page with frontmatter.

**C5.** Cloudflare DNS record for `portfolio.example.com` → Pages.

## Section D — Find the bug

**D1.** Tailwind classes don't apply.

```
<div className={`bg-${color}-500`}>
```

**D2.** Site loads but icons missing.

```
<img src="/icons/menu.svg">
```

**D3.** CSS file applies in dev but not prod.

## Section E — Write the code

**E1.** A responsive hero section: heading, subhead, CTA. Stacks on mobile, side-by-side on desktop.

**E2.** A footer with three columns on desktop, stacked mobile.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 2

**Total: __ / 25**

Log score in `learning-log/`. 20+ to advance.
