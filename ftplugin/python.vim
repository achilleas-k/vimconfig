"for python-jedi
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
" call signatures are nice but cause input lag - disable if lag (re)appears
let g:jedi#show_call_signatures = 0

" --Disabled to check if other plugins cover this--
" set tags file
" set tags=$HOME/ctags/python.tags
" generate ctags on save
" au BufWritePost *.py silent! !ctags -a --languages=python -f $HOME/ctags/python.tags -R $(pwd) &

" The following was added ages ago and I don't know if it's relevant any more
" See ~/notsotemp on Tessa for related files
" from https://dev.launchpad.net/UltimateVimPythonSetup
"if !exists("autocommands_loaded")
"  let autocommands_loaded = 1
"  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/ftplugin/python/python_ide
"endif

set nospell

" the following currently overlap with ~/.vimrc but they might be removed from
" the global conf
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set formatoptions=cqj
set textwidth=78
set foldmethod=indent
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set colorcolumn=80

" don't remove indent on comments
inoremap # X<BS>#

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"


" `gf` jumps to the filename under the cursor (import statement)
" Similar to <leader>d with Jedi, but slightly different handling
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF


" Use F7/Shift-F7 to add/remove a breakpoint (pdb.set_trace)
python << EOF
def SetBreakpoint():
    import re
    nLine = int( vim.eval( 'line(".")'))

    strLine = vim.current.line
    strWhite = re.search( '^(\s*)', strLine).group(1)

    vim.current.buffer.append(
       "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)

    for strLine in vim.current.buffer:
        if strLine == "import pdb":
            break
    else:
        vim.current.buffer.append( 'import pdb', 0)
        vim.command( 'normal j1')

vim.command( 'map <f7> :py SetBreakpoint()<cr>')

def RemoveBreakpoints():
    import re

    nCurrentLine = int( vim.eval( 'line(".")'))

    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine == "import pdb" or strLine.lstrip()[:15] == "pdb.set_trace()":
            nLines.append( nLine)
        nLine += 1

    nLines.reverse()

    for nLine in nLines:
        vim.command( "normal %dG" % nLine)
        vim.command( "normal dd")
        if nLine < nCurrentLine:
            nCurrentLine -= 1

    vim.command( "normal %dG" % nCurrentLine)

vim.command( "map <s-f7> :py RemoveBreakpoints()<cr>")
EOF

