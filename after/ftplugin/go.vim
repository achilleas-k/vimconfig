map <silent> <leader>d   :GoDef<CR>
map <silent> <leader>k   :GoDocBrowser<CR>
map <leader>i   :GoImport<space>
map <leader>r   :GoRename<space>
map <leader>c   :GoMetaLinter<CR>
map <leader>e   :cnext<CR>
map <leader>E   :cprev<CR>

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_aggregate_errors = 1

" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_types = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_play_open_browser = 0

setlocal foldmethod=syntax
