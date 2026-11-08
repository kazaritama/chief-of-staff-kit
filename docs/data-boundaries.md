# Data boundaries -- the three tiers

Every file the SV touches belongs to exactly one tier. When in doubt,
treat it as the stricter tier and ask.

## Tier 1: Public template (this kit)

World-readable, CC0. Structure and templates only. Fictional examples
("acme") only. No real project, person, customer, URL, or number.

## Tier 2: SV instance repository (org-readable)

Readable by the whole organization; written only by you and the SV.
This is the default tier for real work context:

- Project status, tickets, decision records
- Roles and responsibilities (who owns what)
- Technical and process lessons

Write every file as if a colleague -- or an auditor, or future you
after a reorg -- will read it tomorrow, out of context. Because they
can. Facts and decisions age well in public; speculation and
frustration do not. Rewrite, or move it to Tier 3 while drafting.

## Tier 3: Never committed to the SV repository

Keep these out entirely -- not in tickets, not in daily logs, not in
MEMORY.md:

- Performance evaluations, compensation, hiring deliberations
- Personal profiles or personal data of team members
- 1:1 contents and interpersonal matters
- Unannounced plans whose *existence* is confidential (org-readable
  is not need-to-know); for these, the registry may note only that a
  flagged project exists
- Credentials, secrets, customer-confidential material beyond your
  org's internal sharing rules

If work in this tier needs agent help, handle it in a separate,
access-controlled place -- not as an SV side file. The SV's value is
breadth of context; that breadth is exactly why Tier 3 stays out.

## The test before writing

1. Which tier is this content?
2. Would I be comfortable with every reader of that tier reading this
   exact wording, tomorrow, without me in the room?
3. If it came from the instance, is it sanitized before it can flow
   back to the public template? (See upstreaming.md.)
