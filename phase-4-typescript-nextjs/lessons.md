# Phase 4 Lessons

---

## Week 1 — TypeScript

### Day 1 — Setup and basics

Install Node via `fnm` or `nvm`. Install `pnpm`.

```bash
mkdir ts-warmup && cd ts-warmup
pnpm init
pnpm add -D typescript @types/node
pnpm tsc --init
```

Edit `tsconfig.json`:
```json
{
  "compilerOptions": {
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "Bundler",
    "esModuleInterop": true,
    "skipLibCheck": true
  }
}
```

`strict` and `noUncheckedIndexedAccess` are non-negotiable.

### Day 2 — Types and inference

```typescript
const name: string = "Prince";
const age = 16;                 // inferred number
const isActive: boolean = true;

const user: { id: number; name: string } = { id: 1, name: "Prince" };

type User = {
  id: number;
  name: string;
  email?: string;        // optional
};

const users: User[] = [];
```

`type` vs `interface` — for value types, prefer `type`. For library APIs you expect others to extend, `interface`. Pick one, be consistent.

### Day 3 — Unions, intersections, narrowing

```typescript
type Status = "loading" | "success" | "error";

function describe(s: Status): string {
  if (s === "loading") return "Working on it…";
  if (s === "success") return "Done!";
  return "Something broke";
}

type ApiResponse<T> =
  | { ok: true; data: T }
  | { ok: false; error: string };

function handle<T>(res: ApiResponse<T>) {
  if (res.ok) {
    console.log(res.data);    // T
  } else {
    console.error(res.error); // string
  }
}
```

### Day 4 — Generics

```typescript
function first<T>(items: T[]): T | undefined {
  return items[0];
}

const n = first([1, 2, 3]);     // number | undefined
const s = first(["a", "b"]);    // string | undefined

type Result<T, E = Error> =
  | { ok: true; value: T }
  | { ok: false; error: E };
```

Don't over-generic. Start concrete; generic when you actually have two callsites.

### Day 5 — Utility types and unknown

```typescript
type User = { id: number; name: string; email: string };

type UserCreate = Omit<User, "id">;
type UserPreview = Pick<User, "id" | "name">;
type PartialUser = Partial<User>;
type RequiredUser = Required<User>;

// `unknown` — the safe `any`
function parseJson(text: string): unknown {
  return JSON.parse(text);
}

const data = parseJson('{"x": 1}');
// data.x  // ERROR — must narrow first
if (typeof data === "object" && data !== null && "x" in data) {
  // data.x is now usable
}
```

Use `unknown`, never `any`. If you need `any`, use `unknown` and narrow.

---

## Week 2 — React fundamentals

### Day 1 — A Vite + React + TS sandbox

```bash
pnpm create vite@latest react-warmup -- --template react-ts
cd react-warmup
pnpm install
pnpm dev
```

You're not using this for the project — just to learn React without Next.js's complexity layered on top.

### Day 2 — Components, props, state

```tsx
type ButtonProps = {
  label: string;
  onClick: () => void;
  disabled?: boolean;
};

export function Button({ label, onClick, disabled }: ButtonProps) {
  return (
    <button onClick={onClick} disabled={disabled} className="...">
      {label}
    </button>
  );
}

// State
import { useState } from "react";

export function Counter() {
  const [count, setCount] = useState(0);
  return (
    <button onClick={() => setCount(count + 1)}>
      Clicked {count} times
    </button>
  );
}
```

### Day 3 — Effects and data fetching

```tsx
import { useEffect, useState } from "react";

function UserProfile({ id }: { id: number }) {
  const [user, setUser] = useState<User | null>(null);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    let cancelled = false;
    fetch(`/api/users/${id}`)
      .then(r => r.json())
      .then(data => { if (!cancelled) setUser(data); })
      .catch(e => { if (!cancelled) setError(e.message); });
    return () => { cancelled = true; };
  }, [id]);

  if (error) return <div>Error: {error}</div>;
  if (!user) return <div>Loading…</div>;
  return <h1>{user.name}</h1>;
}
```

This pattern works but is verbose. Real apps use React Query / SWR.

### Day 4 — Forms and validation

```tsx
import { useState } from "react";
import { z } from "zod";

const schema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
});

export function LoginForm() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState<string | null>(null);

  function submit(e: React.FormEvent) {
    e.preventDefault();
    const result = schema.safeParse({ email, password });
    if (!result.success) {
      setError(result.error.errors[0].message);
      return;
    }
    // submit
  }

  return (
    <form onSubmit={submit}>
      <input type="email" value={email} onChange={e => setEmail(e.target.value)} />
      <input type="password" value={password} onChange={e => setPassword(e.target.value)} />
      {error && <p>{error}</p>}
      <button type="submit">Log in</button>
    </form>
  );
}
```

