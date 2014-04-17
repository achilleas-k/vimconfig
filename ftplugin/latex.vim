let g:tex_flavor = "latex"
noremap j gj
noremap k gk
"noremap <A-F6> :w<CR>:!pdflatex -synctex=1 -interaction=nonstopmode %<CR>
"inoremap <A-F6> <ESC>:w<CR>:!pdflatex -synctex=1 -interaction=nonstopmode %<CR>
"noremap <A-F8> :!bibtex %:r.aux<CR>
"inoremap <A-F8> <ESC>:!bibtex %:r.aux<CR>
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
echo s:syncfile
endfunction
nnoremap <A-F9> :call SyncTexForward()<CR>

" latex box mappings and variables
let g:LatexBox_output_type = 'pdf'
let g:LatexBox_viewer = 'okular --unique'
let g:LatexBox_latexmk_async = 0
let g:LatexBox_latexmk_preview_continuously = 0  " can get annoying
let g:LatexBox_quickfix = 2
let g:LatexBox_show_warnings = 0

noremap <A-F6>      :w<CR>:Latexmk<CR>
inoremap <A-F6>     <ESC>:w<CR>:Latexmk<CR>
"noremap <A-F9>      :LatexView<CR>

" clean latex junk on close
au BufDelete *.tex,*.latex silent LatexmkClean
au VimLeave *.tex,*.latex silent LatexmkClean

