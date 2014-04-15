set foldmethod=syntax
set tags=$HOME/ctags/cpp.tags
" generate ctags on save
au BufWritePost *.c,*.cpp,*.h silent! !ctags --languages=C,C++ -a -f $HOME/ctags/cpp.tags -R $(pwd) &

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set formatoptions=caqj
set textwidth=78

