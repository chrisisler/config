"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Note: See :help cterm-colors for more information.
" Note: See `:vert h highlight`
" Note: See `:vert h :match`
" Note: https://stackoverflow.com/questions/29192124
" Note: http://learnvimscriptthehardway.stevelosh.com/chapters/46.html
"
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

try
    " colorscheme solarized
    colorscheme onedark
catch /:E185:/
    " Silently ignore if colorscheme not found
endtry

set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
    " highlight MatchParen ctermfg=white ctermbg=bg

    highlight VertSplit ctermfg=bg ctermbg=bg

    if &filetype == "javascript.jsx"
        " call HighlightJavaScriptSolarized()
        call HighlightJavaScriptOneDark()
    endif
else
    " todo
    highlight Pmenu cterm=reverse ctermbg=fg ctermfg=bg
    highlight PmenuSel ctermbg=white ctermfg=darkblue
    " highlight MatchParen ctermfg=black ctermbg=bg
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

autocmd BufEnter,BufRead,BufNewFile,FileType *.js,javascript call HighlightJavaScriptOneDark()
function! HighlightJavaScriptOneDark()

    " todo
    highlight Search cterm=bold,reverse ctermbg=lightmagenta

    call clearmatches()

    highlight OneDarkItalic cterm=italic
    call matchadd("OneDarkItalic", '\<this\>')

    " function arguments, JS specific
    " highlight Special cterm=italic

    " function definition and function call are same 'blue' color.
    highlight FuncDefAndCall ctermfg=darkblue
    call matchadd("FuncDefAndCall", '\<[a-z_]\w*\ze(') " function calls (with lowercase first chars)
    " arrow function definition. does not work for arrow func as class property.
    " call matchadd("FuncDefAndCall", '\w\+\s\+\zs\<[A-Za-z_]\w*\>\ze\s*=[^.]\+=>')
    " arrow function definition. DOES WORK for arrow func as class property.
    " call matchadd("FuncDefAndCall", '\w*\s\+\zs\<[A-Za-z_]\w*\>\ze\s*=[^.]\+=>')
    call matchadd("FuncDefAndCall", '\w*\s\+\zs\<[A-Za-z_]\w*\>\ze\s*=[^.]\+=>')

    " `require` is specifically 'cyan' colored.
    highlight ReservedFunc ctermfg=cyan
    call matchadd("ReservedFunc", '\.\<require\>\ze(')
    call matchadd("ReservedFunc", '\.\<keys\>\ze(')
    call matchadd("ReservedFunc", '\.\<test\>\ze(')
    call matchadd("ReservedFunc", '\.\<slice\>\ze(')
    call matchadd("ReservedFunc", '\.\<forEach\>\ze(')

    " return
    highlight Statement cterm=italic ctermfg=magenta
    " if else
    highlight Conditional cterm=italic ctermfg=magenta
    " for, while, do, of
    highlight Repeat cterm=italic ctermfg=magenta
    " try, catch, finally, throw
    highlight Exception cterm=italic ctermfg=magenta
    " case, default
    highlight Label cterm=italic ctermfg=magenta
    " instanceof, typeof, new, in, void
    highlight Identifier cterm=italic ctermfg=magenta

    highlight Todo cterm=bold,underline ctermfg=NONE

    " highlight OneDarkGolden ctermfg=yellow
    " call matchadd("OneDarkGolden", '(var|let|const|.)\zs[A-Z][A-Z0-9_]*')

    " highlight OneDarkVar cterm=italic ctermfg=magenta
    " call matchadd("OneDarkVar", '\s*[^*/]\zs\<var\>')
    " call matchadd("OneDarkVar", '\s*[^*/]\zs\<let\>')
    " call matchadd("OneDarkVar", '\s*[^*/]\zs\<const\>')
    " call matchadd("OneDarkVar", '\s*[^*/]\zs\<function\>')

    " Note: In One Dark, `Keyword` is the iconic red color.
    highlight OneDarkRed ctermfg=red
    call matchadd("OneDarkRed", '@see\s\+\zs\S\+\ze')
    " make stuff like /** @param {String} myFoo */ highlighted red for `myFoo`
    call matchadd("OneDarkRed", '\*\s*@[A-Za-z]\+\s*{.*}\s*\zs\<\h\S\+\>')

