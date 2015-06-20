let g:pathogen_disabled = ['supertab']
setlocal foldmethod=syntax
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal formatoptions=cqj
setlocal textwidth=78
setlocal colorcolumn=80
setlocal completeopt=menu,menuone
setlocal tags+=~/tags/cpp

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_checkers = ['cppcheck']

let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_jumpto_declaration_key = '<Leader>d'
let g:clang_complete_auto = 1
let g:clang_use_library = 1
