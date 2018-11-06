" Default Dark
"
" TODO: (see VSCode for colors)
" - RegExp
" - Generics

call clearmatches()

let identifier = '\<\h\w*\>'
" let beforeArrow = '(\_[^()]*)[^()]*\_s*=>'
" let beforeArrow = '\((\_[^()]*)\|\_[^()]*\)[^()]*\_s*=>'
let beforeArrow = '\(([^()]*)\|[^()]*\)[^()]*\_s*=>'

" User-defined ----------------------------------------------------------------

highlight Fn ctermfg=darkblue

let optionalGenerics = '\(<.*>\)\?' 
let fn = '\<\l\w*\>' . '\ze' .  optionalGenerics . '('
call matchadd("Fn", fn)

let methodNameAsObjKey = identifier . '\ze:\s*' . beforeArrow
call matchadd("Fn", methodNameAsObjKey)

let arrowFnDef = identifier . '\ze\s*=\s*' . beforeArrow
call matchadd("Fn", arrowFnDef)

highlight Type ctermfg=cyan

let type = '\<type\>\s\+\zs\<\u\w*\>'
call matchadd("Type", type)

let maybeType = '?\zs' . identifier
call matchadd("Type", maybeType)

let voidType = '\<void\>\ze\(\s*|\|,\|)\|$\)'
call matchadd("Type", voidType)

let instanceofKeyword = '\<instanceof\>'
let rhsForInstanceofOp = instanceofKeyword . '\s\+\zs' . identifier
call matchadd("Type", rhsForInstanceofOp)

let constructorCall = '\<new\>\s\+\zs' . identifier
call matchadd("Type", constructorCall)

let flowChecksKeyword = '%\zs\<checks\>'
call matchadd("Type", flowChecksKeyword)

let generic = '<\zs\<' . '[a-zA-Z_][a-zA-Z0-9_$]*' . '\>\ze>'
call matchadd("Type", generic)

let prototype = identifier . '\ze\.\<prototype\>'
call matchadd("Type", prototype)

highlight Bananas ctermfg=blue

let parens = '[()]'
call matchadd("Bananas", parens)

" Builtins --------------------------------------------------------------------

highlight Identifier ctermfg=magenta cterm=italic
highlight javascriptBraces ctermfg=green
highlight javascriptOperator ctermfg=magenta

" LET CONST
highlight javascriptVariable ctermfg=magenta cterm=italic

let typeKeyword = '\<type\>\ze\s\+\u'
call matchadd("javascriptVariable", typeKeyword)

let functionKeyword = '\<function\>\ze\s*('
call matchadd("javascriptVariable", functionKeyword)

let arrow = '=>'
call matchadd("javascriptVariable", arrow)

let voidKeyword = '[^>:]\s\+\zs\<void\>'
call matchadd("javascriptVariable", voidKeyword)

let reservedValues = '\(true\|false\|null\|this\)'
call matchadd("javascriptVariable", reservedValues)
