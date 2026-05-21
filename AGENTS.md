# AGENTS.md — for the template itself

> This file applies to the `ralph-loop-template` repository (the bootstrap). Generated projects have their own [`_project/AGENTS.md`](_project/AGENTS.md); that one is what tells the conversational LLM how to behave once a project has been initialized.

You are likely reading this because a human is asking you to apply this template to a new project. Walk them through these steps:

1. **Pick a destination.** Confirm the absolute path of the directory to create.

2. **Run `init.sh <path>`.** Do not copy `_project/` by hand — use the bundled script so the directory layout and `.gitignore` stay consistent.

3. **Replace `{{PROJECT_NAME}}` placeholders.** The skeletons leave `{{PROJECT_NAME}}` literal so it is visible where the project name is needed. Replace all occurrences across the generated files in one pass.

4. **Fill in the spec documents together.** `README.md`, `SPEC.md`, `PRD.md`, `CONVENTIONS.md` start as skeletons. Write the substantive sections _with_ the human, not for them — these are spec documents and need human direction. Resist the urge to batch-fill from a single prompt.

5. **Propose 3–5 initial PRD tasks** based on the human's description of what they want to build. Keep them small (one concern each) and leave room for the human to edit.

After that, hand off. The human chooses when to invoke `./ralph.sh` and how many iterations to run. Do not run it for them as part of setup.

## Things to resist

- **Adding language-specific scaffolds.** No `Cargo.toml`, `package.json`, `pyproject.toml` in the template itself. The adopter's chosen stack is captured in `CONVENTIONS.md` and the first PRD task creates the actual file.
- **Inflating `prompt.md` with project-specific rules.** Anything that varies by project belongs in `CONVENTIONS.md`. `prompt.md` stays generic so it changes rarely.
- **Adding sample code.** A blank `_project/` after init is the intended state.
- **Announcing "Ralph Loop"** in conversation with the user during setup. Use the conventions; do not narrate them.

## The four files the human always edits first

Order of attention when filling skeletons:

1. `PRD.md` — get the What and Why right; everything else flows from here.
2. `README.md` — Quick Tour as soon as there is anything to demo.
3. `SPEC.md` — Data Model and Architecture as the design firms up.
4. `CONVENTIONS.md` — fill in Tech Stack and lint commands once the stack is chosen, often after the first PRD task lands.

`AGENTS.md`, `prompt.md`, and `ralph.sh` in the generated project are ready to use as-is for most adopters and rarely need editing.
