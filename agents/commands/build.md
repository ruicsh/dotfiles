Load the `incremental-implementation` skill alongside `test-driven-development`.

## Modes

- **`build`** — implement the next pending task, then stop.
- **`build auto`** — create the plan if needed, take one approval, then implement every task without stopping between them.

`$ARGUMENTS` selects the mode. `auto` (or `all`) is autonomous; anything else, including empty, is single-task.
Autonomous mode is not faster per task — it runs the same test-driven loop. It only removes the human stepping
between tasks.

## Default: one task

Take the next pending task from the plan, then:

1. Read its acceptance criteria.
2. Load relevant context: existing code, patterns, types.
3. RED — write a failing test for the expected behavior.
4. GREEN — implement the minimum code that passes it.
5. Run the full test suite for regressions.
6. Run the build to verify compilation.
7. Commit with a descriptive message.
8. Mark the task complete and stop.

## Autonomous: the whole plan

Every task still earns a passing test and its own commit. Verification never gets dropped.

1. **Require a spec.** Accept only `SPEC.md`, a root-level `SPEC-<change>.md`, `docs/SPEC.md`, or a file under
   `spec/`. A README does not count. If none exists, stop and ask the user to load the `spec-driven-development`
   skill first — do not invent requirements.
2. **Establish a clean baseline.** Run `git status --porcelain`. If uncommitted changes exist outside planning
   artifacts (`SPEC*.md`, `docs/SPEC.md`, `spec/*`, `tasks/plan.md`), stop and ask the user how to handle them.
3. **Plan if needed.** If `tasks/plan.md` is missing, load `planning-and-task-breakdown` to generate it and record
   `Source spec: <path>` at the top. Reuse an existing plan only when that line matches the selected spec;
   otherwise ask before replacing it.
4. **Single checkpoint.** Present the plan and wait for an unambiguous affirmative. Hedge answers are not approval.
   Commit a generated `tasks/plan.md` separately, before execution starts.
5. **Execute in dependency order.** Run the full loop for each task. Stage only the files that task touched plus
   its status update — never `git add -A`. One commit per task, so any point is a clean rollback.
6. **Stop and ask** instead of pushing through when:
   - a test cannot be made to pass, or the build breaks without an obvious fix → load `debugging-and-error-recovery`
   - the spec is ambiguous, or the task needs a decision the spec does not cover
   - the task is high-risk or irreversible (auth, permissions, payments, destructive migrations, deploys, secrets,
     anything `git revert` cannot undo) → load `doubt-driven-development` and get explicit sign-off

   Resume with `build auto` after the blocker is resolved.
7. **Summarize:** tasks completed, tests added, commits made, anything skipped or flagged.
