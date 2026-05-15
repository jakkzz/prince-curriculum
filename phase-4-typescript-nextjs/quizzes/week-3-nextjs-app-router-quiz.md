# Phase 4 Week 3 Quiz — Next.js App Router

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** App Router file conventions, server vs client components, layouts, loading/error, server actions.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** What does the `app/` directory imply?

**A2.** Default component type in App Router?

**A3.** When need `'use client'`?

**A4.** What does `loading.tsx` do?

**A5.** What does `error.tsx` do, and what must it be?

**A6.** Server action?

**A7.** What's `revalidatePath('/quests')`?

**A8.** `<Link>` vs `<a>`?

**A9.** Why does `useState` in a server component error?

**A10.** Middleware — what's it for?

## Section B — Predict the output

**B1.**

```
// app/page.tsx (server component by default)
export default async function Page() {
  const quests = await fetch('http://localhost:8000/quests').then(r => r.json());
  return <ul>{quests.map(q => <li key={q.id}>{q.title}</li>)}</ul>;
}
```

**B2.**

```
// app/quests/[id]/page.tsx
export default function Page({ params }: { params: { id: string } }) {
  return <h1>Quest {params.id}</h1>;
}
```

**B3.**

```
'use client';
import { useState } from 'react';
export default function Counter() { const [n, setN] = useState(0); return <button onClick={() => setN(n+1)}>{n}</button>; }
```

**B4.**

```
// app/quests/loading.tsx
export default function Loading() { return <div>Loading…</div>; }
```

**B5.**

```
<Link href="/quests">Quests</Link>
```

## Section C — Fill in the missing code

**C1.** Server component that fetches data.

**C2.** Loading file.

**C3.** Error file.

**C4.** Server action.

**C5.** Form using server action.

## Section D — Find the bug

**D1.**

```
// app/page.tsx (no 'use client')
import { useState } from 'react';
export default function Page() { ... }
```

**D2.**

```
// app/error.tsx (no 'use client')
export default function Error({ error }) { ... }
```

**D3.**

```
<a href="/quests">Quests</a>
```

## Section E — Write the code

**E1.** Server component fetching from FastAPI, with loading state.

**E2.** Layout with sidebar nav.

**E3.** Middleware that redirects unauthenticated.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
