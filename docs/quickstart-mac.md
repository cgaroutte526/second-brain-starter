# Quickstart — Mac

## 1. Install Claude Code
Open **Terminal** (Cmd+Space → "Terminal") and paste:
```bash
curl -fsSL https://claude.ai/install.sh | bash
```
Sign in with your company Claude account when prompted.

## 2. Get the kit
On this repo's GitHub page: green **Code** button → **Download ZIP**, then unzip. (Or `git clone` if you know git.)

## 3. Make it yours
Copy the **`template`** folder into your Documents and rename it **`My Second Brain`**.

## 4. Open it in Claude Code
Either the **Claude desktop app → Code tab** (open the folder), or Terminal:
```bash
cd "$HOME/Documents/My Second Brain" && claude
```

## 5. Run setup
Type **`/setup`** and answer the questions. Claude builds your vault and sets the Mac auto-context hook.

## 6. Restart and go
`/exit`, then `claude` again. Watch for **"Loading vault context…"** on startup, then run **`/today`**.

Stuck? See `troubleshooting.md`.
