""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" au! FileType css,scss,sass setl iskeyword+=-

" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =


" http://vim.wikia.com/wiki/Automatically_fitting_a_quickfix_window_height

au FileType qf call AdjustWindowHeight(2, 10)
function! AdjustWindowHeight(minheight, maxheight)
    if !g:ale_open_list
        exe max([min([line('$')+1, a:maxheight]), a:minheight]) . "wincmd _"
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Exclude quickfix window from `:bn[ext]` and `:bp[revious]` commands.
" Essentially cements it as an output-only window positioned at bottom.
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=2000
        " echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=200
        " echo 'Highlight current word: ON'
        return 1
    endif
endfunction
" uncomment the line below to auto highlight the hovered word
" call AutoHighlightToggle()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Insert mode: line cursor
" Otherwise, block cursor
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    " let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    " let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" auto close vim if only remaining window is NerdTree
autocmd BufEnter * if (winnr("$") ==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


au FileType qf setlocal linebreak wrap nonumber nocursorline colorcolumn= statusline=\ Info
au FileType nerdtree setlocal nocursorline statusline=\ Explorer


if has('nvim')
  au TermOpen * setlocal nonumber statusline=\ Terminal
else
  au TerminalOpen * setlocal nonumber statusline=\ Terminal
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead,BufNewFile,BufEnter,FileType *.java set shiftwidth=4 tabstop=4

" Follow Rust code style rules
au BufRead,BufNewFile,BufEnter,FileType rust set shiftwidth=4 tabstop=4
" au Filetype rust source ~/.vim/scripts/spacetab.vim
" au Filetype rust set colorcolumn=100

" au BufRead,BufNewFile,BufEnter,FileType *.txt,*.md set nocursorline nonumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" https://stackoverflow.com/questions/2378004/how-to-block-column-paste-in-vim
