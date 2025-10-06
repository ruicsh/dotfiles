# ~/.dotfiles

Neovim conf is on a separate [repo](https://github.com/ruicsh/nvim-config).

## Terminal

- [carapace](https://github.com/carapace-sh/carapace-bin) Command completion
- [eza](https://github.com/eza-community/eza) Alternative to `ls`
- [fd](https://github.com/sharkdp/fd) Alternative to `find`
- [fzf](https://github.com/junegunn/fzf) Fuzzy finder
- [neovim](https://github.com/neovim/neovim) Editor
- [nushell](https://github.com/nushell/nushell) Shell
- [ouch](https://github.com/ouch-org/ouch) Archive manipulation
- [ripgrep](https://github.com/BurntSushi/ripgrep) Alternative to `grep`
- [starship](https://github.com/starship/starship) Prompt
- [tmux](https://github.com/tmux/tmux) Multiplexer
- [yazi](https://github.com/sxyazi/yazi) File manager
- [zoxide](https://github.com/ajeetdsouza/zoxide) Alternative to `cd`

## Keybinds

### Tmux

- `<c-a>` prefix key

#### Windows

- `c` create window with current path
- `q` close window
- `w` switch to last used window

#### Panes navigation

- `a` last pane
- `h` focus pane on the left
- `j` focus pane below
- `k` focus pane above
- `l` focus pane on the right
- `x` close pane

#### Panes splitting

- `s` open horizontal pane
- `v` open vertical pane
- `S` open full width horizontal pane
- `V` open full height vertical pane

#### Panes resizing

- `+` resize up
- `-` resize down
- `<` resize left
- `>` resize right
- `|` toggle zoom

#### Copy mode

- `'` jump to mark
- `/` search up
- `?` search down
- `{` jump up 6 lines
- `}` jump down 6 lines
- `m` set mark
- `v` begin selection
- `y` yank selection

### Windows Terminal

#### Tabs

- `<c-C>` create tab with current path
- `<c-Q>` close tab
- `<c-W>` switch tab

#### Panes navigation

- `<c-A>` last pane
- `<c-H>` focus pane on the left
- `<c-J>` focus pane below
- `<c-K>` focus pane above
- `<c-L>` focus pane on the right
- `<c-X>` close pane

#### Panes splitting

- `<c-S>` open horizontal pane
- `<c-V>` open vertical pane

#### Panes resizing

- `<c-+>` resize up
- `<c-->` resize down
- `<c-<>` resize left
- `<c->>` resize right
- `<c-|>` toggle zoom
