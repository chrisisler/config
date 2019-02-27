" https://hackernoon.com/the-last-statusline-for-vim-a613048959b2

" Functions -------------------------------------------------------------------

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

  return l:all_errors == 0 && l:all_warnings == 0 && l:all_infos == 0 ? '' : printf('%s%s%s', errors_message, warnings_message, infos_message)
  " return l:all_errors == 0 && l:all_warnings == 0 && l:all_infos == 0 ? '' : printf('%s%s%s| ', errors_message, warnings_message, infos_message)
endfunction

function! BufferInfo() abort
  let l:buffers = len(getbufinfo({'buflisted':1}))
  let l:bufferNumber = bufnr('%')
  " return l:buffers == 1 ? '' : printf('#%s of %s |', bufferNumber, buffers)
  " return l:buffers == 1 ? '' : printf('%s | #%s', buffers, bufferNumber)
  " return l:buffers == 1 ? '' : printf('#%s |', bufferNumber)
  " return l:buffers == 1 ? '' : printf('#%s', bufferNumber)
  return l:buffers == 1 ? '' : printf('| Buf %s', bufferNumber)
endfunction

function! Modified() abort
  let l:modified = getbufvar(bufnr('%'), '&modified') ? ' ∴ ' : ''
  " let l:modified = getbufvar(bufnr('%'), '&modified') ? ' ⊕' : ''
  " let l:modified = getbufvar(bufnr('%'), '&modified') ? ' ●' : ''
  " let l:modified = getbufvar(bufnr('%'), '&modified') ? ' | +' : ''
  return printf('%s', modified)
endfunction

function! Spaces() abort
  let l:spaces = getbufvar(bufnr('%'), '&shiftwidth')
  return printf('S:%s', spaces)
endfunction

function! TagbarCurrentFunction() abort
  let l:tag = tagbar#currenttag('%s','')
  if &filetype == "java"
    return printf('%s ', tag)
  endif
  return printf('')
endfunction

" http://vim.wikia.com/wiki/Showing_syntax_highlight_group_in_statusline
" function! SyntaxItem()
"   let l:syntaxItem = synIDattr(synID(line("."),col("."),1),"name")
"   return printf('%s | ', syntaxItem)
" endfunction

" Statusline ------------------------------------------------------------------

" Clear
set statusline=

" set statusline+=%{SyntaxItem()}

" Whitespace and path to file
set statusline+=\ %f
" set statusline+=\ %t
" set statusline+=\ %F

" Special symbol if file is modified
set statusline+=%{Modified()}
" set statusline+=\ %M

" Statusline info after this will be on the right side
set statusline+=%=

" Errors and warnings
set statusline+=%{LintStatus()}

" Scope
set statusline+=%{TagbarCurrentFunction()}

" Show line and column numbers
set statusline+=Ln\ %l\ Col\ %c\ %{BufferInfo()}
" set statusline+=Ln\ %l\ Col\ %c\
" set statusline+=%l:%c\ 
" set statusline+=%{Spaces()}\ 
