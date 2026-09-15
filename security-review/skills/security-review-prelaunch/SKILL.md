---
name: security-review-prelaunch
description: Use this skill ONLY once, right before deploying/launching a project — not after every feature (use security-review-incremental for that). Performs a full-codebase security audit covering config, secrets, auth, CORS, cookies, HTTPS, dependencies, and leftover debug/test artifacts. Trigger phrases: "pre-launch review", "about to deploy, check everything", "final security check before going live".
---

# Pre-Launch Security Review (run once, before going live)

## Scope
Full codebase, not a diff. This is the last gate before deployment.

## Checklist — pass/fail each item against the WHOLE project

1. All secrets (API keys, DB credentials, JWT signing keys, third-party tokens) are in environment variables or a secret manager — none in source, none in committed `.env` files.
2. All user input is validated server-side across every endpoint, not just newly touched ones.
3. All database queries use parameterization — grep the codebase for string-built queries, don't assume based on the framework.
4. Every API endpoint has both authentication and authorization checks, including admin/internal endpoints that are easy to forget.
5. Error responses across the app don't leak stack traces, file paths, or DB engine details. Confirm the framework's debug/error page is disabled in production config.
6. CORS is locked to your actual production domain(s) — not `*`, not `localhost` left in from dev.
7. Debug mode / verbose logging is off in the production config (e.g., `DEBUG=False`, `NODE_ENV=production`).
8. All cookies used for sessions/auth have `Secure`, `HttpOnly`, and `SameSite` flags set.
9. HTTPS is enforced everywhere — no mixed content, HTTP requests redirect to HTTPS, HSTS header set if applicable.
10. Rate limiting is in place on login, signup, password reset, OTP, and any endpoint that calls a paid/expensive third-party API.
11. File uploads are validated server-side and stored securely (see incremental checklist item 7 for detail).
12. **Dependency vulnerabilities**: actually run the audit tool for your stack (`npm audit --production`, `pip-audit`, `cargo audit`, etc.) and report real findings — do not summarize from memory or guess based on package names.
13. No test credentials, seeded dummy accounts, hardcoded "admin/admin" logins, or `console.log`/debug print statements with sensitive data remain.
14. **Session/token hardening** (new): token expiry is enforced, refresh tokens rotate and invalidate old ones, session ID regenerates on login, logout actually invalidates the server-side session/token (not just client-side deletion).

## Output format
Pass/Fail table, one row per item, one-line reason each.
For every Fail: fix it, then state exactly what changed.
This skill does NOT generate documentation or take screenshots — that's a separate step, run `security-audit-log` skill afterward if you want a record of this review.
