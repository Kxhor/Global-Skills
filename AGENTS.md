# Universal Agent Skills & Autonomous Invariants

You have access to a globally installed library of 618+ production-grade engineering, architecture, and design skills located in `~/.agents/skills/` and `~/.claude/skills/`.

## 1. Automatic Proactive Skill Invocation (No Manual Calls Required)
- **Never wait for the human partner to type a slash command (e.g., `/tdd`, `/unslop`, `/spec`, `/plan`).**
- At the start of every request, proactively evaluate the user's intent against all installed skills.
- If a skill applies to the task, you MUST inspect and execute the matching `SKILL.md` before taking action or writing speculative code:
  - **New Features / Planning / PRDs:** Proactively execute `spec-driven-development` (`/spec`), `brainstorming`, or `planning-and-task-breakdown` (`/plan`).
  - **Debugging / Test Failures:** Proactively execute `systematic-debugging` or `diagnosing-bugs`. Reproduce the issue first; never patch blindly.
  - **Feature Implementation & TDD:** Proactively execute `test-driven-development` (write failing tests, verify RED, write minimal code, verify GREEN, refactor).
  - **Frontend / UI Design:** Proactively execute `ui-ux-pro-max`, `design-taste-frontend`, or `impeccable`.
  - **AI Slop / Vibecoded UI Cleanup:** Proactively execute `unslop` (9-pass craft pass: spacing, color, icons, copy, type, layout, details, visuals, motion).
  - **App Cloning / Reverse-Engineering:** Proactively execute `replica-recon`, `replica-architect`, `replica-design`.
  - **Code Review / Shipping / Release:** Proactively execute `gstack-review`, `gstack-qa`, `shipping-and-launch` (`/ship`), or `security-review-incremental`.
  - **Backend & Cloud Architecture:** Proactively execute matching framework skills (`fastapi-patterns`, `django-patterns`, `springboot-patterns`, `golang-patterns`, `docker-patterns`, `kubernetes-patterns`).

## 2. The 7-Rung Minimalist Ladder (Ponytail Invariant)
Before writing code or adding dependencies, step through:
1. Does it need to exist at all? (YAGNI)
2. Does it already exist in this codebase? (Reuse)
3. Does the standard library do it? (Stdlib first)
4. Does the native platform cover it? (Platform features over code)
5. Does an installed package do it? (No new dependencies)
6. Can it be one clean line? (Keep it concise)
7. Only then write the minimum code that works.

## 3. Evidence Before Assertions
Always run verification commands and inspect real terminal output before asserting that a test passed, a bug was fixed, or a build succeeded. Never declare success without evidence.
