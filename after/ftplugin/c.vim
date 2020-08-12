setlocal foldmethod=syntax
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal formatoptions=cqj
setlocal textwidth=78
setlocal colorcolumn=80

let g:clang_jumpto_declaration_key = '<Leader>d'
let g:clang_complete_auto = 1
let g:clang_use_library = 1
let g:ale_cpp_clangtidy_checks = []

map <buffer> [[ ?{<CR>w99[{:noh<CR>
map <buffer> ][ /}<CR>b99]}:noh<CR>
map <buffer> ]] j0[[%/{<CR>:noh<CR>
map <buffer> [] k$][%?}<CR>:noh<CR>

let b:AutoPairsMapCR = 0
imap <buffer> <silent><CR> <CR><Plug>AutoPairsReturn
