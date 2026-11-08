#!/usr/bin/env bash
# Crude leak guard. Run inside a clone before committing -- mandatory
# in the PUBLIC template clone, recommended in the instance.
#
# It greps staged files for common secret shapes and for words you
# list in .leak-words (one per line, e.g. real project or customer
# names that must never reach the public template).
# It is a tripwire, not a guarantee: read your diff anyway.
set -euo pipefail

fail=0
staged="$(git diff --cached --name-only --diff-filter=ACM)"
[ -n "$staged" ] || { echo "nothing staged"; exit 0; }

patterns='(AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9]{20,}|sk-[A-Za-z0-9]{20,}|-----BEGIN [A-Z ]*PRIVATE KEY-----|password[[:space:]]*[:=][[:space:]]*[^[:space:]]+|api[_-]?key[[:space:]]*[:=])'
if git diff --cached -U0 | grep -E -n "$patterns" >/dev/null; then
  echo "POSSIBLE SECRET in staged changes:" >&2
  git diff --cached -U0 | grep -E -n "$patterns" >&2 || true
  fail=1
fi

if [ -f .leak-words ]; then
  while IFS= read -r word; do
    [ -n "$word" ] || continue
    if git diff --cached -U0 | grep -F -n "$word" >/dev/null; then
      echo "LEAK WORD staged: $word" >&2
      fail=1
    fi
  done < .leak-words
fi

[ "$fail" -eq 0 ] && echo "check-before-commit: no tripwires hit"
exit "$fail"
