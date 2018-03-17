set nocompatible
source $HOME/.vim/rc/general-settings.vim
source $HOME/.vim/rc/plugins.vim
source $HOME/.vim/rc/mappings.vim
source $HOME/.vim/rc/custom-highlighting.vim
source $HOME/.vim/rc/misc.vim

" auto close if only remaining window is NerdTree
autocmd BufEnter * if (winnr("$") ==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" autocmd VimEnter * call OnVimStartUp()
" function! OnVimStartUp()
  " NERDTree
  " wincmd l
  " Minimap
" endfunction

" autocmd VimLeavePre * call OnVimLeavePre()
" function! OnVimLeavePre()
" endfunction

" autocmd BufEnter * call OnBufEnter()
" function! OnBufEnter()
"   if (exists("b:NERDTree") && b:NERDTree.isTabTree()) 
"     q 
"   endif
"   aug QFClose
"     au!
"     au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix" | q | endif
"   aug END
" endfunction
