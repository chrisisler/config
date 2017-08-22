" http://vim.wikia.com/wiki/Automatically_fitting_a_quickfix_window_height
au FileType qf call AdjustWindowHeight(2, 15)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line('$')+1, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

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
