call clearmatches()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" keyword: this
highlight javascriptIdentifier ctermfg=3 cterm=italic
highlight javascriptFuncArg ctermfg=3 cterm=italic

highlight javascriptIdentifierName ctermfg=9

highlight javascriptVariable ctermfg=magenta cterm=italic
highlight javascriptClassKeyword ctermfg=magenta cterm=italic
highlight javascriptAwaitFuncKeyword ctermfg=magenta cterm=italic
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

" highlight Red ctermfg=red
" call matchadd("Red", '[^.]\.\zs\<\h\w*\>')

" highlight GoldenItalic ctermfg=3 cterm=italic
" call matchadd("GoldenItalic", '\<self\>')

" highlight Golden ctermfg=3
" call matchadd("Golden", '\<__dirname\>')
" call matchadd("Golden", '\<__filename\>')
" call matchadd("Golden", 'new\s\+\zs\<[A-Z]\w*\>\ze(')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight FunctionSyntax ctermfg=darkblue

" function call
call matchadd("FunctionSyntax", '\<\h\w*\>\ze(')

" function definition
call matchadd("FunctionSyntax", '\<\w\+\>\s\+\zs\<\h\w*\>\ze\s\+=[^{.<>]\+=>') 

" function definition with destructuring
call matchadd("FunctionSyntax", '\<\w\+\>\s\+\zs\<\h\w*\>\ze\s\+=\s\+(.*)\s\+=>')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if else
highlight Conditional cterm=italic ctermfg=magenta

" for, while, do, of
highlight Repeat cterm=italic ctermfg=magenta

" try, catch, finally
highlight Exception cterm=italic ctermfg=magenta

" case, default
" highlight Label cterm=italic ctermfg=magenta

" instanceof, typeof, new, in, void
" highlight Identifier cterm=italic ctermfg=magenta

highlight MagentaItalic ctermfg=magenta cterm=italic
call matchadd("MagentaItalic", '\<catch\>\ze\s\+(')
call matchadd("MagentaItalic", '\<async\>\ze\s\+')
call matchadd("MagentaItalic", '\<static\>\ze\s\+')
call matchadd("MagentaItalic", '\<delete\>\ze\s\+')
call matchadd("MagentaItalic", '\<get\>\ze\s\+')
call matchadd("MagentaItalic", '\<set\>\ze\s\+')
call matchadd("MagentaItalic", '^\s*\<type\>\ze\s\+')
call matchadd("MagentaItalic", '\s\+\zs\<instanceof\>\ze\s\+')
call matchadd("MagentaItalic", '\<typeof\>\ze\s\+')

highlight JustMagenta ctermfg=magenta
call matchadd("JustMagenta", '\s\+=>\s*')
call matchadd("JustMagenta", '\<new\>\ze\s\+\h')
call matchadd("JustMagenta", '\s\+\zs\<in\>\ze\s\+')
call matchadd("JustMagenta", '\<void\>\ze\s\+')

highlight Comments ctermfg=white
call matchadd("Comments", '^//\zs.*')
call matchadd("Comments", '\s\+//\zs.*')


highlight FunctionKeyword ctermfg=magenta cterm=italic
call matchadd("FunctionKeyword", '\<function\>\ze\s*.*(')
