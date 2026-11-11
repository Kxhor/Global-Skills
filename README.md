# Universal AI Global Skills Suite 🚀

A comprehensive, production-grade collection of **12 curated suites** and **500+ battle-tested skills** configured for universal compatibility across:
* **Claude Code** (CLI, VS Code extension, terminal)
* **OpenCode** (CLI, VS Code extension, terminal)
* **VS Code & Cursor** (Claude Code, OpenCode, Antigravity, Cline, Roo Code, GitHub Copilot)
* **Google Antigravity** (IDE, Desktop 2.0 Electron, and CLI `agy`)

> [!NOTE]
> **Pure Platform-Agnostic Architecture:**
> The default base plugins bundled with Antigravity IDE (`flutter`, `firebase`, `android-cli`, `chrome-devtools`, `gemini-api`, `data-agent-kit`, `google-antigravity-sdk`, `google_maps_platform`) are intentionally excluded from this repository. If you use Antigravity, those plugins are already provided by your IDE setup wizard. Excluding them here prevents tool collisions, missing MCP errors, and ensures seamless out-of-the-box execution for **Claude Code**, **OpenCode**, and **VS Code**.

---

## ⚡ 1-Command Global Install (For You & Your Friends)

Friends can install the entire 500+ skill suite across all their IDEs and CLI tools with a single terminal command:

### Windows (PowerShell)
Open PowerShell and run:
```powershell
git clone https://github.com/Kxhor/Global-Skills.git "$env:USERPROFILE\.gemini\Global-Skills"; powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.gemini\Global-Skills\install.ps1"
```

### macOS / Linux (Terminal)
Open Terminal and run:
```bash
git clone https://github.com/Kxhor/Global-Skills.git ~/.gemini/Global-Skills && chmod +x ~/.gemini/Global-Skills/install.sh && ~/.gemini/Global-Skills/install.sh
```

> **Zero Extra Disk Space:** The installer creates lightweight directory links (native NTFS Junctions on Windows, symlinks on Unix). All skills stay synchronized directly with your git checkout!

---

## 🤖 Do These Skills Work Automatically Without Calling Them Every Time?

### **YES — 100% Autonomous (No Manual Slash Commands Required)**

You and your friends do **not** need to memorize commands like `/tdd`, `/unslop`, or `/spec` or call skills manually every time. They trigger autonomously through three built-in mechanisms:

### 1. Semantic Progressive Disclosure
Every skill includes YAML frontmatter (`name` and `description`). At the start of a conversation, AI agents (**Claude Code**, **OpenCode**, and **Antigravity**) ingest the catalog of skill descriptions into their system context:
* **"Clean up this messy UI / make it look less AI"** ➔ Agent automatically invokes `unslop` (9-pass craft pass) and `design-taste-frontend`.
* **"Write a new feature for login"** ➔ Agent automatically invokes `spec-driven-development` (`/spec`) and `brainstorming`.
* **"Why is my test or API endpoint failing?"** ➔ Agent automatically invokes `systematic-debugging` and `diagnosing-bugs`.
* **"Implement this in Django / FastAPI / Go / Rust / K8s"** ➔ Agent automatically invokes ECC deep technical patterns (`django-patterns`, `fastapi-patterns`, `golang-patterns`, `rust-patterns`, `kubernetes-patterns`).
* **"Clone this website or reverse-engineer this UI"** ➔ Agent automatically invokes `replica-recon` and `replica-architect`.
* **"Prepare a PR / review this branch"** ➔ Agent automatically invokes `gstack-review`, `gstack-qa`, `shipping-and-launch`, or `security-review-incremental`.

### 2. Universal Proactive Directive (`CLAUDE.md` & `AGENTS.md`)
The installer automatically deploys global rule directives to `~/.claude/CLAUDE.md` and `~/.agents/AGENTS.md`:
> *"Whenever the user's task matches a skill's domain, you MUST inspect and execute the corresponding `SKILL.md` FIRST before taking action or writing speculative code. Do not wait for the user to type a slash command."*

Because Claude Code and OpenCode load these directives globally across all projects, the agent is strictly prohibited from taking speculative, unguided actions without invoking the relevant runbook first.

### 3. How It Works in Your Desired IDEs & CLIs

| Platform / IDE | How It Runs | Automatic Activation Method |
| :--- | :--- | :--- |
| **Claude Code (CLI & Terminal)** | Native `~/.claude/skills/` | Automatic via frontmatter index + `~/.claude/CLAUDE.md` |
| **OpenCode (CLI & Terminal)** | Native `~/.agents/skills/` & `~/.config/opencode/skills/` | Automatic via frontmatter index + `~/.agents/AGENTS.md` |
| **VS Code (Claude Code / OpenCode)** | Integrated terminal & extensions | Fully automatic; reads user-profile `~/.claude` and `~/.agents` |
| **Cursor / Windsurf** | Agent mode | Reads `~/.agents/skills/` and global rules automatically |
| **Antigravity (IDE, Desktop, `agy`)** | Native plugin & skill registry | Progressive disclosure + global invariants in `config.json` |

---

## 📦 Installed Frameworks & Capabilities (12 Suites · 500+ Skills)

