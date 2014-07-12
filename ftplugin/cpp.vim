let g:pathogen_disabled = ['supertab']
set foldmethod=syntax
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set formatoptions=cqj
set textwidth=78
set colorcolumn=80

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_checkers = ['cppcheck']

let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_jumpto_declaration_key = '<Leader>d'
let g:clang_complete_auto = 1
let g:clang_use_library = 1

set completeopt=menu,menuone

set tags+=~/tags/cpp
