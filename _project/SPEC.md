# {{PROJECT_NAME}} — Developer Spec

This document captures the project's _internal_ spec — the things a developer (or an AI agent implementing a task) needs to know but a user does not. End users read `README.md` instead; product intent and the tasks ledger live in `PRD.md`; coding style lives in `CONVENTIONS.md`.

## Data Model

> _Internal data structures, file formats, on-disk representation, serialization conventions. The detail level should be enough that someone implementing a feature can derive correct types and invariants without guessing._

## Architecture

> _High-level component layout: which modules exist, what they own, how data flows between them. A diagram in ASCII or Mermaid is fine if helpful._

## Internal APIs

> _Function signatures, trait or interface boundaries, and contracts that matter for cross-module consistency. Update as boundaries stabilize; do not pre-document churn._

## Constraints and invariants

> _Cross-cutting properties that must hold (e.g., "all paths are absolute", "state.yml is gitignored", "every command supports --json")._
