# Project registry (template)

Every repository the SV may reason about. The SV reads this at
session start. Keep it factual and org-readable.

| Project | Repository path | Purpose | Status | Notes |
|---|---|---|---|---|
| acme-web | ~/src/acme-web | Customer web app | active | Pilot project for SV delegation |
| acme-api | ~/src/acme-api | Backend API | paused | Resume after web pilot |

## Sensitivity flags

Mark any project that is *not* org-readable by default (unannounced,
NDA-bound, security-sensitive). For flagged projects the SV keeps only
the fact that work exists here; detail stays in that project's own
access-controlled space.
