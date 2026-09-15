---
name: security-review-incremental
description: Use this skill immediately after finishing a new feature, endpoint, UI flow, or backend change, before moving on to the next task. Reviews ONLY the newly written/changed code for security issues — not the whole codebase. Trigger phrases: "review this for security", "just finished building X, check it", "is this code secure", "check the new endpoint". Do NOT use for a full pre-launch audit — use security-review-prelaunch for that instead.
---

# Incremental Security Review (post-feature)

## Scope
Review ONLY the diff / newly added or modified code from the current feature. Do not re-audit the entire codebase — that is a different skill (`security-review-prelaunch`), run once before launch. Running the full audit here on every feature wastes time and produces redundant noise.

## Checklist — check each item against the new code only

1. **Auth on every new endpoint** — both authentication (is the caller logged in / holding a valid token?) AND authorization (are they allowed to touch *this specific* resource, not just any resource of this type — check for IDOR: can user A access user B's record by changing an ID?).
2. **No hardcoded secrets** — API keys, tokens, DB credentials, webhook URLs. Anything sensitive must come from environment variables / secret manager, never committed inline.
3. **Backend input validation** — every field validated server-side regardless of what the frontend already checks. Frontend validation is UX, not security.
4. **Safe error responses** — no stack traces, file paths, SQL fragments, or internal exception messages returned to the client. Log details server-side; return a generic message to the user.
5. **Output sanitization** — any user-generated content that gets stored or re-rendered (comments, profile fields, filenames, etc.) is escaped/sanitized against XSS before display.
6. **Parameterized queries only** — no string concatenation or f-string/template building of SQL/NoSQL queries with user input.
7. **File upload safety** (if applicable) — validate MIME type and extension server-side (not just filename), enforce a size limit, store outside the web root or behind a randomized filename, never trust the client-supplied content-type.
8. **Rate limiting** on any new endpoint that's abusable (login, OTP, search, anything that hits a paid API or DB expensively).
9. **CSRF protection** on state-changing requests (POST/PUT/PATCH/DELETE) if the app uses cookie-based sessions. Not needed if you're using stateless bearer tokens with no cookies.
10. **Data exposure** — API responses return only fields the client needs. Check you're not leaking password hashes, internal IDs, other users' emails, etc. in a list/detail response.
11. **Session / token handling** (new — was missing from original checklist): if this feature touches auth, check token expiry is enforced, refresh tokens rotate on use, and there's no session fixation (session ID must regenerate after login).
12. **Dependency check for anything newly added**: if this feature introduced a new package/library, actually run the dependency audit command for the stack (`npm audit`, `pip-audit`, `cargo audit`, etc.) — do not eyeball the package file and guess. If no tool access, explicitly say "I cannot verify this without running a scanner" rather than asserting it's safe.

## Output format
For each item: **Pass** / **Fail** / **N/A** with a one-line reason.
For every Fail: explain the vulnerability, then fix it in the code, then state exactly what you changed and why.
Do not silently modify code without listing it in the output — every fix must be enumerated.
