# Troubleshooting / FAQ

## "Do I need to pay / what account?"
You need Claude Code (free to install) signed in with a Claude plan. Your company provides Claude Pro — use that account. No personal billing.

## The hook didn't fire (no "Loading vault context…" on startup)
- **Did you restart Claude after `/setup`?** The hook only activates on a fresh start.
- **Check the settings file exists:** there should be a `.claude/settings.json` in your vault. `/setup` creates it by copying the OS-specific one. If it's missing, re-run `/setup` Phase 1, or copy it yourself (`settings.windows.json` or `settings.mac.json` → `settings.json`).
- **Windows — "scripts are disabled on this system":** that's PowerShell's execution policy. The hook already passes `-ExecutionPolicy Bypass`, but if you still see it, open PowerShell **as Administrator** and run: `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.
- **Windows — hook command form:** if context still won't load, the hook command in `.claude/settings.json` may need a tweak for your setup. Working alternates to try in the `"command"` field:
  - `pwsh -NoProfile -ExecutionPolicy Bypass -File "${CLAUDE_PROJECT_DIR}/.claude/load-context.ps1"` (if you have PowerShell 7)
  - `powershell -NoProfile -ExecutionPolicy Bypass -File "%CLAUDE_PROJECT_DIR%\.claude\load-context.ps1"`

## A space in my folder name broke something
Folder names with spaces (like "My Second Brain") are fine — the hooks quote the path. If you wrote a custom command, quote paths the same way.

## Do I need Git / GitHub?
Only for **automatic backup**. The system runs fully without it. If you want backup and you're on Windows, install **Git for Windows** (https://git-scm.com/download/win), then re-run `/setup` and choose backup.

## Is Obsidian required?
No. It's just a nicer *reader* for your notes. Everything works in Claude Code alone. If you want it: install Obsidian, "Open folder as vault," point it at your vault.

## How do I update the kit later?
Your vault is yours — updates to the starter repo don't touch it. To adopt a new command, copy the changed file from the repo's `template/.claude/commands/` into your vault's `.claude/commands/`.
