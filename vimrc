" 1 important {{{
" }}}
" 2 moving around, searching and patterns {{{
set cdhome
set nowrapscan
set incsearch
set ignorecase
set smartcase
" }}}
" 3 tags {{{
" }}}
" 4 displaying text {{{
set scrolloff=5
set nowrap
set list
set listchars=
set listchars+=tab:\\u2192\
set listchars+=space:\\u00B7
set listchars+=trail:\\u00B7
set listchars+=nbsp:\\u237D
set listchars+=eol:\\u23CE
set number
" }}}
" 5 syntax, highlighting and spelling {{{
set hlsearch
set cursorline
" }}}
" 6 multiple windows {{{
set laststatus=2
set hidden
" }}}
" 7 multiple tab pages {{{
" }}}
" 8 terminal {{{
" }}}
" 9 using the mouse {{{
" }}}
"10 printing {{{
"}}}
"11 messages and info {{{
"}}}
"12 selecting text {{{
set clipboard+=unnamed,unnamedplus
"}}}
"13 editing text {{{
set showmatch
"}}}
"14 tabs and indenting {{{
"}}}
"15 folding {{{
set foldmethod=syntax
"}}}
"16 diff mode {{{
"}}}
"17 mapping {{{
"}}}
"18 reading and writing files {{{
set autoread
"}}}
"19 the swap file {{{
set noswapfile
"}}}
"20 command line editing {{{
set wildoptions+=pum
"}}}
"21 executing external commands {{{
"}}}
"22 running make and jumping to errors (quickfix) {{{
"}}}
"23 language specific {{{
"}}}
"24 multi-byte characters {{{
"}}}
"25 various {{{
let &viminfo =  &viminfo . ',n' . expand('<script>:p:h') . '/viminfo'
"}}}

filetype plugin indent on
syntax on

if !has('nvim')
  packadd comment
  packadd! editorconfig
endif
packadd nohlsearch
packadd! cfilter
packadd! matchit
