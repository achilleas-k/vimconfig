" {{{ general options
let g:tex_flavor = "latex"
let maplocalleader = "-"
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
noremap j gj
noremap k gk
setlocal cc=0  " no max length for tex
setlocal wrap
setlocal linebreak
setlocal textwidth=0
setlocal wrapmargin=0
setlocal spell
" }}}

" {{{ forward searching function
" from https://tex.stackexchange.com/questions/71619/how-to-do-forward-search-to-pdf-file-opened-with-okular-from-include-files-when
function! SyncTexForward()
    let s:syncfile = fnamemodify(fnameescape(LatexBox_GetMainFileName()), ":r").".pdf"
    let execstr = "silent !okular --unique ".s:syncfile."\\#src:".line(".").expand("%\:p").' &'
    exec execstr
    echo s:syncfile
endfunction
nnoremap <A-F9> :call SyncTexForward()<CR>
nnoremap <F9> :call SyncTexForward()<CR>
" }}}

" {{{ latex box mappings and options
let g:LatexBox_output_type = 'pdf'
let g:LatexBox_viewer = 'okular --unique'
let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_preview_continuously = 0  " can get annoying
let g:LatexBox_quickfix = 2
let g:LatexBox_show_warnings = 0
let g:LatexBox_Folding = 1

noremap <A-F6>      :w<CR>:Latexmk<CR>
noremap <F6>      :w<CR>:Latexmk<CR>
inoremap <A-F6>     <ESC>:w<CR>:Latexmk<CR>
inoremap <F6>      :w<CR>:Latexmk<CR>

" clean latex junk on close
au BufDelete *.tex,*.latex silent LatexmkClean
au VimLeave *.tex,*.latex silent LatexmkClean

" }}}

" {{{ the following three options fix scrolling lag and unresponsiveness
NoMatchParen
setlocal nocursorline
setlocal nocursorcolumn
setlocal norelativenumber
" }}}

" {{{ tagbar workaround
noremap <C-B>   :TagbarClose<CR>:Unite buffer<CR>
noremap <C-F>   :UniteWithProjectDir file_rec/async<CR>
noremap <C-G>   :TagbarClose<CR>:Unite grep:.<CR>
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
