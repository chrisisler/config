"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Note: See :help cterm-colors for more information.
" Note: See `:vert h highlight`
" Note: See `:vert h :match`
" Note: https://stackoverflow.com/questions/29192124
" Note: http://learnvimscriptthehardway.stevelosh.com/chapters/46.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove line numbers for quickfix window
au FileType qf setlocal nonumber colorcolumn=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" set background=light

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remove obnoxious highlighting from quickfix window
highlight QuickFixLine ctermfg=fg ctermbg=bg

highlight Comment cterm=italic

" do not change the background color of the line numbers (flat ui)
highlight LineNr ctermbg=bg
" highlight CursorLineNr ctermbg=bg

" do not display ~ character for end of buffer (make text color = bg color)
highlight EndOfBuffer ctermfg=bg ctermbg=NONE

highlight VertSplit ctermfg=bg ctermbg=bg

highlight MatchParen cterm=none ctermfg=cyan ctermbg=bg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme and background (dark/light) color dependent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &background == "dark"
  " highlight Pmenu ctermbg=fg ctermfg=bg
  " highlight PmenuSel cterm=bold ctermbg=15 ctermfg=cyan
  " highlight PmenuThumb ctermbg=fg ctermfg=bg

  if &filetype == "rust"
    call HighlightRustOneDark()
  endif

  if &filetype == "javascript" || &filetype == "typescript" || &filetype == "javascript.jsx"
    " NOTES:
    " doesn't work for keyword 'async' inside a class definition
    " highlight javascriptAsyncFuncKeyword ctermfg=magenta cterm=italic

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " colorscheme-dependent syntax highlighting overrides:

    call HighlightJavaScriptOneDark()

    " call HighlightJavaScriptSolarized()
    " function! HighlightJavaScriptSolarized()
    "   source ~/.vim/rc/syntax-highlighting/solarized-javascript.vim
    " endfunction
    " autocmd BufEnter,BufRead,BufNewFile,FileType *.js,javascript call HighlightJavaScriptSolarized()
  endif

  " if &filetype == "java"
  "     highlight _FuncDefAndCall ctermfg=darkblue
  "     call matchadd("_FuncDefAndCall", '\<\h\w*\>\ze(')

  "     highlight javaConditional ctermfg=magenta cterm=italic
  "     highlight javaExceptions ctermfg=magenta cterm=italic
  "     highlight javaRepeat ctermfg=magenta cterm=italic
  "     highlight javaOperator ctermfg=magenta cterm=italic
  "     highlight Statement ctermfg=magenta cterm=italic
  " endif
elseif &background == "light"
  " highlight Pmenu cterm=reverse ctermbg=fg ctermfg=bg
  " highlight PmenuSel ctermbg=white ctermfg=darkblue
  " highlight MatchParen ctermfg=black ctermbg=bg
  " highlight Search cterm=bold ctermfg=black
  " highlight VertSplit ctermfg=bg ctermbg=bg
endif


"-----------------------------------------------------------------------------
" One Dark Rust specific syntax highlighting
"-----------------------------------------------------------------------------

autocmd BufEnter,BufRead,BufNewFile,FileType *.rs call HighlightRustOneDark()
function! HighlightRustOneDark()
  source ~/.vim/rc/syntax-highlighting/onedark-rust.vim
endfunction

autocmd BufEnter,BufRead,BufNewFile,FileType *.js,javascript call HighlightJavaScriptOneDark()
function! HighlightJavaScriptOneDark()
  source ~/.vim/rc/syntax-highlighting/onedark-javascript.vim
endfunction

autocmd BufEnter,BufRead,BufNewFile,FileType *.ts,tsx call SetFT()
function! SetFT()
  set ft=javascript
endfunction
