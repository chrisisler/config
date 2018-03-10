set nocompatible
source $HOME/.vim/rc/general-settings.vim
source $HOME/.vim/rc/plugins.vim
source $HOME/.vim/rc/mappings.vim
source $HOME/.vim/rc/custom-highlighting.vim
source $HOME/.vim/rc/misc.vim

autocmd VimEnter * call OnVimStartUp()
function! OnVimStartUp()
  " list of commands to execute on vim init
  " NERDTree
  " wincmd l
  " Minimap
endfunction

" " autocmd VimLeavePre * call OnVimLeavePre()
" function! OnVimLeavePre()
  " list of commands to execute before vim exit
  " if (winnr("$") ==1 && exists("loaded_minimap")) | MinimapClose | endif
" endfunction

" auto close if only remaining window is NerdTree
" autocmd BufEnter * if (winnr("$") ==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufEnter * call OnBufEnter()
function! OnBufEnter()
  if (exists("b:NERDTree") && b:NERDTree.isTabTree()) 
    q 
  endif
  aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix" | q | endif
  aug END
endfunction

" vimL syntax:
" if exists('loaded_minimap')
"     finish
" endif
