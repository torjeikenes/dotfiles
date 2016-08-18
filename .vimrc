set nocompatible              " required
filetype off                  " required
filetype plugin on

" Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'lifepillar/vim-solarized8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'terryma/vim-expand-region'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vimwiki/vimwiki'
Plugin 'rking/ag.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'vim-pandoc/vim-pandoc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}
" Leader {{{
let mapleader = "\<Space>"

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>z :wq<CR>
nnoremap <Leader>g :Goyo<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" }}}
" Colors {{{
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
colorscheme solarized
let python_highlight_all=1
syntax on
" }}} 
" Split {{{
set splitbelow
set splitright
" }}}
" Folding {{{
"Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the leader F
nnoremap <leader>f za
let g:SimpylFold_docstring_preview=1
" }}}
" Tabs & Spaces {{{
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set encoding=utf-8
" }}}
" NERDTree {{{
map <C-n> :NERDTreeToggle<CR>
" }}}
" UI {{{
set nu
set rnu
set cursorline
" }}}
" CTRLP {{{
let g:ctrlp_show_hidden = 1

" }}}
" Powerline {{{
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
" }}}
" Search {{{
" Search with / , replace with cs , n.n. to replace following
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>
" }}}
" Paste {{{
vnoremap <silent> y y`]
vnoremap <silent> p p`]
noremap gV `[v`]
" }}}
" Navigation {{{
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enter is G, backspace is gg
nnoremap <CR> G
nnoremap <BS> gg

" Fixes backspace
set backspace=2
" }}}
" Organization {{{
set foldmethod=marker
set foldlevel=0
set modelines=1
" }}}
" VimWiki {{{
" let g:vimwiki_list = [{'path': '$HOME/Dropbox/notes', "path_html": '~/Dropbox/notes/notes_html/index.html', "syntax": 'markdown', "ext": '.md'}]

let g:vimwiki_list = [{"path": '$HOME/Dropbox/skole1617/notes', "path_html": '$HOME/Dropbox/skole1617/notes_html', "syntax": 'markdown', "ext": '.md', "css_file": '$HOME/Dropbox/skole1617/notes_html/style.css', "auto_export": 1}]

" }}}
" Fonts {{{
if has('gui_running')
  set guifont=Consolas:h10
endif  
" }}}
" Swap File{{{
set shortmess+=A
" }}}
