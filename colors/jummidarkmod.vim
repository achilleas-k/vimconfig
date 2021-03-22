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
highlight clear Float
highlight link Float Number
highlight clear Boolean
highlight link Boolean Keyword

" SignColumn background same as global bg
highlight SignColumn      ctermbg=233 guibg=bg

" Spelling
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline gui=undercurl guibg=#330022
highlight SpellRare term=standout guibg=#333300

" Current line number
highlight CursorLineNr guifg=#00d7d7 guibg=bg

" Make IncSearch differ from Search
highlight IncSearch term=reverse ctermbg=237 guibg=#6a6a6a

" unlink diffAdded from Identifier and make it match diff add
highlight diffAdded guifg=#009900
