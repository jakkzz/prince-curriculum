# Phase 2 Week 4 Quiz — SQL

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Basic SELECT/INSERT/UPDATE/DELETE, JOINs, GROUP BY, indexes, schema design, EXPLAIN ANALYZE.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 22 / 30.

## Section A — Multiple choice

**A1.** Difference between INNER and LEFT JOIN?

**A2.** What's a primary key?

**A3.** Why use `IS NULL` instead of `= NULL`?

**A4.** What's an index?

**A5.** When should you add an index?

**A6.** What does GROUP BY do?

**A7.** HAVING vs WHERE?

**A8.** What's a transaction?

**A9.** Why never f-string user input into SQL?

**A10.** Composite index `(user_id, created_at)` — which queries does it help?

## Section B — Predict the output

**B1.** What does this return?

```
SELECT COUNT(*) FROM users;
```

**B2.**

```
SELECT name FROM users WHERE age > 18 ORDER BY age DESC LIMIT 5;
```

**B3.**

```
SELECT u.name, COUNT(p.id) FROM users u LEFT JOIN posts p ON p.user_id = u.id GROUP BY u.name;
```

**B4.**

```
EXPLAIN ANALYZE SELECT * FROM sessions WHERE user_id = 42;
```

**B5.**

```
SELECT * FROM users WHERE name = 'NULL';
```

## Section C — Fill in the missing code

**C1.** Find users older than 30, sorted by age.

**C2.** Insert a new user.

**C3.** Update a user's email.

**C4.** Count posts per user, only users with >5 posts.

**C5.** Add an index on `posts.user_id`.

**C6.** Find users who never posted.

## Section D — Find the bug

**D1.**

```
UPDATE users SET email = 'x@y.com';
```

**D2.**

```
SELECT * FROM users WHERE name = NULL;
```

**D3.**

```
SELECT name, COUNT(*) FROM posts GROUP BY user_id;
```

**D4.**

```
f"SELECT * FROM users WHERE name = '{user_input}'"
```

## Section E — Write the code

**E1.** Schema for a library: books, members, loans. Show CREATE TABLE statements with appropriate keys.

**E2.** Find the top 5 most-borrowed books with their loan count.

**E3.** Currently-borrowed books (not returned).

**E4.** Members who've borrowed more than 10 books historically.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 6  · **D**: __ / 4  · **E**: __ / 4

**Total: __ / 30**

Log score in `learning-log/`. 22+ to advance.
