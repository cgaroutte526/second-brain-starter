You are running the user's morning plan for today.

## Step 1 — Get today's inputs

Ask the user to paste a plain-text dump containing:
- Today's calendar (meetings, blocks, with start and end times).
- Any new urgent items from the user's task tracker or any inbox sweep they just did.
- Anything top-of-mind that isn't already in the vault.

Wait for the paste.

## Step 2 — Read the vault

Read in this order:
- Yesterday's `daily-logs/YYYY-MM-DD.md` (yesterday's date) — pull "Tomorrow's seed" and any open roll-forwards.
- All project files (`_project.md` and flat single-file projects) with `Status: active` — focus especially on those with `Active focus: yes`. Extract open commitments, blockers, and any deadlines.
- The 4-tier priority model and time-block rules from `CLAUDE.md` §4.

## Step 3 — Rank and schedule

Apply the 4-tier priority model strictly:
1. Tier 1 — someone is blocked on me.
2. Tier 2 — leadership-facing deadline.
3. Tier 3 — project momentum at risk.
4. Tier 4 — personal commitment.

Apply the roll-forward boost: within each tier, items that have slipped from prior days rank higher. Note slip counts.

Map ranked items into the available time blocks in the user's calendar:
- Deep block (≥ 90 min) → heavy work (writing, decisions, multi-step strategy).
- Medium block (45–89 min) → focused but bounded (review, prep, analysis).
- Shallow block (< 45 min) → email, approvals, short follow-ups.

If the user keeps any recurring check-ins (e.g., an inbox they sweep on a schedule, a standup), insert those as fixed markers between blocks. Otherwise skip this.

If the day doesn't have enough open time for everything ranked, say so explicitly and propose what to cut or defer.

## Step 4 — Write the daily log

Create or overwrite `daily-logs/YYYY-MM-DD.md` (today's date) with this exact structure:

```
# YYYY-MM-DD — [Day of Week]

## Plan (set HH:MM via /today)

### Top 5
1. [item] — Tier [N], because [reason] — est [time]
2. [item] — Tier [N], because [reason] — est [time]
3. [item] — Tier [N], because [reason] — est [time]
4. [item] — Tier [N], because [reason] — est [time]
5. [item] — Tier [N], because [reason] — est [time]

### Ranked queue (4-tier)
**Tier 1 — Someone blocked on me:**
- [items, or "none"]

**Tier 2 — Leadership-facing deadline:**
- [items, or "none"]

**Tier 3 — Project momentum at risk:**
- [items, or "none"]

**Tier 4 — Personal commitment:**
- [items, or "none"]

### Suggested schedule
- HH:MM–HH:MM  [item] — [deep | medium | shallow]
- HH:00         [recurring check-in, if any]
- HH:MM–HH:MM  [item] — [deep | medium | shallow]
- ...

### Roll-forwards
- [item] — slipped [N] day(s)
- [items, or "none"]

### Capacity check
[Either "Plan fits the day" OR an explicit note about what won't fit and suggested cuts.]
```

## Step 5 — Confirm

Show the user the file contents in the terminal. Ask: "Anything to adjust before we run with this?"
