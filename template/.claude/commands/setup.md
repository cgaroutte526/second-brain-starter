You are setting up a brand-new Second Brain vault for the user. This is a guided interview. Work through the phases below IN ORDER, asking ONE question at a time and waiting for the answer. Confirm before writing files. Never invent facts about the user — only record what they tell you.

## Phase 0 — Welcome
Briefly tell the user: "I'll ask you a handful of questions and build your personalized second brain. Takes about 10–15 minutes. You can say 'skip' to any question." Then begin.

## Phase 1 — Detect OS and activate the hook
1. Determine the operating system. Run this via Bash and read the result:
   ```bash
   uname -s 2>/dev/null || echo "Windows"
   ```
   - Output contains `Darwin` → macOS. Output `Linux` → Linux (use the Mac/bash hook). Anything else or an error → Windows.
2. Confirm with the user in plain language: "It looks like you're on <Windows/Mac> — is that right?"
3. Activate the matching hook by copying the correct settings file to `.claude/settings.json`:
   - Windows: copy `.claude/settings.windows.json` → `.claude/settings.json`
   - Mac/Linux: copy `.claude/settings.mac.json` → `.claude/settings.json`
   Do this with the Bash tool (`cp`). Tell the user the auto-context hook is now set for their OS and will activate after they restart Claude.

## Phase 2 — Identity
Ask, one at a time:
1. "What's your name?"
2. "What's your role / title, and what are you responsible for?"
Record the answers; you'll write them into CLAUDE.md §1.

## Phase 3 — Areas & projects
1. "What are your 1–3 main areas of work?" (e.g., a domain, a function, a product line)
2. For each area: "What are the active projects or initiatives you're pushing in <area>? List a few."
3. For each project, ask only if not already clear: who's involved, what's the next action, anything blocked.
Tell the user you'll create a project file per initiative and flag the most important 1–2 as `Active focus: yes`.

## Phase 4 — People
"Who are the handful of people you work with most? For each: their role and your relationship." Record for `people/` files.

## Phase 5 — Tools
"What do you use for: tasks/projects? email? team chat?" (e.g., Zoho, Asana, Outlook, Teams, Slack). Record these in CLAUDE.md so `/today` and `/ingest` know your manual-paste workflow. (No automatic integrations are set up — you paste things in.)

## Phase 6 — Voice
"Paste 1–2 emails you've actually sent (any kind), or just describe your tone in a sentence." From samples, extract: greeting style, sign-off, characteristic phrases, things to avoid. Write these into CLAUDE.md §2. If the user skips, write: "Voice: professional, warm, direct. (No samples provided yet — add some later for sharper drafts.)" and move on.

## Phase 7 — Rules & priorities
1. Show the 5 default hard rules (from the current CLAUDE.md §5) and ask: "Keep these as-is, or add/change any?"
2. Show the 4-tier priority model (§4) and ask the same.
Apply any changes the user requests.

## Phase 8 — Generate the vault (CONFIRM FIRST)
Tell the user exactly what you're about to create, then on their OK:
1. Rewrite `CLAUDE.md`: replace every `<<FILL-IN>>` with their real answers (name, role, areas, voice, tools). Keep the section structure.
2. For each project from Phase 3: create `areas/<area-slug>/<project-slug>.md` (or `areas/<area-slug>/_project.md` + the area folder) from `templates/project.md`, filled with what they told you. Mark the top 1–2 `Active focus: yes`. Use `[NEEDS: ...]` for anything not yet known — never invent.
3. For each area: create `areas/<area-slug>/_area.md` from `templates/area.md`.
4. For each person from Phase 4: create `people/<name-slug>.md` from `templates/person.md`.
5. Rewrite `areas/_index.md` to list their real areas/projects.
6. Delete the example files: `areas/example-area/` (whole folder) and `people/example-person.md`.
7. Cite sources as `(source: /setup interview <today's date>)` on seeded claims.

Show a summary of every file created.

## Phase 9 — Optional GitHub backup
Ask: "Want automatic GitHub backup of your vault? Each `/shutdown` will then push your day's work. (Needs Git installed; on Windows that's 'Git for Windows'.)"
- If yes: check `git --version` via Bash. If present, run `git init -b main`, make an initial commit, and tell them how to connect a private GitHub repo (or run `gh repo create` if `gh` is available and they're logged in). If Git is missing, point them to the troubleshooting doc and continue.
- If no: skip. `/shutdown`'s backup step stays dormant (it self-checks).

## Phase 10 — Handoff
Tell the user, clearly:
1. "Restart Claude Code now (`/exit`, then `claude`) so your auto-context hook loads."
2. "Then run `/today` to build your first plan."
3. "Open this folder in Obsidian anytime for nicer reading (optional)."
4. Point them at `docs/` in the starter repo if they want the full guide.

Hard rules: never send anything externally; never write outside this vault folder; confirm before generating files; never invent facts.
