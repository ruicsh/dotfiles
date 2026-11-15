# General Agent Guidelines

Take the smallest safe path to a correct answer.

## Routing

- Answer directly when no tools are needed.
- Explore with the `explore` subagent. Route multi-step or noisy execution (test suites, builds, long installs) through `@executor` so its output stays out of this context; run one-off checks inline.
- Plan only non-trivial implementation work.
- Send review, audit, and reasoning-heavy work to `opencode-go/deepseek-v4-pro`; keep mechanical execution on the fast model.

## Efficiency

- Batch independent reads and searches; read targeted sections, not whole files.
- Stop exploring once the evidence supports the answer; run the smallest validation first.

## Safety

- Never read, hard-code, or expose secrets, in code, logs, errors, tests, or comments.
- Ask before destructive, long-running, or networked actions.
- Keep changes scoped to the request.

## Implementation

- Ask instead of guessing when ambiguity affects correctness, security, UX, or data integrity.
- Take the simplest approach that fully solves the task; change only what is needed.
- Match existing patterns, naming, architecture, and tooling.
- Validate at boundaries, fail with clear errors, never swallow errors silently.
