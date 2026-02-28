# AGENTS.md

## Repository Overview

Personal dotfiles repository for CLI tools, editors, and OS automation. Configs are
organized by tool name (one directory per tool). The main Neovim config lives in a
separate repo; this repo contains the VSCode-Neovim bridge config (`nvim-vscode/`).

Cross-platform: macOS (primary), Linux/WSL, and Windows.

## Directory Structure

```
.scripts/       # Standalone utility scripts (Nushell, Bash)
atuin/          # Shell history config
bat/            # cat alternative config
carapace/       # Shell completions
fd/             # find alternative config
fzf/            # Fuzzy finder config
ghostty/        # Terminal emulator config (macOS)
git/            # Git config and aliases
hammerspoon/    # macOS window management and app launcher (Lua)
lsd/            # ls alternative config
mise/           # Dev tool version manager (installs all CLI tools)
nushell/        # Primary shell config (Nushell)
nvim-vscode/    # Neovim config for VSCode integration (Lua, lazy.nvim)
opencode/       # AI coding agent config
ripgrep/        # grep alternative config
starship/       # Prompt config (TOML)
tmux/           # Terminal multiplexer config
vim/            # Vim/Neovim minimal config (Vimscript)
vscode/         # VSCode settings
yazi/           # File manager config
zsh/            # Zsh shell config (bootstraps into tmux + nushell)
```

## Build / Lint / Test Commands

This is a dotfiles repo -- there is no build system, test suite, or CI pipeline for
the configs themselves. The only CI workflow is `.github/workflows/backup.yml` which
mirrors the repo to Bitbucket on push.

### Lua Formatting

Lua files use `stylua` (installed via mise). Format with:

```sh
stylua <file>              # Format a single file
stylua hammerspoon/ nvim-vscode/   # Format all Lua dirs
```

### Tool Installation

