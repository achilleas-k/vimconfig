" reset current scheme
hi clear
if exists("syntax_on")
  syntax reset
endif

" Based on jellybeans
runtime colors/jummidark.vim

let g:colors_name = "jummidarkmod"

" make comments italic and slightly higher contrast
highlight Comment cterm=italic guifg=#5f5f5f

" kolor airline theme matches (sorta)
let g:airline_theme = 'kolor'

" red error signs with background matching SignColumn
highlight Error      guibg=bg guifg=#bb0000
highlight ErrorMsg   guibg=bg guifg=#bb0000

" lower contrast listchars
highlight SpecialKey guifg=#424242 guibg=bg

" colour literals
highlight Number guifg=#ff33ff
highlight link Float Number

" SignColumn background same as global bg
highlight SignColumn      ctermbg=233 guibg=bg

" Spelling
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline gui=undercurl guifg=#ff00aa
