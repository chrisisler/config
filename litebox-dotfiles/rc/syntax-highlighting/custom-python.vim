" Line below for Estalee work, switching between JS and Python
call clearmatches()

highlight Builtin ctermfg=red
highlight pythonDecorator ctermfg=magenta
highlight pythonConditional ctermfg=magenta
highlight pythonRepeat ctermfg=magenta
" not, and, or
highlight pythonOperator ctermfg=magenta
" def, class
highlight pythonStatement ctermfg=magenta

highlight ControlFlow ctermfg=magenta cterm=underline
call matchadd("ControlFlow", '\<return\>')
call matchadd("ControlFlow", '\<raise\>')

highlight FunctionSyntax ctermfg=darkblue
call matchadd("FunctionSyntax", '\<\h\w*\>\ze(')

highlight NamedArgument ctermfg=red
call matchadd("NamedArgument", '\<\h\w\+\>\ze=')

" highlight Trinkets ctermfg=15
" call matchadd("Trinkets", '[=:]')

highlight Bananas ctermfg=12
call matchadd("Bananas", '[()]')

highlight Braces ctermfg=magenta
call matchadd("Braces", '[{}]')

highlight pythonBuiltin ctermfg=yellow
