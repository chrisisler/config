set nocompatible " must be first line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" General.
filetype plugin indent on " automatically detect file types
set tabstop=4 softtabstop=0 shiftwidth=4
set showcmd
set autoindent                 " auto indent new lines
set smartindent                " don't indent like an idiot
set noerrorbells
set novisualbell
set smarttab                   " no tabs
set expandtab                  " tabs are spaces now
set visualbell t_vb=           " no beeping
set autoread                   " auto-read file when it's changed from the outside
set mouse=a                    " enable mouse
set mousehide                  " hide mouse cursor while typing
set hidden                     " allow buffer switching w/o saving
set bs=2                       " allow backspacing over everything in insert mode
set backspace=indent,eol,start " allow backspacing over everything
set scrolloff=5                " minimum number of lines to keep above and below cursor
set nolist                     " do not display eol signs ('$')
set nojoinspaces               " prevents inserting 2 spaces when joining
set splitright                 " put new vertically split windows to the right of current
set splitbelow                 " put new split windows to bottom of current
set laststatus=2               " force vim to display status line always
set showfulltag                " display more info when auto-completing
set smartcase                  " smart (case-sensitive when you specify) search matching
set modeline                   " i have no idea what this does tbh
set modelines=5                " see above
set formatoptions+=j           " delete comment character when Joining comments
set formatoptions-=t           " stop vim  from auto-wrapping lines at a ruler
set ff=unix
set fileformat=unix
set ignorecase
set incsearch
set noswapfile
set virtualedit=block
set encoding=utf-8
set backupcopy=yes

" https://robots.thoughtbot.com/vim-you-complete-me
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview
set wildmenu                  " visual autocomplete
set path+=**

" Visual.
set number      " show line numbers
set cursorline  " highlight current line
set hlsearch    " search highlighting
set ttyfast     " assume fast terminal
set noshowmatch " do not jump to matching brackets/parens when typing
set noshowmode  " do not show me which mode im in (cause I use airline)
set timeoutlen=500
set ttimeoutlen=500
set lazyredraw  " redraw only when you need to

" Make :Q and :W work like :q and :w
command! W w
command! Q q

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins (vim-plug)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Language
Plug 'othree/yajs.vim'                        " ECMAScript syntax highlighting
Plug 'othree/javascript-libraries-syntax.vim' " provide proper syntax highlighting for js libs
Plug 'hail2u/vim-css3-syntax'                 " css3 syntax
Plug 'mxw/vim-jsx'                            " react-jsx syntax highlighting
Plug 'mattn/emmet-vim'                        " the only way to write html in vim
Plug 'octol/vim-cpp-enhanced-highlight'       " better c++ highlighting

" Interface
Plug 'vim-airline/vim-airline-themes'   " themes for airline (status)
Plug 'altercation/vim-colors-solarized' " solarized colorscheme for vim
" Plug 'flazz/vim-colorschemes'           " abunch of random colorschemes for vim
Plug 'scrooloose/nerdtree'              " side-bar (tree explorer)
Plug 'bling/vim-airline'                " vim status bar
Plug 'airblade/vim-gitgutter'           " git diff in gutter

" Integrations
Plug 'tpope/vim-commentary' " sane (un)commenting
" Plug 'tpope/vim-fugitive'   " git integration
Plug 'w0rp/ale'             " async linter

" Commands
Plug 'terryma/vim-multiple-cursors' " sublime-like multi cursors
Plug 'ctrlpvim/ctrlp.vim'           " fuzzy finder
Plug 'skywind3000/asyncrun.vim'     " run terminal commands and display them
Plug 'tpope/vim-surround'           " manipulating characters that surround text objects
Plug 'tpope/vim-repeat'             " repeat plugin-specific commands

" Completion
Plug 'jiangmiao/auto-pairs'   " auto-match all brackets, parenthesis, quotes, etc.
Plug 'ervandew/supertab'      " hit <tab> for autocomplete
Plug 'shougo/neocomplete.vim' " code-completion
Plug 'sirver/ultisnips'       " snippies

" Other
Plug 'godlygeek/tabular' " for auto-aligning things easily (use the mapping)

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsSnippetsDir="~/.vim/snippets"

let g:user_emmet_mode='a'         " enable emmet in all vim modes
let g:user_emmet_install_global=0 " enable emmet for just html/css
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-j>' " remap the default emmet leader from <C-y> to <C-j>

