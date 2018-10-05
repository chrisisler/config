call clearmatches()


highlight rustArrowCharacter ctermfg=magenta
call matchadd("rustArrowCharacter", '\s\+\zs=>\ze\s\+')
highlight rustOperator ctermfg=cyan
highlight rustModPath ctermfg=blue cterm=NONE
highlight rustModPathSep ctermfg=cyan
highlight rustPubScope ctermfg=magenta cterm=bold
highlight rustLifetime ctermfg=13

highlight Conditional ctermfg=9
