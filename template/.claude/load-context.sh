#!/usr/bin/env bash
# Loads session-start context for your Second Brain.
# Plain-text stdout becomes session context (Claude Code SessionStart hook).
# Deliberately NOT using `set -e`: a non-zero exit makes the hook fail
# silently, so every step is guarded and the script always ends with exit 0.

# Resolve the vault root. Prefer Claude's project dir; fall back to the
# script's own location so it works no matter how it's invoked.
if [ -n "${CLAUDE_PROJECT_DIR:-}" ]; then
  VAULT_DIR="$CLAUDE_PROJECT_DIR"
else
  VAULT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fi

cd "$VAULT_DIR" 2>/dev/null || { echo "(could not enter vault dir)"; exit 0; }

echo "===== SECOND BRAIN — SESSION CONTEXT ====="
echo ""

echo "===== AREAS INDEX ====="
if [ -f areas/_index.md ]; then
  cat areas/_index.md
else
  echo "(no areas/_index.md yet)"
fi
echo ""

echo "===== RECENT DAILY LOGS (last 3) ====="
LOGS="$(ls -1 daily-logs/ 2>/dev/null | grep -E '^[0-9]{4}-[0-9]{2}-[0-9]{2}\.md$' | sort | tail -3)"
if [ -z "$LOGS" ]; then
  echo "(no daily logs yet)"
else
  while IFS= read -r log; do
    [ -z "$log" ] && continue
    echo "--- $log ---"
    cat "daily-logs/$log" 2>/dev/null
    echo ""
  done <<< "$LOGS"
fi
echo ""

echo "===== ACTIVE FOCUS PROJECTS ====="
ACTIVE="$(grep -rliE "active focus:(\*\*)? yes" areas/ 2>/dev/null)"
if [ -z "$ACTIVE" ]; then
  echo "(no projects flagged Active focus: yes)"
else
  while IFS= read -r f; do
    [ -z "$f" ] && continue
    echo "--- $f ---"
    cat "$f" 2>/dev/null
    echo ""
  done <<< "$ACTIVE"
fi
echo ""

echo "===== END SESSION CONTEXT ====="
exit 0