let g:ale_echo_msg_warning_str=''
let g:ale_echo_msg_error_str=''
let g:ale_lint_delay=1500
let g:ale_open_list=1
let g:ale_sign_column_always=1
let g:airline_section_error='%{ale#statusline#Status()}'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_statusline_format=['[%d Errors]', '[%d Warnings]', '']
let g:ale_linters={
\   'javascript': ['eslint'],
\   'cpp': ['g++'],
\}

let g:ctrlp_custom_ignore='node_modules'

let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=1
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
\ 'default' : '',
\ 'text' : '/usr/share/dict/connectives',
\ 'javascript' : '~/Main/Code/JS/Dictionary/all.txt',
\ 'cpp' : '~/Main/Code/Cpp/Dictionary/cpp-dictionary-keywords.txt'
\ }

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

let g:loaded_matchparen=0

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

let g:jsx_ext_required=0
" Airline settings.
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_detect_iminsert=1
let g:airline_skip_empty_sections=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#format=1

" Mode=0 is asynchronous mode. Trim=1 trims empty lines in quickfix window.
let g:asyncrun_mode=1
let g:asyncrun_trim=1

" When set to 0, <ESC>ing in the following modes will not quit multi-cursor mode.
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0

let g:used_javascript_libs = 'ramda, underscore'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Leader Mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map leader to comma.
let mapleader=","
let g:mapleader=","
let maplocalleader=","
let g:maplocalleader=","

" Linter mappings
nnoremap <Leader>p :ALEPreviousWrap<CR>kj
nnoremap <Leader>n :ALENextWrap<CR>kj
nnoremap <Leader>x :ALEToggle<CR>kj

" Horizontal and vertical resizing like my tmux key-bindings.
nnoremap <silent> <Leader>H :vertical res -4<CR>
nnoremap <silent> <Leader>J :res -4<CR>
nnoremap <silent> <Leader>K :res +4<CR>
nnoremap <silent> <Leader>L :vertical res +4<CR>

" Navigate between splits like my tmux key-bindings.
nnoremap <silent> <Leader>h :wincmd h<CR>
nnoremap <silent> <Leader>j :wincmd j<CR>
nnoremap <silent> <Leader>k :wincmd k<CR>
nnoremap <silent> <Leader>l :wincmd l<CR>

" Move horizontal splits to vertical splits
nnoremap <silent> <Leader>i <C-w>t <C-w>K
nnoremap <silent> <Leader>o <C-w>t <C-w>H

" Delete current buffer.
nnoremap <silent> <Leader>q<CR> :bdelete %<CR>

" Set ruler.
nnoremap <silent> <Leader>r :set cc=

" Make local/loclist and quickfix windows go away.
nnoremap <silent> <Leader>w :lcl<CR>:ccl<CR>

" Mappings for saving and sourcing .vimrc.
nnoremap <silent> <Leader>5<CR> :w<CR>:so %<CR>
nnoremap <silent> <Leader>4<CR> :w<CR>:so $MYVIMRC<CR>

" Replace variable name with variable definition and delete variable.
" Example (with cursor hovering N in 'names' on line 2):
"       1. var names = people.map(person => person.name);
"       2. doStuff(names, otherVar);
"      Turns into:
"          doStuff(people.map(person => person.name), otherVar);
nnoremap <Leader>@ gd2wvf;h"xy"_ddn"_deh"xp

