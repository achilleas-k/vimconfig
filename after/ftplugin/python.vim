" python-jedi {{{
let jedi#auto_initialization = 1
let jedi#force_py_version = 3
let jedi#completions_enabled = 1
let jedi#popup_on_dot = 0
let jedi#auto_vim_configuration = 0
let jedi#use_tabs_not_buffers = 0
let jedi#popup_select_first = 0
let jedi#show_call_signatures = 2 " call signatures in command line
let jedi#smart_auto_mappings = 0 " autoinserts import word
let jedi#auto_close_doc = 1
setlocal noshowmode  " required for call signatures in command line
" }}}

" ALE linters {{{
" set line length to a local variable and use it for linters and colorcolumn
let line_length = 120
let b:ale_linters = {'python': ['ruff', 'pylint', 'pycodestyle', 'mypy', 'jedils']}
let b:ale_python_mypy_options = '--ignore-missing-imports --check-untyped-defs'
" Pylint codes: http://pylint-messages.wikidot.com/all-codes
let g:ale_fixers = {'python': ['isort', 'ruff_format']}
let g:ale_fix_on_save = 1
let g:ale_python_pylint_options = '--disable C0111 --max-line-length=' . line_length
let g:ale_python_pycodestyle_options = '--max-line-length=' . line_length
let g:ale_python_flake8_options = '--max-line-length=' . line_length
let g:ale_python_autopep8_options = '--max-line-length=' . line_length
let g:ale_python_ruff_options = '--line-length=' . line_length
let g:ale_python_ruff_format_options = '--line-length=' . line_length
" }}}

" Mapping {{{
nmap <buffer> <leader>h   :call jedi#show_documentation()<CR>
" }}}

" general {{{
setlocal spell
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal formatoptions=cqj
setlocal foldmethod=indent
setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
execute "setlocal colorcolumn=" . line_length
execute "setlocal textwidth=" . line_length
" }}}

" python specific behaviour and bindings {{{
" don't remove indent on comments
inoremap <buffer> # X<BS>#
" }}}

" gf - jump to file at import {{{
" `gf` jumps to the filename under the cursor (import statement)
" Similar to <leader>d with Jedi, but slightly different handling
python3 << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"setlocal path+=%s" % (p.replace(" ", r"\ ")))
EOF
" }}}

" vim:fdm=marker
