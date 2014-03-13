set foldmethod=syntax
set tags=$HOME/ctags/c.tags
" generate ctags on save
au BufWritePost *.c,*.cpp,*.h silent! !ctags -a --languages=C,C++ -f $HOME/ctags/c.tags -R $(pwd) &

