" indentation rules can get weird in gitrebase
" disable autondent on line move

" Move line(s) up or down
nnoremap <silent><c-n> :m .+1<cr>
nnoremap <silent><c-p> :m .-2<cr>
vnoremap <silent><c-n> :m '>+1<cr>
vnoremap <silent><c-p> :m '<-2<cr>
