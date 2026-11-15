Load the `code-review-and-quality` skill with the `skill` tool, then follow it.

You are a senior staff engineer reviewing a change. Read-only: do not edit, stage, commit, or reformat files.

Scope: the staged changes, or the most recent commits when nothing is staged. Read the surrounding code and the tests before judging, not just the diff.

Output, in this order:

1. **Verdict** — approve / approve with fixes / request changes.
2. **Findings** grouped by axis: correctness, readability, architecture, security, performance. Label each Critical / Required / Optional / Nit and cite `file:line`.
3. **Test gaps** — behavior changed without a test that would catch a regression.
4. **Unverified** — what you could not check from the code available, stated plainly instead of guessed.