| Suite / Framework | What It Does | Key Bundled Skills |
| :--- | :--- | :--- |
| **Agent Skills** *(Addy Osmani)* | Engineering lifecycle: Specs before code, atomic plans, strict test gates, automated reviews, safe shipping. | `spec-driven-development`, `planning-and-task-breakdown`, `incremental-implementation`, `test-driven-development`, `code-review-and-quality`, `shipping-and-launch`, `code-simplification`, `doubt-driven-development`, `performance-optimization` *(25 skills)* |
| **ECC (Everything Claude Code / Agent Harness OS)** *(Affaan Mustafa)* | Massive library covering 20+ stacks (FastAPI, Django, Rails, Spring Boot, Go, Rust, Kotlin, Swift, Vue, React, K8s, etc.), eval-first loops, token-budget optimization, and multi-agent coordination. | `agentic-engineering`, `continuous-learning-v2`, `eval-harness`, `ecc-guide`, `api-design`, `backend-patterns`, `frontend-patterns`, `token-budget-advisor`, `docker-patterns`, `kubernetes-patterns` *(314 skills)* |
| **Unslop** *(Damir Sokolovsky)* | Anti-slop redesign & craft engine: Turns vibecoded, AI-looking UI into a designed interface with authentic character via 9 redline passes. | `unslop` (`/unslop`, `/unslop <url>`, `/unslop story`) |
| **Replica Skill** *(Jake Schincariol)* | Clean-room app replication & commercialization: Rebuild any web/mobile app from URLs or screenshots and engineer competitor pain points into features. | `replica-recon`, `replica-architect`, `replica-design`, `replica-backend`, `replica-build`, `replica-diff`, `replica-test`, `replica-entrepreneur`, `replica-brand`, `replica-launch`, `replica-deploy` *(11 skills)* |
| **Superpowers** | Disciplined problem-solving: Enforces brainstorming before planning, TDD before coding, systematic debugging on errors, and verification before completion. | `using-superpowers`, `brainstorming`, `systematic-debugging`, `test-driven-development`, `writing-plans`, `executing-plans`, `subagent-driven-development`, `verification-before-completion` *(14 skills)* |
| **gstack** *(Garry Tan)* | Full-stack engineering, QA, and release management: Atomic shipping, pre-landing PR reviews, headless browser QA testing, and CEO/Eng architectural reviews. | `gstack`, `gstack-review`, `gstack-qa`, `gstack-ship`, `gstack-browse`, `gstack-autoplan`, `gstack-office-hours`, `gstack-careful`, `gstack-investigate` *(58 skills)* |
| **UI/UX Pro Max** | Design intelligence engine with searchable local dataset: 79 styles, 192 product palettes, 74 font pairings, 119 UX guidelines, 105 icons, 17 GSAP motion presets, 25 chart types. | `ui-ux-pro-max`, `ui-styling` (shadcn/Tailwind), `design-system`, `brand`, `banner-design`, `slides` *(7 skills)* |
| **Taste Skill** | Anti-slop frontend engineering: Establishes a one-line Design Read, calibrates 3 dials (`VARIANCE`, `MOTION`, `DENSITY`), and bans generic purple glows and low-contrast palettes. | `design-taste-frontend`, `minimalist-ui`, `industrial-brutalist-ui`, `high-end-visual-design`, `redesign-existing-projects`, `brandkit`, `stitch-design-taste` *(13 skills)* |
| **Ponytail** | Pragmatic complexity filter: Enforces the 7-rung minimalist ladder (YAGNI, standard library first, native platform before new dependencies). | `ponytail`, `ponytail-review`, `ponytail-audit`, `ponytail-debt`, `ponytail-gain` *(6 skills)* |
| **Impeccable** | Design directorship, accessibility, and micro-interactions across Persuade, Operate, Read, and Experience modes. | `impeccable` (contrast audits, typography refinement, micro-interactions) |
| **Security Review** | Automated security audits, incremental reviews on git diffs, and pre-launch security logging. | `security-review-incremental`, `security-review-prelaunch`, `security-audit-log` *(3 skills)* |
| **Matt Pocock's Skills** | Architecture pressure-testing, requirements grilling, and type system / schema modeling. | `ask-matt`, `domain-modeling`, `codebase-design`, `grill-me`, `diagnosing-bugs`, `to-spec`, `to-tickets` *(30 skills)* |
| **Standalone Suites** | Specialized presentation, video generation, and reverse-engineering power tools. | `pptx` (PowerPoint generation, analysis & repair), `hyperframes` suite (code-driven animation & video generation), `brag` (generate launch videos), `reverse-engineer-anything` *(15 skills)* |

---

## ⚡ Optional Manual Slash Commands

While automatic activation is the primary mode of operation, you can still trigger or steer any workflow manually via slash commands in your CLI or chat:

* **Clean Vibecoded UI:** `/unslop`, `/unslop <url>`
* **Lifecycle & Specs:** `/spec`, `/plan`, `/build`, `/test`, `/review`, `/ship`, `/code-simplify`, `/webperf`
* **App Replication:** `/replica-recon`, `/replica-architect`, `/replica-design`, `/replica-backend`, `/replica-diff`
* **Release & QA:** `/gstack-review`, `/gstack-qa`, `/gstack-ship`, `/gstack-browse`, `/gstack-autoplan`
* **Design & Styling:** `/ui-ux-pro-max`, `/ui-styling`, `/design-system`, `/brand`, `/banner-design`, `/slides`, `/design-taste-frontend`
* **Engineering Process:** `/brainstorming`, `/test-driven-development`, `/systematic-debugging`, `/verification-before-completion`, `/ponytail-review`
* **Utilities:** `/pptx`, `/brag`, `/grill-me`, `/ask-matt`, `/reverse-engineer-anything`

---

## 🔄 Keeping Up to Date

Because the installation scripts link to your local clone, updates take effect immediately without re-running any installer:
```bash
git pull origin main
```
