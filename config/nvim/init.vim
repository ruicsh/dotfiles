call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'ggandor/leap.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()



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

" default leader key \
let mapleader = ' '

" center screen when moving
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap N Nzz
nnoremap n nzz

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
inoremap <C-l> <C-o>l

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <Cmd>Telescope find_files<CR>
nnoremap <leader>fg <Cmd>Telescope live_grep<CR>
nnoremap <leader>fb <Cmd>Telescope buffers<CR>
nnoremap <leader>fh <Cmd>Telescope help_tags<CR>

" keys for leap.nvim
nnoremap s <Plug>(leap-forward)
nnoremap S <Plug>(leap-backward)

" move text up and down
xnoremap <S-j> :move '>+1<CR>gv=gv
xnoremap <S-k> :move '<-2<CR>gv=gv

" removes highlighting after escaping vim search
nnoremap <Esc> <Esc>:noh<CR>

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
nnoremap <Leader>6 <Cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>
nnoremap <Leader>7 <Cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>
nnoremap <Leader>8 <Cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>
nnoremap <Leader>9 <Cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>

" vscode.lsp
nnoremap gd <Cmd>lua require('vscode').action('editor.action.peekDefinition')<CR>
nnoremap gD <Cmd>lua require('vscode').action('editor.action.revealDefinition')<CR>
nnoremap gi <Cmd>lua require('vscode').action('editor.action.peekImplementation')<CR>
nnoremap gI <Cmd>lua require('vscode').action('references-view.findImplementations')<CR>
nnoremap go <Cmd>lua require('vscode').action('editor.action.peekTypeDefinition')<CR>
nnoremap gO <Cmd>lua require('vscode').action('editor.action.goToTypeDefinition')<CR>
nnoremap gr <Cmd>lua require('vscode').action('editor.action.goToReferences')<CR>
nnoremap gR <Cmd>lua require('vscode').action('references-view.findReferences')<CR>

