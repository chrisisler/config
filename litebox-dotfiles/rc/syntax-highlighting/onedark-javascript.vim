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


" highlight CursorLineNr ctermbg=2 ctermfg=4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight MatchParen cterm=bold ctermfg=cyan ctermbg=bg


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" jsx brackets syntax
highlight DefaultColor ctermfg=fg
call matchadd("DefaultColor", '\/>')
call matchadd("DefaultColor", '<\/\?\ze\<\a\w*\>')
call matchadd("DefaultColor", '<\/\?\<\a\w*\>.*\zs\/\?>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight ItalicGolden cterm=italic ctermfg=3
call matchadd("ItalicGolden", '\<this\>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight FuncDefAndCall ctermfg=darkblue
call matchadd("FuncDefAndCall", '\<[a-z_]\w*\ze(')
call matchadd("FuncDefAndCall", '\w*\s\+\zs\<[A-Za-z_]\w*\>\ze\s*=[^.]\+=>')


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
call matchadd("Cyan", '\.\.\.\ze\S\?\h')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ItalicMagenta built-in keywords
" `Define` is the arrow func syntax, the actual arrow


" return, see `SeanLarkinnItalicLightMagenta`
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


highlight Red ctermfg=darkred
call matchadd("Red", '@see\s\+\zs\S\+\ze')
call matchadd("Red", '\*\s*@[A-Za-z]\+\s*{.*}\s*\zs\<\h\S\+\>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Golden ctermfg=3
call matchadd("Golden", '\<document\>')
" all caps constants, min len 1, not strings. fixme: defend against
" surrounding single/double quotes.
" call matchadd("Golden", '\<[A-Z_][^a-z]*\>')

syntax match foo "\<[A-Z_][^a-z]*\>"
highlight link Golden foo
" call matchadd("Golden", allCapsConstants)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" idea: force comment things that are comments, and @foo thingies that are comments
" call matchadd("Comment", '^\s*\*\s*.*')
" call matchadd("Comment", '^\s*\*@\h\w\+\s\+[0-9A-Za-z_.{}]\+\s\zs\s*.*')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight SeanLarkinnItalicLightMagenta cterm=italic ctermfg=darkmagenta
"return
call matchadd("SeanLarkinnItalicLightMagenta", '\<return\>')
" import
call matchadd("SeanLarkinnItalicLightMagenta", '^\<import\>\ze\s\+\S\+')
" from
call matchadd("SeanLarkinnItalicLightMagenta", '^\<import\>\s\+\S\+\s\+\zs\<from\>\ze\s\+\S\+')
" export
call matchadd("SeanLarkinnItalicLightMagenta", '\<export\>\ze\s\+\S\+')
" default
call matchadd("SeanLarkinnItalicLightMagenta", '\<export\>\s\+\S\+\s\+\zs\<default\>\ze\s\S\+')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Magenta ctermfg=magenta
call matchadd("Magenta", '=>')
