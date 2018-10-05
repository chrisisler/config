call clearmatches()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" keyword: this
highlight javascriptIdentifier ctermfg=3 cterm=italic
highlight javascriptFuncArg ctermfg=6 cterm=italic


highlight javascriptIdentifierName ctermfg=9


" let, const
highlight javascriptVariable ctermfg=magenta cterm=italic

" async/await
highlight javascriptAwaitFuncKeyword ctermfg=3 cterm=italic
call matchadd("javascriptAwaitFuncKeyword", '\<async\>\ze\s\+')

highlight javascriptClassKeyword ctermfg=magenta cterm=italic
highlight javascriptTry ctermfg=magenta cterm=italic
" highlight javascriptArrowFunc ctermfg=magenta


highlight javascriptClassExtends ctermfg=darkmagenta cterm=italic
highlight javascriptImport ctermfg=darkmagenta cterm=italic
highlight javascriptReturn ctermfg=darkmagenta cterm=italic,underline

" keywords: default, export
highlight javascriptExport ctermfg=darkmagenta cterm=italic

" object keys (not es6 key/val sorthand)
highlight javaScriptObjectLabel ctermfg=darkmagenta


" highlight javascriptComma ctermfg=cyan
" spread/rest operator
" highlight javascriptObjectLiteral ctermfg=cyan


" NOTE: These dont work
" highlight javascriptCase ctermfg=magenta cterm=italic
" highlight javascriptFuncKeyword ctermfg=magenta cterm=italic
" highlight javascriptObjectLabelColon ctermfg=cyan
" highlight javascriptEndColons ctermfg=cyan
" highlight javascriptCatch ctermfg=magenta cterm=italic
" highlight javaScriptObjectLabel ctermfg=green
" highlight javaScriptReserved ctermfg=green
" highlight javascriptPropertyName ctermfg=green cterm=italic
" highlight javascriptProp ctermfg=green cterm=italic
" highlight javascriptProps ctermfg=green cterm=italic
" highlight javascriptProperty ctermfg=green cterm=italic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight BraceSyntax ctermfg=darkmagenta
" call matchadd("BraceSyntax", '{')
" call matchadd("BraceSyntax", '}')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" if else
highlight Conditional cterm=italic ctermfg=magenta


" for, while, do, of
highlight Repeat cterm=italic ctermfg=magenta


" try, catch
highlight Exception cterm=italic ctermfg=magenta


" case, default
" highlight Label cterm=italic ctermfg=magenta


" instanceof, typeof, new, in, void
" highlight Identifier cterm=italic ctermfg=magenta


highlight MagentaItalic ctermfg=magenta cterm=italic
call matchadd("MagentaItalic", '\<finally\>')
call matchadd("MagentaItalic", '\<catch\>\ze\s\+(')
call matchadd("MagentaItalic", '\<static\>\ze\s\+')
call matchadd("MagentaItalic", '\<delete\>\ze\s\+')
call matchadd("MagentaItalic", '\<get\>\ze\s\+')
call matchadd("MagentaItalic", '\<set\>\ze\s\+')
call matchadd("MagentaItalic", '(export )\?\|\s*\<type\>\ze\s\+')
call matchadd("MagentaItalic", '\s\+\zs\<instanceof\>\ze\s\+')
call matchadd("MagentaItalic", '\<typeof\>\ze\s\+')
call matchadd("MagentaItalic", '\<yield\>\ze')


highlight JustMagenta ctermfg=magenta
call matchadd("JustMagenta", '\s\+=>\s*')
call matchadd("JustMagenta", '\<new\>\ze\s\+\h')
call matchadd("JustMagenta", '\s\+\zs\<in\>\ze\s\+')
call matchadd("JustMagenta", '\<void\>\ze\s\+')
call matchadd("JustMagenta", '\s\+\zs\<as\>\ze\s\+')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight Red ctermfg=red
call matchadd("Red", '\<\h\w*\>\.\<\h\w*\>\.\zs\<\h\w*\>')
call matchadd("Red", '\(\<\h\w*\>\.\)\+\zs\<\h\w*\>')
" call matchadd("Red", '[^.]\.\zs\<\h\w*\>')
call matchadd("Red", '\<\h\w*\>\.\zs\<\h\w*\>')
" For properties of objects retrieved by index.
call matchadd("Red", ']\.\zs\<\h\w*\>')


highlight GoldenItalic ctermfg=3 cterm=italic
call matchadd("GoldenItalic", '\<self\>')


highlight Golden ctermfg=3
call matchadd("Golden", 'new\s\+\zs\<[A-Z]\w*\>\ze(')
call matchadd("Golden", '\<window\>')
" jsx customs
" call matchadd("Golden", '<\zs\<\u\w*\>')
" call matchadd("Golden", '\<__dirname\>')
" call matchadd("Golden", '\<__filename\>')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight FunctionSyntax ctermfg=darkblue

" function call
call matchadd("FunctionSyntax", '\<\h\w*\>\ze(')
" flow function support with generics
call matchadd("FunctionSyntax", '\<\h\w*\>\ze<.*>(')

" function definition
call matchadd("FunctionSyntax", '\<\w\+\>\s\+\zs\<\h\w*\>\ze\s\+=[^{.<>]\+=>') 
" function definition as a method on something but not in an object instantiation
" example: Person.staticMethod = () => {}
call matchadd("FunctionSyntax",        '.\+\.\zs\<\h\w*\>\ze\s\+=[^{.<>]\+=>') 

" function definition as an arrow method: `onClick = event => { ... }`
" call matchadd("FunctionSyntax", '\s\+\zs\<\h\w*\>\ze\s\+=[^{.<>]\+=>') 

" function definition with destructuring
call matchadd("FunctionSyntax", '\<\w\+\>\s\+\zs\<\h\w*\>\ze\s\+=\s\+(.*)\s\+=>')
" function definition with destructuring as a method on something but not in an object instantiation
" example: Person.staticMethod = () => {}
call matchadd("FunctionSyntax",        '.\+\.\zs\<\h\w*\>\ze\s\+=\s\+(.*)\s\+=>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call matchadd("MagentaItalic", '\<function\>\ze\s*.*(')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight Strings ctermfg=green
" TODO: Use non-greedy version of .*
" call matchadd("Strings", "'.*'")
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Comments ctermfg=white
call matchadd("Comments", '^//\zs.*')
call matchadd("Comments", '\s\+//\zs.*')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
