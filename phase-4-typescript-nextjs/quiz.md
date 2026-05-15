# Phase 4 Quiz

End of Week 4. 60 min. Section E live.

## Section A — TypeScript (10)

1. What does `strict: true` enable?
2. Difference between `type` and `interface`?
3. What's narrowing? Give one example.
4. What's the difference between `unknown` and `any`?
5. What does `as const` do?
6. What's a discriminated union? Why useful?
7. Write the type for: a function that takes an array of objects with `id: number` and returns the one with the highest id, or undefined.
8. What does `T extends U ? X : Y` do?
9. What's `keyof` and when is it useful?
10. What does `Omit<User, "password">` mean?

## Section B — React (10)

1. What's the difference between props and state?
2. What does the dependency array in `useEffect` do?
3. Why does this not work as expected? `setCount(count + 1); setCount(count + 1);`
4. What's the difference between controlled and uncontrolled inputs?
5. Why do lists need `key` props? What's a bad choice for key?
6. What's `useMemo` and when do you need it?
7. What does "lifting state up" mean?
8. Why is mutating state directly (`state.x = 5`) bad?
9. What's a fragment (`<>...</>`)? Why use one?
10. When should a component be split into smaller ones?

## Section C — Next.js (10)

1. What does the `app/` directory imply about routing?
2. What's a server component? When does it run?
3. What's `"use client"` and when do you add it?
4. What does `loading.tsx` do?
5. What does `error.tsx` do? What does it need to be marked as?
6. What's a server action? What problem does it solve?
7. What does `revalidatePath` do?
8. What's the difference between `Link` and `<a>`?
9. What does `middleware.ts` enable?
10. Why does putting a `useState` hook in a server component throw an error?

## Section D — Data, forms, auth (5)

1. What's the difference between React Query's `useQuery` and `useMutation`?
2. What's an optimistic update? Why use one?
3. Where do you store an auth token in a Next.js app? Why?
4. What's a CSRF attack? Does using SameSite=lax cookies mitigate it?
5. What's the difference between client-side and server-side form validation? Why do both?

## Section E — Live (60 min)

Brief: "Add a `/quests/archive` page that shows only deleted quests for the current user, with a button to restore. Include one Playwright test."

Watch for:
- Server or client component, and why.
- Route placement.
- Fetching strategy (server component? React Query?).
- The restore action — server action, API route, or direct fetch?
- Test covers the happy path AND an error.

---

**Scoring:**
- A–D: 35 questions, 1 each. Need 28+.
- E: pass/fail.