In real life you'd use `react-hook-form` + zod. We'll get there in Week 3.

### Day 5 — Common patterns

- Lifting state up.
- Composition over inheritance (no class components in this course).
- Lists with keys.
- Conditional rendering with `&&`, ternary, early return.
- Avoiding effects when you don't need them (derived state from props).

---

## Week 3 — Next.js App Router

### Day 1 — Setup

```bash
pnpm create next-app@latest questly-web --typescript --tailwind --app --eslint
cd questly-web
pnpm dev
```

App Router uses the `app/` directory. Folders are routes. Files (`page.tsx`, `layout.tsx`, `loading.tsx`, `error.tsx`) have special meaning.

### Day 2 — Routes and layouts

```
app/
├── layout.tsx              # root layout
├── page.tsx                # /
├── login/page.tsx          # /login
├── quests/
│   ├── page.tsx            # /quests
│   └── [id]/page.tsx       # /quests/:id
└── (auth)/                 # route group (no URL segment)
    ├── login/page.tsx
    └── register/page.tsx
```

### Day 3 — Server vs client components

**Default: server.** Components render on the server, send HTML, ship no client JS. Faster, more secure, can read env vars and DB directly.

**Client:** explicitly opt in with `"use client"` at the top. Required when using `useState`, `useEffect`, browser-only APIs, event handlers.

```tsx
// app/quests/page.tsx — server component
import { fetchQuests } from "@/lib/api";

export default async function QuestsPage() {
  const quests = await fetchQuests();
  return (
    <ul>
      {quests.map(q => <li key={q.id}>{q.title}</li>)}
    </ul>
  );
}

// components/QuestForm.tsx — client component
"use client";
import { useState } from "react";

export function QuestForm() {
  const [title, setTitle] = useState("");
  // ...
}
```

Rules of thumb:
- **Server by default.** Always.
- **Client when** you need state, effects, or browser APIs.
- **Push state down.** Wrap the smallest possible piece of the tree in a client component.

### Day 4 — Loading and error states

```tsx
// app/quests/loading.tsx
export default function Loading() {
  return <div>Loading quests…</div>;
}

// app/quests/error.tsx
"use client";
export default function Error({ error, reset }: { error: Error; reset: () => void }) {
  return (
    <div>
      <p>Something went wrong: {error.message}</p>
      <button onClick={reset}>Try again</button>
    </div>
  );
}
```

These wrap their route segments via React's Suspense + Error Boundaries automatically.

### Day 5 — Server actions

Server actions are functions you call from the client that run on the server. Replace separate API routes for form submissions.

```tsx
"use server";

import { revalidatePath } from "next/cache";

export async function createQuest(formData: FormData) {
  const title = formData.get("title") as string;
  await api.createQuest({ title });
  revalidatePath("/quests");
}

// In a component:
<form action={createQuest}>
  <input name="title" />
  <button>Create</button>
</form>
```

Use for: mutations from forms. Don't use for: long-running tasks, anything cacheable, complex multi-step flows.

---

## Week 4 — Auth, state, data

### Day 1 — Talking to the Phase 3 API

Build a typed client wrapper:

```typescript
// lib/api.ts
const API_URL = process.env.NEXT_PUBLIC_API_URL!;

export async function api<T>(
  path: string,
  init?: RequestInit & { auth?: string }
): Promise<T> {
  const res = await fetch(`${API_URL}${path}`, {
    ...init,
    headers: {
      "content-type": "application/json",
      ...(init?.auth ? { authorization: `Bearer ${init.auth}` } : {}),
      ...init?.headers,
    },
  });
  if (!res.ok) {
    throw new ApiError(res.status, await res.text());
  }
  return res.json();
}

export class ApiError extends Error {
  constructor(public status: number, message: string) {
    super(message);
  }
}
```

### Day 2 — Cookies for auth

Access token in memory (or HttpOnly cookie). Refresh token in HttpOnly + Secure + SameSite=lax cookie.

```typescript
// in a server component / action
import { cookies } from "next/headers";

cookies().set("refresh_token", token, {
  httpOnly: true,
  secure: process.env.NODE_ENV === "production",
  sameSite: "lax",
  path: "/",
  maxAge: 60 * 60 * 24 * 30,
});
```

### Day 3 — Protected routes

Middleware approach:

```typescript
// middleware.ts
import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

const PUBLIC = ["/login", "/register", "/"];

export function middleware(req: NextRequest) {
  const token = req.cookies.get("refresh_token");
  if (!token && !PUBLIC.includes(req.nextUrl.pathname)) {
    return NextResponse.redirect(new URL("/login", req.url));
  }
}

export const config = {
  matcher: ["/((?!api|_next/static|_next/image|favicon.ico).*)"],
};
```

