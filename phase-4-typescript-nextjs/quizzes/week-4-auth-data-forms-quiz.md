# Phase 4 Week 4 Quiz — Auth, data, forms

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Cookies for auth, protected routes, React Query, forms with react-hook-form + zod, optimistic UI.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** Best place for refresh token in Next.js?

**A2.** When use React Query vs server component?

**A3.** What's an optimistic update?

**A4.** Why use zod for form validation?

**A5.** Client- AND server-side form validation — why both?

**A6.** What's `useMutation` from React Query?

**A7.** `queryClient.invalidateQueries({ queryKey: ['quests'] })`?

**A8.** CSRF with HttpOnly cookies?

**A9.** Why React Query over rolling your own fetch+useState?

**A10.** `staleTime` in React Query?

## Section B — Predict the output

**B1.**

```
const { data, isLoading } = useQuery({ queryKey: ['quests'], queryFn: () => fetch('/api/quests').then(r => r.json()) });
```

**B2.**

```
const mutation = useMutation({ mutationFn: createQuest, onSuccess: () => qc.invalidateQueries({ queryKey: ['quests'] }) });
mutation.mutate({ title: 'read' });
```

**B3.**

```
// middleware.ts checks cookie, redirects to /login if absent
// User visits /protected with no token
```

**B4.**

```
form.handleSubmit((data) => { console.log(data); })
```

**B5.**

```
<input {...form.register('email')} />
```

## Section C — Fill in the missing code

**C1.** Set HttpOnly refresh cookie.

**C2.** React Query useQuery for quests.

**C3.** useMutation with optimistic update.

**C4.** react-hook-form with zod.

**C5.** Show validation error message.

## Section D — Find the bug

**D1.**

```
// Store token:
localStorage.setItem('token', token);
```

**D2.**

```
// Form submits but errors aren't visible
const form = useForm();
<input {...form.register('email')} />
```

**D3.**

```
// Mutation completes; list doesn't update
const mutation = useMutation({ mutationFn: createQuest });
```

## Section E — Write the code

**E1.** Complete login form with react-hook-form + zod + error display.

**E2.** Quest list with React Query and optimistic complete.

**E3.** Auth provider that wraps app with React Query + auth context.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
