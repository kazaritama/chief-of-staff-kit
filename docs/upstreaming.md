# Flowing improvements back to the public template

Your instance will teach you things the template should know. Before
anything moves from the instance (Tier 2) to the public kit (Tier 1):

1. **Generalize.** The lesson must be about the structure or the
   workflow, not about your project.
2. **Sanitize.** Replace real project names, people, customers, URLs,
   and numbers with the fictional `acme` example or placeholders.
3. **Re-check.** Run `scripts/check-before-commit.sh` in the template
   clone, and read the diff yourself line by line. Automated scans
   miss context; your eyes are the control.
4. **Separate commits, separate clones.** Never work on the instance
   inside the template clone, and never push from an instance clone to
   the template remote. The accident this prevents is the classic one:
   real context published because the wrong directory felt familiar.

If a lesson cannot survive sanitization, it belongs in your instance
only. That is fine -- most lessons are local.
