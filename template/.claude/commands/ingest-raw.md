You are processing files in `raw/` and routing their content into the vault.

## Step 1 — List the queue

List every file in `raw/` that is NOT inside `raw/_processed/`. For each, note filename and apparent type (PDF, email export, transcript, screenshot, etc.). Note total count.

If there are no files, tell the user and stop.

## Step 2 — Read each file

For each file:
- If it's text, read it.
- If it's a PDF, read the text (use `pdftotext` if needed via Bash; the system has poppler installed).
- If it's an image or unparseable, note that and ask the user for a brief description rather than guessing content.
- Extract substantive content: facts, dates, decisions, commitments, names, numbers. For long docs, summarize sections rather than transcribing — but always cite the source for any factual claim.

## Step 3 — Match to a target

For each file, propose one of:
- `UPDATE: areas/<path>/<file.md>` — content fits an existing project file.
- `CREATE: areas/<area>/<new-name>.md` — content represents a new project.
- `??? — needs your input` — file is ambiguous, unrelated, or you can't tell.

## Step 4 — Show the routing table

Show the user this table BEFORE writing anything to `areas/`. Hard rule #3.

```
## Routing table — YYYY-MM-DD HH:MM

| File in raw/ | Apparent type | Action | Target |
|---|---|---|---|
| project-spec.pdf | PDF | UPDATE | areas/<area>/<project>.md |
| q2-deadline-email.eml | email export | UPDATE | areas/<area>/<project>.md |
| unknown-deck.pdf | PDF | ??? | needs your input |
```

WAIT for the user's explicit approval. If the user wants to change a route, accept the correction.

## Step 5 — Apply approved routes

For each approved route:

### UPDATE
- Open the target project file.
- Add the file's substantive content to the right sections:
  - Open commitments / decisions / blockers → in the matching section.
  - New deadlines or status → update header fields and `Recent activity`.
  - Other context → `Notes`, cited.
- Cite the source raw file in every line you add (format: `(source: raw/<filename>)`).
- Update the project's `Last updated:` field.

### CREATE
- Use `templates/project.md` as the scaffold.
- Fill in what you have from the raw file. Use `[unsourced]` or `[NEEDS: <what>]` for gaps.
- Add the new project as a row in `areas/_index.md` and as a bullet in the relevant `_area.md`'s "Active projects" list.

### Move processed files
- After applying, move each processed raw file to `raw/_processed/YYYY-MM-DD/<original-filename>`. Create the dated subfolder if it doesn't exist.

## Step 6 — Confirm

Show the user:
- The list of project files updated or created.
- The new contents of `areas/_index.md` if it changed.
- The list of files moved to `raw/_processed/YYYY-MM-DD/`.

For any `???` routing files the user didn't resolve, leave them in `raw/` for next time.

Hard rules in `CLAUDE.md` apply.
