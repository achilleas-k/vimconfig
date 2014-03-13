"for vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
noremap j gj
noremap k gk
noremap <A-F6> :w<CR>:!pdflatex -synctex=1 -interaction=nonstopmode %<CR>
inoremap <A-F6> <ESC>:w<CR>:!pdflatex -synctex=1 -interaction=nonstopmode %<CR>
noremap <A-F8> :!bibtex %:r.aux<CR>
inoremap <A-F8> <ESC>:!bibtex %:r.aux<CR>
set cc=0  " no max length for tex
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set spell

