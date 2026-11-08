# Operating loop

## Daily

- **Start** (`/standup` or just ask): SV reads MEMORY, registry, and
  STATUS files, and briefs: in flight / waiting on you / waiting on
  others.
- **During**: all requests go to the SV first. It either answers from
  filed context, researches, drafts a ticket, or delegates.
- **End** (`/wrap`): decisions, ticket states, STATUS, and the daily
  log are filed. Open loops are listed explicitly.

## Per ticket

1. Ticket filed with acceptance criteria and scope (TEMPLATE.md).
2. `/delegate`: brief written, shown to you, worker launched as a
   separate process in the repo (own worktree if parallel).
3. Worker returns a result file: summary, tests, open questions.
4. Reviewer agent checks result + diff against acceptance criteria.
5. SV files the outcome into the ticket, updates STATUS, and logs it.
   Follow-ups become new proposed tickets, not silent scope growth.

## Weekly

- `/curate`: promote durable facts from daily logs to MEMORY.md;
  demote stale ones. MEMORY stays an index, not an archive.
- Review dropped/stale tickets and the registry's accuracy.

## Restarts are normal

End sessions freely. A new session that has read CLAUDE.md, MEMORY.md,
the registry, and the relevant STATUS files *is* the same SV. If a
restarted SV cannot reconstruct the state, the filing -- not the
session -- is what needs fixing.
