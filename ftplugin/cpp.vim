set foldmethod=syntax
set tags=$HOME/ctags/cpp.tags
" generate ctags on save
au BufWritePost *.c,*.cpp,*.h silent! !ctags --languages=C,C++ -a -f $HOME/ctags/cpp.tags -R $(pwd) &

