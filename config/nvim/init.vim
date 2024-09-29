"----------------
" SETTINGS 
"----------------

set clipboard=unnamed                 "clipboard (so that yank goes to OS clipboard)
set cursorline                        "highlight current line
set linebreak                         "don't break line on middle of word
set noswapfile                        "stop creating swp files
set relativenumber                    "show relative line numbers
set shortmess+=I                      "disable startup message
set tabstop=2 shiftwidth=2 expandtab  "soft tabs
set ignorecase                        "ignore case on search patterns
set smartcase                         "use case sensitive if keyword contains capital letters

"----------------
" KEY MAPPINGS 
"----------------

" default leader key space
let mapleader = ' '

" start/end of line
nnoremap H ^
nnoremap L $

" redo
nnoremap U <c-r>

" quit/save
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" don't yank on delete char
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X

" change text without putting it into the vim register
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
xnoremap c "_c

" paste over currently selected text without yanking it
xnoremap p  "_dp
xnoremap P "_dP

" center screen when moving (doesn't work on vscode, why?!)
nnoremap <c-f> <c-f>zz
nnoremap <c-b> <c-b>zz
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz
nnoremap N Nzzzv
nnoremap n nzzzv
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz

" disable arrow keys
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
xnoremap <down> <nop>
xnoremap <left> <nop>
xnoremap <right> <nop>
xnoremap <up> <nop>

" sort selection then switch to normal mode
xnoremap <leader>s :sort<cr><esc>

" don't lose selection when indenting
xnoremap < <gv
xnoremap > >gv

" insert mode arrow navigation
inoremap <c-h> <c-o>h
inoremap <c-j> <c-o>j
inoremap <c-k> <c-o>k
inoremap <c-l> <c-o>a

" go to the beginning and end of current line in insert mode quickly
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-b> <c-o>B
inoremap <c-w> <c-o>W

" delete the character to the right of the cursor
inoremap <c-d> <del>

" keys for leap.nvim
nnoremap s <plug>(leap-forward)
nnoremap S <plug>(leap-backward)

" move text up and down
xnoremap J :move '>+1<cr>gv=gv
xnoremap K :move '<-2<cr>gv=gv

" remove search highlighting
nnoremap <cr> :noh<cr><cr>

" keeps cursor in place when joining lines
nnoremap J mzJ`z

" search and replace the current word
nnoremap <leader>s :%s/\<<c-r><c-w>\>/

" don't include paragraph jumps on jumplist
nnoremap { <cmd>keepj normal!{<cr>
nnoremap } <cmd>keepj normal!}<cr>

"----------------
" PLUGINS
"----------------

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'ggandor/leap.nvim'

if !exists('g:vscode')
  Plug 'airblade/vim-gitgutter'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-fugitive'
endif

call plug#end()



" highlighted yank
highlight HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 500
let g:highlightedyank_highlight_in_visual = 0



" vscode only keymaps
if exists('g:vscode')

  " vscode.switch tabs
  nnoremap <tab> <cmd>lua require('vscode').action('workbench.action.openPreviousRecentlyUsedEditor')<cr>
  nnoremap <s-tab> <cmd>lua require('vscode').action('workbench.action.openNextRecentlyUsedEditor')<cr>
  nnoremap ]t <cmd>lua require('vscode').action('workbench.action.nextEditorInGroup')<cr>
  nnoremap [t <cmd>lua require('vscode').action('workbench.action.previousEditorInGroup')<cr>

  " vscode.harpoon
  nnoremap <leader>ha <cmd>lua require('vscode').action('vscode-harpoon.addEditor')<cr>
  nnoremap <leader>ho <cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<cr>
  nnoremap <leader>he <cmd>lua require('vscode').action('vscode-harpoon.editEditors')<cr>
  nnoremap <leader>hn <cmd>lua require('vscode').action('vscode-harpoon.gotoPreviousHarpoonEditor')<cr>
  nnoremap <leader>1 <cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<cr>
  nnoremap <leader>2 <cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<cr>
  nnoremap <leader>3 <cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<cr>
  nnoremap <leader>4 <cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<cr>
  nnoremap <leader>5 <cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<cr>

  " vscode.lsp
  nnoremap gD <cmd>lua require('vscode').action('editor.action.peekDefinition')<cr>
  nnoremap gd <cmd>lua require('vscode').action('editor.action.revealDefinition')<cr>
  nnoremap gI <cmd>lua require('vscode').action('editor.action.peekImplementation')<cr>
  nnoremap gi <cmd>lua require('vscode').action('references-view.findImplementations')<cr>
  nnoremap gO <cmd>lua require('vscode').action('editor.action.peekTypeDefinition')<cr>
  nnoremap go <cmd>lua require('vscode').action('editor.action.goToTypeDefinition')<cr>
  nnoremap gR <cmd>lua require('vscode').action('editor.action.goToReferences')<cr>
  nnoremap gr <cmd>lua require('vscode').action('references-view.findReferences')<cr>
  
  " vscode equivalent to telescope
  nnoremap <leader>ff <cmd>lua require('vscode').action('workbench.action.quickOpen')<cr> 
  nnoremap <leader>fg <cmd>lua require('vscode').action('workbench.action.findInFiles')<cr> 
  nnoremap <leader>fc <cmd>lua require('vscode').action('workbench.action.showCommands')<cr> 

  " vscode equivalent to nerdtree
  nnoremap <leader>e <cmd>lua require('vscode').action('workbench.files.action.focusFilesExplorer')<cr> 
  
  " vscode equivalent to vim.fugitive
  nnoremap <leader>g <cmd>lua require('vscode').action('workbench.view.scm')<cr> 

else

  " airline
  let g:airline_theme='lucius'

  " telescope 
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fs <cmd>Telescope grep_string<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>fc <cmd>Telescope commands<cr>
  
  " nerdtree
  nnoremap <leader>e <cmd>NERDTreeToggle<cr>

  " fugitive
  nnoremap <leader>g <cmd>G<cr>

endif
