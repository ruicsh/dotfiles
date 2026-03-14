" THEME {{{
syntax on
colorscheme nordstone
" }}}

" OPTIONS {{{

" 1 important {{{
set nocompatible
" }}}

" 2 moving around, searching and patterns {{{
set incsearch
set ignorecase 
set path& | let &path .= "**"
set smartcase
set startofline
set whichwrap=b,s,<,>,[,]
" }}}

" 3 tags {{{
set tagstack 
" }}}

" 4 displaying text {{{
set breakindent
set cmdheight=1
set fillchars=vert:\│,foldopen:,foldclose:›,foldsep:\ ,fold:\ ,eob:\ ,diff:\ 
set list
set listchars=tab:\ \ ,trail:·,extends:»,precedes:«,nbsp:+
set lazyredraw 
set number
set numberwidth=5
set relativenumber
set scrolloff=5
set sidescrolloff=10
set wrap
" }}}

" 5 syntax, highlighting and spelling {{{
set cursorline
set cursorlineopt=screenline,number
set hlsearch
set spelloptions=camel
set termguicolors
" }}}

" 6 multiple windows {{{
set hidden
set laststatus=2
set noequalalways
set splitbelow
set splitkeep=cursor
set splitright
" }}}

" 7 multiple tab pages {{{
set showtabline=0
set tabpagemax=50
" }}}

" 9 using the mouse {{{
set mouse="nic"
" }}}

" 11 messages and info {{{
set belloff=all
set noshowcmd 
set report=9999
set ruler
set shortmess=ACFISWacs
set showmode
" }}}

" 12 selecting text {{{

" Use win32yank if on Windows
if has('win32') || has('win64')
  let g:clipboard = {
    \ 'name': 'win32yank-wsl',
    \ 'copy': {
    \    '+': 'win32yank.exe -i --crlf',
    \    '*': 'win32yank.exe -i --crlf',
    \ },
    \ 'paste': {
    \    '+': 'win32yank.exe -o --lf',
    \    '*': 'win32yank.exe -o --lf',
    \ },
    \ 'cache_enabled': 1,
  \ }
" Use xclip if inside WSL `:h clipboard-wsl`
elseif !empty($WSL_DISTRO_NAME) || !empty($WSL_INTEROP)
  let g:clipboard = {
    \   'name': 'xclip',
    \   'copy': {
    \     '+': 'xclip -selection clipboard',
    \     '*': 'xclip -selection primary',
    \   },
    \   'paste': {
    \     '+': 'xclip -selection clipboard -o',
    \     '*': 'xclip -selection primary -o',
    \   },
    \   'cache_enabled': 1,
    \ }
endif

set clipboard=unnamedplus
" }}}

" 13 editing text {{{
set complete=.,]
set completeopt=menu,menuone,noinsert,preview
set formatoptions=/1bcjnpqt
set infercase
set pumheight=5
set noshowmatch
set noundofile
" }}}

" 14 tabs and indenting {{{
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
" }}}

" 15 folding {{{
set foldcolumn=0
set foldenable
set foldlevel=999
set foldlevelstart=99
set foldmethod=indent
set foldopen=insert,mark,search,tag
" }}}

" 17 mapping {{{
set timeout
set timeoutlen=500
set ttimeout
set ttimeoutlen=100
" }}}

" 19 the swap file {{{
set noswapfile
" }}}

" 20 reading and writing files {{{
set autoread
set history=1000
set nobackup
set nowritebackup
set wildmenu
" }}}

" 23 language specific {{{
set iskeyword=@,48-57,_,192-255,-
set nolangremap
" }}}

" 25 various {{{
set conceallevel=0
set gdefault
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
set signcolumn=yes
set viewoptions=cursor,folds
set viminfo=
" }}}

" }}}

" KEYMAPS {{{

" Leader {{{
let g:mapleader=" "
let g:maplocalleader=","
" }}}

" Normal mode {{{

" More deterministic short distance jumps
noremap { 6gkg0
noremap } 6gjg0

" Redo
nnoremap U <C-R>

" Keep same logic from `y/c/d` on `v`
nnoremap V v$
nnoremap vv V

" Paste on adjacent line
nnoremap [p :put!<CR>==
nnoremap ]p :put<CR>==

" Move current line up/down
nnoremap <A-j> :move .+1<CR>==
nnoremap <A-k> :move .-2<CR>==

" Keep cursor in place when joining lines
nnoremap J mzJ`z:delmarks z<CR>

" Save file
nnoremap <C-S> :silent! update<CR>
nnoremap q :quit<CR>
nnoremap <c-q> :qa!<CR>

" Don't store on register when changing text or deleting a character.
nnoremap C "_C
nnoremap c "_c
nnoremap cc "_cc
nnoremap x "_x
nnoremap X "_X

" Toggle fold
nnoremap <Tab> za

" Enter visual block mode
nnoremap <leader>v <c-v> 
" }}}

" Insert mode {{{
inoremap <C-S> <C-O>:silent! update<CR><Esc>

" Move current line up/down
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
" }}}

" Visual mode {{{
xnoremap <C-S> :silent! update<CR>
xnoremap <leader>s :'<,'>sort<CR>

" Move selected lines up/down
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Keep selection when indenting
vnoremap < <gv
vnoremap > >gv
" }}}

" Diff conflict resolution mappings
augroup DiffConflictMaps
  autocmd!
  autocmd BufWinEnter * if &diff | call s:DiffConflictMaps() | endif
augroup END

function! s:DiffConflictMaps() abort
  nnoremap <buffer> co :diffget LOCAL<CR>
  nnoremap <buffer> ct :diffget REMOTE<CR>
  nnoremap <buffer> cb :diffget LOCAL<CR>:diffget REMOTE<CR>
  nnoremap <buffer> c0 :diffput<CR>
endfunction
" }}}

" PLUGINS {{{
filetype plugin indent on
runtime macros/matchit.vim

" Disable unused built-in plugins
for plugin in [
      \ '2html_plugin',
      \ 'getscript',
      \ 'getscriptPlugin',
      \ 'gzip',
      \ 'netrw',
      \ 'netrwPlugin',
      \ 'rrhelper',
      \ 'tar',
      \ 'tarPlugin',
      \ 'tutor_mode_plugin',
      \ 'vimball',
      \ 'vimballPlugin',
      \ 'zip',
      \ 'zipPlugin'
      \ ]
  execute 'let g:loaded_' . plugin . ' = 1'
endfor

" Disable unused remote plugin providers
for provider in ['node', 'perl', 'python', 'python3', 'ruby']
  execute 'let g:loaded_' . provider . '_provider = 0'
endfor

" }}}

" AUTOCMDS {{{

" Highlight on yank
if has('nvim')
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup END
endif

" }}}

" vim: foldmethod=marker:foldmarker={{{,}}}:foldlevel=0
