call clearmatches()

let word = '[a-zA-Z0-9:_\-]\+'

" highlight Red ctermfg=red
" call matchadd("Red", word)

" highlight FnCall ctermfg=5
" call matchadd("FnCall", '(\zs' . word)
" call matchadd("FnCall", '\[\zs' . word)
" " call matchadd("FnCall", '(\zs' . word . '\ze[^)]')

" highlight Predicate ctermfg=5
" call matchadd("Predicate", '\<' . word . '?\>')

" highlight Native ctermfg=13
highlight Native ctermfg=4
call matchadd("Native", '(\zsdefine\>')
call matchadd("Native", '(\zslambda\>')

" highlight Parens ctermfg=12
" call matchadd("Parens", '[()]')
" highlight Parens2 ctermfg=magenta
" call matchadd("Parens2", '[\[\]]')

highlight Args ctermfg=red
call matchadd("Args", '(define\(\/\w\+\)\?\s\+(\S\+\s\+\zs[a-zA-Z0-9 :_\-]\+')

highlight Comment ctermfg=15
call matchadd("Comment", '#|\zs.*\ze|#$')
call matchadd("Comment", '^\s*;\zs.*')
