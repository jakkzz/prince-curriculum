# Phase 3 Week 3 Quiz — Authentication

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Password hashing (argon2), JWT, access + refresh tokens, FastAPI auth dependency.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 20 / 28.

## Section A — Multiple choice

**A1.** Why hash passwords instead of storing them?

**A2.** Why argon2 over bcrypt?

**A3.** What's a salt?

**A4.** JWT structure?

**A5.** Why explicitly specify algorithms when decoding JWT?

**A6.** Access token vs refresh token?

**A7.** Why store refresh tokens hashed in DB?

**A8.** HttpOnly cookie — why for auth?

**A9.** Authentication vs authorization?

**A10.** What's `OAuth2PasswordBearer` in FastAPI?

## Section B — Predict the output

**B1.**

```
from argon2 import PasswordHasher
ph = PasswordHasher()
hashed = ph.hash('mypw')
ph.verify(hashed, 'mypw')
```

**B2.**

```
import jwt
token = jwt.encode({'sub': '1', 'exp': datetime.now() + timedelta(minutes=15)}, SECRET, algorithm='HS256')
len(token.split('.'))
```

**B3.**

```
jwt.decode(token, SECRET, algorithms=['HS256'])  # token from 16 minutes ago, exp 15 min
```

**B4.**

```
@router.post('/login')
async def login(body: LoginRequest, db: ...):
    user = await find_user(db, body.email)
    if not user:
        raise HTTPException(401, 'Invalid credentials')
    try:
        ph.verify(user.hashed_password, body.password)
    except VerifyMismatchError:
        raise HTTPException(401, 'Invalid credentials')
```

**B5.**

```
@router.get('/me')
async def me(user: User = Depends(get_current_user)):
    return user
```

## Section C — Fill in the missing code

**C1.** Hash a password.

**C2.** Create an access token.

**C3.** FastAPI auth dependency.

**C4.** Set a refresh cookie.

**C5.** Verify a password against the stored hash.

## Section D — Find the bug

**D1.**

```
@router.post('/register')
def register(body: dict, db):
    user = User(email=body['email'], hashed_password=body['password'])  # not hashed
```

**D2.**

```
jwt.decode(token, SECRET)  # no algorithms specified
```

**D3.**

```
if user.email == form.email and user.hashed_password == form.password:
    # logged in
```

**D4.**

```
token = create_token(user.id)
response = JSONResponse({'token': token})
# stored in localStorage by client
```

## Section E — Write the code

**E1.** Full register endpoint with password hashing.

**E2.** Login that returns access + refresh tokens.

**E3.** Rate-limit the login endpoint to 5/minute per IP.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 4  · **E**: __ / 3

**Total: __ / 28**

Log score in `learning-log/`. 20+ to advance.
