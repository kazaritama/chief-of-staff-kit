# Chief of Staff (SV) Starter Kit for Claude Code

A persistent supervisor workspace for Claude Code: one long-lived
"chief of staff" agent that holds the context of your work as a whole,
and short-lived worker agents that do the actual implementation in
each repository.

The supervisor does not live in a process. It lives in these files.
Sessions restart; the workspace remains.

Inspired by the Chief of Staff Agents pattern discussed on rebuild.fm
(Muse / Claude Code episode) and by the Muse workspace layout:
a curated memory file, daily logs, a user profile, and a workspace
organized around projects rather than repositories.

## Template vs. instance -- the most important rule in this kit

- **This kit is a template.** It is public (CC0) and must never contain
  real project names, real people, internal URLs, or any work product.
- **Your SV repository is an instance.** Create it as a *separate*
  repository from this template (copy the files, `git init` there).
  Never develop your instance inside a clone of the public template:
  sooner or later you will push real context to the public remote.
- Improvements flow back upstream only after sanitization: generalize,
  replace real names with the fictional `acme` example used in this
  kit, and re-check with `scripts/check-before-commit.sh`.
  See `docs/upstreaming.md`.

## Quickstart

1. Copy this kit to your SV workspace location and init your instance:

   ```sh
   cp -r chief-of-staff-starter-kit ~/chief-of-staff
   cd ~/chief-of-staff
   rm -rf .git
   git init
   ```

2. Fill in `USER.md` (how you work, your decision criteria) and
   `projects/registry.md` (your repositories: path, purpose, status).
3. Adjust `.claude/settings.json` to your organization's rules.
4. Start Claude Code in this directory and say:
   "Read MEMORY.md and the STATUS of active projects, then brief me."
5. Run it for one project, for one week, before scaling up.

## Layout

```
CLAUDE.md            Supervisor constitution: role, delegation, bans
USER.md              About you: working style, preferences, criteria
MEMORY.md            Curated long-term memory (keep it short)
memory/              Daily logs, one file per day (raw layer)
projects/
  registry.md        All repositories at a glance
  <project>/
    STATUS.md        Current state, in-flight tickets, next actions
    tickets/         One file per ticket (the unit of delegation)
    decisions/       Decision records (ADR-style)
inbox/               Unsorted capture; the SV triages from here
private/             Local-only scratch. Git-ignored. Never committed.
.claude/
  commands/          /standup  /delegate  /wrap  /curate
  agents/            reviewer, researcher definitions
  settings.json      Permissions (deny first, then allow)
docs/                data-boundaries, operating-loop, upstreaming
scripts/             launch-worker.sh, check-before-commit.sh
```

## Operating principles

1. **State lives in files, not in the session.** Anything that matters
   is written to a ticket, a decision record, STATUS, or memory the
   same day it happens.
2. **The SV does not implement.** It writes briefs, launches workers
   in the target repository (a separate Claude Code process, so the
   repo's own CLAUDE.md applies), reviews results, and files outcomes.
3. **Single writer.** Only the SV writes STATUS.md, MEMORY.md, and
   decision records. Workers return result files; the SV files them.
4. **Delegation unit is a brief file, not a conversation.** Workers
   return a result file (summary, tests, open questions), not a
   transcript. The SV reads artifacts, not logs.
5. **Write for your reader tier.** Know, for every file, whether it is
   world-readable, org-readable, or never committed. See
   `docs/data-boundaries.md`.

## License

CC0 1.0 Universal. See `LICENSE`. The fictional company "acme" is used
for all examples.
