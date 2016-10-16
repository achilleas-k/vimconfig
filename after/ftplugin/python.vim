" {{{ python-jedi
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 2
let g:jedi#smart_auto_mappings = 0
set completeopt+=noinsert
set noshowmode  " required for call signatures in command line
" }}}

" {{{ syntastic
let g:syntastic_python_checkers = ['pyflakes', 'python']
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
" }}}

" {{{ general
setlocal nospell
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal formatoptions=cqj
setlocal textwidth=78
setlocal foldmethod=indent
setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
setlocal colorcolumn=80
" }}}

" {{{ python specific behaviour and bindings
" don't remove indent on comments
inoremap # X<BS>#

" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" }}}

" {{{ gf - jump to file at import
" `gf` jumps to the filename under the cursor (import statement)
" Similar to <leader>d with Jedi, but slightly different handling
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"setlocal path+=%s" % (p.replace(" ", r"\ ")))
EOF
" }}}

" {{{ breakpoints
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
" }}}

" vim:fdm=marker
