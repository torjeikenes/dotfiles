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
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'sheerun/vim-polyglot'
Plugin 'joshdick/onedark.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'alvan/vim-closetag'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'morhetz/gruvbox'
Plugin 'vim-pencil'
Plugin 'suan/vim-instant-markdown'
Plugin 'arcticicestudio/nord-vim'
Plugin 'aperezdc/vim-template'
Plugin 'fmoralesc/vim-pad'
Plugin 'ap/vim-css-color'
Plugin 'morganp/vim-projector'
Plugin 'chriskempson/base16-vim'

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
nnoremap <Leader>b :setlocal spell spelllang=nb<CR>
nnoremap <Leader>y :setlocal spell spelllang=nn<CR>
nnoremap <Leader>u :setlocal spell spelllang=en_us<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>

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
let base16colorspace=256
let python_highlight_all=1
syntax on
" let g:onedark_termcolors=256
colorscheme base16-tomorrow-night
set background=dark

au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino
au! BufRead,BufNewFile *.markdown set filetype=mkd
au! BufRead,BufNewFile *.md       set filetype=mkd

" }}} 
" Cursor {{{
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;grey\x7"
  silent !echo -ne "\033]12;grey\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif 

" }}}
" Split {{{
set splitbelow
set splitright
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" }}}
" Folding {{{
"Enable folding
set foldmethod=syntax
set foldlevel=99

" Enable folding with the leader F
nnoremap <leader>f za
let g:SimpylFold_docstring_preview=1
" }}}
" Tabs & Spaces {{{
set tabstop=4 |
set softtabstop=4 |
set shiftwidth=4 |
set textwidth=79 |
set expandtab |
set autoindent |
set fileformat=unix

"place in vimrc
"shift line forward (Ctrl-Shift-Tab for backward shift)
nmap <C-Tab> i_<Esc>mz:set ve=all<CR>o<C-o>`z<Down>_<Esc>:exe "normal >>"<CR>my`z:exe "normal >>"<CR>`y<Up>mz<Down>dd`z:set ve=<CR>i<Del><Right><Esc>
nmap <C-S-Tab> i_<Esc>mz:set ve=all<CR>o<C-o>`z<Down>_<Esc>:exe "normal <<"<CR>my`zi<Del><Esc>:exe "normal <<"<CR>`y<Up>mz<Down>dd`z:set ve=<CR>:<Del>
imap <C-Tab> _<Esc>mz:set ve=all<CR>o<C-o>`z<Down>_<Esc>:exe "normal >>"<CR>my`z:exe "normal >>"<CR>`y<Up>mz<Down>dd`z:set ve=<CR>i<Del>
imap <C-S-Tab> _<Esc>mz:set ve=all<CR>o<C-o>`z<Down>_<Esc>:exe "normal <<"<CR>my`zi<Del><Esc>:exe "normal <<"<CR>`y<Up>mz<Down>dd`z:set ve=<CR>i

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set encoding=utf-8
au BufNewFile,BufRead *.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.md
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set fileformat=unix

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
let g:ctrlp_map = '<c-p>'


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

" Jump to EOL while in insert
inoremap <C-e> <C-o>A

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

let g:vimwiki_list = [{"path": '$HOME/Dropbox/skole/notes', "path_html": '$HOME/Dropbox/skole/notes_html', "syntax": 'markdown', "ext": '.md', "css_file": '$HOME/Dropbox/skole/notes_html/style.css'}]

let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey= '<leader>p'
" }}}
" Fonts {{{
if has('gui_running')
  set guifont=Consolas:h10
endif  
set nospell
" }}}
" Swap File{{{
set shortmess+=A
" }}}
" Hardmode{{{
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
" }}}
" Vim Pencil{{{
set nocompatible
filetype plugin on       " may already be in your .vimrc

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:pencil#textwidth = 74

augroup pencil
  autocmd!
  autocmd FileType markdown,md  call pencil#init()
  autocmd FileType text,txt         call pencil#init({'wrap': 'hard'})
augroup END
" }}}
" Tables{{{
let g:table_mode_corner_corner = '|'
let g:table_mode_header_fillchar = '-'
let g:table_mode_corner='|'

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" }}}
" notes{{{
let g:pad#dir = "~/notes/notestest"
let g:pad#local_dir = "notestest"
let g:pad#default_format = "markdown"


" }}}
