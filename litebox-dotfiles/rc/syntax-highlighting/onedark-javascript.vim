" TODO
" - explicit 'function' keyword needs its highlighting back, retrieve from github.
" - 'new Foo' should allow 'Foo' to be golden, retrieve from github.

call clearmatches()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lowercase s

highlight javascriptCase ctermfg=magenta cterm=italic
highlight javascriptArrowFunc ctermfg=magenta
highlight javascriptFuncKeyword ctermfg=magenta cterm=italic
highlight javascriptVariable ctermfg=magenta cterm=italic
highlight javascriptClassKeyword ctermfg=darkmagenta cterm=italic
highlight javascriptClassExtends ctermfg=darkmagenta cterm=italic
highlight javascriptImport ctermfg=darkmagenta cterm=italic
highlight javascriptReturn ctermfg=darkmagenta cterm=italic
" highlight javascriptObjectLabelColon ctermfg=cyan
" highlight javascriptEndColons ctermfg=cyan
" highlight javascriptComma ctermfg=cyan
" highlight javascriptNull ctermfg=lightgreen

highlight javascriptTry ctermfg=magenta cterm=italic
highlight javascriptCatch ctermfg=magenta cterm=italic

highlight javascriptIdentifierName ctermfg=9

" 'this' keyword
highlight javascriptIdentifier ctermfg=3 cterm=italic

" handles 'export' and 'default' keywords
highlight javascriptExport ctermfg=darkmagenta cterm=italic

" spread/rest operator
" highlight javascriptObjectLiteral ctermfg=cyan

" highlight javascriptAsyncFuncKeyword ctermfg=magenta cterm=italic
" highlight javascriptAwaitFuncKeyword ctermfg=magenta cterm=italic


highlight javascriptFuncArg ctermfg=3 cterm=italic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" uppercase S



" object keys are green (not es6 key/val sorthand)
highlight javaScriptObjectLabel ctermfg=green

" highlight javaScriptReserved ctermfg=green

" none of these work yo
" highlight javascriptPropertyName ctermfg=green cterm=italic
" highlight javascriptProp ctermfg=green cterm=italic
" highlight javascriptProps ctermfg=green cterm=italic
" highlight javascriptProperty ctermfg=green cterm=italic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight FuncDefAndCall ctermfg=darkblue

" function invocation
" call matchadd("FuncDefAndCall", '[^{]\zs\<\h\w*\>\ze(')
call matchadd("FuncDefAndCall", '\<\h\w*\>\ze(')

" function definition
call matchadd("FuncDefAndCall", '\<\w\+\>\s\+\zs\<\h\w*\>\ze\s\+=[^{.<>]\+=>')

" function definition with destructuring
call matchadd("FuncDefAndCall", '\<\w\+\>\s\+\zs\<\h\w*\>\ze\s\+=\s\+(.*)\s\+=>')

" function definition as a class property or without const/let/var
" call matchadd("FuncDefAndCall", '\s\{2,}\zs\<\h\w*\>\ze\s\+=[^.()]\+=>')
" call matchadd("FuncDefAndCall", '\s\{2,}\zs\<\h\w*\>\ze\s\+=\s\+\(\h\|(\)[^.()]*\s\+=>')
" not working
call matchadd("FuncDefAndCall", '\s\{2,}\zs\<\h\w*\>\ze\s\+=\s\+\(\h\|(\).*\s\+=>')


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
call matchadd("Conditional", '\s\+\zs\<instanceof\>\ze\s\+')
call matchadd("Conditional", '\<typeof\>\ze\s\+')
call matchadd("Conditional", '\s\+\zs\<in\>\ze\s\+')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" the keyword 'function'
call matchadd("Conditional", '\<function\>\ze\s*(')

" highlight Golden ctermfg=3
" call matchadd("Golden", 'new\s\+\zs\<[A-Z]\w*\>\ze(')
