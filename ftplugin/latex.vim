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

" forward searching function
" from https://tex.stackexchange.com/questions/71619/how-to-do-forward-search-to-pdf-file-opened-with-okular-from-include-files-when
function! SyncTexForward()
let s:syncfile = fnamemodify(fnameescape(Tex_GetMainFileName()), ":r").".pdf"
let execstr = "silent !okular --unique ".s:syncfile."\\#src:".line(".").expand("%\:p").' &'
exec execstr
endfunction
nnoremap <A-F9> :call SyncTexForward()<CR>

