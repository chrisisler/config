call clearmatches()

highlight FunctionSyntax ctermfg=darkblue
call matchadd("FunctionSyntax", '\<\h\w*\>\ze(')

highlight NewThingInvocation ctermfg=darkblue
call matchadd("NewThingInvocation", 'new\s\+\zs\<\u\w*\>\ze.*(')

" highlight CapitalNamespace ctermfg=darkred
" call matchadd("CapitalNamespace", '\<\u\w*\>\ze\.\<\h\w*\>')

highlight ReturnKeyword ctermfg=darkmagenta cterm=underline
call matchadd("ReturnKeyword", '[^@]\zs\<return\>')

highlight Comments ctermfg=white
call matchadd("Comments", '^//\zs.*')
call matchadd("Comments", '\s\+//\zs.*')
