setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal spell
noremap <buffer> j gj
noremap <buffer> k gk
setlocal wrap
setlocal linebreak
setlocal textwidth=0
setlocal wrapmargin=0
setlocal fo-=a

let g:vim_markdown_math = 1

" {{{ Compile to PDF using pandoc (function and binding)
function! CompilePDF()
    let l:curfile = fnameescape(expand('%:p'))
    let l:outfile = fnamemodify(l:curfile, ":r").".pdf"
    let execstr = "silent !pandoc -f markdown -t latex -o".l:outfile." ".l:curfile." &> /dev/null &"
    exec execstr
    echo l:outfile
    :redraw!
endfunction

noremap  <buffer> <F6>      :w<CR>:call CompilePDF()<CR>
inoremap <buffer> <F6> <ESC>:w<CR>:call CompilePDF()<CR>
" }}}

" open in browser {{{
noremap  <buffer> <F7>      :w<CR>:!urlhandler '%:p'<CR>
inoremap <buffer> <F7> <ESC>:w<CR>:!urlhandler '%:p'<CR>
" }}}

" {{{ Open PDF (function and binding)
function! OpenPDF()
    let l:pdffile = fnamemodify(fnameescape(expand('%:p')), ":r").".pdf"
    let execstr = "silent !okular --unique ".l:pdffile." &> /dev/null &"
    exec execstr
    echo l:pdffile
    :redraw!
endfunction

nnoremap <buffer> <F9> :call OpenPDF()<CR>
" }}}
