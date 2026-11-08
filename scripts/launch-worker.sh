#!/usr/bin/env bash
# Launch a worker Claude Code process for one ticket brief.
#
# Usage:
#   scripts/launch-worker.sh <repo-or-worktree-dir> <brief-file> [result-file]
#
# The worker runs headlessly in the target directory, so that
# repository's own CLAUDE.md and conventions apply. It must write its
# result to the result file (default: <brief-dir>/<brief-name>.result.md)
# and must not touch any SV management files.
set -euo pipefail

repo_dir="${1:?usage: launch-worker.sh <repo-dir> <brief-file> [result-file]}"
brief_file="${2:?usage: launch-worker.sh <repo-dir> <brief-file> [result-file]}"
result_file="${3:-${brief_file%.md}.result.md}"

[ -d "$repo_dir" ] || { echo "no such directory: $repo_dir" >&2; exit 1; }
[ -f "$brief_file" ] || { echo "no such brief: $brief_file" >&2; exit 1; }

prompt="$(cat "$brief_file")

---
Instructions from the supervisor:
- Work only within the scope in the brief above.
- When done, write a result file at: $result_file
  containing: summary of changes, tests run and their results,
  open questions, and anything you changed that the brief did not
  anticipate.
- Do not push, do not open pull requests, do not modify files outside
  this repository."

cd "$repo_dir"
claude -p "$prompt"
echo "worker finished; expect result at: $result_file"
