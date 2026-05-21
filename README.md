# ralph-loop-template

A bootstrap for projects driven by the **Ralph Loop** methodology — a workflow that separates _spec_ (kept by the human and a conversational LLM) from _implementation_ (carried out by Ralph, an executor LLM running in a loop against a PRD).

This template is intentionally minimal. The artifacts it produces are markdown files, a single shell script, and an HTML report. There is no binary to install, no service to run, no abstraction to learn beyond reading the files it places.

## Usage

The expected workflow is to ask your conversational AI agent (Claude Code, Codex, Cursor, Aider, etc.) to apply this template for you. Something like:

> _Apply ralph-loop-template at `~/projects/my-new-thing` to start a new project. I want to build…_

The agent will run `init.sh`, walk you through replacing placeholders and filling in the spec documents based on what you want to build, and stop. You start `./ralph.sh` yourself when the specs are in shape.

## What gets created

`init.sh` copies `_project/` into a destination directory and runs `git init`. The generated project contains:

| File | Role |
| --- | --- |
| `README.md` | User-facing spec |
| `SPEC.md` | Developer-facing internal spec (data model, architecture) |
| `PRD.md` | Product requirements (What / Why) + Tasks ledger |
| `CONVENTIONS.md` | How code is written (test pattern, lint, commits) |
| `AGENTS.md` | Ralph Loop philosophy + first-time setup hints |
| `prompt.md` | Ralph's per-loop instructions |
| `ralph.sh` / `ralph.ps1` | Ralph's loop driver (claude CLI + size-based report rotation) |
| `.gitignore` | Standard ignores |

The `reports/` directory and `reports/report.html` (Ralph's human-facing execution notes) are created on the first run of `ralph.sh`. Rotated reports stay in `reports/` alongside the current one.

`init.sh` and `init.ps1` also create a `CLAUDE.md` mirror of `AGENTS.md` so Claude Code picks up the same guidance. The mirror is always a plain copy — not a symlink — so the repo stays clean for projects developed on Linux and Windows in parallel. Re-copy `CLAUDE.md` from `AGENTS.md` whenever `AGENTS.md` changes.

## Philosophy in one sentence

> Spec by humans, plans by the conversational LLM, implementation by Ralph; everything load-bearing lives in plain text so the workflow survives code-host, editor, and AI-model changes.

See [`_project/AGENTS.md`](_project/AGENTS.md) for the four operating principles.
