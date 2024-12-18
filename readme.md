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
- `L` expand all 
- `H` collapse all
- `I` toggle filter: gitignore 
- `<c-]>` close explorer
- `[c` previous git change 
- `]c` next git change
- `<` previous source 
- `>` next source

### Directory explorer 

- `<enter>` open 
- `<c-v>` open entry in vertical split
- `<c-p>` preview 
- `-` open parent directory
- `_` open current working directory (root)
- `gs` change sort
- `g.` toggle hidden
- `g\` toggle trash
- `<c-]>` close explorer

### Opened files 

- `§` list open files
- `[b` previous opened file
- `]b` next opened file
- `<bs>` previous recently used file
- `<s-bs>` next recently used file
- `<leader>bc` close file
- `<leader>bC` close all files
- `<leader>bo` close the other files
- `<leader>bx` exit file

### Editing

- `[<space>` add blank line above cursor
- `]<space>` add blank line below cursor
- `[e` move line/selection above
- `]e` move line/selection below
- `[p` paste to new line above
- `]p` paste to new line below
- `cs{target}{replacement}` change surrounding character
- `ds{char}` delete surrounding character
- `ys{motion}{char}` insert surrounding character
- `S{char}` surround selection (visual mode)
- `U` redo
- `<leader>J` syntax aware join lines
- `jj` exit to normal mode

### Insert mode navigation

- `<c-a>` jump to beginning of line
- `<c-b>` jump backwards one character
- `<c-d>` delete character in front of cursor
- `<c-e>` jump to end of line
- `<c-f>` jump forward one character
- `<c-j>` jump to line below
- `<c-k>` jump to line above
- `<c-r>` paste from clipboard
- `<c-u>` delete before the cursor in current line
- `<c-w>` delete word before

### Text objects

- `#` color in CSS
- `S` word in camelCase, PascalCase, snake_case and kebab-case
- `a` function argument
- `c` class in CSS
- `d` code blocks (if, while, for, ...)
- `f` function
- `k` key, left side of assignment
- `o` brackets ({}, (), [])
- `q` quotes ("", '', ``)
- `v` value, right side of assignment
- `x` HTML attribute

### Find & Replace

- `/` find in document forward
- `?` find in document backward
- `<leader>f` find in workspace
- `<leader>r` replace in selection/document/workspace

### Sorting

- `<leader>so` sort selection
- `<leader>s(` sort inside ()
- `<leader>s[` sort inside []
- `<leader>s{` sort inside {}
- `<leader>s'` sort inside ''
- `<leader>s"` sort inside ""
- `<leader>s}` sort paragraph

### LSP

- `K` display hover information for symbol
- `gd` jump to definition
- `gi` jump to implementation
- `go` jump to type definition
- `gr` list references
- `gy` list symbols in document
- `gY` list symbols in workspace
- `<f2>` rename symbol

### LSP - TypeScript

- `<leader>to` organize imports
- `<leader>ts` sort imports
- `<leader>tu` remove unused imports
- `<leader>td` jump to source definition
- `<leader>tr` rename file and update changes to connected files

### Diagnostics

- `<leader>xx` open diagnostics for workspace
- `<leader>xX` open diagnostics for buffer
- `<leader>xL` open location list
- `<leader>xQ` open quickfix list

### Autocomplete

- `<cr>` accept
- `<c-n>` select next entry
- `<c-p>` select previous entry
- `<c-e>` close menu

### AI code generation

- `<tab>` accept suggestion
- `<c-]>` next suggestion
- `<esc>` dismiss suggestions
- `<leader>aa` open chat panel
- `<leader>ae` chat with selection
- `A` apply all generated code
- `a` apply hunk of generated code

### Syntax

- `[a` jump to previous argument start
- `]a` jump to next argument start
- `[A` jump to previous argument end
- `]A` jump to next argument end
- `[d` jump to previous block start
- `]d` jump to next block start
- `[D` jump to previous block end
- `]D` jump to next block end
- `[f` jump to previous function start
- `]f` jump to next function start
- `[F` jump to previous function end
- `]F` jump to next function end
- `[n` increase node selection to parent node
- `[n` start node selection
- `]n` decrease node selection to child node 
- `[r` jump to previous symbol reference
- `]r` jump to next symbol reference

### Git

- `<leader>hf` list changed files
- `<leader>hg` open diffview
- `<leader>hh` status
- `<leader>ho` push set-upstream origin HEAD
- `<leader>hp` push
- `<leader>hr` reset hunk
- `<leader>hR` reset file
- `<leader>hs` stage hunk
- `<leader>hS` stage file
- `<leader>hu` unstage hunk
- `<leader>hv` preview change
- `<leader>hy` share file permalink
- `[c` previous change
- `]c` next change
- `<c-]>` close panel

### Diffview

- `<up>` open diff for previous file 
- `<down>` open diff for next file
- `cc` commit
- `s` stage file
- `X` reset file
- `<c-]>` close panel

### Merge Conflicts

- `co` choose ours
- `ct` choose theirs
- `cb` choose both
- `c0` choose none
- `]x` jump to next conflict
- `[x` jump to previous conflict

### Splits 

- `|` switch splits
- `<c-w>[` move file to split on the left
- `<c-w>]` move file to split on the right
- `<c-w>m` maximize split
- `<c-]>` quit split
- `<c-w>v` split vertically

### Folds

- `zr` decrement foldlevel 
- `zm` increment foldlevel
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

### Jumplist

- `<leader>jj` show jumplist
- `<c-o>` jump to older position
- `<c-i>` jump to newer position

### Workspaces

- `<leader>pp` list workspaces

### Application

- `<leader>n,` search configuration / open settings
- `<leader>n<` open settings (JSON) _(only vscode)_
- `<leader>nn` show notifications history _(only neovim)_
- `<leader>nc` show commands
- `<leader>nh` help
- `<leader>nk` keyboard shortcuts
- `<leader>nK` keyboard shortcuts (JSON) _(only vscode)_
- `<leader>nt` select fuzzy finder to use _(only neovim)_
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
