call clearmatches()

let identifier = '\<\h\w*\>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Builtin Groups"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight StorageClass ctermfg=magenta
highlight Include ctermfg=darkmagenta
highlight Typedef ctermfg=11

" `new` keyword
" highlight Operator ctermfg=red

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""ReturnKeyword""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight ReturnKeyword ctermfg=darkmagenta cterm=underline
call matchadd("ReturnKeyword", '[^@]\zs\<return\>')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""TypeName"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight TypeName ctermfg=3

" TypeName :: \zs\<\h\w*\>\ze\(<\<\h\w*\>>\)\?
"                --------- => the TypeNameImage
"                            ----------------- => Optional polymorphic param

" TypeName as a variable type (non-primitive (upper-case required))
call matchadd("TypeName", '^\s\+\zs\<\u\w*\>')

" TypeName as a variable type, excluding constructor names
let javaAccessModifier = '\(private\|public\|protected\)'
call matchadd("TypeName", '^\s\+' . javaAccessModifier . '\s\+\zs' . '\<\u\w*\>' . '\ze[^(]')

" FooMap<A, B, baz>
"        ---------
call matchadd("TypeName", '\(, \|<\)\zs' . identifier . '\ze\(,\|>\)')

" FooMap<A, B>
" ------
call matchadd("TypeName", '\<\u\w*\>\ze<.*>')

" TypeName as first argument type name
call matchadd("TypeName", identifier . '(\zs' . identifier . '\ze\s\+' . identifier . '[^(]')
" TypeName as second, third, N-th argument type name
call matchadd("TypeName", ',\s*\zs' . identifier . '\ze\(<' . identifier . '>\)\?\s\+' . identifier . '\s*\(,\|)\)')

" TypeName as a type cast
call matchadd("TypeName", '(\zs' . identifier . '\ze)\s\+')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Arguments""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight ArgumentName ctermfg=6

" ArgumentName as first argument type name
" call matchadd("ArgumentName", '\<\h\w*\>(\<\h\w*\>\s\+\zs\<\h\w*\>\ze\(,\|)\)')
" ARgumentName as first argument type name, can be on newline
" call matchadd("ArgumentName", '\<\h\w*\>\s\+\zs\<\h\w*\>\ze\(,\|)\)')
call matchadd("ArgumentName", identifier . '\s\+\zs' . identifier . '\ze\(,\|)\)')
" ArgumentName as second, third, N-th argument name
" call matchadd("ArgumentName", ',\s*' . identifier . '\s\+\zs' . identifier . '\ze\s*\(,\|)\)')
call matchadd("ArgumentName", ',\s*' . '\<\u\w*\><.*>' . '\s\+\zs' . identifier . '\ze\s*\(,\|)\)')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""FunctionSyntax"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight FunctionSyntax ctermfg=darkblue
call matchadd("FunctionSyntax", identifier . '\ze(')
call matchadd("FunctionSyntax", 'new\s\+\zs' . '\<\u\w*\>' . '\ze.*(')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""TypeDeclarations""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight TypeDeclarations cterm=underline
call matchadd("TypeDeclarations", 'class\s\+\zs' . identifier . '\ze')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""NonAlphabetTokens""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight NonAlphabetTokens ctermfg=14
call matchadd("NonAlphabetTokens", '[,=;<>!?:&|^%~+]')
call matchadd("NonAlphabetTokens", '-')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Comments - ALWAYS IN LAST POSITION AS HIGHLIGHT GROUP""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Comments ctermfg=white
call matchadd("Comments", '^//\zs.*')
call matchadd("Comments", '\s\+//\zs.*')
call matchadd("Comments", '^\s\+\*\s\+\zs[^{@<].*')
