call clearmatches()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight javaScriptObjectLabel ctermfg=green
highlight javaScriptBraces ctermfg=darkgreen

" highlight Search cterm=reverse ctermbg=bg ctermfg=3
" highlight IncSearch cterm=reverse ctermbg=bg ctermfg=3

" highlight CursorLineNr ctermbg=bg ctermfg=15


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight ItalicGolden cterm=italic ctermfg=3
call matchadd("ItalicGolden", '\W\s*\zs\<this\>\ze\s*\W')
" call matchadd("ItalicGolden", '\S\zs\<this\>\ze\S')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



highlight Red cterm=NONE ctermfg=darkred

" call matchadd("Red", '@see\s\+\zs\S\+\ze')

" * @returns {Bool} thisIsRedNow
" * @foo  {Whatever} alsoRedNow
" call matchadd("Red", '\*\s*@[A-Za-z]\+\s*{.*}\s*\zs\<\h\w*\>')

" call matchadd("Red", '\w\.\zs\<exports\>')

" anything after `this`, excluding functions
" call matchadd("Red", 'this\.\zs\<\h\w*\>\ze')



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


highlight Cyan ctermfg=cyan
call matchadd("Cyan", '\.\<call\>\ze(')
call matchadd("Cyan", '\.\<apply\>\ze(')
call matchadd("Cyan", '\.\.\.\ze\S\?\h')



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ItalicMagenta built-in keywords
" `Define` is the arrow func syntax, the actual arrow


" for return, see `ItalicLightMagenta`
" highlight Statement cterm=italic ctermfg=magenta
" if else
highlight Conditional cterm=italic ctermfg=magenta

" for, while, do, of
highlight Repeat cterm=italic ctermfg=magenta

" try, catch, finally, throw
highlight Exception cterm=italic ctermfg=magenta

" case, default, and object keys
" highlight Label cterm=italic ctermfg=magenta
call matchadd("Conditional", '\<case\>\ze\s*.*:')
call matchadd("Conditional", '\<default\>\ze\s*:')

" instanceof, typeof, new, in, void
" highlight Identifier cterm=italic ctermfg=magenta
" call matchadd("Conditional", '\s\+\zs\<instanceof\>\ze\s\+')
" call matchadd("Conditional", '\<typeof\>\ze\s\+')

call matchadd("Conditional", '\<async\>')
call matchadd("Conditional", '\<await\>')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight ItalicMagenta cterm=italic ctermfg=magenta
call matchadd("ItalicMagenta", '\W\+\s\+\zs\<var\>\ze\s\+') " wtf is this regex?
call matchadd("ItalicMagenta", '\<var\>\ze\s\+')
call matchadd("ItalicMagenta", '\<let\>\ze\s\+')
" call matchadd("ItalicMagenta", '\(^\|\s\{2,}\)\zs\<const\>\ze\s\+')
call matchadd("ItalicMagenta", '\<const\>\ze\s\+')

" anonymous keyword 'function'
call matchadd("ItalicMagenta", '\<function\>\ze\s*(')
" named keyword 'function'
call matchadd("ItalicMagenta", '\<function\>\ze\s*\(\<\h\w*\>\)\?\s*(')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" highlight Golden ctermfg=3
" all caps constants, min len 1, not strings. fixme: defend against
" surrounding single/double quotes.
" call matchadd("Golden", '\<[A-Z_][^a-z]*\>')

" syntax match foo "\<[A-Z_][^a-z]*\>"
" highlight link Golden foo
" call matchadd("Golden", allCapsConstants)

" `new CapitalizedThing()`
" call matchadd("Golden", 'new\s\+\zs\<[A-Z]\w*\>\ze(')

" `CapitalizedThing.property`
" call matchadd("Golden", '[^/]\zs\<[A-Z]\w*\>\ze\.\h\w*')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" idea: force comment things that are comments, and @foo thingies that are comments
" call matchadd("Comment", '^\s*\*\s*.*')
" call matchadd("Comment", '^\s*\*@\h\w\+\s\+[0-9A-Za-z_.{}]\+\s\zs\s*.*')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight ItalicLightMagenta cterm=italic ctermfg=darkmagenta

" import
call matchadd("ItalicLightMagenta", '^\<import\>\ze\s\+\S\+')

" from
call matchadd("ItalicLightMagenta", '}\?\s\+\zs\<from\>\ze\s*\S\+')
" call matchadd("ItalicLightMagenta", '^import}\?\s\+\zs\<from\>\ze\s*\S\+')

" as
call matchadd("ItalicLightMagenta", '^\<import\>.*\s\+\zs\<as\>\ze\s\+')

" export
call matchadd("ItalicLightMagenta", '\<export\>\ze\s\+\S\+')

" default
call matchadd("ItalicLightMagenta", '\<export\>\s\+\zs\<default\>\ze\s\+\S\+')

" return
call matchadd("ItalicLightMagenta", '\<return\>')
" call matchadd("ItalicLightMagenta", '\(^\<return\>\)\|\s\{2,}\<return\>') " either 2 or more whitespace or no whitespace at start-of-line
" either 2 or more whitespace OR no whitespace at start-of-line OR return
" something after parenthesis (for an if statement, for example).
" call matchadd("ItalicLightMagenta", '\(^\<return\>\)\|\s\{2,}\<return\>\|)\s\+\zs\<return\>\ze')

" function definition shorthand on an object
" call matchadd("ItalicLightMagenta", '^\s\{2,}\<\h\w*\>(\zs\<\h\w*\>\ze')

" arrow function parameters, single, no parenthesis
" call matchadd("ItalicLightMagenta", '[A-Za-z_$][0-9A-Za-z_$]*\ze\s*=>')
" arrow function parameters, single, parenthesis
" call matchadd("ItalicLightMagenta", '(\s*\zs[A-Za-z_$][0-9A-Za-z_$]*\ze\s*)\s*=>')

" arrow function parameters, multiple {{{
" first param, arrow must be on same line
" call matchadd("ItalicLightMagenta", '(\zs\<[A-Za-z_$][0-9A-Za-z_$]*\>\ze,\s*.*=>')
" middle params, arrow must be on same line
" call matchadd("ItalicLightMagenta", ',\s*\zs\<[A-Za-z_$][0-9A-Za-z_$]*\>\ze,\?\s*[^}]*=>')
" last param, arrow must be on same line
" call matchadd("ItalicLightMagenta", '[(,]\?\s*\zs\<[A-Za-z_$][0-9A-Za-z_$]*\>\ze\s*[,)]\?\s*=>')
" }}}

" class
call matchadd("ItalicLightMagenta", '\<class\>\ze\s\+')

" extends (note: using `\h\w` does not include the cash sign character '$')
" works for anonymous classes
call matchadd("ItalicLightMagenta", '\<class\>\s\+\(\<\h\w*\>\s\+\)\?\zs\<extends\>')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Magenta ctermfg=magenta
call matchadd("Magenta", '\s\+\zs=>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" new goes here


