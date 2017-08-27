"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Note: See :help cterm-colors for more information.
" Note: See `:vert h highlight`
" Note: See `:vert h :match`
"
" Note: https://stackoverflow.com/questions/29192124/how-to-color-function-call-in-vim-syntax-highlighting
" Note: http://learnvimscriptthehardway.stevelosh.com/chapters/46.html
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
if !exists("g:syntax_on")
    syntax enable
endif


try
    colorscheme solarized
catch /:E185:/
    " Silently ignore if colorscheme not found
endtry

set background=dark

call clearmatches()

highlight Comment cterm=italic
highlight Special cterm=italic
highlight Number ctermfg=darkmagenta
highlight MatchParen cterm=underline ctermfg=white ctermbg=NONE
highlight Search cterm=bold ctermfg=white
highlight LineNr ctermbg=NONE
highlight CursorLineNr ctermbg=NONE ctermfg=yellow
highlight VertSplit ctermbg=black ctermfg=black
highlight EndOfBuffer ctermfg=black ctermbg=NONE

" " Preview (popup) menu syntax highlighting
highlight Pmenu ctermbg=white ctermfg=black

highlight DarkBlue ctermfg=darkblue
" highlight DarkBlue ctermfg=darkblue
" match DarkBlue /<\s\|\[\|\]\|+=\|<=\|>=\|\s=\s\|\s\W==\s\|\s?\s\|\s:\s\|!\|&\|\s!=\s\|\s|\s\|+\|-\||\|\<\w\+\ze(/
match DarkBlue /\s==\s\|>\s\|<\s\|\[\|\]\|+=\|<=\|>=\|\s=\s\|\s\W==\s\|\s?\s\|\s:\s\|!\|&\|\s!=\s\|\s|\s\|+\|-/

" Function calls.
highlight Erxi3LightBlueKeywords ctermfg=red
call matchadd("Erxi3LightBlueKeywords", '\<\w\+\ze(')
call matchadd("Erxi3LightBlueKeywords", '\s\+\zs\h\w\+\ze\s*=\s*')

highlight ItalicKeywords cterm=italic
call matchadd("ItalicKeywords", '\<this\>')
call matchadd("ItalicKeywords", '\<<.*\zs\w*\ze=.*>')
call matchadd("ItalicKeywords", '\<arguments\>')
call matchadd("ItalicKeywords", '\<var\>')
call matchadd("ItalicKeywords", '\<let\>')
call matchadd("ItalicKeywords", '\<const\>')
call matchadd("ItalicKeywords", '\<function\>')
call matchadd("ItalicKeywords", '\s@\w*.*$')

highlight MagentaKeywords ctermfg=magenta
call matchadd("MagentaKeywords", '\<return\>')
call matchadd("MagentaKeywords", '\<void\>')
call matchadd("MagentaKeywords", '\<null\>')
call matchadd("MagentaKeywords", '\<new\>')
call matchadd("MagentaKeywords", '=>')
call matchadd("MagentaKeywords", '\s?\s')
call matchadd("MagentaKeywords", '\s:\s')
call matchadd("MagentaKeywords",  '<\zs\l\w*\>\ze.*>')
" JSX any (lowercase-beginning) html-tag
call matchadd("MagentaKeywords",  '</\zs\l\w*\>\ze.*>')
" JSX Custom Components (jsx that begins with upper case letter (\u))
call matchadd("MagentaKeywords", '[</]\zs\u\w*\>\ze.*>')

highlight DarkMagentaKeywords ctermfg=darkmagenta
call matchadd("DarkMagentaKeywords", '\<__dirname\>')
call matchadd("DarkMagentaKeywords", '\<__filename\>')
" " call matchadd("DarkMagentaKeywords", '\<true\>')
" " call matchadd("DarkMagentaKeywords", '\<false\>')