" Fat array function snippet after typing function arguments.
" Uses clean indents on newline (after function header/prototype).
" Uses recursive mapping of ; to :
imap <Leader>{ <Space>=><Space>{<CR>;<ESC>jA;<ESC>kS

" Copy the currently hovered word and console.log it on the next line.
nnoremap <Leader>cl "xyiwoconsole.log(<ESC>"xpA);<ESC>
" Same as above, except: console.log('variable is:', variable);
nnoremap <Leader>clv "xyiwoconsole.log('<ESC>"xpa<Space>is:',<Space><ESC>"xpa);<ESC>

" echo a cursor-hovered variable for shell scripts.
nnoremap <Leader>en "xyiwoecho -n "${}"hh"xp

" Make <C-x><C-l> (whole-line auto-completion) easier to type.
inoremap <Leader>l <C-x><C-l>

" Fast mapping to call tabular.
nnoremap <Leader>t :Tab /

" Remove trailing whitespace
nnoremap <Leader>nows<CR> :%s/\s\+$//e<CR>:nohlsearch<CR>:w<CR>

" Change tab width/length.
nnoremap <Leader>t2 :set shiftwidth=2<CR>:set tabstop=2<CR>
nnoremap <Leader>t4 :set shiftwidth=4<CR>:set tabstop=4<CR>

" switch to last open buffer
nnoremap <Leader>b :b#<CR>

" Add a semi-colon to the end of the cursor's current line.
nnoremap <Leader>; A;<ESC>

" Disable/Enable auto-complete framework.
nnoremap <Leader>1 :NeoCompleteEnable<CR>
nnoremap <Leader>2 :NeoCompleteDisable<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Mappings for Mathematical Symbols
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <silent> <Leader>intersection ∩
inoremap <silent> <Leader>is ∩
inoremap <silent> <Leader>union ∪
inoremap <silent> <Leader>un ∪
inoremap <silent> <Leader>and ∧
inoremap <silent> <Leader>or ∨

inoremap <silent> <Leader>congruent ≡

inoremap <silent> <Leader>propersubset ⊂
inoremap <silent> <Leader>subset ⊆

inoremap <silent> <Leader>roughlyequal ≈
inoremap <silent> <Leader>notequal ≠

inoremap <silent> <Leader>plusorminus ±
inoremap <silent> <Leader>therefore ∴
inoremap <silent> <Leader>foreach ∀
inoremap <silent> <Leader>forany ∀
inoremap <silent> <Leader>lambda λ
inoremap <silent> <Leader>lamda λ
inoremap <silent> <Leader>emptyset ∅
inoremap <silent> <Leader>sum Σ
inoremap <silent> <Leader>mult ∏
inoremap <silent> <Leader>multiply ∏
inoremap <silent> <Leader>times ∙
inoremap <silent> <Leader>integral ∫
inoremap <silent> <Leader>derivative ∂
inoremap <silent> <Leader>not ¬
inoremap <silent> <Leader>in ∈
inoremap <silent> <Leader>cartesianproduct ×
inoremap <silent> <Leader>by ×
inoremap <silent> <Leader>beta ∝
inoremap <silent> <Leader>thereexists ∃
inoremap <silent> <Leader>perp ⊥
inoremap <silent> <Leader>suchthat ﬆ
inoremap <silent> <Leader>st ﬆ
inoremap <silent> <Leader>xor ⊕
inoremap <silent> <Leader>degree °
inoremap <silent> <Leader>composition °
inoremap <silent> <Leader>compo °
inoremap <silent> <Leader>divide ÷
inoremap <silent> <Leader>sigma σ
inoremap <silent> <Leader>std σ
inoremap <silent> <Leader>stddev σ

inoremap <silent> <Leader>complement ⁽
inoremap <silent> <Leader>compl ⁽

inoremap <silent> <Leader>floor ┗ x┛
inoremap <silent> <Leader>ceiling ┏ x┓

inoremap <silent> <Leader>greaterthanequal ≥
inoremap <silent> <Leader>lessthanequal ≤

inoremap <silent> <Leader>ifftaut ⇔
inoremap <silent> <Leader>iff ↔
inoremap <silent> <Leader>thentaut ⇒
inoremap <silent> <Leader>then →

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <C-r> is hard to type, man.
nnoremap U <C-r>

" Open nerdtree.
nnoremap <silent> \ :NERDTreeToggle<CR>

" Next window.
nnoremap [ <C-w>w

" Not highlighting things happens pretty often.
nnoremap <silent> <space> :nohlsearch<CR>

" keep cursor where it is when joining lines.
" nnoremap J mzJ`z

" Go to next/previous buffer.
nnoremap ] :bn<CR>
nnoremap } :bp<CR>

" X is uncomfortable to type, ' is better.
nnoremap ' X

" I dont like accidently pressing these.
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>

" Tmux uses C-k
noremap <C-k> <C-u>
inoremap <C-u> <C-k>

" Make Y behave like C and D.
nnoremap Y y$

" Center screen after moving to next match.
nnoremap n nzz
nnoremap N Nzz

" Wrapped lines go up/down to next row, not next line.
noremap j gj
noremap k gk

" Avoid pressing escape. Avoid pressing <C-[>
inoremap ;; <ESC>l
vnoremap ;; <ESC>l
snoremap ;; <ESC>l

" Best mapping ever.
noremap ; :
noremap : ;

