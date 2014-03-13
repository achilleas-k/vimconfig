"for vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
noremap j gj
noremap k gk
noremap <M-F6> :w<CR>:!pdflatex -synctex=1 -interaction=nonstopmode %<CR>
inoremap <M-F6> <ESC>:w<CR>:!pdflatex -synctex=1 -interaction=nonstopmode %<CR>
noremap <M-F8> :!bibtex %:r.aux<CR>
inoremap <M-F8> <ESC>:!bibtex %:r.aux<CR>
set cc=0  " no max length for tex
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set spell

