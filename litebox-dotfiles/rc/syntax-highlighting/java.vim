call clearmatches()

highlight FunctionSyntax ctermfg=darkblue
call matchadd("FunctionSyntax", '\<\h\w*\>\ze(')

" highlight CapitalNamespace ctermfg=darkred
" call matchadd("CapitalNamespace", '\<\u\w*\>\ze\.\<\h\w*\>')