endfunction






function! HighlightJavaScriptSolarized()

    " when searching, highlight found matches as bold white
    highlight Search cterm=bold ctermfg=white

    " remove previous syntax highlight (and apply the below highlights)
    call clearmatches()

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " 
    " Italic
    " 
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " function arguments, JS specific
    highlight Special cterm=italic

    " This native/built-in highlight replaces the `matchadd` call commented out below.
    " This is for @foo thingies in js comments which have types like String which are not italicized.
    highlight SpecialComment cterm=italic ctermfg=darkred
    " call matchadd("ItalicKeywords", '\s@\w*.*$') 

    " Every `Statement` except `Keyword`
    " Italic builtin control flow keywords. See any Sean Larkin coding video on youtube.
    " Does not include `try`, `catch`, `finally`, `return`, `throw`
    highlight Conditional cterm=italic ctermfg=darkgreen
    highlight Repeat cterm=italic ctermfg=darkgreen
    highlight Operator cterm=italic ctermfg=darkgreen
    highlight Label cterm=italic ctermfg=darkgreen
    " I dont think `Exception` actually does anything in JS with yajs highlighting.
    highlight Exception cterm=italic ctermfg=darkgreen
    call matchadd("Exception", '\<try\>')
    call matchadd("Exception", '\<catch\>')
    call matchadd("Exception", '\<finally\>')
    call matchadd("Exception", '\<throw\>')

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Italic - forced custom matches, overrides comments, which is really bad,
    " and the motivation for switching to native/built-in `highlight` groups.
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    highlight ItalicKeywords cterm=italic

    " jsx props
    " call matchadd("ItalicKeywords", '\<<.*\zs\w*\ze=.*>')

    " `this` keyword. Cannot be replaced by builtin/native highlight any group.
    call matchadd("ItalicKeywords", '\zs\<this\>\ze\.\h')

    " `Identifier` = `const`, `let`, `var`, {}, [], `new`, `void`, `in`
    " see below
    " highlight Identifier cterm=italic
    " call matchadd("ItalicKeywords", '\<var\>')
    " call matchadd("ItalicKeywords", '\<let\>')
    " call matchadd("ItalicKeywords", '\<const\>')
    " call matchadd("ItalicKeywords", '\<function\>')

    highlight Return cterm=italic ctermfg=magenta
    call matchadd("Return", '\<return\>')

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " 
    " Other
    " 
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    highlight Boolean ctermfg=darkmagenta
    highlight Number ctermfg=darkmagenta




    " todo: make custon syntax highlighting for these in the same way that
    " the yajs plugin does it.
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







    " JSX any (lowercase-beginning) html-tag
    highlight MagentaKeywords ctermfg=magenta
    call matchadd("MagentaKeywords",  '<\zs\l\w*\>\ze.*>')
    call matchadd("MagentaKeywords",  '</\zs\l\w*\>\ze.*>')
    " JSX Custom Components (jsx that begins with upper case letter (\u))
    call matchadd("MagentaKeywords", '[</]\zs\u\w*\>\ze.*>')






    " Function calls. Cannot be replaced with native highlight groups unfortunately.
    highlight FunctionCallAndArrowFuncDefinition ctermfg=red
    call matchadd("FunctionCallAndArrowFuncDefinition", '\<\w\+\ze(') " function calls
    call matchadd("FunctionCallAndArrowFuncDefinition", '\w\+\s\+\zs\<\h\w*\>\ze\s*=[^.]\+=>') " arrow function definition

endfunction

" autocmd BufEnter,BufRead,BufNewFile,FileType *.js,javascript call HighlightJavaScript()
" autocmd FileType javascript call HighlightJavaScript()
