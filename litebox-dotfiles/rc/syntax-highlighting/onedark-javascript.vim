call clearmatches()
" highlight RegExp cterm=bold

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lowercase s

highlight javascriptArrowFunc ctermfg=magenta

highlight javascriptCase ctermfg=magenta cterm=italic
highlight javascriptFuncKeyword ctermfg=magenta cterm=italic
highlight javascriptVariable ctermfg=magenta cterm=italic
highlight javascriptClassKeyword ctermfg=magenta cterm=italic
highlight javascriptClassExtends ctermfg=darkmagenta cterm=italic
highlight javascriptImport ctermfg=darkmagenta cterm=italic
highlight javascriptReturn ctermfg=darkmagenta cterm=italic,underline
" highlight javascriptReturn ctermfg=darkcyan cterm=italic
" highlight javascriptObjectLabelColon ctermfg=cyan
" highlight javascriptEndColons ctermfg=cyan
" highlight javascriptComma ctermfg=cyan

" null is special, it's Golden
highlight javascriptNull ctermfg=yellow

highlight javascriptTry ctermfg=magenta cterm=italic
" highlight javascriptCatch ctermfg=magenta cterm=italic

highlight javascriptIdentifierName ctermfg=9

" 'this' keyword
highlight javascriptIdentifier ctermfg=3 cterm=italic

" handles 'export' and 'default' keywords
highlight javascriptExport ctermfg=darkmagenta cterm=italic

" spread/rest operator
" highlight javascriptObjectLiteral ctermfg=cyan

" doesn't work for keyword 'async' inside a class definition
" highlight javascriptAsyncFuncKeyword ctermfg=magenta cterm=italic

highlight javascriptAwaitFuncKeyword ctermfg=magenta cterm=italic

highlight javascriptFuncArg ctermfg=3 cterm=italic


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" uppercase S


" object keys (not es6 key/val sorthand)
highlight javaScriptObjectLabel ctermfg=darkmagenta
" highlight javaScriptObjectLabel ctermfg=green

" highlight javaScriptReserved ctermfg=green

" none of these work yo
" highlight javascriptPropertyName ctermfg=green cterm=italic
" highlight javascriptProp ctermfg=green cterm=italic
" highlight javascriptProps ctermfg=green cterm=italic
" highlight javascriptProperty ctermfg=green cterm=italic


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight Red ctermfg=red
call matchadd("Red", '[^.]\.\zs\<\h\w*\>')

highlight Golden ctermfg=3
call matchadd("Golden", '\<__dirname\>')
call matchadd("Golden", '\<__filename\>')
call matchadd("Golden", 'new\s\+\zs\<[A-Z]\w*\>\ze(')

highlight GoldenItalic ctermfg=3 cterm=italic
call matchadd("GoldenItalic", '\<self\>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight FuncDefAndCall ctermfg=darkblue

" function invocation
" call matchadd("FuncDefAndCall", '[^{]\zs\<\h\w*\>\ze(')
call matchadd("FuncDefAndCall", '\<\h\w*\>\ze(')
" call matchadd("FuncDefAndCall", '\<\h\w*\>\ze\s\?(')

" function definition
call matchadd("FuncDefAndCall", '\<\w\+\>\s\+\zs\<\h\w*\>\ze\s\+=[^{.<>]\+=>') 
" function definition with destructuring
call matchadd("FuncDefAndCall", '\<\w\+\>\s\+\zs\<\h\w*\>\ze\s\+=\s\+(.*)\s\+=>')

" function definition as a class property or without const/let/var
" call matchadd("FuncDefAndCall", '\s\{2,}\zs\<\h\w*\>\ze\s\+=[^.()]\+=>')
" call matchadd("FuncDefAndCall", '\s\{2,}\zs\<\h\w*\>\ze\s\+=\s\+\(\h\|(\)[^.()]*\s\+=>')
" not working
call matchadd("FuncDefAndCall", '\s\{2,}\zs\<\h\w*\>\ze\s\+=\s\+\(\h\|(\).*\s\+=>')

" the keyword 'function'
call matchadd("Conditional", '\<function\>\ze\s*(')

highlight Gray ctermfg=white
call matchadd("Gray", '^//\zs.*')
call matchadd("Gray", '\s\+//\zs.*')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" typescript syntax
if &filetype == "typescript"
    call matchadd("JustMagenta", '=>')

    " TODO
    " identifiers -> red (avoid using the 'Normal' syntax highlighting group)
    " args -> golden
    " * / + -  -> cyan

    " keywords: function
    highlight typescriptFuncKeyword ctermfg=magenta
    " keywords: let const var
    highlight typescriptIdentifier ctermfg=magenta cterm=italic
    " keywords: && ||
    highlight typescriptLogicSymbols ctermfg=cyan
    " type annotations are Golden
    " const num: Number = 42 // 'Number' is highlighted Golden
    highlight typescriptType ctermfg=3
    " keywords: ( )
    highlight typescriptParens ctermfg=fg
    " keywords: = == === != !== => > < <= >=
    highlight typescriptOpSymbols ctermfg=cyan

    " TODO: does this work?
    " highlight typescriptRepeat ctermfg=cyan
    " highlight typescriptOperator ctermfg=cyan
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " All syntax-highlighting below is for typescript where Normal=red
    " TODO object keys are still red

    " highlight typescriptDotNotation ctermfg=fg
    " highlight typescriptInterpolationDelimiter ctermfg=fg
    " " IMPORTANT : this line must be at the end of other `highlight` changes/calls
    " highlight Normal ctermfg=red

    " keys of an object
    " WARNING : BREAKS VAR DECLARATIONS WITH TYPE ANNOTATIONS
    " highlight JustDarkMagenta ctermfg=darkmagenta
    " call matchadd("JustDarkMagenta", '\<\h\w*\>\ze:')
end


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
call matchadd("MagentaItalic", '\<catch\>')
call matchadd("MagentaItalic", '\<async\>\ze\s\+')
call matchadd("MagentaItalic", '\<static\>\ze\s\+')
call matchadd("MagentaItalic", '\<delete\>\ze\s\+')
call matchadd("MagentaItalic", '\<get\>\ze\s\+')
call matchadd("MagentaItalic", '\<set\>\ze\s\+')


highlight JustMagenta ctermfg=magenta
call matchadd("JustMagenta", '\<new\>\ze\s\+\h')
call matchadd("JustMagenta", '\s\+\zs\<in\>\ze\s\+')
call matchadd("JustMagenta", '\<void\>\ze\s\+')

call matchadd("Conditional", '\s\+\zs\<instanceof\>\ze\s\+')
call matchadd("Conditional", '\<typeof\>\ze\s\+')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
