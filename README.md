# ralph-loop-template

A bootstrap for projects driven by the **Ralph Loop** methodology — a workflow that separates _spec_ (kept by the human and a conversational LLM) from _implementation_ (carried out by Ralph, an executor LLM running in a loop against a PRD).

This template is intentionally minimal. The artifacts it produces are markdown files, a single shell script, and an HTML report. There is no binary to install, no service to run, no abstraction to learn beyond reading the files it places.

## Usage

Clone or copy this template, then run the bootstrap from a normal shell — no AI involved at this step.

```sh
./init.sh ~/projects/my-new-thing        # Linux / macOS
.\init.ps1 $HOME\projects\my-new-thing   # Windows / PowerShell
```

Move into the new project and start your conversational AI agent (Claude Code, Codex, Cursor, Aider, etc.) from there:

```sh
cd ~/projects/my-new-thing
claude        # or your agent of choice
```

A useful first prompt is something like:

> _I just initialized a Ralph Loop project here. I want to build [a short description of what you have in mind]. Walk me through first-time setup._

The agent reads `AGENTS.md` / `CLAUDE.md` in the new project and walks you through replacing `{{PROJECT_NAME}}` placeholders and filling in the spec documents based on what you want to build. You start `./ralph.sh` (or `.\ralph.ps1`) yourself when the specs are in shape.

## What gets created

`init.sh` (or `init.ps1`) copies `_project/` into a destination directory and runs `git init`. The generated project contains:

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

`init.sh` and `init.ps1` also create a `CLAUDE.md` mirror of `AGENTS.md` so Claude Code picks up the same guidance. Re-copy `CLAUDE.md` from `AGENTS.md` whenever `AGENTS.md` changes.
