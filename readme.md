# ~/.dotfiles

## NeoVim/VSCode keybindings

### Files

- `<leader>ff` list files
- `[f` open previous file in current directory
- `]f` open next file in current directory
- `\` focus file explorer

### Search

- `<leader>fg` find in workspace
- `<leader>sr` find in document

### Commands

- `[<space>` add blank line above cursor
- `]<space>` add blank line below cursor
- `[e` move line above
- `]e` move line below
- `J` move selected lines above (visual-mode)
- `K` move selected lines below (visual-mode)

### Text objects

- `a` function argument
- `la` last function argument
- `na` next function argument
- `b` blocks
- `lb` last block
- `nb` next block
- `q` quotes
- `lq` last quote
- `nq` next quote
- `ae` entire file
- `ie` entire file without leading and trailing empty lines

### Operators

- `cs` change surrounding character
- `ds` delete surrounding character
- `ys` insert surrounding character
- `cx` exchange text

### Motions

- `s` jump to next position by entering a 2char search
- `S` jump to previous position by entering a 2char search

### Insert mode navigation

- `<c-a>` go to beginning of line
- `<c-b>` go backwards one character
- `<c-d>` delete character in front of cursor
- `<c-e>` go to end of line
- `<c-f>` move forward one character
- `<c-n>` jump to line below
- `<c-p>` jump to line above
- `<c-r>` paste from clipboard
- `<c-u>` delete before the cursor in current line
- `<c-w>` delete word before

### LSP

- `<leader>[r` go to previous reference
- `<leader>]r` go to next reference
- `<leader>cD` peek declaration
- `<leader>cI` peek implementation
- `<leader>cO` peek type definition
- `<leader>cR` peek references
- `<leader>cd` go to declaration
- `<leader>cn` rename symbol
- `<leader>co` go to type definition
- `<leader>cr` list references
- `<leader>cs` list symbols in document
- `<leader>cw` list symbols in workspace

### Git

- `<leader>gg` open git changes
- `<leader>gs` stage hunk
- `<leader>gr` reset hunk
- `<leader>gu` unstage hunk
- `<leader>gS` stage file
- `<leader>gR` reset file
- `<leader>gB` blame file
- `<leader>gp` preview change
- `<leader>[c` previous change
- `<leader>]c` next change

### Tabs (buffers in neovim)

- `<tab>` open previous recently used tab
- `<s-tab>` open next recently used tab
- `<leader>b1` go to tab in position 1
- `<leader>b2` go to tab in position 2
- `<leader>b3` go to tab in position 3
- `<leader>b4` go to tab in position 4
- `<leader>b5` go to tab in position 5
- `<leader>b6` go to tab in position 6
- `<leader>b7` go to tab in position 7
- `<leader>b8` go to tab in position 8
- `<leader>b9` go to tab in position 9
- `<leader>bb` list open tabs
- `<leader>bc` close tab
- `<leader>bC` close all tabs
- `<leader>bo` close the other tabs
- `<leader>bp` pick tab
- `<leader>bx` exit tab
- `[t` previous tab
- `]t` next tab

### Splits (views in vscode, windows in neovim)

- `<c-w><` decrease window width
- `<c-w>>` increase window width
- `<c-w>m` maximize split
- `<c-w>q` quit window
- `<c-w>v` split vertically
- `<c-w>w` switch splits

### Folds

- `za` toggle fold
- `zA` toggle fold recursively
- `zC` close fold recursively
- `zM` close all folds
- `zO` open fold recursively
- `zR` open all folds
- `zc` close fold
- `zo` open fold
- `[z` go to parent fold
- `zk` go to previous fold
- `zj` go to next fold

### Harpoon

- `<leader>1` go to file 1
- `<leader>2` go to file 2
- `<leader>3` go to file 3
- `<leader>4` go to file 4
- `<leader>5` go to file 5
- `<leader>6` go to file 6
- `<leader>7` go to file 7
- `<leader>8` go to file 8
- `<leader>9` go to file 9
- `<leader>ha` add file
- `<leader>hh` list files
- `<leader>hn` next file
- `<leader>hp` previous file
- `<leader>hr` remove file

### VSCode

- `<leader>vb` toggle sidebar visibility

## macOS keybindings

### Open app shortcuts

- `<r-opt>l` open firefox
- `<r-opt>;` open vscode
- `<r-opt>` open iterm

### Window tiling

- `<ctrl><opt>e` first two thirds
- `<ctrl><opt>t` last two thirds
- `<ctrl><opt><right>` left half
- `<ctrl><opt><left>` right half
- `<ctrl><opt><up>` top half
- `<ctrl><opt><down>` bottom half
- `<ctrl><opt>u` top left corner
- `<ctrl><opt>i` top right corner
- `<ctrl><opt>j` bottom left corner
- `<ctrl><opt>k` bottom right corner
- `<ctrl><opt>d` first third
- `<ctrl><opt>f` center third
- `<ctrl><opt>g` last third
- `<ctrl><opt><enter>` full screen

## Install

```shell

cd $HOME
git clone https://github.com/ruicsh/dotfiles .dotfiles
cd .dotfiles
./dot.sh

```

## Uninstall

```shell

cd $HOME/.dotfiles
./undot.sh
cd $HOME
rm -rf .dotfiles

```

## License

MIT
