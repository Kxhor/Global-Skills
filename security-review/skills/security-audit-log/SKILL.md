---
name: security-audit-log
description: Use this skill AFTER running security-review-incremental or security-review-prelaunch, when the user wants a written record of what was reviewed and fixed. Generates a detailed markdown log of the prompts used, findings, and fixes, with screenshots of current UI state, and flags (without fixing) any post-review regressions. Trigger phrases: "create an md file of the review", "log what we just did", "document this security pass". Do not run this as part of the security review itself — it's a separate reporting step.
---

# Security Audit Log Generator

## Preconditions
Only run this after a `security-review-incremental` or `security-review-prelaunch` pass has actually completed. If no review has been run yet in this session, say so and ask whether to run one first — do not fabricate a review log.

## What to include in the .md file
1. The exact checklist/prompt used (incremental or pre-launch), verbatim, so it can be cross-verified independently.
2. Every item's pass/fail result and reasoning, as produced during the review — do not re-summarize or paraphrase results into something new; copy them forward exactly.
3. Every fix that was made: what the vulnerability was, what changed, in which file.
4. Screenshots of the current UI/app state (take them now, don't reuse old ones).
5. Two regression checks, flagged only — do NOT fix these here, only report them:
   - Have frontend changes from this session broken any backend functionality?
   - Does the project currently run without errors after the review? If there are errors, describe them and suggest (don't apply) a fix.

## Hard rule
This skill must not introduce new findings, re-run checks, or alter code. It is a transcription/reporting step only. If you notice something new while writing the log, note it separately as "New issue found during logging, not part of original review" — never merge it silently into the review results.
