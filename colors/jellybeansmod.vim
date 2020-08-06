" reset current scheme
hi clear
if exists("syntax_on")
  syntax reset
endif

" Based on jellybeans
runtime colors/jellybeans.vim

let g:colors_name = "jellybeansmod"

" enable italics in jellybeans and make comments italic
let g:jellybeans_use_term_italics = 1
highlight Comment cterm=italic

" airline theme (sets automatically, but let's be explicit)
let g:airline_theme = 'jellybeans'

" signcolumn error symbols
highlight ErrorMsg guibg=bg guifg=#bb0000
highlight Error    guibg=bg guifg=#bb0000

" SignColumn background same as global bg
highlight SignColumn      ctermbg=233 guibg=bg

" Spelling
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline gui=undercurl guisp=#ff0000
