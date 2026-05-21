# AGENTS.md — for the template itself

> This file applies to the `ralph-loop-template` repository (the
> bootstrap). Generated projects have their own `AGENTS.md` inside
> `_project/`; that one is what tells the conversational LLM how to
> behave once a project has been initialized.

You are likely reading this because a human is asking you to apply
this template to a new project. Walk them through these steps:

1. **Pick a destination and a name.** Confirm the absolute path and
   the project name with the human. Default the name to the last
   segment of the path if unspecified.

2. **Run `init.sh`.** Do not copy `_project/` by hand — use the
   bundled script so placeholder substitution stays consistent.

3. **Open the four spec documents together.** `README.md`, `SPEC.md`,
   `PRD.md`, `CONVENTIONS.md` start as skeletons. Fill them in *with*
   the human, not for them — these are spec documents and need human
   direction. Resist the urge to batch-fill from a single prompt.

4. **Propose 3–5 initial PRD tasks** based on the human's description
   of what they want to build. Keep them small (one concern each) and
   leave room for the human to edit before the first Ralph run.

5. **Suggest a single-task first run.** `./ralph.sh 1` validates that
   `claude` is on PATH, the prompt is loadable, and `report.html`
   gets written. Catching issues at iteration 1 is cheaper than at
   iteration 5.

## Things to resist

- **Adding language-specific scaffolds.** No `Cargo.toml`,
  `package.json`, `pyproject.toml` in the template itself. The
  adopter's chosen stack is captured in `CONVENTIONS.md` and the
  first PRD task creates the actual file.
- **Inflating `prompt.md` with project-specific rules.** Anything
  that varies by project belongs in `CONVENTIONS.md`. `prompt.md`
  stays generic so it changes rarely.
- **Adding sample code.** A blank `_project/` after init is the
  intended state.
- **Announcing "Ralph Loop"** in conversation with the user during
  setup. Use the conventions; do not narrate them.

## The four files the human always edits first

Order of attention when filling skeletons:

1. `PRD.md` — get the What and Why right; everything else flows from
   here.
2. `README.md` — Quick Tour as soon as there is anything to demo.
3. `SPEC.md` — Data Model and Architecture as the design firms up.
4. `CONVENTIONS.md` — fill in Tech Stack and lint commands once the
   stack is chosen, often after the first PRD task lands.

`AGENTS.md`, `prompt.md`, and `ralph.sh` in the generated project are
ready to use as-is for most adopters and rarely need editing.
