setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2


" {{{ Compile to PDF using pandoc (function and binding)
function! PDFCompile()
    let l:curfile = fnameescape(expand('%:p'))
    let l:outfile = fnamemodify(l:curfile, ":r").".pdf"
    let execstr = "silent !pandoc -f markdown -t latex -o".l:outfile." ".l:curfile
    exec execstr
    echo l:outfile
    :redraw!
endfunction

noremap <A-F6>      :w<CR>:call PDFCompile()<CR>
noremap <F6>      :w<CR>:call PDFCompile()<CR>
inoremap <A-F6>     <ESC>:w<CR>:call PDFCompile()<CR>
inoremap <F6>     <ESC>:w<CR>:call PDFCompile()<CR>
" }}}

" {{{ Open PDF (function and binding)
function! OpenPDF()
    let l:pdffile = fnamemodify(fnameescape(expand('%:p')), ":r").".pdf"
    let execstr = "silent !okular --unique ".l:pdffile." &> /dev/null &"
    exec execstr
    echo l:pdffile
    :redraw!
endfunction
nnoremap <A-F9> :call OpenPDF()<CR>
nnoremap <F9> :call OpenPDF()<CR>
" }}}
