setlocal foldmethod=syntax
setlocal spell

map <buffer> <silent> <leader>d   :GoDef<CR>
map <buffer> <leader>i   :GoInfo<CR>
map <buffer> <leader>r   :GoRename<space>
map <buffer> <leader>c   :GoMetaLinter<CR>
map <buffer> <leader>h   :GoDoc<CR>

let g:go_fmt_command = "goimports"
let g:go_play_open_browser = 0
let g:go_metalinter_enabled = ['go', 'vet', 'golint', 'errcheck', 'ineffassign', 'staticcheck', 'gosimple']
let g:go_metalinter_deadline = "1s"
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = []
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 0
let g:go_highlight_variable_declarations = 0
let g:go_highlight_variable_assignments = 0

" let g:ale_linters = {'go': ['go build', 'gofmt', 'golint', 'gometalinter', 'gosimple', 'go vet', 'staticcheck']}
let g:ale_linters = {'go': ['gometalinter']}
let g:ale_go_gometalinter_options = '--fast --disable=gas --deadline=1s'
