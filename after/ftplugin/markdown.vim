setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal spell
noremap j gj
noremap k gk
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

noremap <A-F6>      :w<CR>:call CompilePDF()<CR>
noremap <F6>      :w<CR>:call CompilePDF()<CR>
inoremap <A-F6>     <ESC>:w<CR>:call CompilePDF()<CR>
inoremap <F6>     <ESC>:w<CR>:call CompilePDF()<CR>
" }}}

" open in browser {{{
noremap <A-F7>      :w<CR>:!urlhandler '%:p'<CR>
noremap <F7>      :w<CR>:!urlhandler '%:p'<CR>
inoremap <A-F7>     <ESC>:w<CR>:!urlhandler '%:p'<CR>
inoremap <F7>     <ESC>:w<CR>:!urlhandler '%:p'<CR>
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
