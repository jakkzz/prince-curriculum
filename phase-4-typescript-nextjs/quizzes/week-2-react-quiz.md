# Phase 4 Week 2 Quiz — React fundamentals

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Components, props, state, effects, controlled forms, lists with keys, lifting state.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** Props vs state?

**A2.** Why need `key` prop on list items?

**A3.** Why is mutating state directly bad?

**A4.** Controlled vs uncontrolled input?

**A5.** When do you need `useMemo`?

**A6.** What's lifting state up?

**A7.** What does the dependency array in `useEffect` do?

**A8.** Why does this NOT increment twice? `setCount(count+1); setCount(count+1);`

**A9.** Composition vs inheritance for components?

**A10.** What's a fragment `<>...</>`?

## Section B — Predict the output

**B1.**

```
function Counter() { const [n, setN] = useState(0); return <button onClick={() => setN(n+1)}>{n}</button>; }
```

**B2.**

```
useEffect(() => { console.log('mounted'); }, []);
```

**B3.**

```
const [x, setX] = useState({a: 1});
setX({...x, b: 2});
```

**B4.**

```
{items.map(item => <Row data={item} />)}
```

**B5.**

```
<form onSubmit={(e) => { console.log('submit'); }}><button>Go</button></form>
```

## Section C — Fill in the missing code

**C1.** Typed button component.

**C2.** Counter with state.

**C3.** Controlled input.

**C4.** Render a list with keys.

**C5.** Effect that fetches once.

## Section D — Find the bug

**D1.**

```
const [items, setItems] = useState([]);
items.push('new');
setItems(items);
```

**D2.**

```
{users.map(u => <Row data={u} />)}
```

**D3.**

```
useEffect(() => {
  document.title = title;
});  // no deps array
```

## Section E — Write the code

**E1.** Login form (controlled, with state, validation message).

**E2.** Reusable Modal component with children prop.

**E3.** Component that fetches and renders, with loading + error states.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
