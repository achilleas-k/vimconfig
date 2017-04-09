" Plugin setup {{{
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'itchyny/calendar.vim', { 'on': 'Calendar' }
Plug 'vim-scripts/python.vim', { 'for': 'python' }
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/denite.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'vim-scripts/TaskList.vim', { 'on': 'TaskList' }
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'achilleas-k/vim-tmux-focus-events'
Plug 'maralla/completor.vim'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow', { 'on': 'RainbowToggle' }
Plug 'lilydjwg/colorizer'
Plug 'w0rp/ale'

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
set list listchars=tab:>·,trail:·,extends:>,precedes:<,nbsp:-
" update stuff quicker (default 4000)
set updatetime=1000
" show keystrokes for combined mappings
set showcmd
" mouse stuff for terminal
set mouse=a
set ttymouse=xterm2  " makes selections fast in tmux

" }}}

" Colours and GUI {{{
set t_Co=256
colorscheme jellybeans
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11
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

" run the cleaner on save for certain types
au BufWritePost *.py Cleanws
" }}}

" Custom mappings {{{
" Buffer swapping
noremap <silent> <leader>`  :b#<CR>

" Key combo timeouts
set timeout
set ttimeout
set timeoutlen=1000
set ttimeoutlen=0

" General {{{
noremap <silent> <A-/> :nohlsearch<CR>
noremap <silent> /   :nohlsearch<CR>

" Previous/Next code block (function, method, etc)
map <A-k> [[
map k   [[
map <A-j> ]]
map j   ]]

inoremap <C-U> <C-G>u<C-U>

nnoremap <space> za
vnoremap <space> zf

noremap <F2>      :set relativenumber!<CR>

" don't remove indent on comments
inoremap # X<BS>#

" error jumping
noremap <leader>e   :lnext<CR>
noremap <leader>E   :lprev<CR>

" tag jumping
noremap     t   :MtaJumpToOtherTag<CR>

" }}}

" Buffer switching {{{
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
" Denite bindings
noremap <C-b>   :Denite buffer<CR>
noremap <C-f>   :DeniteProjectDir file_rec<CR>
noremap <C-g>   :DeniteProjectDir -no-empty grep<CR>

" Tagbar
nmap <silent> <F8> :TagbarToggle<CR>

" Toggle location list
nnoremap <F4> :lwindow<CR>

nnoremap <F5> :UndotreeToggle<CR>

" choosewin
nmap <leader>q <Plug>(choosewin)

" fugitive
nmap <leader>gc :Gwrite<CR>:Gcommit<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gs :Gstatus<CR>

" auto pair
let g:AutoPairsShortcutFastWrap = '<C-e>'

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
let g:easytags_syntax_keyword = 'always'
set regexpengine=1
" }}}

" ALE {{{
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 1
let g:ale_sign_column_always = 1
" }}}

" Undo stuff {{{
set undodir=~/.vim/undodir/
set undofile
" }}}

" Rainbow disabled by default {{{
let g:rainbow_active = 0
" }}}

" SuperTab {{{
let g:SuperTabDefaultCompletionType = "context"
" }}}

" }}}

" Custom filetype extensions {{{
" markdown - probably unnecessary
au BufNewFile,BufReadPost *.md set filetype=markdown
" vue as html
au BufNewFile,BufReadPost *.vue set filetype=html
" }}}

" Set terminal window title {{{
au BufEnter * let &titlestring = 'vim(' . v:servername . '): ' . expand("%:t")
if &term =~ "screen"
    set t_ts=k
    set t_fs=\
endif
if &term =~ "screen" || &term =~ "xterm"
    set title
endif

" vim:fdm=marker
