# Phase 4 Week 5 Quiz — shadcn/ui & design polish

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** shadcn/ui patterns, design tokens, dark mode, mobile-first, accessibility audit.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** shadcn/ui — what is it?

**A2.** Why not just `npm install shadcn-ui`?

**A3.** Why Radix primitives?

**A4.** Dark mode strategy in Tailwind?

**A5.** Mobile-first vs desktop-first?

**A6.** Focus visible — why specifically `focus-visible` not `focus`?

**A7.** Loading skeleton vs spinner?

**A8.** Color contrast for body text — AA?

**A9.** Empty state — why care?

**A10.** Mobile breakpoint to test?

## Section B — Predict the output

**B1.**

```
<Button variant="destructive">Delete</Button>
```

**B2.**

```
<div className="bg-white dark:bg-slate-900">
```

**B3.**

```
<button className="focus-visible:ring-2 focus-visible:ring-blue-500">
```

**B4.**

```
<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
```

**B5.**

```
// Empty state
<div>No quests yet. <Button>Create your first</Button></div>
```

## Section C — Fill in the missing code

**C1.** Install a shadcn component.

**C2.** Dark mode toggle.

**C3.** Responsive card grid.

**C4.** Loading skeleton.

**C5.** Empty state with CTA.

## Section D — Find the bug

**D1.**

```
// Lighthouse a11y: 60
<button onClick={...}><span>×</span></button>
```

**D2.**

```
// Tabbing through page: focus invisible
<button className="hover:bg-blue-700">
```

**D3.**

```
// Page horizontal scrolls on mobile (overflow)
<div className="w-screen">
```

## Section E — Write the code

**E1.** A complete card component with image, title, description, CTA.

**E2.** A modal/dialog with accessibility hooks.

**E3.** Tailwind config customization for brand colors.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
