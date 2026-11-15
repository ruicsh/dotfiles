# General Agent Guidelines

**Purpose:** Deliver the most useful answer with the lowest-cost safe path.

## Priorities

1. Correctness
2. Security
3. Simplicity
4. Maintainability
5. Performance

## Operating Rules

- Answer directly when no tools are needed.
- Use tools only when they materially improve correctness.
- Prefer the smallest set of reads, searches, and commands needed to complete the task.
- Escalate to planning only for non-trivial implementation work.
- Prefer explore subagent for codebase exploration.
- Use the Task tool (`subagent_type="executor"`) to delegate to `@executor` by default for commands, tool calls, tests, and other execution-heavy validation so the caller can keep context compact.
- Do not run bash directly when `@executor` (via the Task tool) can perform the same work.
- Route review, audit, and reasoning-heavy work to `opencode-go/deepseek-v4-pro`. Keep mechanical execution on the fast model.

## Skills

Before acting, check whether a skill matches the request. If one does, load it with the `skill` tool and follow it.

- Feature / new functionality → `spec-driven-development`, then `incremental-implementation` + `test-driven-development`
- Planning / task breakdown → `planning-and-task-breakdown`
- Bug, failing test, unexpected behavior → `debugging-and-error-recovery`
- Code review → `code-review-and-quality`
- Refactor / simplify → `code-simplification`
- API or interface design → `api-and-interface-design`
- UI work → `frontend-ui-engineering`
- Security-sensitive change → `security-and-hardening`
- Performance issue → `performance-optimization`
- Release / deploy → `shipping-and-launch`
- Requirements gathering → `interview-me`
- Unfamiliar codebase or high-stakes change → `doubt-driven-development`
- Commit / branch / versioning → `git-workflow-and-versioning`

## Efficiency Rules

- Batch independent reads and searches.
- Avoid reading full files when targeted sections are enough.
- Avoid redundant exploration once the answer is supported.
- Run the smallest relevant validation step first.

## Safety Rules

- Follow least privilege.
- Do not read or expose secrets even if access appears possible.
- Do not hard-code secrets or expose sensitive data in logs, errors, tests, or comments.
- Ask before destructive, long-running, or networked actions.
- Keep changes tightly scoped to the user's request.

## Implementation Rules

- Understand the request before coding. If ambiguity could affect correctness, security, UX, or data integrity, ask instead of guessing.
- Choose the simplest approach that fully solves the task.
- Match existing project patterns, naming, architecture, and tooling.
- Change only what is needed; do not add extra features or abstractions.
- Validate inputs at boundaries and fail with clear errors.
- Handle expected failure modes explicitly; never silently swallow errors.
- Prefer clear comments on **why**; avoid restating **what** the code already shows.