### Day 4 — React Query for client-side data

```typescript
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";

function useQuests() {
  return useQuery({
    queryKey: ["quests"],
    queryFn: () => api<Quest[]>("/quests"),
  });
}

function useCreateQuest() {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: (q: QuestCreate) => api<Quest>("/quests", { method: "POST", body: JSON.stringify(q) }),
    onSuccess: () => qc.invalidateQueries({ queryKey: ["quests"] }),
  });
}
```

Use it for client-side fetching when server components don't fit (real-time updates, infinite scroll, etc.).

### Day 5 — Optimistic updates

```typescript
const mutation = useMutation({
  mutationFn: completeQuest,
  onMutate: async (questId) => {
    await qc.cancelQueries({ queryKey: ["quests"] });
    const previous = qc.getQueryData<Quest[]>(["quests"]);
    qc.setQueryData<Quest[]>(["quests"], (old) =>
      old?.map(q => q.id === questId ? { ...q, completed: true } : q) ?? []
    );
    return { previous };
  },
  onError: (_err, _id, ctx) => {
    if (ctx?.previous) qc.setQueryData(["quests"], ctx.previous);
  },
  onSettled: () => qc.invalidateQueries({ queryKey: ["quests"] }),
});
```

Optimistic = update the UI immediately, roll back if the server says no.

---

## Week 5 — Polish with shadcn/ui

### Day 1 — Install and configure

```bash
pnpm dlx shadcn@latest init
pnpm dlx shadcn@latest add button input label dialog dropdown-menu form sonner
```

shadcn/ui is **not a library you install**. It copies the source into your repo. You own it. Customize freely.

### Day 2 — Build a real form with react-hook-form + zod

```tsx
"use client";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";

const schema = z.object({
  title: z.string().min(1).max(200),
  description: z.string().optional(),
  xpReward: z.coerce.number().int().min(1).max(1000),
});

type Values = z.infer<typeof schema>;

export function QuestForm() {
  const form = useForm<Values>({
    resolver: zodResolver(schema),
    defaultValues: { title: "", xpReward: 10 },
  });

  function onSubmit(values: Values) {
    // ...
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)}>
        <FormField
          control={form.control}
          name="title"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Title</FormLabel>
              <FormControl><Input {...field} /></FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        {/* ... more fields */}
      </form>
    </Form>
  );
}
```

### Day 3 — Design pass

Spend a full day making it not look generic:
- Pick a real font (Inter, Geist, JetBrains Mono for code).
- Define a color theme (Tailwind config — primary, secondary, accent).
- Add subtle animations (`transition-colors`, `transition-transform`, framer-motion for the brave).
- Empty states that aren't sad.
- Loading skeletons (not spinners) for content blocks.

### Day 4 — Accessibility audit

- Run Lighthouse, fix everything < 95.
- Tab through every page from a cold start. Every interactive element reachable, focus visible.
- Test with VoiceOver or NVDA — at least the login flow.
- Color contrast on hover and focus, not just default.

### Day 5 — Mobile pass

Test every page at 360px. Most apps look terrible at that width. Yours should be intentional.

---

## Week 6 — Playwright and deploy

### Day 1 — Playwright setup

```bash
pnpm create playwright@latest
```

```typescript
// tests/auth.spec.ts
import { test, expect } from "@playwright/test";

test("can log in", async ({ page }) => {
  await page.goto("/login");
  await page.getByLabel("Email").fill("test@example.com");
  await page.getByLabel("Password").fill("pw12345678");
  await page.getByRole("button", { name: "Log in" }).click();
  await expect(page).toHaveURL("/quests");
  await expect(page.getByRole("heading", { name: "Quests" })).toBeVisible();
});
```

### Day 2 — Critical-path tests

Write at minimum:
- Register flow.
- Login flow.
- Create quest.
- Complete quest.
- View stats.
- Logout.

These run against a real backend (the dockerized Phase 3 API), against a test DB.

### Day 3 — CI for the frontend

GitHub Actions: lint, type-check, build, run unit tests, then run Playwright against a docker compose stack.

### Day 4 — Deploy

Pick one:
- **Vercel** — easiest for Next.js, push-to-deploy, generous free tier.
- **Cloudflare Pages** — if you want to keep everything on Cloudflare.

Either way: custom subdomain, HTTPS, env vars set via the dashboard. Test the production deploy.

### Day 5 — Gate prep

Walk through the gate criteria. Be ready to:
1. Add a page live.
2. Explain server vs client at a glance for each piece of your app.
3. Show a Playwright test you wrote.
