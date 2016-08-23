map <silent> <leader>d   :GoDef<CR>
map <silent> <leader>k   :GoDoc<CR>
map <leader>i   :GoImport<space>

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_aggregate_errors = 1

