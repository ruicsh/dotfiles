# ~/.dotfiles

## NeoVim/VSCode keybindings

### File explorer (oil in neovim, explorer in vscode)

- `[f` open previous file in current directory
- `]f` open next file in current directory
- `\` open explorer
- `<c-c>` close explorer
- `<enter>` open entry
- `<c-o>` open entry in horizonal split
- `<c-v>` open entry in vertical split
- `<c-p>` preview entry
- `-` open parent directory
- `_` open current working directory (root)
- `gs` change sort
- `g.` toggle hidden
- `g\` toggle trash

### Files (buffers in neovim, tabs in vscode)

- `<up><up>` list open files
- `<up>f` fuzzy find files
- `<up>.` fuzzy find old files
- `[b` previous open file
- `]b` next open file
- `<tab>` open previous recently used file
- `<s-tab>` open next recently used file
- `<leader>bc` close file
- `<leader>bC` close all files
- `<leader>bo` close the other files
- `<leader>bx` exit file

### Editing

- `<c-a>` select all
- `J` move selected lines above (visual-mode)
- `K` move selected lines below (visual-mode)
- `[<space>` add blank line above cursor
- `]<space>` add blank line below cursor
- `[e` move line above
- `]e` move line below
- `cs` change surrounding character
- `ds` delete surrounding character
- `ys` insert surrounding character
- `dw` backwards delete word
- `cx` exchange text

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

### Search

- `<up>g` find in workspace
- `<up>w` find current word in workspace
- `<up>r` resume last search
- `<leader>sr` find in document
- `s` jump to labelled search result
- `S` jump to labelled treesiter node _(not vscode)_

### Sorting

- `<leader>s` sort selection
- `<leader>s(` sort inside ()
- `<leader>s[` sort inside []
- `<leader>s{` sort inside {}
- `<leader>s'` sort inside ''
- `<leader>s"` sort inside ""
- `<leader>s}` sort paragraph

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

### LSP - TypeScript

- `<leader>toi` organize imports
- `<leader>tsi` sort imports
- `<leader>tui` remove unused imports
- `<leader>tcd` go to source definition
- `<leader>trf` rename file and update changes to connected files _(not vscode)_

### Git

- `<leader>gg` status
- `<leader>gs` stage hunk
- `<leader>gr` reset hunk
- `<leader>gu` unstage hunk
- `<leader>gS` stage file
- `<leader>gR` reset file
- `<leader>gB` blame file
- `<leader>gp` preview change
- `<leader>[c` previous change
- `<leader>]c` next change

### Splits (views in vscode, windows in neovim)

- `|` switch splits
- `<c-w><` decrease split width
- `<c-w>>` increase split width
- `<c-w>[` move file to split on the left
- `<c-w>]` move file to split on the right
- `<c-w>m` maximize split
- `<c-w>q` quit split
- `<c-w>v` split vertically

### Folds

- `zr` decrement foldlevel _(not vscode)_
- `zm` increment foldlevel _(not vscode)_
- `zR` decrement foldlevel to zero
- `zM` increment foldlevel to maximum
- `zo` open current fold
- `zc` close current fold
- `zO` open current fold recursively
- `zC` close current fold recursively
- `za` toggle fold
- `zA` toggle fold recursively
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
