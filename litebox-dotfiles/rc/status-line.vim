" https://hackernoon.com/the-last-statusline-for-vim-a613048959b2

function! LintStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_warnings = l:counts.warning + l:counts.style_warning
  let l:all_infos = l:counts.info

  " let l:errors_message = l:all_errors == 0 ? '' : printf('%d ✕', all_errors)
  " let l:warnings_message = l:all_warnings == 0 ? '' : printf('%d⚠  ', all_warnings)

  let l:errors_message = l:all_errors == 0 ? '' : l:all_errors == 1 ? '1 Error ' : printf('%s Errors ', all_errors)
  let l:warnings_message = l:all_warnings == 0 ? '' : l:all_warnings == 1 ? '1 Warning ' : printf('%s Warnings ', all_warnings)
  let l:infos_message = l:all_infos == 0 ? '' : printf('%d i ', all_infos)

  return l:all_errors == 0 && l:all_warnings == 0 && l:all_infos == 0 ? '' : printf('%s%s%s| ', errors_message, warnings_message, infos_message)
endfunction


function! BufferInfo() abort
  let l:buffers = len(getbufinfo({'buflisted':1}))
  let l:bufferNumber = bufnr('%')
  " return l:buffers == 1 ? '' : printf('[#%s of %s]', bufferNumber, buffers)
  " return l:buffers == 1 ? '' : printf('#%s of %s |', bufferNumber, buffers)
  " return l:buffers == 1 ? '' : printf('%s | #%s', buffers, bufferNumber)
  " return l:buffers == 1 ? '' : printf('#%s |', bufferNumber)
  return l:buffers == 1 ? '' : printf('%s |', bufferNumber)
endfunction

function! Modified() abort
  let l:modified = getbufvar(bufnr('%'), '&modified') ? ' ∴' : ''
  " let l:modified = getbufvar(bufnr('%'), '&modified') ? ' ⊕' : ''
  " let l:modified = getbufvar(bufnr('%'), '&modified') ? ' ●' : ''
  " let l:modified = getbufvar(bufnr('%'), '&modified') ? ' | +' : ''
  return printf('%s', modified)
endfunction

" http://vim.wikia.com/wiki/Showing_syntax_highlight_group_in_statusline
" function! SyntaxItem()
"   let l:syntaxItem = synIDattr(synID(line("."),col("."),1),"name")
"   return printf('%s | ', syntaxItem)
" endfunction

" clear it
set statusline=

" set statusline+=%{SyntaxItem()}

set statusline+=%{BufferInfo()}

" space character and full path to file
set statusline+=\ %t
" set statusline+=\ %F

" space character and possibly a `+` if file is modified
set statusline+=%{Modified()}
" set statusline+=\ %M

" statusline stuff after this will be on right side of statusline
set statusline+=%=

" lint errors and warnings separately and with space padding
set statusline+=%{LintStatus()}

" Show line and column numbers (padded with spaces)
" set statusline+=L%l\ C%c\ 
set statusline+=Ln\ %l\ Col\ %c\ 
