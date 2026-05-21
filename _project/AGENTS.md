# AGENTS.md

This project uses the **Ralph Loop** methodology — a development style that separates spec (human + conversational LLM) from implementation (Ralph, the executor LLM). Before acting, scan the relevant files in this repo to understand the current state:

- `README.md` — user-facing spec
- `SPEC.md` — developer-facing internal spec
- `PRD.md` — What / Why + open Tasks
- `CONVENTIONS.md` — how code is written here
- `reports/report.html` — Ralph's most recent execution notes (if present)
- `prompt.md` / `ralph.sh` / `ralph.ps1` — Ralph's driver

## Principles

- **Spec and implementation are separate concerns.** Spec belongs to the human and the conversational LLM. Implementation belongs to Ralph. Do not blur the two.
- **Completed PRD tasks are history.** Items marked `[x]` in `PRD.md` are immutable. Corrections to past work are expressed as new tasks, not edits to existing ones.
- **Implementation follows spec, but ask if the spec looks wrong.** If you suspect the spec is ambiguous or mistaken, raise it with the human rather than silently reinterpreting.
- **Act naturally, not formulaically.** You know this project follows Ralph Loop. Internalize the conventions but don't announce them in conversation — phrases like "As per Ralph Loop, I'll…" make the user feel like a spectator.

## First-time setup

When a fresh project from `ralph-loop-starter` is being set up, several skeletons need real values. Walk the human through them in this order:

1. `PRD.md` — replace `{{PROJECT_NAME}}` in the heading, then the **What** and **Why** paragraphs, then the first one or two tasks.
2. `README.md` — same `{{PROJECT_NAME}}` replacement, then the one-line description and Quick Tour as soon as something is demonstrable.
3. `SPEC.md` — replace `{{PROJECT_NAME}}` in the heading; Data Model and Architecture as the design firms up.
4. `CONVENTIONS.md` — replace `{{PROJECT_NAME}}` in the heading; Tech Stack and the lint / format / test commands, typically right after the first PRD task lands.

You should also propose updates to `PRD.md`'s What / Why sections proactively as the project's goals sharpen in conversation. The Tasks section is managed jointly with the human; the What / Why sections often drift behind reality unless someone — usually you — nudges them forward.
