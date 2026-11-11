# Universal AI Skills Suite

A curated collection of 12 skill suites and 500+ engineering skills configured for cross-platform compatibility across:
* **Claude Code** (CLI, VS Code extension, terminal)
* **OpenCode** (CLI, VS Code extension, terminal)
* **VS Code and Cursor** (Claude Code, OpenCode, Antigravity, Cline, Roo Code, GitHub Copilot)
* **Google Antigravity** (IDE, Desktop, CLI)

---

## Installation

Install all skill suites across supported IDEs and CLI tools using a single command:

### Windows (PowerShell)
```powershell
git clone https://github.com/Kxhor/Global-Skills.git "$env:USERPROFILE\.gemini\Global-Skills"; powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.gemini\Global-Skills\install.ps1"
```

### macOS and Linux
```bash
git clone https://github.com/Kxhor/Global-Skills.git ~/.gemini/Global-Skills && chmod +x ~/.gemini/Global-Skills/install.sh && ~/.gemini/Global-Skills/install.sh
```

The installer configures directory links (NTFS junctions on Windows, symbolic links on Unix) so all skills stay updated directly from the git repository without duplicating files.

---

## Execution Model

Skills can be triggered automatically by agents or called manually via slash commands.

### Automatic Invocation
Agents discover and execute skills based on context:
1. **Frontmatter Indexing**: Every skill defines its scope and purpose in standard YAML frontmatter. Supported agents (Claude Code, OpenCode, Antigravity) index these definitions at startup and match them against user requests.
2. **Global Directives**: The installer deploys configuration files to `~/.claude/CLAUDE.md` and `~/.agents/AGENTS.md` that guide agents to consult relevant skills before implementing solutions.

### Environment Support

| Environment | Discovery Path | Activation Method |
| :--- | :--- | :--- |
| **Claude Code (CLI and Terminal)** | `~/.claude/skills/` | Automatic via frontmatter index and `CLAUDE.md` |
| **OpenCode (CLI and Terminal)** | `~/.agents/skills/` | Automatic via frontmatter index and `AGENTS.md` |
| **VS Code (Claude Code / OpenCode)** | `~/.claude/` and `~/.agents/` | Automatic via user profile configurations |
| **Cursor and Windsurf** | `~/.agents/skills/` | Automatic via global agent instructions |
| **Google Antigravity** | `~/.gemini/config/skills/` | Automatic via skill registry |

---

## Included Skill Suites (12 Suites / 500+ Skills)

| Suite | Focus | Key Skills |
| :--- | :--- | :--- |
| **Agent Skills** *(Addy Osmani)* | Engineering lifecycle: specifications, task decomposition, test-driven development, code quality, and release management. | `spec-driven-development`, `planning-and-task-breakdown`, `incremental-implementation`, `test-driven-development`, `code-review-and-quality`, `shipping-and-launch` *(25 skills)* |
| **ECC (Everything Claude Code)** *(Affaan Mustafa)* | Architecture patterns for major backend and frontend frameworks (FastAPI, Django, Rails, Spring Boot, Go, Rust, React, Vue, Kubernetes), evaluation harnesses, and performance tuning. | `agentic-engineering`, `continuous-learning-v2`, `eval-harness`, `api-design`, `backend-patterns`, `frontend-patterns`, `token-budget-advisor`, `kubernetes-patterns` *(314 skills)* |
| **Unslop** *(Damir Sokolovsky)* | Interface polish and code cleanup: refactors generic design patterns into structured, production-ready interfaces. | `unslop` *(1 skill)* |
| **Replica Skill** *(Jake Schincariol)* | Reverse-engineering workflows: application analysis, architecture extraction, design reconstruction, and implementation planning. | `replica-recon`, `replica-architect`, `replica-design`, `replica-backend`, `replica-build`, `replica-diff` *(11 skills)* |
| **Superpowers** | Structured problem-solving: requirements clarification, plan generation, test-driven development, and systematic debugging. | `using-superpowers`, `brainstorming`, `systematic-debugging`, `test-driven-development`, `writing-plans`, `executing-plans`, `verification-before-completion` *(14 skills)* |
| **gstack** *(Garry Tan)* | Engineering workflows: pull request reviews, automated browser QA, architectural planning, and code inspection. | `gstack`, `gstack-review`, `gstack-qa`, `gstack-ship`, `gstack-browse`, `gstack-autoplan`, `gstack-careful` *(58 skills)* |
| **UI/UX Pro Max** | Design system reference: design styles, color palettes, typography pairings, UX patterns, and component guidelines. | `ui-ux-pro-max`, `ui-styling`, `design-system`, `brand`, `banner-design`, `slides` *(7 skills)* |
| **Taste Skill** | Interface styling: structured layout guidelines, density and typography calibration, and color balance. | `design-taste-frontend`, `minimalist-ui`, `industrial-brutalist-ui`, `high-end-visual-design`, `redesign-existing-projects` *(13 skills)* |
| **Ponytail** | Complexity reduction: enforces minimal code footprints, standard library utilization, and dependency reduction. | `ponytail`, `ponytail-review`, `ponytail-audit`, `ponytail-debt`, `ponytail-gain` *(6 skills)* |
| **Impeccable** | Interface polish: contrast checks, typography hierarchy, and micro-interaction design. | `impeccable` *(1 skill)* |
| **Security Review** | Security assessment: incremental diff reviews and pre-deployment security audits. | `security-review-incremental`, `security-review-prelaunch`, `security-audit-log` *(3 skills)* |
| **Matt Pocock's Skills** | System modeling, schema validation, debugging workflows, and specification generation. | `ask-matt`, `domain-modeling`, `codebase-design`, `grill-me`, `diagnosing-bugs`, `to-spec` *(30 skills)* |
| **Standalone Suites** | Specialized utilities for slide deck generation, animation, and documentation. | `pptx`, `hyperframes`, `brag`, `reverse-engineer-anything` *(15 skills)* |

---

## Slash Commands

Skills can also be explicitly invoked using slash commands:

* **UI and Design**: `/unslop`, `/design-taste-frontend`, `/ui-ux-pro-max`, `/ui-styling`, `/design-system`
* **Specification and Planning**: `/spec`, `/plan`, `/brainstorming`, `/writing-plans`, `/grill-me`
* **Development and Testing**: `/test-driven-development`, `/systematic-debugging`, `/verification-before-completion`, `/code-simplify`
* **Review and Release**: `/gstack-review`, `/gstack-qa`, `/gstack-ship`, `/security-review-incremental`, `/ponytail-review`
* **Application Analysis**: `/replica-recon`, `/replica-architect`, `/replica-design`, `/replica-backend`
* **Utilities**: `/pptx`, `/brag`, `/reverse-engineer-anything`

---

## Updates

To fetch the latest skill updates, pull changes in the repository directory:
```bash
git pull origin main
```
Because the setup scripts link directly to this repository, updates take effect immediately across all tools.
