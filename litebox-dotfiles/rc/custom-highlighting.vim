"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: See :help cterm-colors for more information.
" Note: See `:vert h highlight`
" Note: See `:vert h :match`
" Note: https://stackoverflow.com/questions/29192124
" Note: http://learnvimscriptthehardway.stevelosh.com/chapters/46.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
if !exists("g:syntax_on")
    syntax enable
endif

let g:onedark_termcolors=16
let g:onedark_terminal_italics=1

try
    " for one dark them using 'github.com/joshdick/onedark'
    colorscheme onedark
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " colorscheme one
catch /:E185:/
    " Silently ignore if colorscheme not found
endtry

set background=dark
" set background=light

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 3 is golden/yellow, 4 is blue
" highlight PmenuSel ctermfg=4 ctermbg=bg

" make background of statusline transparent (same as background)
highlight StatusLine ctermfg=fg ctermbg=bg
highlight StatusLineNC ctermfg=15 ctermbg=bg
highlight StatusLineTerm ctermfg=fg ctermbg=bg
highlight StatusLineTermNC ctermfg=15 ctermbg=bg

" remove obnoxious highlighting from quickfix window
highlight QuickFixLine ctermfg=fg ctermbg=bg

highlight Comment cterm=italic

" do not change the background color of the line numbers (flat ui)
highlight LineNr ctermbg=bg
" highlight CursorLineNr ctermbg=bg

" do not display ~ character for end of buffer (make text color = bg color)
highlight EndOfBuffer ctermfg=bg ctermbg=NONE

" do not show split separators
highlight VertSplit ctermfg=bg ctermbg=bg

highlight MatchParen cterm=bold,underline ctermfg=3 ctermbg=bg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &background == "dark"
  if &filetype == "rust"
    call HighlightRustOneDark()
  endif
  if &filetype == "java"
    call HighlightJava()
  endif

  if &filetype == "javascript" || &filetype == "typescript" || &filetype == "javascript.jsx"
    call HighlightJavaScriptOne()
    " call HighlightJavaScriptSolarized()
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
  if &filetype == "javascript" || &filetype == "typescript" || &filetype == "javascript.jsx"
    call HighlightJavaScriptOne()
  endif
endif


autocmd BufEnter,BufRead,BufNewFile,FileType *.rs call HighlightRustOneDark()
function! HighlightRustOneDark()
  source ~/.vim/rc/syntax-highlighting/onedark-rust.vim
endfunction

autocmd BufEnter,BufRead,BufNewFile,FileType *.java call HighlightJava()
function! HighlightJava()
  source ~/.vim/rc/syntax-highlighting/java.vim
endfunction

autocmd BufEnter,BufRead,BufNewFile,FileType *.js,javascript call HighlightJavaScriptOne()
function! HighlightJavaScriptOne()
  source ~/.vim/rc/syntax-highlighting/default-dark-js.vim
  " source ~/.vim/rc/syntax-highlighting/one-javascript.vim
endfunction

autocmd BufEnter,BufRead,BufNewFile,FileType *.ts,tsx call SetFT()
function! SetFT()
  set ft=javascript
endfunction

" function! HighlightJavaScriptSolarized()
"   source ~/.vim/rc/syntax-highlighting/solarized-javascript.vim
" endfunction
" autocmd BufEnter,BufRead,BufNewFile,FileType *.js,javascript call HighlightJavaScriptSolarized()
