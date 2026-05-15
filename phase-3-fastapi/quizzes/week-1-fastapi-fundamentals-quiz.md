# Phase 3 Week 1 Quiz — FastAPI Fundamentals

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** FastAPI routes, Pydantic models, path/query params, dependency injection, routers.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** What does `@app.get('/users/{id}')` do?

**A2.** What returns 422?

**A3.** Pydantic `BaseModel` is for?

**A4.** What's `Depends(get_db)`?

**A5.** Difference between request body and query params?

**A6.** What's `response_model=Item` for?

**A7.** APIRouter — when?

**A8.** `/docs` shows what?

**A9.** Why use type hints on parameters?

**A10.** What HTTP method to add a `tag` field to an existing resource?

## Section B — Predict the output

**B1.**

```
@app.get('/{name}')
def hi(name: str): return {'hello': name}
```

**B2.**

```
@app.get('/items')
def list_items(limit: int = 10): return list(range(limit))
```

**B3.**

```
class ItemCreate(BaseModel):
    name: str
    price: float

@app.post('/items')
def create(item: ItemCreate): return item
```

**B4.**

```
@app.get('/items/{id}', status_code=200, response_model=Item)
def get(id: int): ...
```

**B5.**

```
@app.post('/items', status_code=201)
```

## Section C — Fill in the missing code

**C1.** Define a Pydantic model for a Quest with title (str, min 1, max 200), xp (int, 1..1000), tag (optional str).

**C2.** Endpoint to create a quest.

**C3.** Endpoint to list quests with optional filter.

**C4.** Wire a router into the main app.

**C5.** Raise a 404 with a message.

## Section D — Find the bug

**D1.**

```
@app.get('/{id}')
def get(id):
    return {'id': id}
```

**D2.**

```
@app.post('/users')
def create(name: str, email: str):
    return {'name': name}
```

**D3.**

```
@app.get('/users')
async def get_users():
    return db.query(User).all()  # sync ORM in async route
```

## Section E — Write the code

**E1.** Full `GET /quests/{id}` with not-found handling.

**E2.** Health check endpoint that returns process status.

**E3.** Pydantic model with computed property.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
