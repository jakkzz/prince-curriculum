# Phase 2 Week 1 Quiz — HTML & CSS

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Semantic HTML, CSS box model, selectors, flexbox/grid, accessibility basics.
>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 20 / 25.

## Section A — Multiple choice (10)

**A1.** What's the difference between `<div>` and `<section>`?

A) Same thing
B) `<section>` has implied semantic meaning (a thematic group with usually a heading); `<div>` is generic
C) `<section>` is for layout, `<div>` for content
D) `<section>` is newer

**A2.** Which is the correct way to write an accessible image?

A) `<img src="cat.jpg">`
B) `<img src="cat.jpg" alt="">`
C) `<img src="cat.jpg" alt="A cat playing">`
D) Either B or C, depending on whether the image is decorative

**A3.** What does `box-sizing: border-box` change?

A) Removes padding
B) Padding and border are INCLUDED in the declared width — predictable sizing
C) Removes the border
D) Sets the box type

**A4.** What's the CSS specificity order, low to high?

A) tag, class, id, inline
B) id, class, tag, inline
C) inline, id, class, tag
D) class, id, tag, inline

**A5.** When should you use flexbox vs grid?

A) Flex for everything
B) Flex for 1D (row OR column); Grid for 2D (rows AND columns simultaneously)
C) Grid for everything
D) Flex is faster

**A6.** Which `<input>` type validates email format automatically?

A) `<input type="text">`
B) `<input type="email">`
C) `<input type="mail">`
D) `<input type="form">`

**A7.** WCAG AA contrast ratio for normal text?

A) 3:1
B) 4.5:1
C) 7:1
D) 1.5:1

**A8.** Why use `rem` instead of `px` for font sizes?

A) Faster rendering
B) `rem` is relative to root font-size — respects user's browser font-size preference
C) Smaller numbers
D) Required by Tailwind

**A9.** What does `aria-label="Close"` do?

A) Adds a tooltip
B) Provides an accessible label for screen readers when there's no visible text (e.g., icon-only buttons)
C) Styling
D) JavaScript hook

**A10.** What's the purpose of `<label for="email">`?

A) Adds a tooltip
B) Associates the label with an input (id="email") — clicking the label focuses the input; screen readers announce it
C) Styles the input
D) Required by HTML

## Section B — Predict the output (5)

**B1.** What does this render?

```html
<button>Click me</button>
<style>
button { background: red; }
button:hover { background: blue; }
</style>
```

**B2.** Predict the layout:

```html
<div style="display: flex; gap: 10px;">
  <div style="background: red;">A</div>
  <div style="background: green;">B</div>
  <div style="background: blue;">C</div>
</div>
```

**B3.** What's wrong here?

```html
<a href="page2.html">Go to page 2</a>
```

**B4.** What's the displayed width?

```css
.box { width: 200px; padding: 20px; border: 5px solid; box-sizing: border-box; }
```

**B5.** What does this CSS select?

```css
ul > li.active { color: red; }
```

## Section C — Fill in the missing code (5)

**C1.** Make a heading and accessible image.

```html
<???>Welcome</???>
<img ??? ???>
```

**C2.** Center a div using flexbox (both vertical and horizontal).

```html
<div class="parent">
  <div class="child">centered</div>
</div>
<style>
.parent { ??? }
</style>
```

**C3.** Style a button with hover state in Tailwind.

```html
<button class="???">Click me</button>
```

**C4.** Form with email and password, properly labelled.

```html
???
```

**C5.** Responsive grid: 3 cols desktop, 2 tablet, 1 mobile in Tailwind.

```html
<div class="???">
  <div>card 1</div>
  <div>card 2</div>
  <div>card 3</div>
</div>
```

## Section D — Debug (3)

**D1.** Button doesn't show hover effect:

```css
button hover { color: red; }
```

**D2.** Image broken:

```html
<img src="/users/jakkrit/Desktop/cat.jpg">
```

**D3.** Tailwind classes don't apply:

```jsx
const color = 'red';
<div className={`bg-${color}-500`}>
```

## Section E — Write the code (2)

**E1.** Build a card with heading, text, and CTA button — using semantic HTML and Tailwind.

**E2.** Build a contact form: name (text), email (email type), message (textarea), submit button. Use proper labels and required attributes.

## Score yourself

- **A** (MCQ): __ / 10
- **B** (predict): __ / 5
- **C** (fill in): __ / 5
- **D** (debug): __ / 3
- **E** (write): __ / 2

**Total: __ / 25**

| Score | Meaning |
|-------|---------|
| 23–25 | Strong |
| 20–22 | Pass |
| 15–19 | Re-read [Week 1 lesson](../lessons.md). Retake. |
| < 15  | Slow down. HTML/CSS is the foundation for the rest of the course. |
