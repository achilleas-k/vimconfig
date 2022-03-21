setlocal foldmethod=syntax
setlocal spell

map <buffer> <leader>d   :GoDef<CR>
map <buffer> <leader>i   :GoInfo<CR>
map <buffer> <leader>I   :GoImports<CR>
map <buffer> <leader>r   :GoRename<space>
map <buffer> <leader>c   :GoCallers<CR>
map <buffer> <leader>t   :GoImplements<CR>
map <buffer> <leader>h   :GoDoc<CR>
map <buffer> <leader>H   :GoDocBrowser<CR>

let b:go_fmt_command = "gofmt"
let b:go_play_open_browser = 0
let b:go_highlight_types = 1
let b:go_highlight_operators = 1
let b:go_highlight_functions = 1
let b:go_highlight_function_arguments = 1
let b:go_highlight_fields = 1
let b:go_highlight_format_strings = 0
let b:go_highlight_variable_declarations = 0
let b:go_highlight_variable_assignments = 0
let b:ale_go_golangci_lint_package = 1

let b:ale_linters = {'go': ['gopls']}

let g:airline#extensions#whitespace#skip_indent_check_ft = {'go': ['mixed-indent-file']}

let b:go_def_mode='gopls'
let b:go_info_mode='gopls'
let b:go_imports_mode='gopls'

let b:go_rename_command = 'gopls'
