"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: See :help cterm-colors for more information.
" Note: See `:vert h highlight`
" Note: See `:vert h :match`
" Note: https://stackoverflow.com/questions/29192124/how-to-color-function-call-in-vim-syntax-highlighting
" Note: http://learnvimscriptthehardway.stevelosh.com/chapters/46.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" turn syntax on
syntax on
if !exists("g:syntax_on")
    syntax enable
endif

" do not throw error if colorscheme not found
try
    colorscheme solarized
    " colorscheme gruvbox
catch /:E185:/
    " Silently ignore if colorscheme not found
endtry

set background=dark

" make comments italic
highlight Comment cterm=italic

" when searching, highlight found matches as bold white
" todo: not dark/light background-color agnostic
" highlight Search cterm=bold ctermfg=white

" do not change the bacground color of the line numbers (flat ui)
highlight LineNr ctermbg=bg

" remove background color highlighting from the current line number
highlight CursorLineNr ctermbg=bg ctermfg=blue

" todo: not dark/light background-color agnostic
highlight VertSplit ctermfg=bg ctermbg=bg
" highlight VertSplit ctermbg=black ctermfg=black

" do not display "~" character for end of buffer (make text color = bg color)
highlight EndOfBuffer ctermfg=bg ctermbg=NONE

if &background == "dark"

    " Preview (popup) menu syntax highlighting
    highlight Pmenu ctermbg=fg ctermfg=bg
    highlight PmenuSel cterm=reverse ctermbg=fg ctermfg=black

    " Highlighted (in visual mode) syntax highlighting
    highlight Visual cterm=underline,reverse ctermbg=fg ctermfg=black

    " highlight the matching parenthesis/bracket/angle and make it bold white
    highlight MatchParen ctermfg=white ctermbg=bg

    if &filetype == "javascript.jsx"
        call HighlightJavaScript()
    endif
else
    " todo
    highlight Pmenu cterm=reverse ctermbg=fg ctermfg=bg
    highlight PmenuSel ctermbg=white ctermfg=darkblue

    highlight MatchParen ctermfg=black ctermbg=bg
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" autocmd BufEnter,BufRead,BufNewFile,FileType *.js,javascript call HighlightJavaScript()
" autocmd FileType javascript call HighlightJavaScript()

function! HighlightJavaScript()

    " function arguments, JS specific
    highlight Special cterm=italic
    highlight Boolean ctermfg=magenta

    " make numbers deep purple/pink
    " todo: not dark/light background-color agnostic
    highlight Number ctermfg=darkmagenta

    " remove previous syntax highlight (and apply the below highlights)
    call clearmatches()

    highlight DarkBlue ctermfg=darkblue
    " highlight DarkBlue ctermfg=darkblue
    " match DarkBlue /<\s\|\[\|\]\|+=\|<=\|>=\|\s=\s\|\s\W==\s\|\s?\s\|\s:\s\|!\|&\|\s!=\s\|\s|\s\|+\|-\||\|\<\w\+\ze(/
    " match DarkBlue /=>\|==\|>\s\|<\s\|\[\|\]\|+=\|<=\|>=\|\s*=\s*\|\s\W==\s\|!\|&\|\s!=\s\|\s|\s\|+\|-/
    call matchadd("DarkBlue", '=')
    call matchadd("DarkBlue", '>')
    call matchadd("DarkBlue", '<')
    call matchadd("DarkBlue", '+')
    call matchadd("DarkBlue", '-')

    " highlight forward slash only when not followed by a foward slash
    call matchadd("DarkBlue", '/(?=/)')
    " call matchadd("DarkBlue", '*')
    " call matchadd("DarkBlue", '[')
    " call matchadd("DarkBlue", ']')
    call matchadd("DarkBlue", '&')
    call matchadd("DarkBlue", '|')
    call matchadd("DarkBlue",  '?')
    call matchadd("DarkBlue",  ':')
    call matchadd("DarkBlue",  '!')

    " Function calls.
    highlight Erxi3LightBlueKeywords ctermfg=red
    call matchadd("Erxi3LightBlueKeywords", '\<\w\+\ze(')
    " arrow function definition
    call matchadd("Erxi3LightBlueKeywords", '\w\+\s\+\zs\<\h\w*\>\ze\s*=[^.]\+=>')

    highlight ItalicKeywords cterm=italic
    call matchadd("ItalicKeywords", '\zs\<this\>\ze\.\h')
    call matchadd("ItalicKeywords", '\<<.*\zs\w*\ze=.*>')
    call matchadd("ItalicKeywords", '\s@\w*.*$')
    " call matchadd("ItalicKeywords", '\<var\>')
    " call matchadd("ItalicKeywords", '\<let\>')
    " call matchadd("ItalicKeywords", '\<const\>')
    call matchadd("ItalicKeywords", '\<function\>')

    highlight MagentaKeywords ctermfg=magenta
    call matchadd("MagentaKeywords", '\<return\>')

    " JSX any (lowercase-beginning) html-tag
    call matchadd("MagentaKeywords",  '<\zs\l\w*\>\ze.*>')
    call matchadd("MagentaKeywords",  '</\zs\l\w*\>\ze.*>')
    " JSX Custom Components (jsx that begins with upper case letter (\u))
    call matchadd("MagentaKeywords", '[</]\zs\u\w*\>\ze.*>')

endfunction
