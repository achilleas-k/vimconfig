setlocal foldmethod=syntax

map <silent> <leader>d   :GoDef<CR>
map <silent> <leader>k   :GoDocBrowser<CR>
map <leader>i   :GoImport<space>
map <leader>r   :GoRename<space>
" map <leader>c   :GoMetaLinter<CR>
map <leader>h   :GoDoc<CR>

let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes' : ['go']}
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1

" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_types = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_play_open_browser = 0
" let g:go_list_type = 'quickfix'
" let g:go_metalinter_enabled = ['go', 'vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['go', 'vet', 'golint', 'errcheck']

" let syntastic handle linting
let g:go_metalinter_enabled = []
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = []

