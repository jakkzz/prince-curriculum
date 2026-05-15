# Phase 5 Week 2 Quiz — DNS, nginx, TLS, Cloudflare

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** DNS records, nginx reverse proxy, Let's Encrypt + certbot, Cloudflare proxy modes.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 18 / 25.

## Section A — Multiple choice

**A1.** What's an A record?

**A2.** A vs CNAME — when use each?

**A3.** What's a nameserver?

**A4.** What's nginx for in front of an app?

**A5.** TLS — what does a cert prove?

**A6.** Cloudflare 'Full (strict)' SSL mode means?

**A7.** What's Cloudflare origin cert?

**A8.** HSTS — what?

**A9.** Why proxy mode (orange cloud) in Cloudflare?

**A10.** Let's Encrypt cert lifetime?

## Section B — Predict the output

**B1.**

```
dig +short api.example.com
```

**B2.**

```
dig +trace example.com
```

**B3.**

```
curl -v https://example.com 2>&1 | grep '^[<>]'
```

**B4.**

```
sudo nginx -t
```

**B5.**

```
sudo systemctl reload nginx
```

## Section C — Fill in the missing code

**C1.** nginx reverse-proxy config.

**C2.** Get a Let's Encrypt cert via certbot.

**C3.** Verify auto-renew is set up.

**C4.** Cloudflare DNS A record for api subdomain (proxy on).

**C5.** HSTS header in nginx.

## Section D — Find the bug

**D1.**

```
Browser: ERR_CERT_AUTHORITY_INVALID
```

**D2.**

```
Browser: 502 Bad Gateway
```

**D3.**

```
Browser shows 'too many redirects' (HTTP→HTTPS→HTTP loop)
```

## Section E — Write the code

**E1.** Full nginx config: HTTP → HTTPS redirect + reverse proxy.

**E2.** Cloudflare DNS plan for an app at api.example.com + frontend at example.com.

**E3.** Use Cloudflare Origin Cert on the VPS.

## Score yourself

- **A**: __ / 10  · **B**: __ / 5  · **C**: __ / 5  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 25**

Log score in `learning-log/`. 18+ to advance.
