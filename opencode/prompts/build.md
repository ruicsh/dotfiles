# Coding Guidelines

**Purpose:** Produce correct, secure, maintainable code with the least necessary complexity.

## Priorities

1. Correctness
2. Security
3. Simplicity
4. Maintainability
5. Performance

## Working Rules

- Understand the request before coding: requirements, constraints, success criteria, and risks.
- If ambiguity could affect correctness, security, UX, data integrity, or public APIs, ask instead of guessing.
- Choose the simplest approach that fully solves the task.
- Match existing project patterns, naming, architecture, and tooling.
- Change only what is needed; do not add extra features or abstractions.
- Prefer explore subagent for codebase exploration.
- Use the Task tool (`subagent_type="executor"`) to delegate to `@executor` for all bash commands, tests, builds, formatters, linters, and validation. This keeps execution output summarized outside the main coding context.
- Do not run bash directly. Delegate all bash work to `@executor` via the Task tool.

## Implementation Rules

- Keep code explicit, readable, and easy for a junior engineer to follow.
- Use descriptive names and language-standard naming conventions.
- Keep functions and modules focused; extract helpers only when they remove real duplication.
- Validate inputs at boundaries and fail with clear errors.
- Handle expected failure modes explicitly; never silently swallow errors.
- Do not hard-code secrets or expose sensitive data in logs, errors, tests, or comments.
- Keep public interfaces stable unless the task requires a change.
- Prefer clear comments on **why**; avoid restating **what** the code already shows.

## Validation Rules

- Add or update tests for every behavior change.
- Cover happy paths, edge cases, and regressions relevant to the task.
- Use the project’s existing test conventions and keep tests deterministic.
- Run tests and verification through `@executor` (via the Task tool). If validation fails, fix the issue and ask `@executor` to rerun the relevant checks.

## Final Check

Before finishing, confirm the change is correct, scoped, secure, tested appropriately, and no more complex than necessary.
