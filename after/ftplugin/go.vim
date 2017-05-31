setlocal foldmethod=syntax

map <silent> <leader>d   :GoDef<CR>
map <silent> <leader>k   :GoDocBrowser<CR>
map <leader>i   :GoImport<space>
map <leader>r   :GoRename<space>
map <leader>c   :GoMetaLinter<CR>
map <leader>h   :GoDoc<CR>

let g:go_fmt_command = "goimports"
let g:go_play_open_browser = 0
" ALE handles automatic linting and checks, but GoMetaLinter can be used manually
let g:go_metalinter_enabled = ['go', 'vet', 'golint', 'errcheck', 'ineffassign', 'staticcheck', 'gosimple']
let g:go_metalinter_deadline = "30s"
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = []

let g:ale_linters = {'go': ['go build', 'gofmt', 'golint', 'gometalinter', 'gosimple', 'go vet', 'staticcheck']}

