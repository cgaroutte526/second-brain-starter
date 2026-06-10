You are running the user's end-of-day shutdown.

## Step 1 — Ask the four shutdown questions

Ask the user these four questions, one at a time, waiting for the answer before the next. Read today's daily log first so you have the morning plan as context.

1. **What got done today?** (You can offer the morning plan's Top 5 + ranked queue as a checklist to walk through.)
2. **What didn't get done?** For each unfinished item, ask: defer to tomorrow, partial progress, or dropped?
3. **Any new commitments made today?** Capture: what, to whom, by when.
4. **What did you learn today?** One sentence is fine. Anything worth remembering.

## Step 2 — Append to today's daily log

Open `daily-logs/YYYY-MM-DD.md` (today's date). Do NOT overwrite the morning plan section. Append a new section at the bottom:

```
## End of day (HH:MM via /shutdown)

### Done
- [item]
- [item]

### Partial / Deferred
- [item] — reason — pushed to [date]
- [item] — reason — dropped

### New commitments
- [commitment] — to [name] — by [date]
  → ROUTE: [proposed target project file]

### Decisions made today
- [decision] — was: [pending] → now: [decided | deferred]
  → ROUTE: [proposed target project file]

### What I learned
- [the user's answer to Q4]

### Tomorrow's seed
- Top candidates: [2-3 items, drawn from Partial/Deferred + Tier 1/2 still open]
- Roll-forwards: [items + slip count]
```

## Step 3 — Show the routing table and wait for approval

For every "→ ROUTE:" line, propose a target project file (or "new file: areas/.../[name].md" if it needs a new project).

Show the user the proposed routing as a table:

```
## Routing for end-of-day commitments + decisions

| Item | Type | Target file | Action |
|---|---|---|---|
| ... | commitment | areas/<area>/<project>.md | append to Open commitments |
| ... | decision | areas/<area>/<project>.md | flip pending → decided |
```

WAIT for the user's explicit OK before touching anything in `areas/`. This is hard rule #3.

## Step 4 — On approval, apply routes

For each approved route:
- Update the target project file. Add commitments to the "Open commitments" section. Flip decisions in the "Open decisions" section. Add a line to "Recent activity" citing today's daily log as source.
- Update the project's `Last updated:` field.
- If a status changed (e.g., active → blocked or → done), update `areas/_index.md`.

## Step 5 — Confirm

Show the user:
- The daily log file path with today's complete entry.
- A list of project files that were updated.
- Tomorrow's seed (for tomorrow's `/today`).

## Step 6 — Back up to GitHub (only if backup was set up)

If — and only if — this vault is a git repository with a remote configured, back up the day's work. Run this check first via Bash:

```bash
if git rev-parse --is-inside-work-tree >/dev/null 2>&1 && git remote get-url origin >/dev/null 2>&1; then
  git add -A
  git commit -m "chore: daily shutdown $(date +%F)" || echo "nothing to commit"
  git push && echo "Backed up to GitHub ✓"
else
  echo "No git backup configured — skipping (set one up anytime with /setup or 'git init')."
fi
```

- If it pushed, tell the user "Backed up to GitHub ✓".
- If there was no git repo/remote, that is fine — say backup is not configured and move on. Do NOT treat this as an error.
- If the push fails (e.g., offline), say the commit was made locally and will sync later.

This is always the last step of `/shutdown`.

Hard rules in `CLAUDE.md` apply.
