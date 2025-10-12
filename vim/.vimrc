" THEME {{{

set background=dark
highlight clear

" Reset all highlights {{{
for group in getcompletion('', 'highlight')
  execute 'highlight ' . group . ' gui=NONE cterm=NONE guifg=#d8dee9 guibg=NONE'
endfor
" }}}

" Highlight groups {{{
highlight ColorColumn guifg=NONE guibg=NONE
highlight CommandMode guifg=#D8DEE9 guibg=NONE gui=reverse
highlight Conceal guifg=#2E3440
highlight CurSearch guifg=#2E3440 guibg=#81A1C1
highlight Cursor guifg=#D8DEE9 guibg=NONE gui=reverse
highlight CursorColumn guifg=NONE guibg=#2E3440
highlight CursorIM guifg=#E5E9F0 guibg=NONE gui=reverse
highlight CursorLine guibg=#3B4252 gui=NONE cterm=NONE
highlight CursorLineNr guifg=#D8DEE9 gui=NONE cterm=NONE
highlight DiffAdd guibg=#A3BE8C
highlight DiffChange guibg=#2E3440
highlight DiffDelete guibg=#BF616A
highlight DiffText guibg=#4C566A
highlight Directory guifg=#81A1C1
highlight EndOfBuffer guifg=#2E3440
highlight ErrorMsg guifg=NONE
highlight FloatBorder guifg=#434C5E guibg=#2E3440
highlight FloatTitle guifg=#D8DEE9 guibg=#2E3440
highlight FoldColumn guifg=#4C566A guibg=NONE
highlight Folded guifg=#81A1C1 gui=italic
highlight Function guifg=#81A1C1
highlight Identifier guifg=#81A1C1
highlight IncSearch guifg=#2E3440 guibg=#81A1C1
highlight InsertMode guifg=#A3BE8C guibg=NONE gui=reverse
highlight LineNr guifg=#4C566A
highlight MatchParen guifg=#EBCB8B guibg=NONE gui=bold
highlight ModeMsg guifg=#D8DEE9
highlight MoreMsg guifg=#D8DEE9
highlight NonText guifg=#2E3440
highlight Normal guifg=#D8DEE9 guibg=NONE
highlight NormalFloat guifg=#D8DEE9 guibg=#2E3440
highlight NormalMode guifg=#D8DEE9 guibg=NONE gui=reverse
highlight Pmenu guifg=#D8DEE9 guibg=NONE
highlight PmenuExtra guifg=#81A1C1
highlight PmenuExtraSel guifg=#2E3440 guibg=#81A1C1
highlight PmenuKindSel guifg=#2E3440 guibg=#81A1C1
highlight PmenuSbar guibg=#2E3440
highlight PmenuSel guifg=#2E3440 guibg=#81A1C1
highlight PmenuThumb guibg=#4C566A
highlight Question guifg=#A3BE8C
highlight QuickFixLine NONE
highlight ReplacelMode guifg=#BF616A guibg=NONE gui=reverse
highlight Search guibg=#3B4252
highlight SignColumn guifg=#D8DEE9 guibg=NONE
highlight Special guifg=#8FBCBB
highlight SpecialKey guifg=#81A1C1
highlight SpellBad guifg=#BF616A gui=undercurl
highlight SpellCap guifg=#8FBCBB guibg=NONE gui=undercurl
highlight SpellLocal guifg=#81A1C1 guibg=NONE gui=undercurl
highlight SpellRare guifg=#81A1C1 guibg=NONE gui=undercurl
highlight StatusLine guifg=#D8DEE9 guibg=#4c566a
highlight StatusLineNC guifg=#D8DEE9 guibg=#2E3440 
highlight StatusLineTerm guifg=#D8DEE9 guibg=NONE
highlight StatusLineTermNC guifg=#D8DEE9 guibg=NONE
highlight Substitute guifg=#2E3440 guibg=#BF616A
highlight TabLine guifg=#4C566A
highlight TabLineFill NONE
highlight TabLineSel guifg=#4C566A
highlight Title guifg=#D8DEE9 guibg=NONE gui=bold
highlight ToolbarButton guifg=#D8DEE9 guibg=NONE gui=bold
highlight ToolbarLine guifg=#D8DEE9 guibg=#2E3440
highlight VertSplit guifg=#3B4252 guibg=NONE
highlight Visual guifg=#D8DEE9 guibg=#2E3440
highlight VisualMode guifg=#2E3440 guibg=#81A1C1
highlight WarningMsg guifg=#E5E9F0
highlight Warnings guifg=#E5E9F0
highlight WildMenu guifg=#BF616A guibg=NONE gui=bold
highlight WinSeparator guifg=#434C5E guibg=NONE
highlight healthError guifg=#BF616A
highlight healthSuccess guifg=#A3BE8C
highlight healthWarning guifg=#E5E9F0
" }}}

" }}}

" OPTIONS {{{

" 2 moving around, searching and patterns {{{
set ignorecase 
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
set fillchars=vert:\│,foldopen:,foldclose:›,foldsep:\ ,fold:\ ,eob:\ 
set list
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:␣
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
set hlsearch
set termguicolors
" }}}

" 6 multiple windows {{{
set noequalalways
set laststatus=3
set splitbelow
set splitright
" }}}

" 7 multiple tab pages {{{
set showtabline=0
" }}}

" 9 using the mouse {{{
set mouse="nic"
" }}}

" 10 messages and info {{{
set belloff=all
set report=9999
set noruler
set shortmess=ACFISWacs
set noshowcmd 
set showmode
" }}}

" 11 selecting text {{{
set clipboard=unnamedplus
" }}}

" 12 editing text {{{
set complete=.,]
set completeopt=menu,menuone,noinsert,preview
set formatoptions=/1bcjnpqt
set pumheight=5
set noshowmatch
set noundofile
" }}}

" 13 tabs and editing {{{
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
" }}}

" 14 folding {{{
set foldcolumn=0
set foldenable
set foldlevel=999
set foldlevelstart=99
set foldmethod=indent
set foldopen=insert,mark,search,tag
" }}}

" 16 mapping {{{
set timeout
set timeoutlen=500
set ttimeoutlen=10
" }}}

" 17 reading and writing files {{{
set autoread
set nobackup
" }}}

" 18 the swap file {{{
set noswapfile
" }}}

" 20 executing external commands {{{
let &shell = exepath('nu')
" }}}

" 24 various {{{
set conceallevel=0
set gdefault
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
set signcolumn=yes
set viewoptions=cursor,folds
" }}}

" }}}

" KEYMAPS {{{

" Leader {{{
let g:mapleader=" "
let g:maplocalleader="\\"
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
nnoremap <A-Up> :move -2<CR>==
nnoremap <A-Down> :move +1<CR>==

" Keep cursor in place when joining lines
nnoremap J mzJ`z:delmarks z<CR>

" Save file
nnoremap <C-S> :silent! update<CR>
nnoremap q :quit<CR>

" Don't store on register when changing text or deleting a character.
nnoremap C "_C
nnoremap c "_c
nnoremap cc "_cc
nnoremap x "_x
nnoremap X "_X

nnoremap <Tab> za
" }}}

" Insert mode {{{
inoremap <C-S> <C-O>:silent! update<CR>
" }}}

" Visual mode {{{
xnoremap <C-S> :silent! update<CR>
" }}}

" }}}

" vim: foldmethod=marker:foldmarker={{{,}}}:foldlevel=0
