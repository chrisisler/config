" TODO
" - explicit 'function' keyword needs its highlighting back, retrieve from github.
" - 'new Foo' should allow 'Foo' to be golden, retrieve from github.

call clearmatches()

" check these out:
" javascriptCase
" javascriptCaseExpression

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lowercase s

" highlight Normal ctermfg=red
highlight javascriptArrowFunc ctermfg=magenta
highlight javascriptFuncKeyword ctermfg=magenta cterm=italic
highlight javascriptVariable ctermfg=magenta cterm=italic
highlight javascriptClassKeyword ctermfg=darkmagenta cterm=italic
highlight javascriptClassExtends ctermfg=darkmagenta cterm=italic
highlight javascriptImport ctermfg=darkmagenta cterm=italic
highlight javascriptReturn ctermfg=magenta cterm=italic
highlight javascriptObjectLabelColon ctermfg=cyan
highlight javascriptEndColons ctermfg=cyan
highlight javascriptComma ctermfg=cyan
highlight javascriptNull ctermfg=lightgreen

" 'this' keyword
highlight javascriptIdentifier ctermfg=3 cterm=italic

" handles 'export' and 'default' keywords
highlight javascriptExport ctermfg=darkmagenta cterm=italic


" spread/rest operator
highlight javascriptObjectLiteral ctermfg=cyan

highlight javascriptAsyncFuncKeyword ctermfg=magenta cterm=italic
highlight javascriptAwaitFuncKeyword ctermfg=magenta cterm=italic


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" uppercase S


highlight javascriptFuncArg ctermfg=red cterm=italic
highlight javaScriptObjectLabel ctermfg=green
" highlight javaScriptReserved ctermfg=green
" highlight javaScriptPropertyName ctermfg=green cterm=italic


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
call matchadd("FuncDefAndCall", '\s\{2,}\zs\<\h\w*\>\ze\s\+=[^.()]\+=>')
" call matchadd("FuncDefAndCall", '\s\{2,}\zs\<\h\w*\>\ze\s\+=\s\+\(\h\|(\).*\s\+=>')
call matchadd("FuncDefAndCall", '\s\{2,}\zs\<\h\w*\>\ze\s\+=\s\+\(\h\|(\)[^.()]*\s\+=>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" if else
highlight Conditional cterm=italic ctermfg=magenta

" for, while, do, of
highlight Repeat cterm=italic ctermfg=magenta

" try, catch, finally, throw
highlight Exception cterm=italic ctermfg=magenta

" case, default, and object keys
call matchadd("Conditional", '\<case\>\ze\s*.*:')
call matchadd("Conditional", '\<default\>\ze\s*:')

" instanceof, typeof, new, in, void
" highlight Identifier cterm=italic ctermfg=magenta
call matchadd("Conditional", '\s\+\zs\<instanceof\>\ze\s\+')
call matchadd("Conditional", '\<typeof\>\ze\s\+')

