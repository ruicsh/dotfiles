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
- [mise](https://github.com/jdx/mise) dev tools, env vars, task runner
- [neovim](https://github.com/neovim/neovim) Code editor
- [opencode](https://github.com/sst/opencode) AI coding agent
- [ouch](https://github.com/ouch-org/ouch) Archive manipulation
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
