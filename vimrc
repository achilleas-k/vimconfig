set nocompatible              " be iMproved, required
filetype off                  " required

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
Plugin 'tomtom/tlib_vim'
Plugin 'Shougo/unite.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'bling/vim-airline'
Plugin 'xolox/vim-easytags'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ivanov/vim-ipython'
Plugin 'xolox/vim-misc'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'tpope/vim-surround'
Plugin 'cespare/vim-toml'
Plugin 'Shougo/vimproc.vim'

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

" Jump to first line if it is a git commit message
autocmd BufReadPost gitcommit exe "normal! gg"

" leader
let mapleader="-"

syntax on
filetype plugin indent on
filetype on
filetype plugin on
set t_Co=256
colorscheme jellybeans
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
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
set hidden
"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=244 guibg=#101010
set foldcolumn=1
set foldlevelstart=99
set guicursor+=a:blinkon0
set guioptions-=r
set guioptions-=m
set guioptions-=T
set guioptions-=L
nnoremap <space> za
vnoremap <space> zf
" for help and docstrings
set splitbelow

" vertical split for diff
set diffopt+=vertical

set list listchars=tab:\|_,trail:·

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

" custom mappings
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

" relative line numbering
noremap <F2>      :set relativenumber!<CR>
set relativenumber

" next and previous buffer
noremap <A-,>    :bp<CR>
noremap <A-.>    :bn<CR>
noremap ,      :bp<CR>
noremap .      :bn<CR>
" switch back and forth between 2 buffers
noremap <A-`>    :b#<CR>
" same for terminal vim
noremap `      :b#<CR>

" don't remove indent on comments
inoremap # X<BS>#

" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Unite bindings
" following two replace scroll up and down without cursor, which I rarely use
noremap <C-B>   :Unite buffer<CR>
noremap <C-F>   :Unite file_rec/async<CR>
noremap <C-G>   :Unite grep:.<CR>

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

" tagbar sorting - default to order of appearance
let g:tagbar_sort = 0
highlight TagbarHighlight guifg=cyan ctermfg=cyan

" calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" always show gitgutter column
" nicer for keeping text width and alignment fixed
let g:gitgutter_sign_column_always = 1

" Custom filetype extensions
" neuron filetype for mod
au BufRead,BufNewFile *.mod set filetype=NMODL
" neuron hoc files look OK with Java syntax highlighting
au BufReadPost *.hoc,*.ses set syntax=java
" mardown filetype extension
au BufRead,BufNewFile *.md set filetype=markdown

" easytags options
let g:easytags_by_filetype = '~/tags'
let g:easytags_include_members = 1
let g:easytags_autorecurse = 0
let g:easytags_events = ['BufWritePost', 'BufReadPost']
let g:easytags_auto_highlight = 0
let g:easytags_async = 1
"let g:easytags_syntax_keyword = 'always'

" syntastic
nnoremap <F4> :llist<CR>

let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_always_populate_loc_list = 1

" run syntastic on load (will do nothing for unsupported types)
au BufWinEnter * SyntasticCheck

normal! gg
