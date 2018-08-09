" I want a mapping that copies lines x through y and pastes them at line z
" I want a mapping that deletes lines x through y
set nocompatible
source $HOME/.vim/rc/general-settings.vim
source $HOME/.vim/rc/plugins.vim
source $HOME/.vim/rc/mappings.vim
source $HOME/.vim/rc/custom-highlighting.vim
source $HOME/.vim/rc/misc.vim

" auto close vim if only remaining window is NerdTree
autocmd BufEnter * if (winnr("$") ==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" todo
" - automatically invoke `:Codi` for ~/Code/Test/test.js
