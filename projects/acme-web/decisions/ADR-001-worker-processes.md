---
id: ADR-001
title: Implementation workers run as separate Claude Code processes
status: accepted
date: 2026-01-05
supersedes:
superseded-by:
ticket: T-001
---

# ADR-001: Implementation workers run as separate processes (example)

## Context

The SV needs to delegate implementation without polluting its own
context with repository detail, and workers need the target repo's
own CLAUDE.md and conventions to apply.

## Decision

Implementation is delegated to a separate Claude Code process started
in the target repository, driven by a brief file, returning a result
file. Subagents are reserved for research and review inside the SV
session.

## Alternatives considered

- Subagents for everything: simpler, but the SV context fills with
  repo detail and long tasks cannot be supervised independently.
- One long-lived session per repo: state drifts and restarts lose the
  thread; files (tickets/results) are the durable layer instead.

## Consequences

- Briefs and result files become load-bearing; their templates are in
  tickets/TEMPLATE.md.
- Parallel work needs one git worktree per ticket.
