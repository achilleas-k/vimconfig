setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal endofline
setlocal conceallevel=0

let b:ale_linters = {'json': ['jq', 'biome']}
let b:ale_fixers = {'json': ['jq']}

let b:ale_fix_on_save = 1
