" call clearmatches()

" sorted by `ctermfg` foreground color

highlight javascriptFuncArg ctermfg=red cterm=italic

" keyword: this
highlight javascriptIdentifier ctermfg=darkmagenta cterm=italic
highlight javascriptArrowFunc ctermfg=darkmagenta
highlight javascriptImport ctermfg=darkmagenta cterm=italic
highlight javascriptExport ctermfg=darkmagenta cterm=italic

highlight javascriptClassExtends ctermfg=magenta cterm=italic
highlight javascriptReturn ctermfg=magenta cterm=italic,underline
highlight javascriptVariable ctermfg=magenta cterm=italic
highlight javascriptClassKeyword ctermfg=magenta cterm=italic
highlight javascriptAwaitFuncKeyword ctermfg=magenta cterm=italic

highlight javaScriptObjectLabel ctermfg=darkgreen
highlight javascriptTry ctermfg=darkgreen cterm=italic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight FunctionSyntax ctermfg=darkblue

" function call
call matchadd("FunctionSyntax", '\<\h\w*\>\ze(')

" function definition
call matchadd("FunctionSyntax", '\<\w\+\>\s\+\zs\<\h\w*\>\ze\s\+=[^{.<>]\+=>') 

" function definition with destructuring
call matchadd("FunctionSyntax", '\<\w\+\>\s\+\zs\<\h\w*\>\ze\s\+=\s\+(.*)\s\+=>')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" todo -retain comments in completely gray color
highlight Comments ctermfg=red
call matchadd("Comments", '^//\zs.*')
call matchadd("Comments", '\s\+//\zs.*')
