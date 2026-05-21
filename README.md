# ralph-loop-template

A bootstrap for projects driven by the **Ralph Loop** methodology — a
workflow that separates *spec* (kept by the human and a conversational
LLM) from *implementation* (carried out by Ralph, an executor LLM
running in a loop against a PRD).

This template is intentionally minimal. It is a starting layout, not a
framework. The artifacts it produces are markdown files, a single shell
script, and an HTML report. There is no binary to install, no service
to run, no abstraction to learn beyond reading the files it places.

## What gets created

`init.sh` copies `_project/` into a new directory, substitutes a few
placeholders, and runs `git init`. The generated project contains:

| File | Role |
| --- | --- |
| `README.md` | User-facing spec |
| `SPEC.md` | Developer-facing internal spec (data model, architecture) |
| `PRD.md` | Product requirements (What / Why) + Tasks ledger |
| `CONVENTIONS.md` | How code is written (test pattern, lint, commits) |
| `AGENTS.md` | Ralph Loop philosophy + first-time setup hints |
| `prompt.md` | Ralph's per-loop instructions |
| `ralph.sh` | Ralph's loop driver (claude CLI + size-based report rotation) |
| `.gitignore` | Standard ignores |

`report.html` (Ralph's human-facing execution notes) and the
`report-archive/` directory are created on the first run of `ralph.sh`.

## Usage

```sh
./init.sh <path> [<project-name>] [<short-description>]
```

Examples:

```sh
# Minimal — derives project name from the last path segment
./init.sh ~/projects/my-new-thing

# Full
./init.sh ~/projects/my-new-thing my-new-thing "A short description"
```

After init:

```sh
cd ~/projects/my-new-thing
# 1. Open README.md, SPEC.md, PRD.md, CONVENTIONS.md and fill in the
#    substantive parts together with your conversational LLM.
# 2. Add the first task to PRD.md.
# 3. Run: ./ralph.sh 5
```

## Philosophy in one sentence

> Spec by humans, plans by the conversational LLM, implementation by
> Ralph; everything load-bearing lives in plain text so the workflow
> survives forge / editor / model changes.

See `_project/AGENTS.md` for the four operating principles.

## Scope notes

Things the template intentionally does **not** include:

- A binary, daemon, or framework — `ralph.sh` is a 50-line bash script
  by design
- Language-specific scaffolds (Rust / Python / Node etc.) — the
  conversational LLM adds those per project via PRD
- Sample code — adopters write their own from `PRD.md` outward
- `progress.md` or `metrics.csv` — superseded by `report.html` (human)
  and Git history (machine)
- Pre-commit hooks or other mechanical PRD-edit guards — the
  AGENTS.md + prompt.md rules carry the discipline

The template is a starting point, not a destination. Adopters are
expected to edit anything that doesn't fit, including `ralph.sh` and
`prompt.md` themselves.
