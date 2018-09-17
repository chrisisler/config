" Resources:
" - https://hackernoon.com/the-last-statusline-for-vim-a613048959b2

" function! GitInfo() abort
"   " . ~/Code/Status/git.sh
"   let l:result = system('/bin/bash ~/Code/Status/git-vim-statusline.sh')
"   return printf("%s", result)
" endfunction

function! LintStatus() abort
  " let g:ale_statusline_format=['[%d Errors]', '[%d Warnings]', '']
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_warnings = l:counts.warning + l:counts.style_warning
  let l:all_infos = l:counts.info

  let l:errors_message = l:all_errors == 0 ? '' : printf('%d ✕', all_errors)
  let l:warnings_message = l:all_warnings == 0 ? '' : printf('%d ⚠', all_warnings)
  let l:infos_message = l:all_infos == 0 ? '' : printf('%d i', all_infos)
  return l:all_errors == 0 && l:all_warnings == 0 && l:all_infos == 0 ? '' : printf('%s %s %s', errors_message, warnings_message, infos_message)

  " return l:counts.total == 0 ? '' : printf(
  "       \   '[%d E] [%d W]',
  "       \   all_errors,
  "       \   all_warnings
  "       \)
endfunction

function! TotalNumberOfOpenBuffers() abort
  let l:buffers = len(getbufinfo({'buflisted':1}))
  return l:buffers == 1 ? '' : printf('[%s]', buffers)
endfunction

" clear it
set statusline=

set statusline+=%{TotalNumberOfOpenBuffers()}

" space character and full path to file
set statusline+=\ %F

" space character and possibly a `+` if file is modified
set statusline+=\ %M

" statusline stuff after this will be on right side of statusline
set statusline+=%=

" lint errors and warnings separately and with space padding
set statusline+=%{LintStatus()}

" Show line and column numbers (padded with spaces)
set statusline+=Ln\ %l\ Col\ %c\ 
