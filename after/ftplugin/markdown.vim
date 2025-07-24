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
setlocal cpo+=J  " two spaces between sentences

" Add support for markdown files in tagbar.
" requires https://github.com/jszakmeister/markdown2ctags
" available in the AUR
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : 'markdown2ctags',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

let g:markdown_fenced_languages = ['python', 'bash=sh', 'yaml', 'crontab', 'go', 'json', 'diff', 'toml']

" Compile to PDF using pandoc (function and binding) {{{
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
noremap  <buffer> <F7>      :w<CR>:!firefox --new-window 'file://%:p'<CR>
inoremap <buffer> <F7> <ESC>:w<CR>:!firefox --new-window 'file://%:p'<CR>
" }}}


" Open PDF (function and binding) {{{
function! OpenPDF()
    let l:pdffile = fnamemodify(fnameescape(expand('%:p')), ":r").".pdf"
    let execstr = "silent !okular --unique ".l:pdffile." &> /dev/null &"
    exec execstr
    echo l:pdffile
    :redraw!
endfunction

nnoremap <buffer> <F9> :call OpenPDF()<CR>
" }}}

" Syntax highlight overrides {{{
highlight link markdownCode Statement
" }}}

" Vim surround bold {{{
let g:surround_{char2nr('b')} = "**\r**"
" }}}


" Section jumping {{{
" Next previous (sub)section
map <buffer> [[ k?^#<CR>:noh<CR>
map <buffer> ]] /^#<CR>:noh<CR>

" Top-level section navigation
map <buffer> [{ k?^#\s<CR>:noh<CR>
map <buffer> ]} /^#\s<CR>:noh<CR>
" }}}
