Load the `shipping-and-launch` skill.

`ship` is a fan-out orchestrator: it runs three specialist reviews against the current change in parallel, then
merges their reports into one go/no-go decision with a rollback plan. Scope: `$ARGUMENTS`; if empty, use the staged
changes or the most recent commits.

## Phase A — parallel fan-out

Issue all three subagent calls in a single assistant turn so they execute in parallel. Sequential calls defeat the
purpose of this command.

Use named subagents when the harness provides them — `code-reviewer`, `security-auditor`, `test-engineer`.
Otherwise spawn general-purpose subagents and give each the matching instruction:

1. **Review** — load `code-review-and-quality`; five-axis review (correctness, readability, architecture, security,
   performance). Standard review template.
2. **Security** — load `security-and-hardening`; vulnerability and threat-model pass: OWASP Top 10, secrets
   handling, auth/authz, dependency CVEs. Standard audit report.
3. **Tests** — load `test-driven-development`; coverage analysis: happy path, edge cases, error paths, concurrency.
   Standard coverage analysis.

Subagents cannot spawn subagents, and each returns only its report to this session. If the harness cannot spawn
subagents at all, run the three reviews sequentially and say so in the output.

## Phase B — merge in this session

1. **Code quality** — aggregate Critical/Required findings, resolve duplicates between reviewers.
2. **Security** — promote any Critical/High findings to launch blockers; cross-check the review's security axis.
3. **Performance** — pull the review's performance axis; cross-check Core Web Vitals where applicable.
4. **Accessibility** — keyboard navigation, screen reader support, contrast. Verify directly.
5. **Infrastructure** — env vars, migrations, monitoring, feature flags. Verify directly.
6. **Documentation** — README, ADRs, changelog. Verify directly.

## Phase C — decision and rollback

Produce a single output:

```markdown
## Ship Decision: GO | NO-GO

### Blockers (must fix before ship)
- [source: Critical finding + file:line]

### Recommended fixes (should fix before ship)
- [source: Important finding + file:line]

### Acknowledged risks (shipping anyway)
- [risk + mitigation]

### Rollback plan
- Trigger conditions: [signals that would prompt rollback]
- Procedure: [exact steps]
- Recovery time objective: [target]

### Specialist reports (full)
- [review]
- [security]
- [tests]
```

## Rules

1. Phase A runs in parallel where the harness allows — never a subagent calling another subagent.
2. The merge happens here.
3. A rollback plan is mandatory before any GO decision.
4. Any Critical finding defaults to NO-GO unless the user explicitly accepts the risk.
5. Skip the fan-out only when the change touches 2 files or fewer, the diff is under 50 lines, and it touches no
   auth, payments, data access, or config/env. Otherwise default to fan-out.
