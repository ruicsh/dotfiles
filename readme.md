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

`claude/`, `copilot/`, and `opencode/` are symlinked into `~/.config`.
`opencode/opencode.json` spells its instruction paths as
`~/.config/opencode/prompts/*.md`, so moving `XDG_CONFIG_HOME` off `~/.config`
leaves those entries resolving to nothing, and OpenCode skips missing files
silently.

`agent-prompts/` holds instructions shared across agents: `voice.md` for tone,
`commit.md` and `review.md` for those workflows. Linked once:

```sh
ln -sfn ~/dotfiles/agent-prompts ~/.config/agent-prompts
```

OpenCode loads `voice.md` through its `instructions` array, and the other two
through command templates:

```json
"instructions": [
  "~/.config/opencode/prompts/general.md",
  "~/.config/agent-prompts/voice.md"
],
"commands": {
  "commit": { "template": "{file:../agent-prompts/commit.md}" },
  "review": { "template": "{file:../agent-prompts/review.md}" }
}
```

Command templates carry no frontmatter. `opencode.json` holds the description
and model, which are OpenCode-only.

Copilot CLI has no prompt-file commands. It turns `~/.copilot/skills/<name>/SKILL.md`
into a slash command from that file's frontmatter, so each skill points at the
shared prompt instead of copying it:

```md
---
name: commit
user-invocable: true
disable-model-invocation: true
---

Read `~/.config/agent-prompts/commit.md` and follow it exactly.
```

`commit` and `review` work this way. The body stays one line; the prompt lives in
`agent-prompts/`.

Claude Code uses skills too — commands were merged into them. Same pointer shape,
different frontmatter, and each skill needs a link into `~/.claude/skills`:

```sh
ln -sfn ~/dotfiles/claude/skills/commit ~/.claude/skills/commit
ln -sfn ~/dotfiles/claude/skills/review ~/.claude/skills/review
```

```md
---
name: commit
disable-model-invocation: true
---

@~/.config/agent-prompts/commit.md
```

Claude imports the file inline, so no read round-trip. Copilot cannot: its `@`
references must stay inside `~/.copilot`, so it keeps the read pointer.

Pass `instructions` an absolute or `~` path. It resolves relative entries
against the current directory, not the config dir, so `../agent-prompts/...`
silently loads nothing. `{file:}` does resolve against the config dir, which is
why the template uses a relative path.

Other agents take a single instructions file. Paste `voice.md`, or reference
`~/.config/agent-prompts/voice.md`, into `~/.claude/CLAUDE.md` or
`$HOME/.copilot/copilot-instructions.md`.
