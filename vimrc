execute pathogen#infect()

" leader
let mapleader="-"

syntax on
filetype plugin indent on
filetype on
filetype plugin on
set t_Co=256
colorscheme jellybeans
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
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
"set smartcase
set nospell
set cursorline
set nocursorcolumn
set hidden
set colorcolumn=80
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

:set list listchars=tab:\|_,trail:·

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

noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

noremap <F4>      :NERDTreeToggle<CR>

" relative line numbering
noremap <F2>      :set relativenumber!<CR>
set relativenumber

" next and previous buffer
noremap <A-,>    :bp<CR>
noremap <A-.>    :bn<CR>
" switch back and forth between 2 buffers
noremap <A-`>    :b#<CR>

" don't remove indent on comments
inoremap # X<BS>#

" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" Unite bindings
" following two replace scroll up and down without cursor, which I rarely use
noremap <C-B>   :Unite buffer<CR>
noremap <C-F>   :Unite file<CR>

" command line editing
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <A-b> <S-Left>
cnoremap <A-f> <S-Right>

" calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" always show gitgutter column
" nicer for keeping text width and alignment fixed
let g:gitgutter_sign_column_always = 1

" nmodl filetype for hoc and mod
au BufRead,BufNewFile *.hoc,*.mod set filetype=nmodl

" mardown filetype extension
au BufRead,BufNewFile *.md set filetype=markdown

let g:easytags_by_filetype = '~/tags'
