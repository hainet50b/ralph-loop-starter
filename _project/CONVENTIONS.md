# {{PROJECT_NAME}} — Conventions

How code is written in this project. Read before implementing.

## Tech Stack

> _Languages, runtimes, key libraries with one-line rationale for
> each. The first PRD task usually establishes this; until then,
> leave a placeholder line so it is visibly empty._

## Test Pattern

Unit tests follow the **3A pattern**:

- **Arrange** — set up the preconditions
- **Act** — explicitly invoke the function or method under test
- **Assert** — verify the outcomes

Fixtures handle Arrange only. The Act call must be visible in the
test body, not hidden inside a fixture helper.

## Lint / Format / Test Commands

The commands below must pass before a task is marked complete in
`PRD.md`. Replace the placeholder with the actual commands once the
stack is chosen.

```sh
# placeholder — replace with the real commands for this project
# e.g. cargo fmt --check && cargo clippy -- -D warnings && cargo test
true
```

## Commit Messages

Subject line: present-imperative, ≤ 72 characters. Body optional and
free-form. The implementation LLM has discretion on wording — no
template, no enforced prefixes.

## File and Identifier Naming

> _Naming rules that matter for consistency (e.g., snake_case for
> Rust modules, PascalCase for types, kebab-case for CLI subcommand
> names). Add as conventions emerge._
