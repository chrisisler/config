""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" http://vim.wikia.com/wiki/Automatically_fitting_a_quickfix_window_height
au FileType qf call AdjustWindowHeight(2, 12)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line('$')+1, a:maxheight]), a:minheight]) . "wincmd _"
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


" Swap iTerm2 cursors in vim insert mode when using tmux
" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

    " for tmate (brew install tmate)
    " set term=screen-256color
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" let &t_ti.="\e[1 q"
" let &t_te.="\e[0 q"
" let &t_SI.="\e[5 q"
" let &t_EI.="\e[1 q"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" auto close vim if only remaining window is NerdTree
autocmd BufEnter * if (winnr("$") ==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" runtime macros/matchit.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


au FileType qf setlocal wrap number nocursorline colorcolumn= statusline=Info
au FileType nerdtree setlocal nocursorline statusline=Explorer

" https://github.com/junegunn/fzf/blob/master/README-VIM.md#hide-statusline
" autocmd! FileType fzf
" autocmd  FileType fzf set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


" TODO
" au BufRead,BufNewFile,BufEnter,FileType terminfo setlocal statusline=Terminal
" au BufRead,BufNewFile,BufEnter,FileType cterm setlocal statusline=Terminal


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead,BufNewFile,BufEnter,FileType *.java set shiftwidth=4 tabstop=4 cursorline

" Follow Rust code style rules
au BufRead,BufNewFile,BufEnter,FileType rust set shiftwidth=4 tabstop=4
" au Filetype rust source ~/.vim/scripts/spacetab.vim
" au Filetype rust set colorcolumn=100

au BufRead,BufNewFile,BufEnter,FileType *.txt set nocursorline nonumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" https://stackoverflow.com/questions/2378004/how-to-block-column-paste-in-vim
