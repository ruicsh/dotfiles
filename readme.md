# ~/.dotfiles

## NeoVim/VSCode keybindings

### Files explorer

- `\` toggle tree explorer
- `-` open directory explorer
- `<leader>f` fuzzy find files
- `<leader>,` fuzzy find recent files

### Tree explorer

- `<enter>` open 
- `<c-v>` open file to the side 
- `a` add
- `r` rename
- `c` duplicate
- `y` copy
- `h` collapse directory
- `l` open file or expand directory
- `d` delete
- `x` cut
- `p` paste
- `L` expand all _(not vscode)_
- `H` collapse all
- `I` toggle filter: gitignore _(not vscode)_
- `<c-q>` close explorer
- `[c` previous git change _(not vscode)_
- `]c` next git change _(not vscode)_
- `<` previous source _(not vscode)_
- `>` next source _(not vscode)_

### Directory explorer _(not vscode)_

- `<enter>` open 
- `<c-v>` open entry in vertical split
- `<c-p>` preview 
- `-` open parent directory
- `_` open current working directory (root)
- `gs` change sort
- `g.` toggle hidden
- `g\` toggle trash
- `<c-q>` close explorer

### Opened files 

- `§` list open files
- `[b` previous opened file
- `]b` next opened file
- `<bs>` open previous recently used file
- `<s-bs>` open next recently used file
- `<leader>bc` close file
- `<leader>bC` close all files
- `<leader>bo` close the other files
- `<leader>bx` exit file

### Editing

- `<c-a>` select all
- `<c-l>` jump to end of line
- `[<space>` add blank line above cursor
- `]<space>` add blank line below cursor
- `[e` move line/selection above
- `]e` move line/selection below
- `[p` paste to new line above
- `]p` paste to new line below
- `cs` change surrounding character
- `ds` delete surrounding character
- `ys` insert surrounding character
- `cx` exchange text
- `U` redo
- `<leader>j` syntax aware join lines

### Insert mode navigation

- `<c-a>` jump to beginning of line
- `<c-b>` go backwards one character
- `<c-d>` delete character in front of cursor
- `<c-e>` jump to end of line
- `<c-f>` move forward one character
- `<c-j>` jump to line below
- `<c-k>` jump to line above
- `<c-r>` paste from clipboard
- `<c-u>` delete before the cursor in current line
- `<c-w>` delete word before

### Search

- `s` jump to labelled search result
- `S` jump to labelled treesiter node _(not vscode)_
- `<leader>f` find in workspace
- `<leader>F` find current word in workspace
- `<leader><c-f>` find in open files
- `<leader>tr` resume last search
- `<leader>sr` search and replace current word
- `<leader>/` fuzzy find in document
- `<leader>ts` select fuzzy finder to use _(only neovim)_

### Sorting

- `<leader>so` sort selection
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
- `af` outer function
- `if` inner function

### LSP

- `K` display hover information for symbol
- `gd` jump to definition
- `gi` jump to implementation
- `go` jump to type definition
- `gr` list references
- `gy` list symbols in document
- `gY` list symbols in workspace
- `<leader>gy` toggle symbol navigator
- `<f2>` rename symbol

### LSP - TypeScript

- `<leader>to` organize imports
- `<leader>ts` sort imports
- `<leader>tu` remove unused imports
- `<leader>td` jump to source definition
- `<leader>tr` rename file and update changes to connected files _(not vscode)_

### Autocomplete

- `<tab>` open menu
- `<cr>` accept
- `<tab>` select next entry
- `<s-tab>` select previous entry
- `<esc>` close menu

### Syntax _(not vscode)_

- `{` jump to previous symbol
- `}` jumtp next symbol
- `[a` jump to previous argument start _(not vscode)_
- `]a` jump to next argument start _(not vscode)_
- `[A` jump to previous argument end _(not vscode)_
- `]A` jump to next argument end _(not vscode)_
- `[d` jump to previous block start _(not vscode)_
- `]d` jump to next block start _(not vscode)_
- `[D` jump to previous block end _(not vscode)_
- `]D` jump to next block end _(not vscode)_
- `[f` jump to previous function start _(not vscode)_
- `]f` jump to next function start _(not vscode)_
- `[F` jump to previous function end _(not vscode)_
- `]F` jump to next function end _(not vscode)_
- `[n` increase node selection to parent node
- `[n` start node selection
- `]n` decrease node selection to child node 
- `[r` jump to previous symbol reference
- `]r` jump to next symbol reference
- `[t` jump upwards to context _(not vscode)_

### Git

- `<leader>dd` status
- `<leader>dh` search
- `<leader>ds` stage hunk
- `<leader>dr` reset hunk
- `<leader>du` unstage hunk
- `<leader>dS` stage file
- `<leader>dR` reset file
- `<leader>db` blame hunk
- `<leader>dp` preview change
- `<leader>df` open diff
- `<leader>dt` toggle deleted
- `[c` previous change
- `]c` next change

### Diffview

- `{` open diff for previous file 
- `}` open diff for next file
- `cc` commit
- `s` stage file
- `X` reset file

### Splits 

- `|` switch splits
- `<c-w><` decrease split width
- `<c-w>>` increase split width
- `<c-w>[` move file to split on the left
- `<c-w>]` move file to split on the right
- `<c-w>m` maximize split
- `<c-q>` quit split
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
- `[z` jump to parent fold
- `zk` jump to previous fold
- `zj` jump to next fold

### Pinned tabs

- `§1` jump to file 1
- `§2` jump to file 2
- `§3` jump to file 3
- `§4` jump to file 4
- `§5` jump to file 5
- `§6` jump to file 6
- `§7` jump to file 7
- `§8` jump to file 8
- `§9` jump to file 9
- `[§` jump to previous pinned
- `]§` jump to next pinned

### Jumplist

- `<leader>j` show jumplist
- `<c-o>` jump to older position
- `<c-i>` jump to newer position

### Session management _(not vscode)_

- `<leader>ws` load session for workspace
- `<leader>wS` pick sessions
- `<leader>wl` load last session
- `<leader>wd` stop saving session

### Application

- `<leader>n,` search configuration / open settings
- `<leader>n<` open settings (JSON) _(only vscode)_
- `<leader>nn` show notifications history _(only neovim)_
- `<leader>nc` show commands
- `<leader>nh` help
- `<leader>nk` keyboard shortcuts
- `<leader>nK` keyboard shortcuts (JSON) _(only vscode)_
- `<leader>vb` toggle sidebar visibility _(only vscode)_

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
