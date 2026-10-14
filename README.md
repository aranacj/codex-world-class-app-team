# Codex World-Class App Team

**Created by Christian (@aranacj).** Source-available, no modifications to this toolkit without permission; see [LICENSE](LICENSE).

A product-led AI team for **OpenAI Codex in VS Code**, from one plain-language app idea to researched requirements, intuitive workflows, Figma-informed UX/UI, secure architecture, code, QA, and launch readiness. **10 native Codex skills**, persistent decisions/state, and cross-platform installers. No proprietary Claude-specific agent configs.

## One-message start
Open your app folder in VS Code with the Codex extension and say:

> Build a category-leading time-tracking application for field teams. Lead the process from discovery through security, UI/UX, architecture, implementation, quality assurance and launch. Ask only essential questions and do not rush to code. Start with $build-app.

Codex finds `.agents/skills/*/SKILL.md` and uses `AGENTS.md` for repo-level instructions. Skills **do not themselves create separate agent instances**. One VS Code Codex conversation can route among all skills. Native multi-agent support is optional and depends on your Codex environment; this package doesn't require it.

## Installation

### Windows (PowerShell; for new or existing project)
```powershell
git clone https://github.com/aranacj/codex-world-class-app-team.git
cd codex-world-class-app-team
.\scripts\install.ps1 -TargetPath 'C:\Projects\MyApp'
```

### macOS/Linux
```bash
git clone https://github.com/aranacj/codex-world-class-app-team.git
cd codex-world-class-app-team
bash scripts/install.sh /path/to/MyApp
```

> Repo URL becomes valid only after this toolkit is published. Alternatively download/extract the ZIP and run the installer from the extracted root. Existing `AGENTS.md` is **never overwritten**; a team addendum is saved as `AGENTS.team.example.md` in the target for manual merging. Existing skills with conflicting names are skipped.

### Update
From the toolkit checkout: `git pull --ff-only`, then rerun installer with your project target. Existing skills are preserved; inspect new upstream skill changes and merge manually. This safe-by-default strategy intentionally does **not** silently replace previous versions. See [INSTALL.md](INSTALL.md).

## Native structure
```
.agents/skills/build-app/SKILL.md
.agents/skills/workflow-mapper/SKILL.md
.agents/skills/ux-auditor/SKILL.md
.agents/skills/product-architect/SKILL.md
.agents/skills/ux-designer/SKILL.md
.agents/skills/figma-design/SKILL.md
.agents/skills/software-architect/SKILL.md
.agents/skills/senior-developer/SKILL.md
.agents/skills/qa-engineer/SKILL.md
.agents/skills/code-reviewer/SKILL.md
AGENTS.team.example.md
scripts/install.ps1
scripts/install.sh
templates/
```

## How it works
1. Product Lead (`$build-app`) examines greenfield vs existing code and writes a small decision-oriented brief.
2. Discovery and mapping identify users, competitors, workflows and permissions.
3. UX/UI and Figma review propose intuitive, accessible experiences (requires Figma connection for live files).
4. Architecture and security establish boundaries, data models, least-privilege controls and API contracts.
5. Developer implements thin vertical slices, QA runs checks, reviewer assesses risk and correctness.
6. Project state is updated so work resumes cleanly. The user approves consequential decisions and release.

## VS Code
Install the official OpenAI Codex VS Code extension, sign in, open a project root that contains `.agents/` and `AGENTS.md`, and request `$build-app` or describe your app. Codex skills are not inherently executables or automatic background workers. No separate VS Code instances are needed.

## License & credits
Copyright © 2026 Christian (@aranacj). Unmodified reuse is permitted under [LICENSE](LICENSE); modified distribution is prohibited. This is **not** an OSI open-source license. No co-authors are asserted in this repository.
