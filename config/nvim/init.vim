call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ggandor/leap.nvim'
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
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>
xnoremap <Down> <NOP>
xnoremap <Left> <NOP>
xnoremap <Right> <NOP>
xnoremap <Up> <NOP>

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
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" keys for leap.nvim
nnoremap s <Plug>(leap-forward)
nnoremap S <Plug>(leap-backward)

" move text up and down
xnoremap <C-j> :move '>+1<CR>gv-gv
xnoremap <C-k> :move '<-2<CR>gv-gv
