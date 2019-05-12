" call clearmatches()

let identifier = '\<\h\w*\>'

" Builtin Groups --------------------------------------------------------------

highlight StorageClass ctermfg=magenta cterm=italic
highlight Include ctermfg=darkmagenta cterm=italic
highlight Typedef ctermfg=11 cterm=italic

" `new` keyword
highlight Operator ctermfg=magenta

" call matchadd("Operator", '\<null\>')
call matchadd("Operator", '\<try\>\|\<catch\>\|\<while\>\|\<for\>')

call matchadd("Number", '\<null\>')


" Return Keyword --------------------------------------------------------------

highlight ReturnKeyword ctermfg=darkmagenta cterm=underline
call matchadd("ReturnKeyword", '[^@]\zs\<return\>')
call matchadd("ReturnKeyword", '[^@]\zs\<throw\>\ze\s\+')

" This Keyword ---------------------------------------------------------------

highlight ThisKeyword ctermfg=13 cterm=italic
call matchadd("ThisKeyword", '\<this\>')

" Types -----------------------------------------------------------------------

highlight TypeName ctermfg=3 cterm=italic

" " TypeName :: \zs\<\h\w*\>\ze\(<\<\h\w*\>>\)\?
" "                --------- => the TypeNameImage
" "                            ----------------- => Optional polymorphic param

let exceptionPosition = 'catch\s\+(\zs\<\h\w\+\>\ze\s\+'
call matchadd("TypeName", exceptionPosition)

let instanceOfPosition = '\<instanceof\>\s\+\zs\<\h\w*\>'
call matchadd("TypeName", instanceOfPosition)

let forEachPosition = '(\zs' . '\<\h\w*\>' . '\ze' . '\s\+' . identifier . '\s*:'
call matchadd("TypeName", forEachPosition)

let primitives = '\(\<int\>\|\<char\>\|\<void\>\|\<double\>\|\<long\>\|\<float\>\)'
call matchadd("TypeName", primitives)

" " TypeName as a variable type (non-primitive (upper-case required))
call matchadd("TypeName", '^\s\+\zs\<\u\w*\>')

" " TypeName as a variable type, excluding constructor names
let javaAccessModifier = '\(private\|public\|protected\)'
call matchadd("TypeName", '^\s\+' . javaAccessModifier . '\s\+\zs' . '\<\u\w*\>' . '\ze[^(]')

" call matchadd("TypeName", javaAccessModifier)

" " FooMap<A, B, baz>
" "        ---------
" call matchadd("TypeName", '\(, \|<\)\zs' . identifier . '\ze\(,\|>\)')
call matchadd("TypeName", '<\zs' . identifier . '\ze>')

" " FooMap<A, B>
" " ------
" call matchadd("TypeName", '\<\u\w*\>\ze<.*>')

" " TypeName as first argument type name
call matchadd("TypeName", identifier . '(\zs' . identifier . '\ze\s\+' . identifier . '[^(]')
" " TypeName as second, third, N-th argument type name
call matchadd("TypeName", ',\s*\zs' . identifier . '\ze\(<' . identifier . '>\)\?\s\+' . identifier . '\s*\(,\|)\)')

" " TypeName as a type cast
call matchadd("TypeName", '\W(\zs' . identifier . '\ze\(\[.*\]\)\?' . ')\s\+' . '[^{}]')

" Arguments -------------------------------------------------------------------

" highlight ArgumentName ctermfg=6

" " ArgumentName as first argument type name
" call matchadd("ArgumentName", '\<\h\w*\>(\<\h\w*\>\s\+\zs\<\h\w*\>\ze\(,\|)\)')
" " ARgumentName as first argument type name, can be on newline
" " call matchadd("ArgumentName", '\<\h\w*\>\s\+\zs\<\h\w*\>\ze\(,\|)\)')
" call matchadd("ArgumentName", identifier . '\s\+\zs' . identifier . '\ze\(,\|)\)')
" " ArgumentName as second, third, N-th argument name
" " call matchadd("ArgumentName", ',\s*' . identifier . '\s\+\zs' . identifier . '\ze\s*\(,\|)\)')
" call matchadd("ArgumentName", ',\s*' . '\<\u\w*\><.*>' . '\s\+\zs' . identifier . '\ze\s*\(,\|)\)')

" Functions -------------------------------------------------------------------

highlight FunctionSyntax ctermfg=darkblue
call matchadd("FunctionSyntax", identifier . '\ze(')
call matchadd("FunctionSyntax", 'new\s\+\zs' . '\<\u\w*\>' . '\ze.*(')

" Type Declarations -----------------------------------------------------------

highlight TypeDeclarations cterm=underline
call matchadd("TypeDeclarations", 'class\s\+\zs' . identifier . '\ze\s\+')

" Non-alphabet Tokens ---------------------------------------------------------

highlight NonAlphabetTokens ctermfg=darkcyan
call matchadd("NonAlphabetTokens", '[,;=<>!?:&|^%~+]')
call matchadd("NonAlphabetTokens", '-')
call matchadd("NonAlphabetTokens", '\S\s\zs\*\ze\s\S')
call matchadd("NonAlphabetTokens", '\S\s\zs\/\ze\s\S')

" Bananas and Braces --------------------------------------------------------- 
highlight Bananas ctermfg=blue
call matchadd("Bananas", '[()]')

highlight Braces ctermfg=green
call matchadd("Braces", '[{}]')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Comments - ALWAYS IN LAST POSITION AS HIGHLIGHT GROUP""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Comments ctermfg=white cterm=italic
call matchadd("Comments", '^//\zs.*')
call matchadd("Comments", '\s\+//\zs.*')
call matchadd("Comments", '^\s\+\*\s\+\zs[^{@].*')
