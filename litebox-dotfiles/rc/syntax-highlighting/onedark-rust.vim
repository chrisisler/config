call clearmatches()


" todo: `mut`


highlight rustArrowCharacter ctermfg=magenta
highlight rustOperator ctermfg=cyan
highlight rustModPath ctermfg=fg cterm=NONE


highlight rustPubScope ctermfg=magenta cterm=bold


highlight For ctermfg=9
call matchadd("For", '\<for\>\ze\s\+\<\h\w*\>')


" highlight rustFoldBraces ctermfg=magenta cterm=bold
