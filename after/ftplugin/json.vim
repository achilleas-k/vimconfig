setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

let g:ale_linters = {'json': ['jq']}
let g:ale_fixers = {'json': ['jq']}

let g:ale_fix_on_save = 1
