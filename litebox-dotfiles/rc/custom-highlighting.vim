"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Note: See :help cterm-colors for more information.
" Note: See `:vert h highlight`
" Note: See `:vert h :match`
" Note: https://stackoverflow.com/questions/29192124
" Note: http://learnvimscriptthehardway.stevelosh.com/chapters/46.html
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove line numbers for quickfix window
" au FileType qf setlocal nonumber colorcolumn=


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

try
    " colorscheme solarized
    colorscheme onedark
catch /:E185:/
    " Silently ignore if colorscheme not found
endtry

set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remove obnoxious highlighting from quickfix window
highlight QuickFixLine ctermfg=fg ctermbg=bg

highlight MatchParen cterm=bold,reverse ctermbg=bg ctermfg=darkgray
" highlight MatchParen cterm=bold ctermbg=bg ctermfg=3
" highlight MatchParen cterm=bold ctermbg=darkgray ctermfg=black
" highlight MatchParen cterm=bold,underline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight Comment cterm=italic

" do not change the bacground color of the line numbers (flat ui)
" highlight LineNr ctermbg=bg
" highlight CursorLineNr ctermbg=bg

" do not display ~ character for end of buffer (make text color = bg color)
highlight EndOfBuffer ctermfg=bg ctermbg=NONE




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" Theme and background (dark/light) color dependent
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if &background == "dark"

    " Preview (popup) menu syntax highlighting
    " highlight Pmenu ctermbg=fg ctermfg=bg
    " highlight PmenuSel cterm=reverse ctermbg=fg ctermfg=black
    " highlight PmenuThumb ctermbg=fg ctermfg=bg

    " highlight the matching parenthesis/bracket/angle and make it bold white
    " highlight MatchParen ctermfg=white ctermbg=bg

    " highlight VertSplit ctermfg=fg ctermbg=fg

    " highlight VertSplit ctermfg=bg ctermbg=bg

    if &filetype == "rust"
      call HighlightRustOneDark()
    endif

    if &filetype == "javascript.jsx" || &filetype == "typescript"
        " call HighlightJavaScriptSolarized()
        call HighlightJavaScriptOneDark()
    endif

    if &filetype == "java"
        highlight _FuncDefAndCall ctermfg=darkblue
        call matchadd("_FuncDefAndCall", '\<\h\w*\>\ze(')

        highlight javaConditional ctermfg=magenta cterm=italic
        highlight javaExceptions ctermfg=magenta cterm=italic
        highlight javaRepeat ctermfg=magenta cterm=italic
        highlight javaOperator ctermfg=magenta cterm=italic
        highlight Statement ctermfg=magenta cterm=italic
    endif
else
    " todo
    " highlight Pmenu cterm=reverse ctermbg=fg ctermfg=bg
    " highlight PmenuSel ctermbg=white ctermfg=darkblue
    " highlight MatchParen ctermfg=black ctermbg=bg
    " highlight Search cterm=bold ctermfg=black
    " highlight VertSplit ctermfg=bg ctermbg=bg

    " done
    " ...
endif

" Highlighted (in visual mode) syntax highlighting
" highlight Visual ctermbg=fg ctermfg=black

autocmd BufEnter,BufRead,BufNewFile,FileType *.rs call HighlightRustOneDark()
function! HighlightRustOneDark()
    source ~/.vim/rc/syntax-highlighting/onedark-rust.vim
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" One Dark JavaScript specific syntax highlighting
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


autocmd BufEnter,BufRead,BufNewFile,FileType *.js,javascript call HighlightJavaScriptOneDark()
function! HighlightJavaScriptOneDark()
    source ~/.vim/rc/syntax-highlighting/onedark-javascript.vim
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" Solarized JavaScript specific syntax highlighting
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"function! HighlightJavaScriptSolarized()
"    highlight CursorLineNr ctermbg=bg ctermfg=green

"    " when searching, highlight found matches as bold white
"    highlight Search cterm=bold ctermfg=white

"    " remove previous syntax highlight (and apply the below highlights)
"    call clearmatches()

"    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    " 
"    " Italic
"    " 
"    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"    " function arguments, JS specific
"    highlight Special cterm=italic

