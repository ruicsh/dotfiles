"----------------
" SETTINGS 
"----------------

set clipboard=unnamed                 "Clipboard (so that yank goes to OS clipboard)
set cursorline                        "Highlight current line
set linebreak                         "Don't break line on middle of word
set noswapfile                        "Stop creating swp files
set relativenumber                    "Show relative line numbers
set shortmess+=I                      "Disable startup message
set tabstop=2 shiftwidth=2 expandtab  "Soft tabs
set ignorecase                        "Ignore case on search patterns
set smartcase                         "Use case sensitive if keyword contains capital letters

"----------------
" KEY MAPPINGS 
"----------------

" default leader key Space
let mapleader = ' '

" start/end of line
nnoremap <s-h> ^
nnoremap <s-l> $

" redo
nnoremap <s-u> <c-r>

" quit/save
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" delete single character without copying into register
nnoremap x "_x

" paste over without overwriting register
xnoremap p <s-p>

" center screen when moving (doesn't work on vscode, why?!)
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <s-n> <s-n>zzzv
nnoremap n nzzzv
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz

" disable arrow keys
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
xnoremap <Down> <Nop>
xnoremap <Left> <Nop>
xnoremap <Right> <Nop>
xnoremap <Up> <Nop>

" sort selection then switch to normal mode
xnoremap <Leader>s :sort<CR><Esc>

" don't lose selection when indenting
xnoremap < <gv
xnoremap > >gv

" insert mode arrow navigation
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>a

" keys for leap.nvim
nnoremap s <Plug>(leap-forward)
nnoremap <s-s> <Plug>(leap-backward)

" move text up and down
xnoremap <s-j> :move '>+1<cr>gv=gv
xnoremap <s-k> :move '<-2<cr>gv=gv

" remove search highlighting
nnoremap <cr> :noh<cr><cr>

" keeps cursor in place when joining lines
nnoremap <s-j> mzJ`z

" search and replace the current word
nnoremap <leader>sr :%s/\<<c-r><C-w>\>//gI<left><left><left>

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


" vscode only keymaps
if exists('g:vscode')

  " vscode.switch tabs
  nnoremap <Leader>[ <Cmd>lua require('vscode').action('workbench.action.previousEditorInGroup')<CR>
  nnoremap <Leader>] <Cmd>lua require('vscode').action('workbench.action.nextEditorInGroup')<CR>
  nnoremap <Leader>; <Cmd>lua require('vscode').action('workbench.action.openPreviousRecentlyUsedEditor')<CR>
  nnoremap <Leader>' <Cmd>lua require('vscode').action('workbench.action.openNextRecentlyUsedEditor')<CR>

  " vscode.harpoon
  nnoremap <Leader>ha <Cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>
  nnoremap <Leader>ho <Cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>
  nnoremap <Leader>he <Cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>
  nnoremap <Leader>hn <Cmd>lua require('vscode').action('vscode-harpoon.gotoPreviousHarpoonEditor')<CR>
  nnoremap <Leader>1 <Cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>
  nnoremap <Leader>2 <Cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>
  nnoremap <Leader>3 <Cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>
  nnoremap <Leader>4 <Cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>
  nnoremap <Leader>5 <Cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>

  " vscode.lsp
  nnoremap gD <Cmd>lua require('vscode').action('editor.action.peekDefinition')<CR>
  nnoremap gd <Cmd>lua require('vscode').action('editor.action.revealDefinition')<CR>
  nnoremap gI <Cmd>lua require('vscode').action('editor.action.peekImplementation')<CR>
  nnoremap gi <Cmd>lua require('vscode').action('references-view.findImplementations')<CR>
  nnoremap gO <Cmd>lua require('vscode').action('editor.action.peekTypeDefinition')<CR>
  nnoremap go <Cmd>lua require('vscode').action('editor.action.goToTypeDefinition')<CR>
  nnoremap gR <Cmd>lua require('vscode').action('editor.action.goToReferences')<CR>
  nnoremap gr <Cmd>lua require('vscode').action('references-view.findReferences')<CR>
  
  " vscode equivalent to telescope
  nnoremap <Leader>ff <Cmd>lua require('vscode').action('workbench.action.quickOpen')<CR> 
  nnoremap <Leader>fg <Cmd>lua require('vscode').action('workbench.action.findInFiles')<CR> 
  nnoremap <Leader>fc <Cmd>lua require('vscode').action('workbench.action.showCommands')<CR> 

  " vscode equivalent to nerdtree
  nnoremap <Leader>e <Cmd>lua require('vscode').action('workbench.files.action.focusFilesExplorer')<CR> 
  
  " vscode equivalent to vim.fugitive
  nnoremap <Leader>g <Cmd>lua require('vscode').action('workbench.view.scm')<CR> 

else

  " airline
  let g:airline_theme='lucius'

  " telescope 
  nnoremap <Leader>ff <Cmd>Telescope find_files<CR>
  nnoremap <Leader>fs <Cmd>Telescope grep_string<CR>
  nnoremap <Leader>fg <Cmd>Telescope live_grep<CR>
  nnoremap <Leader>fh <Cmd>Telescope help_tags<CR>
  nnoremap <Leader>fc <Cmd>Telescope commands<CR>
  
  " nerdtree
  nnoremap <Leader>e <Cmd>NERDTreeToggle<CR>

  " fugitive
  nnoremap <Leader>g <Cmd>G<CR>

endif
