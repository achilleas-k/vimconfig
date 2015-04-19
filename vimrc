" vim:fdm=marker
" Vundle plugin setup {{{
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'gcmt/breeze.vim'
Plugin 'itchyny/calendar.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/python.vim'
Plugin 'wting/rust.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'bling/vim-airline'
Plugin 'xolox/vim-easytags'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'xolox/vim-misc'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'mbbill/undotree'
Plugin 't9md/vim-choosewin'
Plugin 'tommcdo/vim-exchange'
" Plugin 'tomtom/tlib_vim'
" Plugin 'cespare/vim-toml'
" Plugin 'ivanov/vim-ipython'
" Plugin 'MarcWeber/vim-addon-mw-utils'

" Colour schemes
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
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
set tabstop=8
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
"set ignorecase
set smartcase
" I keep toggling spell. Perhaps a hotkey toggle or filetype options
"set spell
set cursorline
set nocursorcolumn
set relativenumber
set hidden
set lazyredraw
set wildmenu
"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=244 guibg=#101010
set foldcolumn=1
set foldlevelstart=99
nnoremap <space> za
vnoremap <space> zf
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
nmap <F8> :TagbarToggle<CR>
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
noremap <A-/> :nohlsearch<CR>
noremap /   :nohlsearch<CR>

noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

noremap <F2>      :set relativenumber!<CR>

" next and previous buffer
noremap <A-,>    :bp<CR>
noremap <A-.>    :bn<CR>
noremap ,      :bp<CR>
noremap .      :bn<CR>
noremap <A-->    :bp<CR>
noremap <A-=>    :bn<CR>
noremap -      :bp<CR>
noremap =      :bn<CR>
" switch back and forth between 2 buffers
noremap <A-`>    :b#<CR>
" same for terminal vim
noremap `      :b#<CR>

" don't remove indent on comments
inoremap # X<BS>#

" Plugin related mappings {{{
" Unite bindings
noremap <C-b>   :Unite buffer<CR>
noremap <C-f>   :UniteWithProjectDir file_rec/async<CR>
noremap <C-g>   :Unite grep:.<CR>

" command line editing
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

" syntastic
nnoremap <F4> :llist<CR>

nnoremap <F5> :UndotreeToggle<CR>

" choosewin
nmap <leader>q <Plug>(choosewin)

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

" Custom filetype extensions {{{
" neuron filetype for mod
au BufRead,BufNewFile *.mod set filetype=NMODL
" neuron hoc files look OK with Java syntax highlighting
au BufReadPost *.hoc,*.ses set syntax=java
" mardown filetype extension
au BufRead,BufNewFile *.md set filetype=markdown
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
