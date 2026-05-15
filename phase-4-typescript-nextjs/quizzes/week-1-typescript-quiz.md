# Phase 4 Week 1 Quiz — TypeScript

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Types, inference, narrowing, generics, utility types, unknown vs any.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** Difference between `unknown` and `any`?

**A2.** What does `strict: true` enable?

**A3.** `type` vs `interface`?

**A4.** What's narrowing?

**A5.** Discriminated union?

**A6.** What does `as const` do?

**A7.** `Omit<User, 'password'>` means?

**A8.** Why prefer `unknown` over `any` for JSON parses?

**A9.** `keyof User` returns what?

**A10.** Function with generic: `function first<T>(xs: T[]): T | undefined`

## Section B — Predict the output

**B1.**

```
let x = 5;
x = 'hello';
```

**B2.**

```
type Status = 'loading' | 'success' | 'error';
function describe(s: Status) { if (s === 'loading') return 'wait'; if (s === 'success') return 'ok'; return 'err'; }
```

**B3.**

```
const arr = ['a', 'b'] as const;
arr.push('c');
```

**B4.**

```
function f(x: string | null) { return x.length; }
```

**B5.**

```
type User = { id: number; name: string };
type Preview = Pick<User, 'name'>;
```

## Section C — Fill in the missing code

**C1.** Function taking string, returning length.

**C2.** Type for a result that's either success with data, or error.

**C3.** Function that finds an object by id in an array.

**C4.** Safely parse JSON into a known shape with zod.

**C5.** Type for `{name, email, password}` minus password.

## Section D — Find the bug

**D1.**

```
function greet(name) { return `Hi ${name}`; }
```

**D2.**

```
const user: any = JSON.parse(text);
user.email.toLowerCase();
```

**D3.**

```
const arr: string[] = [];
arr.push(1);
```

## Section E — Write the code

**E1.** Discriminated union for an API response.

**E2.** Generic `Map<K, V>` wrapper with safe `get`.

**E3.** Validate user input at runtime with zod.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
