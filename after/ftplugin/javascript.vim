setlocal spell
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal autoindent

" eslint requires package.json and complains when I'm just editing a
" standalong file
let g:ale_linters_ignore = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['prettier']}
let g:ale_javascript_prettier_options = '--no-semi'
let g:ale_fix_on_save = 0
