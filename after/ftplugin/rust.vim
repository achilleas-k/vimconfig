let b:rustfmt_autosave = 1
let b:ale_linters = ['analyzer', 'rustc']
let b:ale_rust_cargo_use_check = 1  " use check instead of build
let b:ale_rust_cargo_use_clippy = executable('cargo-clippy')

set omnifunc=ale#completion#OmniFunc
