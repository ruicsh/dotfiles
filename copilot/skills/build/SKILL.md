---
name: build
description: Implement tasks incrementally — build, test, verify, commit. Add "auto" to run the whole plan in one approved pass.
user-invocable: true
---

Read `~/.config/agents/commands/build.md` and follow it exactly.

Text after the command name is the argument. `auto` (or `all`) runs the whole plan in one approved pass; empty or
anything else implements the next pending task only.
