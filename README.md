# Antigravity Global Skills Suite 🚀

A comprehensive collection of **18 production suites** and **265+ battle-tested skills** configured for Google Antigravity across all three surfaces:
* **Antigravity IDE**
* **Antigravity 2.0 (Desktop Electron)**
* **Antigravity CLI (`agy`)**

---

## ⚡ Quick Start: 1-Command Global Install

Clone this repository and run the automated installer for your operating system.

### Windows (PowerShell)
Open PowerShell and run:
```powershell
git clone https://github.com/Kxhor/Global-Skills.git "$env:USERPROFILE\.gemini\Global-Skills"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.gemini\Global-Skills\install.ps1"
```

### macOS / Linux (Terminal)
Open Terminal and run:
```bash
git clone https://github.com/Kxhor/Global-Skills.git ~/.gemini/Global-Skills
chmod +x ~/.gemini/Global-Skills/install.sh && ~/.gemini/Global-Skills/install.sh
```

> **Note:** The installer creates lightweight directory links (NTFS Junctions on Windows, symlinks on Unix). It takes zero extra disk space and updates automatically whenever you `git pull`.

---

## 📦 Included Suites & Capabilities

| Suite / Framework | What It Does | Key Workflows & Skills |
| :--- | :--- | :--- |
| **Superpowers** | Process enforcement: TDD, debugging, planning | `brainstorming`, `test-driven-development`, `systematic-debugging`, `verification-before-completion`, `writing-plans` |
| **gstack** *(Garry Tan)* | Full-stack engineering, QA, and release management (58 skills) | `gstack-review`, `gstack-qa`, `gstack-ship`, `gstack-browse`, `gstack-autoplan`, `gstack-office-hours`, `gstack-careful` |
| **UI/UX Pro Max** | Design intelligence with local datasets (79 styles, 192 palettes) | `ui-ux-pro-max`, `ui-styling` (shadcn/Tailwind), `design-system`, `brand`, `banner-design`, `slides` |
| **Taste Skill** | Anti-slop frontend engineering and aesthetic calibration | `design-taste-frontend`, `minimalist-ui`, `industrial-brutalist-ui`, `high-end-visual-design`, `brandkit` |
| **Ponytail** | Complexity filter and minimalist code enforcement | `ponytail` (7-rung minimalist ladder), `ponytail-review`, `ponytail-audit`, `ponytail-debt` |
| **Impeccable** | Design directorship, accessibility, and micro-interactions | `impeccable` (Persuade, Operate, Read, and Experience modes, WCAG contrast audits) |
| **Security Review** | Automated security audits and defense-in-depth | `security-review-incremental`, `security-review-prelaunch`, `security-audit-log` |
| **Matt Pocock's Skills** | Architecture pressure-testing and schema modeling | `ask-matt`, `domain-modeling`, `codebase-design`, `grill-me`, `diagnosing-bugs`, `to-spec` |
| **Modern Web Guidance** | Modern web platform APIs and standards | `modern-web-guidance` (View Transitions, `:has()`, Container Queries), `chrome-extensions` |
| **Chrome DevTools** | MCP browser inspection and web performance | `chrome-devtools`, `a11y-debugging`, `debug-optimize-lcp`, `memory-leak-debugging` |
| **Gemini API & Live** | Multimodal AI integrations and real-time streaming | `gemini-api-dev`, `gemini-live-api-dev` (WebSockets), `gemini-omni-flash-api` |
| **Firebase** | Cloud database, security rules, and auth | `firebase-firestore`, `firebase-auth-basics`, `firebase-security-rules-auditor`, `firebase-hosting-basics` |
| **Flutter & Dart** | Cross-platform mobile development and diagnostics | `flutter-apply-architecture-best-practices`, `flutter-build-responsive-layout`, `dart-fix-runtime-errors` |
| **Data Agent Kit** | Cloud data pipelines and ML workflows | `bigquery-sql`, `dbt-bigquery`, `gcp-spark`, `dataform-bigquery`, `schema-mapping` |
| **Science & Biotech** | Biological sequence and chemical discovery | `alphafold-database-fetch-and-analyze`, `uniprot-database`, `pubmed-database`, `pdb-database` |
| **Gravitas** *(Uday Sharma)* | Model-agnostic engineering reliability runtime | `gravitas` (scoped recon, adaptive planning, evidence-backed verification, 6 invariants) |
| **Standalone Tools** | High-utility specialized tools | `brag` (generate launch videos), `reverse-engineer-anything` |

---

## 🧠 How It Works

### 1. Automatic Intent Activation (No Prompts Needed)
Antigravity operates on **Progressive Disclosure**. The agent continuously evaluates your intent against all registered skill descriptions:
* Ask to fix a mysterious error ➔ automatically activates `systematic-debugging` and `diagnosing-bugs`.
* Ask to design a modern interface ➔ automatically activates `ui-ux-pro-max`, `design-taste-frontend`, and `impeccable`.
* Ask to review a PR or ship changes ➔ automatically activates `gstack-review`, `gstack-qa`, and `security-review-incremental`.

### 2. Manual Slash Commands in CLI (`agy`)
In the Antigravity CLI terminal, all skills are registered as first-class slash commands:
* **QA & Ship:** `/gstack-review`, `/gstack-qa`, `/gstack-ship`, `/gstack-browse`, `/gstack-autoplan`
* **Design:** `/ui-ux-pro-max`, `/ui-styling`, `/design-system`, `/brand`, `/banner-design`, `/slides`
* **Engineering Process:** `/brainstorming`, `/test-driven-development`, `/systematic-debugging`, `/ponytail-review`
* **Utilities:** `/brag`, `/grill-me`, `/ask-matt`

---

## 🔄 Keeping Up to Date
To get the latest skills and upstream updates, simply pull the latest changes:
```bash
git pull origin main
```
Because the installer links to your checkout directory, all updates apply immediately without re-running the installation script.
