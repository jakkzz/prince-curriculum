# Phase 4 Resources

## Required reading

- [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html) — sections 1–4.
- [React docs (react.dev)](https://react.dev/learn) — "Learn React" sections in order.
- [Next.js App Router docs](https://nextjs.org/docs/app/getting-started) — full Getting Started + Routing + Data Fetching.
- [Tanstack Query docs](https://tanstack.com/query/latest/docs/framework/react/overview)
- [shadcn/ui docs](https://ui.shadcn.com/docs)

## Recommended

- [Total TypeScript Beginners course](https://www.totaltypescript.com/tutorials/beginners-typescript) — free, excellent.
- [Patterns.dev — React patterns](https://www.patterns.dev/)
- [Kent C. Dodds — useEffect explained](https://kentcdodds.com/blog/useeffect-vs-uselayouteffect)
- [react-hook-form docs](https://react-hook-form.com/)
- [zod docs](https://zod.dev/)

## A11y

- [The A11y Project](https://www.a11yproject.com/)
- [WebAIM contrast checker](https://webaim.org/resources/contrastchecker/)
- [VoiceOver getting started](https://support.apple.com/guide/voiceover/welcome/mac) — turn it on for 30 min to feel real screen-reader use.

## Visual / design

- [shadcn/ui examples](https://ui.shadcn.com/examples) — see what's possible.
- [Tailwind UI](https://tailwindui.com/) — paid, but the previews give design ideas for free.
- [Refactoring UI](https://www.refactoringui.com/) — book. Worth the price.

## Reference

- [TS playground](https://www.typescriptlang.org/play) — paste and explore.
- [React Query examples](https://tanstack.com/query/latest/docs/framework/react/examples/simple)
- [MDN — fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)

## Skip these for now

- Redux. We're using React Query + URL state. Don't.
- Recoil/Jotai/Zustand. Same.
- React Native. Different course.
- Solid/Svelte/Vue comparisons. Out of scope.
- Server-side rendering theory beyond what Next.js does. Use the framework.

## When stuck

- Hydration errors — read the error in the console. It tells you the exact element where the mismatch happened.
- TypeScript errors — read top to bottom, fix the first one, then re-check.
- React Query weirdness — open the [devtools panel](https://tanstack.com/query/latest/docs/framework/react/devtools) and watch the actual query state.
- [resources/troubleshooting.md](../resources/troubleshooting.md).