All CLI tools are managed via [mise](https://mise.jdx.dev). See `mise/mise.toml`
for the full tool list. Install everything with:

```sh
mise install
```

### Validating Configs

- **Nushell**: Open `nu` -- syntax errors surface immediately on startup.
- **Neovim (VSCode)**: Launch `nvim` with `NVIM_APPNAME=nvim-vscode` and check `:checkhealth`.
- **Hammerspoon**: Auto-reloads on save via the `ReloadConfiguration` spoon; errors appear in the console.
- **Tmux**: `tmux source-file ~/.config/tmux/tmux.conf` to reload; errors print to the terminal.

## Languages and File Types

| Language   | Location                          | Extension   |
|------------|-----------------------------------|-------------|
| Nushell    | `nushell/`, `.scripts/*.nu`       | `.nu`       |
| Lua        | `hammerspoon/`, `nvim-vscode/`    | `.lua`      |
| Vimscript  | `vim/`                            | `.vim`      |
| Bash/POSIX | `zsh/.zshrc`, `.scripts/*.sh`     | `.sh`       |
| TOML       | `starship/`, `mise/`              | `.toml`     |
| Tmux conf  | `tmux/`                           | `.conf`     |

## Code Style Guidelines

### General

- **Indentation**: 2 spaces everywhere (no tabs). Set in vim options and stylua.
- **Line endings**: LF (Unix).
- **Trailing whitespace**: Avoid (vim `listchars` highlights trailing spaces).
- **File modelines**: Config-heavy files end with a vim modeline for folding:
  ```
  # vim: foldmethod=marker:foldmarker={{{,}}}:foldlevel=0
  ```

### Nushell (`.nu` files)

- **Shebangs**: Use `#!/usr/bin/env nu` or `#!/usr/bin/env -S nu`.
- **String quoting**: Double quotes for interpolation, single quotes are rare.
- **Variables**: `let` for immutable bindings; `snake_case` names.
- **Functions**: Use `def` with type annotations on params when appropriate. Use `def --env` only when the function needs to modify the environment.
- **Comments**: `#` with a space after the hash. Block-style comments precede the code they describe.
- **Cross-platform**: Check `$nu.os-info.name` for platform-specific logic ("windows", "macos", "linux"). Use `$env.WSL_DISTRO_NAME?` for WSL detection.
- **Error handling**: Use `try { ... } catch { ... }` blocks; return early with descriptive `print` messages on failure.
- **Imports**: `source` for loading other `.nu` files; `use std/util "path add"` for stdlib.
- **Sections in externs.nu**: Organized with vim fold markers `# tool name {{{ ... # }}}`.

### Lua (Neovim and Hammerspoon)

- **Formatter**: `stylua` (config not explicit; uses defaults: 2-space indent via vim settings).
- **Indentation**: Tabs in Lua files formatted by stylua (stylua default), but the repo vim config sets `expandtab` with 2-space tabs -- follow whichever the existing file uses.
- **Local variables**: Always use `local`. Prefer short descriptive names.
- **Naming**: `snake_case` for variables and functions; `PascalCase` for class-like tables/modules.
- **Module pattern (Hammerspoon Spoons)**:
  ```lua
  local obj = {}
  obj.__index = obj
  function obj:init() ... end
  return obj
  ```
- **Neovim plugin specs (nvim-vscode)**: Return a table (or list of tables) in the lazy.nvim format. Each plugin file is named after the plugin (`flash.lua`, `treesitter.lua`, etc.). Include a comment with the plugin URL at the top.
- **Keymaps**: Wrap `vim.keymap.set` in a local helper `k(lhs, rhs, opts)` to reduce boilerplate. Always include `desc` for discoverability.
- **Vim fold markers**: Used in keymap files: `-- Section {{{ ... -- }}}`.

### Vimscript (`.vim` files)

- **Structure**: Organized in fold-marker sections (`" SECTION {{{ ... " }}}`).
- **Indentation**: 2 spaces.
- **Comments**: `"` followed by a space. Section headers in ALL CAPS.
- **Mappings**: Use `nnoremap`, `xnoremap`, etc. (always non-recursive unless intentional `remap`). Include a comment above each mapping explaining its purpose.

### Tmux Config

- **Structure**: Sections separated by fold markers (`# Section {{{ ... # }}}`).
- **Comments**: Inline comments explain each setting.
- **Key bindings**: Listed before options. Grouped by function (windows, panes, copy mode).

### TOML Config Files

- **Comments**: `#` with explanation, often including a URL to docs at the top of the file.
- **Formatting**: Follow the tool's conventional TOML structure.

### Shell Scripts (Bash/Zsh)

- **Shebangs**: `#!/bin/sh` for POSIX, `#!/bin/bash` for Bash-specific.
- **Quoting**: Always double-quote variables (`"$VAR"`).
- **Style**: Minimal -- these scripts are short bootstrappers (zsh loads mise, then tmux auto-starts).

## Git Conventions

- **Default branch**: `main`
- **Commit message format**: `type(scope): description` (lowercase)
  - Types: `feat`, `fix`, `refactor`, `docs`, `chore`
  - Scope: tool/directory name (e.g., `nushell`, `git`, `nvim-vscode`, `opencode`)
  - Examples:
    - `feat(nushell) add opencode alias`
    - `fix(opencode): transparent background on diffs`
    - `refactor: Use default keys config for lazy`
  - Note: colon after scope is used inconsistently (both `feat(git):` and `feat(git)` appear); either is acceptable.
- **Pull strategy**: Rebase (configured in git config).
- **Push**: Auto-sets upstream on first push.
- **Commit signing**: Disabled (gpgsign = false).

## Important Notes

- **No Cursor rules or Copilot instructions** exist in this repository.
- **`.nvim.env`** is gitignored and contains per-repo Neovim env vars (e.g., `RESTORE_CHANGED_FILES_IGNORE`).
- **Nord theme**: The color palette throughout (Ghostty, tmux, starship, Nushell, nvim-vscode) is based on [Nord](https://www.nordtheme.com/) with custom "NordStone" extensions. Color hex values are defined in `nvim-vscode/colors/nordstone.lua` and `nushell/theme.nu`.
- **Symlink deployment**: Configs are expected to be symlinked to `~/.config/<tool>/` (the repo does not include an install script).
- The main Neovim config is in a **separate repository**: https://github.com/ruicsh/nvim-config
