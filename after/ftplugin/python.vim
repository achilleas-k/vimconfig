" {{{ python-jedi
" disabling completion for completor
" this makes most of the other opts redundant
let g:jedi#completions_enabled = 0
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#auto_close_doc = 1
set completeopt+=noinsert
set noshowmode  " required for call signatures in command line
" }}}

" ALE linters {{{
let g:ale_linters = {'python': ['flake8', 'pylint', 'mypy']}
" }}}

" {{{ general
setlocal nospell
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal formatoptions=cqj
setlocal textwidth=78
setlocal foldmethod=indent
setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
setlocal colorcolumn=80
" }}}

" {{{ python specific behaviour and bindings
" don't remove indent on comments
inoremap # X<BS>#

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" }}}

" {{{ gf - jump to file at import
" `gf` jumps to the filename under the cursor (import statement)
" Similar to <leader>d with Jedi, but slightly different handling
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"setlocal path+=%s" % (p.replace(" ", r"\ ")))
EOF
" }}}

" vim:fdm=marker
