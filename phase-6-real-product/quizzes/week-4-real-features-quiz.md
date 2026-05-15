# Phase 6 Week 4 Quiz — Real features

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** Adding production-grade features: email, files, background jobs, rate limiting.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 16 / 22.

## Section A — Multiple choice

**A1.** When add email sending?

**A2.** Where store user-uploaded files?

**A3.** Background jobs — when?

**A4.** Rate limiting per user vs per IP?

**A5.** Webhook receiving — auth strategy?

**A6.** Server-Sent Events vs WebSockets?

**A7.** CSV export — what to include?

**A8.** Why audit logs?

**A9.** Multi-user roles — when add?

**A10.** What's a feature flag?

## Section B — Predict the output

**B1.**

```
# Sending email synchronously in request handler
@router.post('/register')
async def register(body):
    user = create_user(body)
    await send_welcome_email(user.email)  # blocks until email sends
    return user
```

**B2.**

```
# User uploads 100MB file via POST
```

**B3.**

```
# Webhook from Stripe; verify with shared secret
# Got header X-Stripe-Signature
```

**B4.**

```
# User triggers report generation; report ready 30s later
```

**B5.**

```
# Scheduled job: daily digest at 8am
```

## Section C — Fill in the missing code

**C1.** Send email via Resend.

**C2.** Upload to R2 with signed URL.

**C3.** arq background job.

**C4.** Verify Stripe webhook signature.

**C5.** Per-user rate limit.

## Section D — Find the bug

**D1.**

```
# Sending password reset email; user reports they didn't get it
```

**D2.**

```
# Background job stops running silently
```

**D3.**

```
# Anyone can hit your /export endpoint and download all data
```

## Section E — Write the code

**E1.** Magic-link login flow.

**E2.** CSV export of user data.

**E3.** Daily digest scheduled job.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 22**

Log score in `learning-log/`. 16+ to advance.
