setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

let g:vim_markdown_math = 1

" {{{ Compile to PDF using pandoc (function and binding)
function! CompilePDF()
    let l:curfile = fnameescape(expand('%:p'))
    let l:outfile = fnamemodify(l:curfile, ":r").".pdf"
    let execstr = "silent !pandoc -f markdown -t latex -o".l:outfile." ".l:curfile
    exec execstr
    echo l:outfile
    :redraw!
endfunction

noremap <A-F6>      :w<CR>:call CompilePDF()<CR>
noremap <F6>      :w<CR>:call CompilePDF()<CR>
inoremap <A-F6>     <ESC>:w<CR>:call CompilePDF()<CR>
inoremap <F6>     <ESC>:w<CR>:call CompilePDF()<CR>
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
