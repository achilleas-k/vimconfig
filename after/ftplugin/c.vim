setlocal foldmethod=syntax
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal formatoptions=cqj
setlocal textwidth=78
setlocal colorcolumn=80

let b:clang_jumpto_declaration_key = '<Leader>d'
let b:clang_complete_auto = 1
let b:clang_use_library = 1
let b:ale_cpp_clangtidy_checks = []
let b:ale_fix_on_save = 1
let b:ale_fixers = {'c': ['clang-format']}

map <buffer> [[ ?{<CR>w99[{:noh<CR>
map <buffer> ][ /}<CR>b99]}:noh<CR>
map <buffer> ]] j0[[%/{<CR>:noh<CR>
map <buffer> [] k$][%?}<CR>:noh<CR>
