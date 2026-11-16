# ~/.dotfiles

Neovim config is on a separate [repo](https://github.com/ruicsh/nvim-config).

## CLI (terminal)

- [atuin](https://github.com/atuinsh/atuin) Shell history
- [bat](https://github.com/sharkdp/bat) Alternative to `cat`
- [carapace](https://github.com/carapace-sh/carapace-bin) Command completion
- [claude-code](https://claude.com/product/claude-code) AI coding agent
- [fd](https://github.com/sharkdp/fd) Alternative to `find`
- [fzf](https://github.com/junegunn/fzf) Fuzzy finder
- [jq](https://github.com/jqlang/jq) JSON processor
- [lsd](https://github.com/lsd-rs/lsd) Alternative to `ls`
- [neovim](https://github.com/neovim/neovim) Code editor
- [opencode](https://github.com/sst/opencode) AI coding agent
- [ripgrep](https://github.com/BurntSushi/ripgrep) Alternative to `grep`
- [starship](https://github.com/starship/starship) Prompt
- [tmux](https://github.com/tmux/tmux) Multiplexer
- [vim](https://github.com/vim/vim) Text editor
- [yazi](https://github.com/sxyazi/yazi) File manager
- [zoxide](https://github.com/ajeetdsouza/zoxide) Alternative to `cd`
- [zsh](https://www.zsh.org/) Shell

## Cross-platform (macOS/Windows)

- [git](https://github.com/git/git) Version control
- [vimium](https://github.com/philc/vimium) Browser vim keybinds

## macOS

- [ghostty](https://github.com/ghostty-org/ghostty) Terminal
- [hammerspoon](https://github.com/Hammerspoon/hammerspoon) OS automation

## Windows

- [AutoHotkey](https://github.com/AutoHotkey/AutoHotkey) OS automation
- [MinGW-W64](https://github.com/niXman/mingw-builds-binaries) Build tools
- [PowerShell](https://github.com/PowerShell/PowerShell) Shell
- [PowerToys](https://github.com/microsoft/PowerToys) OS customization
- [Windows Terminal](https://github.com/microsoft/terminal) Terminal

### Package management

Two manifests, for two environments:

- `winget/packages.json` — winget export; covers GUI and Store apps. Restore with `winget import -i winget/packages.json`.
- `scoop/packages.txt` — Scoop package list for machines where winget is blocked. Covers the CLI tools plus extras like AutoHotkey and PowerToys.

```powershell
scoop bucket add extras
Get-Content .\scoop\packages.txt |
  Where-Object { $_ -and $_ -notmatch '^\s*#' } |
  ForEach-Object { scoop install $_ }
```

## PowerShell (Windows)

### Installation

Symlink the profile entry point. PowerShell 7 reads `$PROFILE` from `Documents\PowerShell`;

```powershell
New-Item -ItemType Directory -Force "$HOME\Documents\PowerShell" | Out-Null
New-Item -ItemType HardLink `
  -Path "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" `
  -Target "$HOME\dotfiles\powershell\Microsoft.PowerShell_profile.ps1"
```

Symlink the directory with the modules:

```powershell
New-Item -ItemType Junction `
  -Path "$HOME\.config\powershell" `
  -Target "$HOME\dotfiles\powershell"
```

## Agent config

`claude/`, `opencode/`, and `copilot/` are symlinked under `~/.config`, with
`COPILOT_HOME` set to `$XDG_CONFIG_HOME/copilot` in `zsh/env.zsh`. `opencode/opencode.json`
spells its instruction paths as `~/.config/opencode/prompts/*.md`, so moving
`XDG_CONFIG_HOME` off `~/.config` leaves those entries resolving to nothing, and
OpenCode skips missing files silently.

`agents/` holds prompts shared across agents. The skills CLI also writes its store here,
so one symlink covers both:

```sh
ln -sfn ~/dotfiles/agents ~/.agents
```

`agents/skills/` is gitignored; `agents/.skill-lock.json` is tracked.
`~/.config/agents` does not exist. Callers reference `~/.agents/...` directly.

### Skills

Two packs, not vendored: [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)
for generic workflows, and [ruicsh/skills](https://github.com/ruicsh/skills) for the
skill router plus the `build`, `commit`, `plan`, and `review` workflows this repo drives.

```sh
npx skills add addyosmani/agent-skills -g -a opencode claude-code github-copilot -y
npx skills add ruicsh/skills -g -a opencode claude-code github-copilot -y
npx skills check
npx skills update
```

- Canonical store is `~/.agents/skills`, which OpenCode discovers directly.
- Claude Code reads `~/.config/claude/skills`; Copilot CLI reads
  `~/.config/copilot/skills` and, with `COPILOT_HOME` set, does not fall back to
  `~/.agents/skills`. Both get symlinks into the store. CLI-made links are gitignored;
  `build`, `commit`, `plan`, and `review` are tracked in both, so a fresh checkout has
  `/build`, `/commit`, `/plan`, and `/review` without a CLI run.
- `build`, `commit`, `plan`, and `review` are owned by `ruicsh/skills`. Edit them there, then
  `npx skills update`. OpenCode needs a command wrapper because it has no skill-to-slash
  mapping; Claude and Copilot map the skill directory name to the slash command themselves.
- `~/.agents/.skill-lock.json` records source and hash per skill. It is tracked, so
  the installed list survives a fresh machine.
- Copilot CLI turns `~/.config/copilot/skills/<name>/SKILL.md` into a slash command from
  its frontmatter. Claude imports shared prompts with `@`. Copilot resolves `@` in
  `.github/copilot-instructions.md` and `AGENTS.md`, but **not** in the home-level
  `copilot-instructions.md` — it injects those lines literally. So Copilot takes shared
  rules as `*.instructions.md` files instead, symlinked into `copilot/instructions/`.

New machine, after linking the repo:

```sh
ln -sfn ~/dotfiles/agents ~/.agents   # must exist before the CLI runs
npx skills update -g -y               # reinstalls every locked skill missing on disk
npx skills list -g                    # verify: all entries "tracked"
```

`update -g` is the restore path. There is no `skills install -g` yet; the project
lock uses `npx skills experimental_install` instead. Remove a stray real
`~/.agents` dir first, or `ln` nests the link inside it.

Shared rules live once, in the installed skills. The intent → skill router and the
tone and minimal-change rules are read straight from `~/.agents/skills/`, so nothing
is copied into this repo. Harnesses consume each file their own way:

| File | OpenCode | Claude | Copilot |
| --- | --- | --- | --- |
| `skills/skill-router/SKILL.md` | `instructions` array | `@~/.agents/...` | symlink to `*.instructions.md` |
| `skills/terse-voice/SKILL.md` | `instructions` array | `@~/.agents/...` | symlink to `*.instructions.md` |
| `skills/minimal-change/SKILL.md` | `instructions` array | `@~/.agents/...` | symlink to `*.instructions.md` |

Copilot gets `skill-router.instructions.md`, `terse-voice.instructions.md`, and
`minimal-change.instructions.md` in `copilot/instructions/` as symlinks; each points
straight at the installed skill, so each rule keeps one source. Copilot reads through the symlinks —
verified via `copilot instruction list` and the `<custom_instruction>` block in the
session log.

`skill-router`, `terse-voice`, and `minimal-change` come from
[`ruicsh/skills`](https://github.com/ruicsh/skills). The skill frontmatter is injected
with the rules; harmless. Edit them in that repo, then `npx skills update`.

### Commands

`build`, `commit`, `plan`, `review`, and `ship` all ship as skills from
[`ruicsh/skills`](https://github.com/ruicsh/skills), so every agent reads one copy. There are
no command bodies in this repo. Claude and Copilot turn each installed skill into `/build`,
`/commit`, `/plan`, `/review`, and `/ship` from its frontmatter. OpenCode has no
skill-to-slash mapping, so `opencode.json` maps them:

```jsonc
"commit": { "template": "@commit" },
"plan": { "template": "@plan" },
"ship": { "template": "Load the `ship` skill. `$ARGUMENTS` is the scope; ..." },
"build": { "template": "Load the `build` skill. `$ARGUMENTS` picks the mode: ..." }
```

`@<skill-id>` loads an OpenCode skill explicitly instead of hoping the model picks it.
`build` and `ship` need the longer wrapper because `$ARGUMENTS` must reach the skill, and a
bare `@<skill-id>` cannot carry it.

| Agent | Where | Shape |
| --- | --- | --- |
| OpenCode | `opencode.json` `commands` | `@<skill>` for `commit`/`plan`/`review`, inline wrapper for `build`/`ship` |
| Claude | `claude/commands/<name>.md` | none — all five come from `~/.agents/skills/<name>` |
| Copilot | `copilot/skills/<name>` | symlink to `~/.agents/skills/<name>` |

- `review` loads `code-review-and-quality` in the main session.
- `ship` fans out to review, security, and test subagents, then merges their reports plus a
  rollback plan.
- `commit` stays OpenCode-only as a command; the skill itself auto-invokes everywhere
  else when the user asks to commit.
- `plan` writes `tasks/plan.md` from a spec and defers the decomposition method to
  `planning-and-task-breakdown`. It never implements; `build` consumes its output.

OpenCode models: `build` and `commit` on `opencode-go/deepseek-v4.1-flash`, `plan`,
`review`, and `ship` on `opencode-go/deepseek-v4-pro`. Claude and Copilot use the session
model.

### Subagents

`opencode/prompts/` holds the persona adapters: `code-reviewer`,
`security-auditor`, `test-engineer`, `web-performance-auditor`. Each starts by
loading its skill, then reports. They are registered in `opencode.json` under
`agents` with `system: {file:...}` and `mode: subagent`.

Review, audit, and reasoning route to `opencode-go/deepseek-v4-pro`; mechanical
execution stays on `opencode-go/deepseek-v4.1-flash`.

