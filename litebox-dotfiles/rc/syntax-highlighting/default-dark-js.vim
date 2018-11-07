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

let arrowMethodNameAsObjKey = identifier . '\ze:\s*' . beforeArrow
call matchadd("Fn", arrowMethodNameAsObjKey)

let methodNameAsObjKey = identifier . '\ze:\s*\<function\>'
call matchadd("Fn", methodNameAsObjKey)

let arrowFnDef = identifier . '\ze\s*=\s*' . beforeArrow
call matchadd("Fn", arrowFnDef)

highlight Type ctermfg=cyan

let type = '\<type\>\s\+\zs\<\u\w*\>'
call matchadd("Type", type)

let maybeType = '?\zs' . identifier
call matchadd("Type", maybeType)

let maybeQuestionMark = identifier . '\zs?'
call matchadd("Type", maybeQuestionMark)
let maybeQuestionMark2 = '?\ze' . identifier
call matchadd("Type", maybeQuestionMark2)

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

" if &background == "light"
  highlight javascriptFuncArg ctermfg=red cterm=italic
  let thisKeyword = '\<this\>'
  call matchadd("javascriptFuncArg", thisKeyword)
" endif

" Builtins --------------------------------------------------------------------

highlight Identifier ctermfg=magenta cterm=italic
highlight javascriptBraces ctermfg=green
highlight javascriptOperator ctermfg=magenta
highlight javascriptClassKeyword ctermfg=magenta cterm=italic
highlight javascriptClassExtends ctermfg=magenta cterm=italic
highlight javascriptImport ctermfg=magenta cterm=italic

" THIS
" highlight javascriptIdentifier ctermfg=red cterm=italic

" LET CONST
highlight javascriptVariable ctermfg=magenta cterm=italic

let typeKeyword = '\<type\>\ze\s\+\u'
call matchadd("javascriptVariable", typeKeyword)

let functionKeyword = '\<function\>\ze\s*'
call matchadd("javascriptVariable", functionKeyword)

let arrow = '=>'
call matchadd("javascriptVariable", arrow)

let voidKeyword = '[^>:]\s\+\zs\<void\>'
call matchadd("javascriptVariable", voidKeyword)

let reservedValues = '\(true\|false\|null\|this\)'
call matchadd("javascriptVariable", reservedValues)
