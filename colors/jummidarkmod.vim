" reset current scheme
hi clear
if exists("syntax_on")
  syntax reset
endif

" Based on jellybeans
runtime colors/jummidark.vim

" make comments italic and slightly higher contrast
highlight Comment cterm=italic guifg=#777777

" kolor airline theme matches (sorta)
let g:airline_theme = 'kolor'

" red error signs with background matching SignColumn
highlight Error      guibg=#383838 guifg=#bb0000
highlight ErrorMsg   guibg=#383838 guifg=#bb0000
