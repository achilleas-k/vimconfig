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

" {{{ vimtex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
noremap <F8>   :VimtexTocToggle<CR>
" }}}

" vim:fdm=marker
