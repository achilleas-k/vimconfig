setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal endofline
setlocal conceallevel=0

let g:ale_linters = {'json': ['jq', 'biome']}
let g:ale_fixers = {'json': ['jq']}

let g:ale_fix_on_save = 1
