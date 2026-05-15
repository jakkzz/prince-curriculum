# Phase 7 Week 2 Quiz — RAG

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Embeddings, vector search with pgvector, chunking, retrieval, prompt construction.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** What's an embedding?

**A2.** Why must same model embed docs + queries?

**A3.** Chunk size tradeoff?

**A4.** Cosine similarity vs L2 distance?

**A5.** What's an ivfflat index in pgvector?

**A6.** How tell if RAG retrieval is bad vs generation is bad?

**A7.** Context stuffing — what's wrong?

**A8.** When DON'T need RAG?

**A9.** Cost of embedding vs generating?

**A10.** Re-ranking after retrieval — when?

## Section B — Predict the output

**B1.**

```
from voyageai import Client
vo = Client()
result = vo.embed(['hello'], model='voyage-3', input_type='document')
len(result.embeddings[0])
```

**B2.**

```
CREATE TABLE docs (id SERIAL PRIMARY KEY, content TEXT, embedding vector(1024));
```

**B3.**

```
SELECT content FROM docs ORDER BY embedding <=> $1 LIMIT 5;
```

**B4.**

```
CREATE INDEX ON docs USING ivfflat (embedding vector_cosine_ops) WITH (lists = 100);
```

**B5.**

```
context = '\n\n'.join(retrieved_chunks[:3])
prompt = f'Documents:\n{context}\n\nQuestion: {query}'
```

## Section C — Fill in the missing code

**C1.** Set up pgvector.

**C2.** Chunk a long document.

**C3.** Index a document.

**C4.** Retrieve top-k.

**C5.** RAG end-to-end.

## Section D — Find the bug

**D1.**

```
# Retrieval returns garbage
```

**D2.**

```
# Hallucinated answers
```

**D3.**

```
# RAG is slow (5s per query)
```

## Section E — Write the code

**E1.** Eval set for RAG quality.

**E2.** Hybrid retrieval (vector + keyword).

**E3.** Indexing pipeline that handles updates.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
