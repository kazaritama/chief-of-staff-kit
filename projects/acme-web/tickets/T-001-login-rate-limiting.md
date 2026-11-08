---
id: T-001
title: Add rate limiting to the login endpoint
status: in-review
project: acme-web
repo: ~/src/acme-web
branch: t-001-login-rate-limit
worktree: ~/src/acme-web-t001
created: 2026-01-05
---

# T-001: Add rate limiting to the login endpoint (example)

## Why

Repeated credential-stuffing attempts against /login in December.
Decision context: projects/acme-web/decisions/ADR-001.md is unrelated;
this follows the security review of 2026-01-03 (org-internal doc).

## Acceptance criteria

- [ ] POST /login is limited per account and per IP
- [ ] Limits and window are configuration, not constants
- [ ] Exceeding the limit returns 429 with Retry-After
- [ ] Existing login tests pass; new tests cover limit and reset

## Scope

- In: /login only, config, tests
- Out: other endpoints, CAPTCHA, account lockout policy

## Brief for the worker

Read the repo CLAUDE.md first. Use the existing middleware pattern in
src/middleware/. Do not add new dependencies. Run `npm test` and
report the full result in your result file.

## Result (filled by the SV from the worker's result file)

- Summary: middleware added, limits in config, 429 + Retry-After done
- Tests: npm test -- 142 passed, 3 new
- Open questions: none
- Follow-ups filed: T-002 (apply the same pattern to /signup) proposed
