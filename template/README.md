# My Second Brain

Your personal AI second brain — Claude Code + a local markdown vault.

## First time here?
Run **`/setup`** in Claude Code. It interviews you and builds everything below automatically.

## Commands

| Command | When | What it does |
|---|---|---|
| `/setup` | Once, first | Interviews you and generates your personalized vault + OS hook. |
| `/load` | Auto on session start | Briefs you on where you left off + active-focus projects. |
| `/today` | Each morning | Reads yesterday + open commitments, asks for your calendar/tasks, writes a ranked plan to `daily-logs/`. |
| `/shutdown` | End of day | 4 questions; updates the daily log + project files; auto-backs-up if you set up Git. |
| `/draft <type> <topic>` | When you need to write | Drafts email/memo/status-update/note in your voice, saved to `drafts/`. |
| `/ingest raw` | Files dropped in `raw/` | Shows a routing table, then files content into the right project. |

## Daily rhythm
Open this folder in Claude Code → `/today` in the morning → `/draft` as needed → `/shutdown` at night.

## Reading it
Open this folder in [Obsidian](https://obsidian.md) ("Open folder as vault") for a nicer view with clickable links. Optional — everything works without it.

## Hard rules
See §5 of `CLAUDE.md`: never sends externally (drafts only), read-only on your task tracker, routing table before `/ingest` writes, cite every claim, never invents notes/quotes.
