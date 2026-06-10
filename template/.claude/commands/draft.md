You are drafting on the user's behalf.

Arguments: `$ARGUMENTS` — expected as `<type> <topic>` where:
- `type` ∈ {`email`, `memo`, `status-update`, `note`}
- `topic` is free-form

## Step 1 — Parse arguments

Identify the type and topic. If either is unclear or missing, ask the user before proceeding.

## Step 2 — Search the vault for relevance

Search across:
- `areas/` — for any project files matching the topic.
- `daily-logs/` — last 14 days.
- `drafts/` — recent drafts on related topics.
- `reference/` — glossary, licensor facts, product specs.
- `people/` — if the topic involves a specific person.

Pull anything substantive. Note the source files; you'll cite them in the footer.

## Step 3 — Use the user's voice

- Write in the user's voice as defined in `CLAUDE.md` §2 (greetings, sign-off, characteristic phrases, things to avoid).
- If the user has noted distinct voices for different audiences (e.g., internal vs. external), pick the one that fits the topic. If unsure which, ask before drafting.

## Step 4 — Apply format rules

From `CLAUDE.md` §2:
- **Email:** point in the first sentence. Under 200 words. If longer, suggest it should be a memo instead.
- **Memo:** recommendation up top, then context, then ask. Two pages maximum.
- **Status update:** what changed / what's blocked / what's next.
- **Note:** free-form, but every factual claim is sourced.

## Step 5 — Write the draft

Save the draft to `drafts/YYYY-MM-DD-<slug>.md`. The slug should be a 3-5 word kebab-case summary of the topic.

Include this footer at the bottom of the file:

```
---
**Sources drawn from:**
- [file:line or section]
- [file:line or section]

**Voice used:** [which voice, if you keep more than one]
**Type:** [email | memo | status-update | note]
**Topic:** [original topic argument]
```

Use `[NEEDS: <what>]` for any factual claim that the vault doesn't support. Do NOT invent.

## Step 6 — Show and iterate

Show the user the draft in the terminal. Ask: "Anything to sharpen, cut, or redirect?"

When the user gives revision notes, edit the SAME file in place. Don't create a new file per iteration. Keep the footer updated as sources change.

Hard rules in `CLAUDE.md` apply.
