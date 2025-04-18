if has('python3')
endif
" Plugin setup {{{
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter', { 'branch': 'main' }
Plug 'xolox/vim-misc'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'vim-scripts/python.vim', { 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'okcompute/vim-python-motions', { 'for': 'python' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'tommcdo/vim-exchange'
Plug 'Valloric/MatchTagAlways'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'lifepillar/vim-mucomplete'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'fatih/vim-go', { 'for': ['go', 'gohtmltmpl'] }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'LunarWatcher/auto-pairs'
Plug 'luochen1990/rainbow', { 'on': 'RainbowToggle' }
Plug 'lilydjwg/colorizer',  { 'on': 'ColorHighlight' }
Plug 'w0rp/ale'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-rooter'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'rip-rip/clang_complete'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'kshenoy/vim-signature'
Plug 'machakann/vim-highlightedyank'
Plug 'ledger/vim-ledger', { 'for': 'ledger' }
Plug 'rhysd/conflict-marker.vim'
Plug 'vim-scripts/haproxy'
Plug 'ryanoasis/vim-devicons'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'vim-scripts/BufOnly.vim'
Plug 'gerw/vim-hilinktrace'
Plug 'mtth/scratch.vim'
Plug 'will133/vim-dirdiff'
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'hashivim/vim-terraform'
Plug 'wellle/context.vim'

" Colour schemes
Plug 'nanotech/jellybeans.vim'
Plug 'arcticicestudio/nord-vim', { 'branch': 'main' }
Plug 'jcherven/jummidark.vim', { 'branch': 'main' }
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'artanikin/vim-synthwave84'

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

" Always go to first line for commit and tag messages
autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
autocmd FileType gitcommit au! BufEnter TAG_EDITMSG call setpos('.', [0, 1, 1, 0])
" }}}

" Syntax and file types {{{
syntax on
filetype plugin indent on
filetype on
filetype plugin on

autocmd BufRead,BufNewFile haproxy* set ft=haproxy

" }}}

" Common settings {{{
let mapleader=" "
let maplocalleader=";"
set modeline
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set showmatch
set ruler
set incsearch
set number
set relativenumber
set hlsearch
set ignorecase
set smartcase
set spell
set cursorline
set nocursorcolumn
set hidden
set lazyredraw
set wildmenu
set wildmode=list:full
set scrolloff=5
set sidescrolloff=5
set winheight=5
set winminheight=5
set nofixendofline
set history=10000
set viminfo+=:10000
set visualbell
set noshowmode
set conceallevel=0

" format options: global defaults
" some of these are (un)set by default, but I specify explicitly for clarity
" and portability
" individual filetypes edit these in the after/plugin scripts
set formatoptions+=n  " recognise numbered lists
set formatoptions+=j  " remove comment leader when joining lines
set formatoptions+=p  " don't break lines at single spaces that follow periods (pairs with cpo-J)
set formatoptions+=l  " don't break long lines when entering insert mode
set formatoptions+=q  " allow formatting of comments with gq (and gw)
set formatoptions-=r  " don't automatically insert comment leader on return
set formatoptions-=o  " don't automatically insert comment leader on 'o' or 'O'

set cpoptions+=J  " two spaces between sentences

"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=244 guibg=#101010
set foldcolumn=1
set foldlevelstart=99
" put new splits below and vsplits right
set splitbelow
set splitright
" vertical split for diff
set diffopt+=vertical
" ignore whitespace and blank lines for diff
set diffopt+=iwhiteeol,iblank
" formatting characters
set list listchars=tab:>\ ,trail:·,extends:>,precedes:<,leadmultispace:\|\ \ \ ,nbsp:-
set fillchars+=vert:│
set showbreak=↳
" update stuff quicker (default 4000)
set updatetime=1000
" don't show keystrokes
set noshowcmd
" mouse stuff for terminal
set mouse=a
if !has('nvim')
    " not supported in neovim
    set ttymouse=xterm2  " makes selections fast in tmux
endif
" never autoinsert a completion option
set completeopt=menuone
" move beyond end of line in block selection mode
set virtualedit=block
" always show sign column (used by gitgutter)
set signcolumn=yes

" for manually installed help
" (disabled because no custom help files)
" helptags ~/.vim/doc

" vim cache root dir
let $vimcachedir = expand('~/.cache/vim')
let &g:directory=$vimcachedir

" Undo directory
set undodir=$vimcachedir/undo
set undofile

" cursor shapes
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
autocmd VimLeave *  call system('printf "\e[5 q" > $TTY')

" }}}

" Colours and GUI {{{
" This is only necessary for termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" fixes glitch? in colors when using vim with tmux
set background=dark
set t_Co=256
set termguicolors

" Use :so $VIMRUNTIME/syntax/hitest.vim to preview
let $colorscheme = 'jummidarkmod'
colorscheme $colorscheme
set guifont=monospace\ 11
set guicursor+=a:blinkon0
set guioptions-=r
set guioptions-=m
set guioptions-=T
set guioptions-=L

" Common highlight overrides {{{

" Highlight word under cursor passively (with custom style)
highlight MatchWord term=reverse ctermfg=69 guifg=#1188FF
autocmd CursorMoved,InsertLeave * exe printf('match MatchWord /\V\<%s\>/', escape(expand('<cword>'), '/\'))
autocmd InsertEnter * match none

" }}}

" Make the quickfix window fullwidth
autocmd filetype qf wincmd J

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
autocmd BufWritePre *.py,*.tex,*.txt Cleanws
" }}}

" Custom mappings {{{

" Key combo timeouts {{{
set timeout
set ttimeout
set timeoutlen=1000
set ttimeoutlen=0
" }}}

" General {{{

" Buffer swapping
noremap <silent> <leader>`  :b#<CR>

" Next/previous buffer
noremap <silent> <leader>]  :bn<CR>
noremap <silent> <leader>[  :bp<CR>

" Close buffer
noremap <silent> <leader>x :bd<CR>

" Close all other buffers
noremap <silent> <leader>o :BufOnly<CR>

" C-c as escape from insert mode
noremap <C-c> <esc>
inoremap <C-c> <esc>

" Shift return (insert mode) adds new line regardless of cursor pos
inoremap OM  <c-o>o

" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" Common setting toggles
noremap <silent><leader>/ :nohlsearch<CR>
noremap <silent><leader>s :set spell!<CR>
noremap <silent><leader>p :set paste!<CR>
noremap <silent><leader>w :set wrap!<CR>
noremap <silent><leader>l :set cursorline!<CR>
noremap <silent><leader>L :set cursorcolumn!<CR>
noremap <silent><leader>n :set relativenumber!<CR>
noremap <silent><leader>\ :set incsearch!<CR>:set incsearch?<CR>

" Yank whole buffer to system clipboard
noremap <silent><leader>Y :%y+<CR>:echo "Buffer copied to clipboard"<CR>

" Previous/next code block (function, method, etc)
nmap <leader>k [[
nmap <leader>j ]]
vmap <leader>k [[
vmap <leader>j ]]

" Move line(s) up or down
nnoremap <silent><c-n> :m .+1<cr>==
nnoremap <silent><c-p> :m .-2<cr>==
vnoremap <silent><c-n> :m '>+1<cr>gv=gv
vnoremap <silent><c-p> :m '<-2<cr>gv=gv

" Quickfix
command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry
nnoremap <silent><leader>qn :Cnext<cr>
nnoremap <silent><leader>qp :Cprev<cr>
nnoremap <silent><leader>qq :cclose<cr>

" Fold and unfold with +
nnoremap + za
vnoremap + zf

" Select whole line without newline
noremap <leader>v   0vg_

" :W aliases for :w since I accidentally type it so much
command W  :w
command Wq :wq

" Scratch window
noremap  ¬           :Scratch<CR>
" noremap  <leader>si  :ScratchInsert<CR>
" noremap  <leader>sp  :ScratchPreview<CR>
" vnoremap <leader>sv  :ScratchSelection<CR>
" }}}

" Splits {{{
noremap <leader>- :split<CR>
noremap <leader>= :vsplit<CR>
" }}}

" Plugin related mappings {{{

" FZF mappings
noremap <c-k>  :Buffers<CR>
noremap <c-f><c-b>  :Buffers<CR>
noremap <c-f><c-c>  :Commits<CR>
noremap <c-f><c-f>  :AgF<SPACE>
noremap <c-f><c-g>  :Ag<SPACE>
noremap <c-f><c-i>  :GFiles<CR>
noremap <c-f><c-m>  :Marks<CR>
noremap <c-f><c-o>  :Files<CR>
noremap <c-f><c-r>  :BTags<CR>
noremap <c-f><c-t>  :Tags<CR>
noremap <c-f><c-w>  :Windows<CR>
let g:fzf_action = {'ctrl-h': 'split', 'ctrl-v': 'vsplit'}

" Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <leader>bt :TagbarToggle<CR>

nnoremap <silent> <F5> :UndotreeToggle<CR>
nnoremap <silent> <leader>bu :UndotreeToggle<CR>

" auto pair
let g:AutoPairsMapBS = 1
let g:AutoPairsMultilineClose = 1
let g:AutoPairsFlyMode = 0

" Error jumping (ALE)
noremap <leader>e   :ALENext<CR>
noremap <leader>E   :ALEPrevious<CR>
" noremap <leader>n   :lnext<CR>
" noremap <leader>p   :lprev<CR>

" Tag jumping (MatchTagAlways)
noremap <leader>m   :MtaJumpToOtherTag<CR>

" Hunk jumping
noremap <leader>hc   :GitGutterNextHunk<CR>
noremap <leader>hC   :GitGutterPrevHunk<CR>

imap <c-n> <plug>(MUcompleteFwd)

" fugitive
noremap <leader>B    :GBrowse<CR>
noremap <leader>gs   :Git status<CR>
noremap <leader>gb   :Git blame<CR>
noremap <leader>gd   :Gdiff<CR>

" context
noremap <leader>f   :ContextToggle<CR>
" }}}

" command line editing {{{
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
" }}}

" scroll and cursor bind shortcuts{{{
nnoremap <leader>bs  :windo set scrollbind!<cr>
nnoremap <leader>bc  :windo set cursorbind!<cr>
" }}}

" EasyAlign {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Switch to Greek input and spell checking
command Greek :set keymap=greek | :set spelllang=en,el

" }}}

" Plugin related settings {{{

" Airline {{{
set laststatus=2
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#current_first = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tagbar#flags = 'f'  " show full tag hierarchy

let g:airline_left_sep = '' " '┃'
let g:airline_right_sep = '' " '┃'
let g:airline_inactive_collapse = 0
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ':'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ':'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = '···'
" }}}

" Tagbar {{{
" tagbar sorting - default to order of appearance
let g:tagbar_sort = 0
highlight TagbarHighlight guifg=cyan ctermfg=cyan
" }}}

" Calendar {{{
let g:calendar_google_calendar = 1
let g:calendar_google_task = 0
" }}}

" Gitgutter {{{

" colours
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" }}}

" GutenTags {{{
let g:gutentags_cache_dir = $vimcachedir . '/tags'
let g:gutentags_generate_on_empty_buffer = 1
" }}}

" ALE {{{
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 1
let g:ale_sign_column_always = 1
" }}}

" Rainbow disabled by default {{{
let g:rainbow_active = 0
" }}}

" Set terminal window title {{{
autocmd BufEnter * let &titlestring = 'vim(' . v:servername . '): ' . expand("%:t")
if &term =~ "screen"
    set t_ts=k
    set t_fs=\
endif
if &term =~ "screen" || &term =~ "xterm"
    set title
endif
" }}}

" Multichar surround function {{{
let g:surround_{char2nr('m')} = "\1Surround: \1\r\1\1"
let g:surround_{char2nr('M')} = "\1S-Open: \1\r\2S-Close: \2"
" }}}

" FZF styling and customizations {{{
if exists('$TMUX')
    let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

let $FZF_PREVIEW_COMMAND="COLORTERM=truecolor bat --theme='Coldark-Dark' --style=numbers --color=always {}"

" set colours for ag
command! -bang -nargs=+ -complete=file Ag call fzf#vim#ag_raw('--hidden --color-line-number "1;37" --color-match "30;36" --color-path "1;35" '.shellescape(<q-args>), <bang>0)
" fixed string version of ag
command! -bang -nargs=+ -complete=file AgF call fzf#vim#ag_raw('--hidden --color-line-number "1;37" --color-match "30;36" --color-path "1;35" --fixed-strings '.shellescape(<q-args>), <bang>0)

" }}}

" Mucomplete options {{{
let g:mucomplete#can_complete = {}
let g:mucomplete#can_complete.go = {'omni': { t -> t =~ '\m\%(\k\k\|\.\)$' }}
let g:mucomplete#can_complete.python = {'omni': { t -> t =~ '\m\%(\k\k\|\.\)$' }}
let g:mucomplete#can_complete.rust = {'omni': { t -> t =~ '\m\%(\k\k\|\.\|::\)$' }}
let g:mucomplete#chains = {}
let g:mucomplete#chains.go = ['path', 'omni']
let g:mucomplete#chains.python = ['path', 'omni']
let g:mucomplete#chains.rust = ['path', 'omni']
let g:mucomplete#chains.gitcommit = ['path', 'keyn', 'dict', 'uspl']  " omni in gitcommit is set by rhubarb to complete github issues/PRs, which I don't use
" }}}

" shorter highlightedyank highlight duration
let g:highlightedyank_highlight_duration = 150

" Use half the screen height for scratch {{{
let g:scratch_height = 0.5
" }}}

" Reload config command {{{
com! Reload source ~/.vim/colors/$colorscheme.vim <bar> source ~/.vim/vimrc
" }}}
" }}}
" vim:fdm=marker
