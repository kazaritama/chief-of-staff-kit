Delegate ticket $ARGUMENTS to a worker.

1. Read the ticket. If acceptance criteria or scope are missing or
   vague, stop and ask me to fix the ticket first -- do not brief a
   worker on a vague ticket.
2. Make sure a git worktree exists for the ticket's branch
   (one worktree per ticket), and record it in the ticket frontmatter.
3. Write the brief from the ticket (why, acceptance criteria, scope,
   repo conventions to follow, tests to run, result-file format).
4. Show me the brief and the exact launch command. Wait for my
   approval before launching.
5. Launch: scripts/launch-worker.sh <repo-or-worktree> <brief-file>
6. Set the ticket status to `delegated` and note it in today's log.
