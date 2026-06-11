# Quickstart — Windows

## 1. Install Claude Code
Open **PowerShell** (Start menu → type "PowerShell" → Enter) and paste:
```powershell
irm https://claude.ai/install.ps1 | iex
```
Then sign in when prompted (use your company Claude account).

## 2. Get the kit
On this repo's GitHub page, click the green **Code** button → **Download ZIP**. Unzip it (right-click → Extract All).

## 3. Make it yours
Open the unzipped folder, find the **`template`** folder, and **copy it** to your Documents. Rename the copy to **`My Second Brain`**.

## 4. Open it in Claude Code
Easiest path — the **Claude desktop app**:
1. Open the Claude app → click the **Code** tab (not Chat).
2. Open your `My Second Brain` folder.
3. (Terminal alternative: open PowerShell, run `cd "$HOME\Documents\My Second Brain"`, then `claude`.)

## 5. Run setup
Type **`/setup`** and answer the questions. Claude builds your vault and sets up the Windows auto-context hook for you.

## 6. Restart and go
Restart Claude (`/exit`, then start it again). You should see **"Loading vault context…"** on startup — that's the hook working. Then type **`/today`**.

Stuck? See `troubleshooting.md`.