" Cool new thing: http://mlsamuelson.com/content/vim-search-word-under-cursor
nnoremap <Leader>[ [I

" ^ is uncomfortable to press.
noremap 8 ^
" $ is uncomfortable to press.
noremap 9 $

" This just makes sense.
nnoremap * *N
nnoremap # #n

" Move up and down faster.
nnoremap E 3kzz
nnoremap D 3jzz

" Copy and paste from (actual) clipboard.
nnoremap <C-c> "*y
nnoremap <C-v> "*p
nnoremap <C-a> ggVG

" (Experimental) Auto-indent pasted code (see `:h =`).
nnoremap P P==
nnoremap p p==
vnoremap P P=
vnoremap p p=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Compile and Run - Mappings
"
" Note: Must be in same directory of file to get correct output.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Javascript
nnoremap <Leader>js<CR> :w<CR>:AsyncRun node %<CR>:copen<CR>:wincmd k<CR><CR>

" Java
nnoremap <Leader>j1<CR> :w<CR>:AsyncRun javac %<CR>:copen<CR>:wincmd k<CR>
nnoremap <Leader>j2<CR> :w<CR>:AsyncRun java %:t:r<CR>:copen<CR>:wincmd k<CR>

" C#
nnoremap <Leader>cs<CR> :w<CR>:AsyncRun csc /nologo /t:exe %<CR>:copen<CR>:wincmd k<CR>

" Shell
nnoremap <Leader>sh<CR> :w<CR>:AsyncRun bash %:p<CR>:copen<CR>:wincmd k<CR>

" Python
nnoremap <Leader>py<CR> :w<CR>:AsyncRun python %<CR>:copen<CR>:wincmd k<CR>

" Ruby
nnoremap <Leader>rb<CR> :w<CR>:AsyncRun ruby %:p<CR>:copen<CR>:wincmd k<CR>

" C
nnoremap <Leader>c1<CR> :w<CR>:AsyncRun gcc %<CR>:copen<CR>:wincmd k<CR>
nnoremap <Leader>c2<CR> :w<CR>:AsyncRun ./a.exe<CR>:wincmd k<CR>

" C++
nnoremap <Leader>cp<CR> :w<CR>:AsyncRun g++ % && ./a.out<CR>:copen<CR>:wincmd k<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Highlighting
"
" Note: See :help cterm-colors for more information.
" Note: https://stackoverflow.com/questions/29192124/how-to-color-function-call-in-vim-syntax-highlighting
" Note: http://learnvimscriptthehardway.stevelosh.com/chapters/46.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colorscheme.
syntax on
if !exists("g:syntax_on")
    syntax enable
endif
set background=light
colorscheme solarized

call clearmatches()
" Custom syntax highlighting.
highlight Comment cterm=italic
highlight Special cterm=italic

highlight mySpecificSyntax ctermfg=darkblue
2match mySpecificSyntax /\s=\s\|\s===\s\|\s?\s\|\s:\s\|!\|,\|\.\|&\|\s|\s\|\<\w\+\ze(/
" 2match mySpecificSyntax /=\|?\|:\|>\|<\|!\|+\|-\|,\|%\|\.\|&\||\|\<\w\+\ze(/
" 2match mySpecificSyntax /=\|?\|:\|>\|<\|!\|+\|-\|;\|,\|\*\|%\|\.\|&\||\|\<\w\+\ze(\|\//

" This group is not `highlight link`'ed to Special because of priority. See :help :match for more
highlight myItalics cterm=italic
match myItalics /\<var\>\|\<let\>\|\<const\>\|\<module\>\|\<exports\>\|\<function\>\| @\w*.*$\|\<console\>\|\<Array\>\|\<Function\>\|\<Object\>\|\<String\>\|\<Number\>\|\<Math\>\|\<Boolean\>\|\<arguments\>\|\<super\>\|\<JSON\>\|\<Date\>\|\<prototype\>\|\<__filename\>\|\<__dirname\>/

highlight swagReturn ctermfg=magenta
call matchadd("swagReturn", "return ")
call matchadd("swagReturn", "new ")
call matchadd("swagReturn", "=>")
call matchadd("swagReturn", "?")
call matchadd("swagReturn", ":")

" highlight jsSpecial ctermfg=darkmagenta cterm=italic
" call matchadd("jsSpecial", "\<prototype\ze")
" call matchadd("jsSpecial", "\<__dirname\ze")
" call matchadd("jsSpecial", "\<__filename\ze")
" call matchadd("jsSpecial", "\<true\ze")
" call matchadd("jsSpecial", "\<false\ze")


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" http://vim.wikia.com/wiki/Automatically_fitting_a_quickfix_window_height
" Set quickfix window default to X-Y lines.
au FileType qf call AdjustWindowHeight(2, 15)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$")+1, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

scriptencoding utf8

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
" call AutoHighlightToggle()
