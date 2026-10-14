# Detailed installation, new projects, existing projects, and upgrades

## Prerequisites
- VS Code and the official OpenAI Codex extension, signed in.
- Git for cloning the public toolkit.
- PowerShell 5.1+ (Windows) or Bash (macOS/Linux). A terminal works inside VS Code.

## Create a brand-new project
Make its folder first, then install the toolkit into it. The installation does not create a framework or application code; Codex will guide technology selection during discovery.

Windows:
```powershell
New-Item -ItemType Directory -Force C:\Projects\MyNewApp
.\scripts\install.ps1 -TargetPath C:\Projects\MyNewApp
code C:\Projects\MyNewApp
```
macOS/Linux:
```bash
mkdir -p ~/Projects/MyNewApp
bash scripts/install.sh ~/Projects/MyNewApp
code ~/Projects/MyNewApp
```
The installer copies 10 skills, reference materials, and starter templates; it creates `AGENTS.md` only if missing. Review the generated AGENTS instructions before asking Codex to implement features.

## Install into existing app
Run the same installer with your existing repository path. It preserves any existing `AGENTS.md`, `.agents/skills/<name>`, and `docs/product` files. If you already have `AGENTS.md`, manually merge the contents of `AGENTS.team.example.md` from your target. Save current git changes/commit before installation.

## Upgrade safely
In the toolkit checkout, `git pull --ff-only`; rerun the installer. The installer **skips** existing skill folders rather than overwriting local customizations. To adopt revised skills, compare upstream files with your installed skill files and merge selected changes manually. Never blindly delete local skills or your existing AGENTS instructions.

## Restore or uninstall
All managed skills live under `.agents/skills/`. Remove only the directories you installed after confirming no user modifications exist. Remove added project docs only if you no longer need them. If the project has git, use `git diff` before committing or deleting anything.

## Codex in VS Code
1. Open project root with the Codex extension.
2. Ensure `AGENTS.md` exists and `.agents/skills/build-app/SKILL.md` exists.
3. Ask: `Use $build-app to plan and guide my app from idea to production. First inspect the repository; do not code until the plan is approved.`
4. Continue in one conversation; Codex picks the appropriate specialist skill. Ask it to consult `docs/product/PROJECT_STATE.md` when resuming a later session.
5. For Figma access, set up an authorized Figma integration in the Codex environment; the skill cannot access your private Figma files without a connection.

## Separate agents?
No. Skills are instructions, not separate processes. One Codex session is the default and cheapest/simple option. If the Codex runtime you use supports optional multi-agent delegation, use it for independent repository exploration or verification, not as a prerequisite. Never assume separate agents exist solely because skill names exist.

## Security and authorship
Keep `.env`, secrets and credentials out of git; do not run destructive commands on production. Publishing to GitHub is a separate explicit step. Configure your own Git author identity when committing; skills have no influence on Git co-author metadata. License is source-available, not open source. The installation process copies files unchanged.
