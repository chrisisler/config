""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" highlight PmenuSel ctermfg=4 ctermbg=bg

" make background of statusline transparent (same as background)
highlight StatusLine ctermfg=fg ctermbg=8 cterm=italic,bold
highlight StatusLineNC ctermfg=15 ctermbg=8
highlight StatusLineTerm ctermfg=fg ctermbg=8 cterm=italic,bold
highlight StatusLineTermNC ctermfg=15 ctermbg=8

" remove obnoxious highlighting from quickfix window
highlight QuickFixLine ctermfg=fg ctermbg=bg

highlight Comment cterm=italic

highlight LineNr ctermbg=NONE
highlight CursorLineNr ctermbg=8

" do not display ~ character for end of buffer (make text color = bg color)
highlight EndOfBuffer ctermfg=bg ctermbg=NONE

" do not show split separators
highlight VertSplit ctermfg=bg ctermbg=8

hi MatchParen ctermfg=NONE ctermbg=NONE cterm=underline,bold

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &filetype == "javascript" || &filetype == "javascript.jsx"
  call HighlightJavaScriptOne()
  " call HighlightJavaScriptSolarized()
elseif &filetype == "rust"
  call HighlightRustOneDark()
elseif &filetype == "racket"
  call HighlightRacketOne()
elseif &filetype == "java"
  call HighlightJava()
endif

autocmd BufEnter,BufRead,BufNewFile,FileType *.rkt call HighlightRacketOne()
function! HighlightRacketOne()
  source ~/.vim/rc/syntax-highlighting/one-racket.vim
endfunction

autocmd BufEnter,BufRead,BufNewFile,FileType *.py call HighlightPython()
function! HighlightPython()
  source ~/.vim/rc/syntax-highlighting/custom-python.vim
endfunction

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
  if &background == "dark"
    source ~/.vim/rc/syntax-highlighting/one-javascript.vim
  elseif &background == "light"
    source ~/.vim/rc/syntax-highlighting/default-dark-js.vim
  endif
endfunction

autocmd BufEnter,BufRead,BufNewFile,FileType *.ts,*.tsx,typescript call HighlightJavaScriptOneTS()
function! HighlightJavaScriptOneTS()
  set filetype=javascript.jsx.typescript
  if &background == "dark"
    source ~/.vim/rc/syntax-highlighting/one-javascript.vim
  elseif &background == "light"
    source ~/.vim/rc/syntax-highlighting/default-dark-js.vim
  endif
endfunction


" function! HighlightJavaScriptSolarized()
"   source ~/.vim/rc/syntax-highlighting/solarized-javascript.vim
" endfunction
" autocmd BufEnter,BufRead,BufNewFile,FileType *.js,javascript call HighlightJavaScriptSolarized()
