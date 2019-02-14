call clearmatches()

highlight Fn ctermfg=red
call matchadd("Fn", '(\zs\<.+\>')
