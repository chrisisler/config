"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: See :help cterm-colors for more information.
" Note: See `:vert h highlight`
" Note: See `:vert h :match`
" Note: https://stackoverflow.com/questions/29192124/how-to-color-function-call-in-vim-syntax-highlighting
" Note: http://learnvimscriptthehardway.stevelosh.com/chapters/46.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" Theme and background (dark/light) color agnostic
" 
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

" do not change the bacground color of the line numbers (flat ui)
highlight LineNr ctermbg=bg

" remove background color highlighting from the current line number
highlight CursorLineNr ctermbg=bg ctermfg=green


" do not display "~" character for end of buffer (make text color = bg color)
highlight EndOfBuffer ctermfg=bg ctermbg=NONE



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" Theme and background (dark/light) color dependent
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if &background == "dark"

    " Preview (popup) menu syntax highlighting
    highlight Pmenu ctermbg=fg ctermfg=bg
    highlight PmenuSel cterm=reverse ctermbg=fg ctermfg=black
    highlight PmenuThumb ctermbg=fg ctermfg=bg

    " highlight the matching parenthesis/bracket/angle and make it bold white
    highlight MatchParen ctermfg=white ctermbg=bg

    " when searching, highlight found matches as bold white
    highlight Search cterm=bold ctermfg=white

    highlight VertSplit ctermfg=bg ctermbg=bg

    if &filetype == "javascript.jsx"
        call HighlightJavaScript()
    endif
else
    " todo
    highlight Pmenu cterm=reverse ctermbg=fg ctermfg=bg
    highlight PmenuSel ctermbg=white ctermfg=darkblue
    highlight MatchParen ctermfg=black ctermbg=bg
    highlight Search cterm=bold ctermfg=black
    highlight VertSplit ctermfg=bg ctermbg=bg

    " done
    " ...
endif

" Highlighted (in visual mode) syntax highlighting
highlight Visual cterm=reverse ctermbg=fg ctermfg=black


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" Solarized Dark JavaScript specific syntax highlighting
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function! HighlightJavaScript()

    " remove previous syntax highlight (and apply the below highlights)
    call clearmatches()

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " 
    " Italic
    " 
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " function arguments, JS specific
    highlight Special cterm=italic

    " Every `Statement` except `Keyword`
    " Italic builtin control flow keywords. See any Sean Larkin coding video on youtube.
    " Does not include `try`, `catch`, `finally`, `return`
    " highlight Conditional cterm=italic ctermfg=darkgreen
    " highlight Repeat cterm=italic ctermfg=darkgreen
    " highlight Operator cterm=italic ctermfg=darkgreen
    " highlight Label cterm=italic ctermfg=darkgreen
    " highlight Exception cterm=italic ctermfg=darkgreen

    highlight ItalicKeywords cterm=italic
    " call matchadd("ItalicKeywords", '\zs\<this\>\ze\.\h') " `this` keyword

    " This native/built-in highlight replaces the `matchadd` call commented out below.
    highlight SpecialComment cterm=italic ctermfg=darkred
    " call matchadd("ItalicKeywords", '\s@\w*.*$') 

    " call matchadd("ItalicKeywords", '\<var\>')
    " call matchadd("ItalicKeywords", '\<let\>')
    " call matchadd("ItalicKeywords", '\<const\>')
    " call matchadd("ItalicKeywords", '\<function\>')

    call matchadd("ItalicKeywords", '\<<.*\zs\w*\ze=.*>') " jsx props

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " 
    " Other
    " 
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    highlight Boolean ctermfg=darkmagenta
    highlight Number ctermfg=darkmagenta




    highlight OperatorSymbol ctermfg=darkblue
    call matchadd("OperatorSymbol", '=')
    call matchadd("OperatorSymbol", '>')
    call matchadd("OperatorSymbol", '<')
    call matchadd("OperatorSymbol", '+')
    call matchadd("OperatorSymbol", '-')
    call matchadd("OperatorSymbol", '&')
    call matchadd("OperatorSymbol", '|')
    call matchadd("OperatorSymbol",  '?')
    call matchadd("OperatorSymbol",  ':')
    call matchadd("OperatorSymbol",  '!')
    " call matchadd("OperatorSymbol", '/')
    " call matchadd("OperatorSymbol", '*')
    " call matchadd("OperatorSymbol", '[')
    " call matchadd("OperatorSymbol", ']')






    " highlight MagentaKeywords ctermfg=magenta
    " call matchadd("MagentaKeywords", '\<return\>')

    " JSX any (lowercase-beginning) html-tag
    call matchadd("MagentaKeywords",  '<\zs\l\w*\>\ze.*>')
    call matchadd("MagentaKeywords",  '</\zs\l\w*\>\ze.*>')
    " JSX Custom Components (jsx that begins with upper case letter (\u))
    call matchadd("MagentaKeywords", '[</]\zs\u\w*\>\ze.*>')






    " Function calls. Cannot be replaced with native highlight groups unfortunately.
    highlight FunctionCallAndArrowFuncDefinition ctermfg=red
    call matchadd("FunctionCallAndArrowFuncDefinition", '\<\w\+\ze(') " function calls
    call matchadd("FunctionCallAndArrowFuncDefinition", '\w\+\s\+\zs\<\h\w*\>\ze\s*=[^.]\+=>') " arrow function definition


endfunction

autocmd BufEnter,BufRead,BufNewFile,FileType *.js,javascript call HighlightJavaScript()
" autocmd FileType javascript call HighlightJavaScript()
