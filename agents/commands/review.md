Load the `code-review-and-quality` skill.

Review only — do not edit, stage, commit, or otherwise modify files. Report findings and let the user apply fixes.

Scope: `$ARGUMENTS`. If empty, review the staged and unstaged changes (`git diff HEAD`).

Cover all five axes:

1. **Correctness** — Matches the spec? Edge cases handled? Tests adequate?
2. **Readability** — Clear names? Straightforward logic? Well organized?
3. **Architecture** — Follows existing patterns? Clean boundaries? Right abstraction level?
4. **Security** — Input validated? Secrets safe? Auth checked? Load `security-and-hardening` for anything nontrivial.
5. **Performance** — Unbounded operations? N+1 queries? Load `performance-optimization` when relevant.

Label each finding Critical / Required / Optional / Nit and cite `file:line`.

Format: one line per finding — `location` — problem — fix. No preamble, no recap, no restating the diff. Group under the axis it belongs to, findings first, summary last only if asked.
