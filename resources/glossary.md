# Glossary

Terms the learner should be able to define unprompted by the time they hit the phase listed in parentheses.

## Programming (Phase 1)

- **Variable** — a named reference to a value in memory.
- **Function** — a reusable unit of code that takes inputs and returns an output.
- **Argument vs parameter** — *parameter* is the name in the function definition; *argument* is the actual value passed in.
- **Scope** — the region of code where a name is visible.
- **Mutability** — whether a value can be changed in place.
- **Reference vs value** — whether a variable holds the data directly or a pointer to it.
- **Exception** — an object representing an error condition that interrupts normal flow.
- **Stack trace** — the call chain at the moment an exception was raised.
- **Type hint** — annotation declaring what type a variable or parameter is expected to be.

## Git (Phase 0)

- **Repository** — a directory tracked by git, including its history.
- **Commit** — a snapshot of the project at a moment in time, with a message and parent(s).
- **Branch** — a movable pointer to a commit.
- **HEAD** — a pointer to the current commit (usually via a branch).
- **Remote** — a named reference to another copy of the repo (e.g. on GitHub).
- **Origin** — the conventional default name for the primary remote.
- **Fast-forward** — a merge where the target branch is an ancestor of the source.
- **Rebase** — replaying commits on top of a different base commit, rewriting history.
- **Merge conflict** — two branches changed the same lines; git needs a human decision.

## Web (Phase 2)

- **HTTP** — the protocol used to send requests and receive responses on the web.
- **Method** — `GET`, `POST`, `PUT`, `PATCH`, `DELETE`, `OPTIONS` — describe the intent of the request.
- **Status code** — 3-digit number indicating the result. 2xx success, 3xx redirect, 4xx client error, 5xx server error.
- **Header** — metadata key-value pair attached to a request or response.
- **Cookie** — small piece of data the server asks the browser to remember and send back.
- **CORS** — browser-enforced rules about which origins can talk to which.
- **DOM** — the in-memory tree representation of an HTML document.

## SQL (Phase 2)

- **Table, row, column** — the basic structure.
- **Primary key** — column(s) that uniquely identify a row.
- **Foreign key** — a column that references another table's primary key.
- **Index** — auxiliary data structure that speeds up queries at the cost of write overhead.
- **JOIN** — combining rows from two tables based on a related column.
- **Transaction** — a group of statements that succeed or fail together.
- **N+1 problem** — making 1 query to fetch a list, then 1 query per item (instead of one combined query).

## Backend (Phase 3)

- **API** — application programming interface; here, usually a set of HTTP endpoints.
- **REST** — a convention for designing HTTP APIs around resources.
- **Endpoint** — a specific URL + method pair the API responds to.
- **Middleware** — code that runs before or after every request.
- **Dependency injection** — providing a function's dependencies as parameters rather than having it create them.
- **Pydantic model** — a typed schema for validating data in FastAPI.
- **ORM** — object-relational mapper; lets you write Python objects that map to SQL rows.
- **Migration** — a versioned, reversible change to the database schema.
- **JWT** — JSON Web Token; a signed, self-contained authentication token.

## Frontend (Phase 4)

- **Component** — a reusable piece of UI.
- **Props** — inputs to a component.
- **State** — data that changes over time and triggers re-renders.
- **Hook** — a function (in React) that lets a component use state, effects, etc.
- **Hydration** — turning server-rendered HTML into interactive React on the client.
- **Server component** — a React component that runs only on the server, never ships its code to the browser.
- **Client component** — a React component that runs in the browser (declared with `"use client"`).

## DevOps (Phase 5)

- **VPS** — virtual private server; a virtual machine you rent.
- **systemd** — Linux init system that manages services.
- **Reverse proxy** — a server that accepts requests on behalf of an app server (e.g. nginx in front of FastAPI).
- **TLS / SSL** — encryption for HTTP. SSL is the old name; TLS is current.
- **DNS** — the system that maps domain names to IP addresses.
- **A record** — DNS record mapping a name to an IPv4 address.
- **CNAME** — DNS record mapping a name to another name.
- **CI/CD** — continuous integration / continuous deployment.

## AI (Phase 7)

- **Token** — the unit of text an LLM processes; roughly ¾ of a word in English.
- **Context window** — the maximum tokens the model can consider at once.
- **Embedding** — a vector representation of text that captures meaning.
- **RAG** — retrieval-augmented generation; fetch relevant docs, then ask the LLM with them in context.
- **Tool use / function calling** — letting the LLM request that the app run a function.
- **Eval** — an automated test of LLM behavior on a fixed input set.
- **Prompt injection** — an attack where user input changes the LLM's instructions.
