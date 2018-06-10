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

map [[ ?{<CR>w99[{:noh<CR>
map ][ /}<CR>b99]}:noh<CR>
map ]] j0[[%/{<CR>:noh<CR>
map [] k$][%?}<CR>:noh<CR>

imap <C-L> <Plug>CompletorCppJumpToPlaceholder
vmap <C-L> <Plug>CompletorCppJumpToPlaceholder
