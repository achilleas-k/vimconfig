setlocal foldmethod=syntax
setlocal spell

map <buffer> <silent> <leader>d   :GoDef<CR>
map <buffer> <leader>i   :GoInfo<CR>
map <buffer> <leader>I   :GoImports<CR>
map <buffer> <leader>r   :GoRename<space>
map <buffer> <leader>c   :GoMetaLinter<CR>
map <buffer> <leader>h   :GoDoc<CR>
map <buffer> <leader>H   :GoDocBrowser<CR>

let g:go_fmt_command = "gofmt"
let g:go_play_open_browser = 0
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 0
let g:go_highlight_variable_declarations = 0
let g:go_highlight_variable_assignments = 0

let g:ale_linters = {'go': ['gopls']}

let g:airline#extensions#whitespace#skip_indent_check_ft = {'go': ['mixed-indent-file']}

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_gorename_command = 'gopls'
