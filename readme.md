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

`claude/` and `opencode/` are symlinked under `~/.config`; `copilot/` is symlinked to
`~/.copilot`. `opencode/opencode.json` spells its instruction paths as
`~/.config/opencode/prompts/*.md`, so moving `XDG_CONFIG_HOME` off `~/.config`
leaves those entries resolving to nothing, and OpenCode skips missing files
silently.

`agents/` holds prompts shared across agents. `commands/` has the workflow bodies
and `instructions/` has cross-cutting rules such as `voice.md` for tone. Linked once:

```sh
ln -sfn ~/dotfiles/agents ~/.config/agents
```

### Skills

One standard pack, not vendored: [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills).

```sh
npx skills add addyosmani/agent-skills -g -a opencode claude-code github-copilot -y
npx skills check
npx skills update
```

- Canonical store is `~/.agents/skills`, which OpenCode and Copilot CLI discover
  directly.
- Claude Code reads `~/.config/claude/skills`, so the CLI symlinks each installed
  skill into `claude/skills`. Those links are gitignored; only `commit` is local.
- `~/.agents/.skill-lock.json` records source and hash per skill.
- Copilot CLI turns `~/.copilot/skills/<name>/SKILL.md` into a slash command from
  its frontmatter. Claude imports shared prompts with `@`; Copilot must read them,
  since its `@` references cannot leave `~/.copilot`.

Each agent gets the same intent → skill map: `opencode/prompts/general.md`,
`claude/CLAUDE.md`, `copilot/copilot-instructions.md`.

### Commands

One body per workflow in `agents/commands/`: `build.md`, `commit.md`, `review.md`, `ship.md`.
Each agent wraps it with its own frontmatter, so the workflow text is not duplicated.

| Agent | Where | Shape |
| --- | --- | --- |
| OpenCode | `opencode.json` `commands` | `template: {file:../agents/commands/<name>.md}` plus description and model |
| Claude | `claude/commands/<name>.md` | frontmatter, body `@~/.config/agents/commands/<name>.md` |
| Copilot | `copilot/skills/<name>/SKILL.md` | `user-invocable: true`, body reads the shared file |

- `review` loads `code-review-and-quality` in the main session.
- `ship` fans out to review, security, and test subagents, then merges their reports plus a
  rollback plan.
- `commit` stays OpenCode-only; Claude and Copilot have a local `commit` skill.

OpenCode models: `build` and `commit` on `opencode-go/deepseek-v4.1-flash`, `review` and
`ship` on `opencode-go/deepseek-v4-pro`. Claude and Copilot commands inherit the session
model.

### Subagents

`opencode/prompts/` holds the persona adapters: `code-reviewer`,
`security-auditor`, `test-engineer`, `web-performance-auditor`. Each starts by
loading its skill, then reports. They are registered in `opencode.json` under
`agents` with `system: {file:...}` and `mode: subagent`.

Review, audit, and reasoning route to `opencode-go/deepseek-v4-pro`; mechanical
execution stays on `opencode-go/deepseek-v4.1-flash`.

