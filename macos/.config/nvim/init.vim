call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'gabrielelana/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'ThePrimeagen/vim-be-good'
call plug#end()



"----------------
" SETTINGS 
"----------------

set autoread                          "Reload files changed outside vim
set backspace=indent,eol,start        "Allow backspace in insert mode
set clipboard=unnamed                 "Clipboard (so that yank goes to OS clipboard)
set columns=80                        "80 characters max width
set cursorline                        "Highlight current line
set expandtab                         "Expand tabs to spaces
set linebreak                         "Don't break line on middle of word
set nofoldenable                      "Don't fold chapters
set noswapfile                        "Stop creating swp files
set number                            "Show line numbers
set scrolloff=3                       "Start scrolling three lines before the horizontal window border
set shortmess+=I                      "Disable startup message
set tabstop=2 shiftwidth=2 expandtab  "Soft tabs
set wrap                              "Text wrap



"----------------
" THEME AND COLORS 
"----------------

colorscheme nord                      "Theme
hi Visual ctermbg=Blue ctermfg=Black  "Visual selection




"----------------
" KEY MAPPINGS 
"----------------

" default leader key \
let mapleader = '\'

" center screen when moving
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap N Nzz
nnoremap n nzz

" disable arrow keys
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
vnoremap <up> <nop>

" sort selection then switch to normal mode
xnoremap <Leader>s :sort<CR><ESC>

" quicker switch to normal mode from insert
inoremap jj <ESC>

" don't lose selection when indenting
xnoremap < <gv
xnoremap > >gv





"----------------
" MISCELLANEOUS 
"----------------

" -----------
" Change cursor shape between insert and normal mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
" Reset cursor on startup
" because the cursor is coming in insert mode from tmux/bash
" https://vi.stackexchange.com/a/21673
augroup ResetCursorShape
au!
autocmd VimEnter * :normal :startinsert :stopinsert
augroup END

" -----------
" Automatically toggle between relative and absolute line numbers
" https://jeffkreeftmeijer.com/vim-number/#automatic-toggling-between-line-number-modes
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
