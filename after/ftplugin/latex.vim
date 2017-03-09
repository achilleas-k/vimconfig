" {{{ general options
let g:tex_flavor = "latex"
noremap j gj
noremap k gk
setlocal cc=0  " no max length for tex
setlocal wrap
setlocal linebreak
setlocal textwidth=0
setlocal wrapmargin=0
setlocal spell
" }}}

" {{{ the following three options fix scrolling lag and unresponsiveness
NoMatchParen
setlocal nocursorline
setlocal nocursorcolumn
setlocal norelativenumber
" }}}

" {{{ tags for tex
let g:tagbar_type_tex = {
    \ 'ctagstype' : 'latex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0,
    \ 'deffile' : expand('<sfile>:p:h:h') . '/tagdef/latex'
\ }
" }}}

" vim:fdm=marker
