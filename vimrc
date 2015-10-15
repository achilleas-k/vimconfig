" Plugin setup {{{
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'itchyny/calendar.vim', { 'on': 'Calendar' }
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': ['latex', 'tex'] }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'vim-scripts/python.vim', { 'for': 'python' }
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'bling/vim-airline'
Plug 'xolox/vim-easytags'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 't9md/vim-choosewin'
Plug 'tommcdo/vim-exchange'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-scripts/TaskList.vim'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
" Plug 'tomtom/tlib_vim'
" Plug 'cespare/vim-toml'
" Plug 'ivanov/vim-ipython'
" Plug 'MarcWeber/vim-addon-mw-utils'

" Colour schemes
Plug 'nanotech/jellybeans.vim'

call plug#end()
" }}}

" Initial cursor positioning {{{
" [copied from vimrc_example.vim]
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Always go to first line for commit messages
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
" }}}

" Syntax and file types {{{
syntax on
filetype plugin indent on
filetype on
filetype plugin on
" }}}

" Common settings {{{
let mapleader="-"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set showmatch
set ruler
set incsearch
set number
set autochdir
set hlsearch
set ignorecase
set smartcase
" I keep toggling spell. Perhaps a hotkey toggle or filetype options
"set spell
set cursorline
set cursorcolumn
set relativenumber
set hidden
set lazyredraw
set wildmenu
set scrolloff=5
set sidescrolloff=5
set winheight=5
set winminheight=5
"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=244 guibg=#101010
set foldcolumn=1
set foldlevelstart=99
" for help and docstrings
set splitbelow
" vertical split for diff
set diffopt+=vertical
set list listchars=tab:\|_,trail:·

" }}}

" Colours and GUI {{{
set t_Co=256
colorscheme jellybeans
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set guicursor+=a:blinkon0
set guioptions-=r
set guioptions-=m
set guioptions-=T
set guioptions-=L

" Spell checker colours and styles
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline gui=undercurl guisp=#ff0000
" }}}

" Whitespace cleaner function {{{
" new improved whitespace cleaner - preserves prev search and cursor pos
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
com! Cleanws call <SID>StripTrailingWhitespaces()
" }}}

" Custom mappings {{{
" General {{{
noremap <A-/> :nohlsearch<CR>
noremap /   :nohlsearch<CR>

inoremap <C-U> <C-G>u<C-U>

nnoremap <space> za
vnoremap <space> zf

noremap <F2>      :set relativenumber!<CR>

" don't remove indent on comments
inoremap # X<BS>#

" error jumping
noremap <leader>e   :lnext<CR>
noremap <leader>E   :lprev<CR>

" }}}

" Buffer switching {{{
nmap <A-1> :b!1<CR>
nmap <A-2> :b!2<CR>
nmap <A-3> :b!3<CR>
nmap <A-4> :b!4<CR>
nmap <A-5> :b!5<CR>
nmap <A-6> :b!6<CR>
nmap <A-7> :b!7<CR>
nmap <A-8> :b!8<CR>
nmap <A-9> :b!9<CR>
nmap <A-0> :b!10<CR>
nmap 1 :b!1<CR>
nmap 2 :b!2<CR>
nmap 3 :b!3<CR>
nmap 4 :b!4<CR>
nmap 5 :b!5<CR>
nmap 6 :b!6<CR>
nmap 7 :b!7<CR>
nmap 8 :b!8<CR>
nmap 9 :b!9<CR>
nmap 0 :b!10<CR>

" next and previous buffer
noremap <silent> <A-,>    :<C-U>exe v:count1."bp"<CR>
noremap <silent> <A-.>    :<C-U>exe v:count1."bn"<CR>
noremap <silent> ,      :<C-U>exe v:count1."bp"<CR>
noremap <silent> .      :<C-U>exe v:count1."bn"<CR>
noremap <silent> <A-->    :<C-U>exe v:count1."bp"<CR>
noremap <silent> <A-=>    :<C-U>exe v:count1."bn"<CR>
noremap <silent> -      :<C-U>exe v:count1."bp"<CR>
noremap <silent> =      :<C-U>exe v:count1."bn"<CR>

" switch back and forth between 2 buffers
noremap <silent> <A-`>    :b#<CR>
noremap <silent> `      :b#<CR>

" }}}

" Split movement {{{
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l
" }}}

" Plugin related mappings {{{
" Unite bindings
noremap <C-b>   :Unite buffer<CR>
noremap <C-f>   :UniteWithProjectDir file_rec/async<CR>
noremap <C-g>   :Unite grep:.<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" syntastic
nnoremap <F4> :llist<CR>

nnoremap <F5> :UndotreeToggle<CR>

" choosewin
nmap <leader>q <Plug>(choosewin)

" fugitive
nmap <leader>gc :Gwrite<CR>:Gcommit<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gs :Gstatus<CR>

" }}}

" command line editing {{{
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <A-b> <S-Left>
cnoremap b <S-Left>
cnoremap <A-f> <S-Right>
cnoremap f <S-Right>
" }}}

" }}}

" Plugin related settings {{{
" Airline {{{
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" }}}

" Tagbar {{{
" tagbar sorting - default to order of appearance
let g:tagbar_sort = 0
highlight TagbarHighlight guifg=cyan ctermfg=cyan
" }}}

" Calendar {{{
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
" }}}

" Gitgutter {{{
" always show gitgutter column
let g:gitgutter_sign_column_always = 1
" }}}

" Easytags options {{{
let g:easytags_by_filetype = '~/tags'
let g:easytags_include_members = 1
let g:easytags_autorecurse = 0
let g:easytags_events = ['BufWritePost', 'BufReadPost']
let g:easytags_auto_highlight = 0
let g:easytags_async = 1
"let g:easytags_syntax_keyword = 'always'
" }}}

" Syntastic {{{
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_always_populate_loc_list = 1

" run syntastic on load (will do nothing for unsupported types)
au BufWinEnter * SyntasticCheck
" }}}

" Undo stuff {{{
set undodir=~/.undodir/
set undofile
" }}}
" }}}

" Custom filetype extensions {{{
" neuron filetype for mod
au BufNewFile,BufReadPost *.mod set filetype=NMODL
" neuron hoc files look OK with Java syntax highlighting
au BufNewFile,BufReadPost *.hoc,*.ses set syntax=java
" markdown - probably unnecessary
au BufNewFile,BufReadPost *.md set filetype=markdown
" }}}
"
" " Set terminal window title {{{
au BufEnter * let &titlestring = 'vim(' . v:servername . '): ' . expand("%:t")
if &term =~ "screen"
    set t_ts=k
    set t_fs=\
endif
if &term =~ "screen" || &term =~ "xterm"
    set title
endif

" vim:fdm=marker
