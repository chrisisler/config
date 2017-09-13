call clearmatches()

" todo:
" jsx props -> italicize
" jsx nodeNames
" light mode?
" pmenusel
" pmenuthumb
" bufline colors
" jsx tags

" not working
" highlight Search
" highlight Visual 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" new goes here


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Golden background
highlight Search cterm=reverse ctermbg=bg ctermfg=3
highlight IncSearch cterm=reverse ctermbg=bg ctermfg=3

highlight CursorLineNr ctermbg=bg ctermfg=15


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight MatchParen cterm=bold ctermfg=cyan


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight DefaultColor ctermfg=fg

" jsx brackets syntax
call matchadd("DefaultColor", '\/\?>')
call matchadd("DefaultColor", '<\/\?\ze\<\a\w*\>')
call matchadd("DefaultColor", '<\/\?\<\a\w*\>.*\zs\/\?>')

" object keys
" call matchadd("DefaultColor", '[0-9A-Za-z_$]\+')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight ItalicGolden cterm=italic ctermfg=3
call matchadd("ItalicGolden", '\<this\>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight FuncDefAndCall ctermfg=darkblue
" function invocation
call matchadd("FuncDefAndCall", '\<[A-Za-z_]\w*\ze(')
" function definition
call matchadd("FuncDefAndCall", '\w\+\s\+\zs\<\h\w*\>\ze\s*=[^.]\+=>')
" function definition as a class property
call matchadd("FuncDefAndCall", '\s\{2,}\zs\<\h\w*\>\ze\s*=[^.]\+=>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight Cyan ctermfg=cyan
call matchadd("Cyan", '\.\<require\>\ze(')
call matchadd("Cyan", '\.\<keys\>\ze(')
call matchadd("Cyan", '\.\<test\>\ze(')
call matchadd("Cyan", '\.\<slice\>\ze(')
call matchadd("Cyan", '\.\<forEach\>\ze(')
call matchadd("Cyan", '\.\<map\>\ze(')
call matchadd("Cyan", '\.\<reduce\>\ze(')
call matchadd("Cyan", '\.\<call\>\ze(')
call matchadd("Cyan", '\.\<apply\>\ze(')
call matchadd("Cyan", '\.\<setState\>\ze(')
call matchadd("Cyan", '\.\.\.\ze\S\?\h')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ItalicMagenta built-in keywords
" `Define` is the arrow func syntax, the actual arrow


" return, see `ItalicLightMagenta`
" highlight Statement cterm=italic ctermfg=magenta
" if else
highlight Conditional cterm=italic ctermfg=magenta
" for, while, do, of
highlight Repeat cterm=italic ctermfg=magenta
" try, catch, finally, throw
highlight Exception cterm=italic ctermfg=magenta
" case, default, and object keys
highlight Label cterm=italic ctermfg=magenta
" instanceof, typeof, new, in, void
highlight Identifier cterm=italic ctermfg=magenta


highlight Todo cterm=underline ctermfg=NONE


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight ItalicMagenta cterm=italic ctermfg=magenta
call matchadd("ItalicMagenta", '\<var\>')
call matchadd("ItalicMagenta", '\<let\>')
call matchadd("ItalicMagenta", '\<const\>')
call matchadd("ItalicMagenta", '\<function\>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight Red cterm=NONE ctermfg=darkred
call matchadd("Red", '@see\s\+\zs\S\+\ze')
call matchadd("Red", '\*\s*@[A-Za-z]\+\s*{.*}\s*\zs\<\h\w*\>') " * @returns {Bool} 
call matchadd("Red", '\w\.\zs\<prototype\>')
call matchadd("Red", '\w\.\zs\<value\>')
call matchadd("Red", '\w\.\zs\<props\>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Golden ctermfg=3
call matchadd("Golden", '\<document\>')
" all caps constants, min len 1, not strings. fixme: defend against
" surrounding single/double quotes.
" call matchadd("Golden", '\<[A-Z_][^a-z]*\>')

" syntax match foo "\<[A-Z_][^a-z]*\>"
" highlight link Golden foo
" call matchadd("Golden", allCapsConstants)

" `new CapitalizedThing()`
call matchadd("Golden", 'new\s\+\zs\<[A-Z]\w*\>\ze(')

" `CapitalizedThing.property`
call matchadd("Golden", '\<[A-Z]\w*\>\ze\.\h\w*')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" idea: force comment things that are comments, and @foo thingies that are comments
" call matchadd("Comment", '^\s*\*\s*.*')
" call matchadd("Comment", '^\s*\*@\h\w\+\s\+[0-9A-Za-z_.{}]\+\s\zs\s*.*')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight ItalicLightMagenta cterm=italic ctermfg=darkmagenta
" import
call matchadd("ItalicLightMagenta", '^\<import\>\ze\s\+\S\+')
" from
call matchadd("ItalicLightMagenta", '}\s*\zs\<from\>\ze\s*\S\+')
" export
call matchadd("ItalicLightMagenta", '\<export\>\ze\s\+\S\+')
" default
call matchadd("ItalicLightMagenta", '\<export\>\s\+\zs\<default\>\ze\s\+\S\+')

"return
call matchadd("ItalicLightMagenta", '\<return\>')

" arrow function parameters, single, no parenthesis
" call matchadd("ItalicLightMagenta", '[A-Za-z_$][0-9A-Za-z_$]*\ze\s*=>')
" arrow function parameters, single, parenthesis
" call matchadd("ItalicLightMagenta", '(\s*\zs[A-Za-z_$][0-9A-Za-z_$]*\ze\s*)\s*=>')

" arrow function parameters, multiple {{{
" first param, arrow must be on same line
call matchadd("ItalicLightMagenta", '(\zs\<[A-Za-z_$][0-9A-Za-z_$]*\>\ze,\s*.*=>')
" middle params, arrow must be on same line
call matchadd("ItalicLightMagenta", ',\s*\zs\<[A-Za-z_$][0-9A-Za-z_$]*\>\ze,\?\s*.*=>')
" last param, arrow must be on same line
call matchadd("ItalicLightMagenta", '[(,]\?\s*\zs\<[A-Za-z_$][0-9A-Za-z_$]*\>\ze\s*[,)]\?\s*=>')
" }}}

" class
call matchadd("ItalicLightMagenta", '\<class\>\ze\s\+')

" extends (note: using `\h\w` does not include the cash sign character '$')
call matchadd("ItalicLightMagenta", '\<class\>\s\+\<\h\w*\>\s\+\zs\<extends\>')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Magenta ctermfg=magenta
call matchadd("Magenta", '=>')