"    " This native/built-in highlight replaces the `matchadd` call commented out below.
"    " This is for @foo thingies in js comments which have types like String which are not italicized.
"    highlight SpecialComment cterm=italic ctermfg=darkred
"    " call matchadd("ItalicKeywords", '\s@\w*.*$') 

"    " Every `Statement` except `Keyword`
"    " Italic builtin control flow keywords. See any Sean Larkin coding video on youtube.
"    " Does not include `try`, `catch`, `finally`, `return`, `throw`
"    highlight Conditional cterm=italic ctermfg=darkgreen
"    highlight Repeat cterm=italic ctermfg=darkgreen
"    highlight Operator cterm=italic ctermfg=darkgreen
"    highlight Label cterm=italic ctermfg=darkgreen
"    " I dont think `Exception` actually does anything in JS with yajs highlighting.
"    highlight Exception cterm=italic ctermfg=darkgreen
"    call matchadd("Exception", '\<try\>')
"    call matchadd("Exception", '\<catch\>')
"    call matchadd("Exception", '\<finally\>')
"    call matchadd("Exception", '\<throw\>')

"    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    " Italic - forced custom matches, overrides comments, which is really bad,
"    " and the motivation for switching to native/built-in `highlight` groups.
"    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"    highlight ItalicKeywords cterm=italic

"    " jsx props
"    " call matchadd("ItalicKeywords", '\<<.*\zs\w*\ze=.*>')
"    call matchadd("ItalicKeywords", '\zs\<\h\w*\>\ze=.\+')

"    " `this` keyword. Cannot be replaced by builtin/native highlight any group.
"    call matchadd("ItalicKeywords", '\zs\<this\>\ze\.\h')

"    " `Identifier` = `const`, `let`, `var`, {}, [], `new`, `void`, `in`
"    " see below
"    " highlight Identifier cterm=italic
"    " call matchadd("ItalicKeywords", '\<var\>')
"    " call matchadd("ItalicKeywords", '\<let\>')
"    " call matchadd("ItalicKeywords", '\<const\>')
"    " call matchadd("ItalicKeywords", '\<function\>')

"    highlight Return cterm=italic ctermfg=magenta
"    call matchadd("Return", '\<return\>')

"    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    " 
"    " Other
"    " 
"    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"    highlight Boolean ctermfg=darkmagenta
"    highlight Number ctermfg=darkmagenta




"    " todo: make custon syntax highlighting for these in the same way that
"    " the yajs plugin does it.
"    highlight OperatorSymbol ctermfg=darkblue
"    call matchadd("OperatorSymbol", '=')
"    call matchadd("OperatorSymbol", '>')
"    call matchadd("OperatorSymbol", '<')
"    call matchadd("OperatorSymbol", '+')
"    call matchadd("OperatorSymbol", '-')
"    call matchadd("OperatorSymbol", '&')
"    call matchadd("OperatorSymbol", '|')
"    call matchadd("OperatorSymbol",  '?')
"    call matchadd("OperatorSymbol",  ':')
"    call matchadd("OperatorSymbol",  '!')
"    " call matchadd("OperatorSymbol", '/')
"    " call matchadd("OperatorSymbol", '*')
"    " call matchadd("OperatorSymbol", '[')
"    " call matchadd("OperatorSymbol", ']')







"    " JSX any (lowercase-beginning) html-tag
"    highlight MagentaKeywords ctermfg=magenta
"    call matchadd("MagentaKeywords",  '<\zs\l\w*\>\ze.*>')
"    call matchadd("MagentaKeywords",  '</\zs\l\w*\>\ze.*>')
"    " JSX Custom Components (jsx that begins with upper case letter (\u))
"    call matchadd("MagentaKeywords", '[</]\zs\u\w*\>\ze.*>')






"    " Function calls. Cannot be replaced with native highlight groups unfortunately.
"    highlight FunctionCallAndArrowFuncDefinition ctermfg=red
"    call matchadd("FunctionCallAndArrowFuncDefinition", '\<\w\+\ze(') " function calls
"    call matchadd("FunctionCallAndArrowFuncDefinition", '\w\+\s\+\zs\<\h\w*\>\ze\s*=[^.]\+=>') " arrow function definition

"endfunction

"" autocmd BufEnter,BufRead,BufNewFile,FileType *.js,javascript call HighlightJavaScript()
"" autocmd FileType javascript call HighlightJavaScript()
