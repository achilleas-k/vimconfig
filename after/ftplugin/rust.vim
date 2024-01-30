let b:rustfmt_autosave = 1
let b:ale_linters = ['analyzer']
let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }
let b:ale_rust_cargo_use_check = 1  " use check instead of build
let b:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let b:ale_completion_enabled = 1

map <buffer> <leader>d   :tag <C-R>=expand('<cword>')<CR><CR>

set omnifunc=ale#completion#OmniFunc
