map <silent> <leader>d   :GoDef<CR>
map <silent> <leader>k   :GoDoc<CR>
map <leader>i   :GoImport<space>

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_aggregate_errors = 1

" GoFmt breaks auto-pair behaviour
let g:go_fmt_autosave = 0

" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_types = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_play_open_browser = 0

