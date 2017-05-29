set nocompatible " must be first line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETtings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" General.
filetype plugin indent on " automatically detect file types
set tabstop=4 softtabstop=0 shiftwidth=4
set showcmd
set autoindent
set smartindent
set noerrorbells
set novisualbell
set smarttab
set expandtab                  " tabs are spaces now
set visualbell t_vb=           " no beeping
set bs=2                       " allow backspacing over everything in insert mode
set autoread                   " auto-read file when it's changed from the outside
set mousehide                  " hide mouse cursor while typing
set hidden                     " allow buffer switching w/o saving
set backspace=indent,eol,start " allow backspacing over everything
set scrolloff=5                " minimum number of lines to keep above and below cursor
set nolist                     " do not display eol signs ('$')
set nojoinspaces               " prevents inserting 2 spaces when joining
set splitright                 " put new vertically split windows to the right of current
set splitbelow                 " put new split windows to bottom of current
set laststatus=2               " force vim to display status line always
set lazyredraw                 " don't redraw while executing macros
set showfulltag                " upon word-completion of a function, show args (I think.)
set modeline                   " ???
set modelines=5                " ???
set smartcase                  " smart (sometimes case-sensitive) search matching
set formatoptions+=j           " delete comment character when Joining comments
set undofile                   " save undo's after file closes
set undodir=~/.vim/undo        " where to save undo histories
set undolevels=1000            " how many undos
set undoreload=10000           " num of lines to save for undo
set nowrap                     " don't wrap lines
set ignorecase                 " ignore case when searching unless specfic case is used
set shiftround                 " number of spaces for autoindenting
set wildignore=*.swp,*.bak,*.pyc,*.class
set ff=unix
set fileformat=unix
set incsearch
set nobackup
set noswapfile
set virtualedit=block
set encoding=utf-8
set backupcopy=yes

" https://robots.thoughtbot.com/vim-you-complete-me
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview
" Display all matching files when we tab-complete
set wildmenu
" Search down into sub-directories. Provides tab-completion.
set path+=**

" Visual.
set number      " show line numbers
set cursorline  " highlight current line
set hlsearch    " search highlighting
set matchtime=2 " number of seconds to show matching bracket for
set ttyfast     " assume fast terminal
set noshowmode  " do not show current vim mode
set ttimeoutlen=50
set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Language
" Plug 'othree/javascript-libraries-syntax.vim' " library-based js syntax highlighting
Plug 'othree/yajs.vim'                        " ECMAScript syntax highlighting
Plug 'mxw/vim-jsx'                            " React JSX syntax highlighting and indenting
" Plug 'scrooloose/syntastic'                   " IDE-like syntax checks
Plug 'hail2u/vim-css3-syntax'                 " css3 sytnax
Plug 'cakebaker/scss-syntax.vim'              " syntax for sassy css

" Interface
Plug 'vim-airline/vim-airline-themes'   " themes for airline (status)
Plug 'majutsushi/tagbar'                " displays tags in a window (ordered by scope)
Plug 'altercation/vim-colors-solarized' " solarized colorscheme for vim
Plug 'scrooloose/nerdtree'              " side-bar (tree explorer)
Plug 'bling/vim-airline'                " vim status bar
Plug 'airblade/vim-gitgutter'           " git diff in gutter
Plug 'tomasr/molokai'                   " monokai color scheme

" Integrations
Plug 'tpope/vim-commentary' " sane (un)commenting
Plug 'w0rp/ale'             " async linter

" Commands
Plug 'terryma/vim-multiple-cursors' " sublime-like multi cursors
Plug 'ctrlpvim/ctrlp.vim'           " fuzzy finder
Plug 'skywind3000/asyncrun.vim'     " run terminal commands and show in quickfix
Plug 'tpope/vim-surround'           " manipulating characters that surround text objects
" Plug 'tpope/vim-repeat'             " repeat plugin-specific commands

" Completion
Plug 'jiangmiao/auto-pairs' " auto-match all brackets
Plug 'ervandew/supertab'    " hit <tab> for autocomplete
Plug 'sirver/ultisnips'     " snippets
" Plug 'shougo/neocomplete.vim' " completion framework
Plug 'mattn/emmet-vim'      " makes html easier

" Other
Plug 'godlygeek/tabular' " text alignment

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

let g:jsx_ext_required=0

let g:neocomplete#enable_at_startup=0
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=4
autocmd filetype javascript setlocal omnifunc=jspc#omni

let g:user_emmet_mode='a' " enable emmet functionality in all modes
let g:user_emmet_install_global=0 " enable emmet for just html/css
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-j>' " remap the default (emmet) leader from <C-y> to <C-j>

let g:loaded_matchparen=1

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

let g:UltiSnipsSnippetsDir="~/.vim/snippets"

" Syntax and colorscheme.
syntax on
if !exists("g:syntax_on")
    syntax enable
endif
set background=dark
colorscheme solarized

" Airline settings.
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_detect_iminsert=1
let g:airline_skip_empty_sections=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#format=1
let g:airline_section_x=''
let g:airline_section_c=' '

" Add syntastic warnings and errors to statusline.
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_stl_format="%E{[%e Errors]} %W{[%w Warnings]}"
" let g:syntastic_mode_map = { "mode": "passive" }
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_enable_highlighting=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_check_on_open=0
" let g:syntastic_check_on_wq=0
" let g:syntastic_auto_jump=1
" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_javascript_eslint_exe='npm run lint --'

" Which javascript libraries to provide syntax highlighting for.
let g:used_javascript_libs='react, ramda, underscore'

" Mode=0 is asynchronous mode. Trim=1 trims empty lines in quickfix window.
let g:asyncrun_mode=1
let g:asyncrun_trim=1

" When set to 0, <ESC>ing in the following modes will not quit multi-cursor mode.
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map leader to comma.
let mapleader=","
let g:mapleader=","
let maplocalleader=","
let g:maplocalleader=","

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

" Run syntax checker.
" nnoremap <Leader>s<CR> :w<CR>:SyntasticCheck<CR>

" Edit ~/.vimrc
nnoremap <Leader>v<CR> :e ~/.vimrc<CR>

" Delete current buffer.
nnoremap <Leader>q<CR> :bdelete %<CR>

" Set ruler.
nnoremap <Leader>r :set cc=

" Make location and quickfix windows go away.
nnoremap <Leader>w :lcl<CR>:ccl<CR>

" Mappings for saving and sourcing .vimrc.
nnoremap <Leader>5<CR> :w<CR>:so %<CR>
nnoremap <Leader>4<CR> :w $MYVIMRC<CR>:so $MYVIMRC<CR>

" Replace variable name with variable definition and delete variable.
" Hovered var must be first use of var - could be improved by using marks.
" Example (with cursor hovering N in 'names' on line 2):
"       1. var names = people.map(person => person.name);
"       2. doStuff(names, otherVar);
"      Turns into:
"          doStuff(people.map(person => person.name), otherVar);
nnoremap <Leader>@ gd2wvf;h"xy"_ddn"_deh"xp

" Fat array function snippet after typing function arguments.
" Uses clean indents on newline (after function header/prototype).
imap <Leader>{ <Space>=><CR>{<CR>;<ESC>jA;<ESC>kS

" Copy the currently hovered word and console.log it on the next line.
nnoremap <Leader>cl<CR> "xyiwoconsole.log(<ESC>"xpA);<ESC>
" Same as above, except: console.log('variable is:', variable);
nnoremap <Leader>clv<CR> "xyiwoconsole.log('<ESC>"xpa<Space>is:',<Space><ESC>"xpa);<ESC>

" Make <C-x><C-l> (whole-line auto-completion) easier to type.
inoremap <Leader>l <C-x><C-l>

" Fast mapping to call tabular.
nnoremap <Leader>t :Tab /

" Toggle syntax-checks on save (active/passive).
" nnoremap <Leader>x :SyntasticToggleMode<CR>

" Remove trailing whitespace
nnoremap <Leader>nows<CR> :%s/\s\+$//e<CR>:nohlsearch<CR>:w<CR>

" Change tab length
nnoremap <Leader>t2 :set tabstop=2<CR>:set shiftwidth=2<CR>
nnoremap <Leader>t4 :set tabstop=4<CR>:set shiftwidth=4<CR>

inoremap <Leader>> <ESC>j>>kS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> - :set relativenumber<CR>
nnoremap <silent> = :set norelativenumber<CR>

" Things being highlighted after searching once is annoying.
nnoremap <Space> :nohlsearch<CR>

noremap <F5> :NeoCompleteDisable<CR>
noremap <F6> :NeoCompleteEnable<CR>

" Open tagbar.
nnoremap <silent> \| :TagbarToggle<CR>

" Open nerdtree.
nnoremap <silent> \ :NERDTreeToggle<CR>

" Next window.
nnoremap [ <C-w>w

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
noremap <C-k> <nop>
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

" ^ is uncomfortable to press.
noremap 8 ^
" $ is uncomfortable to press.
noremap 9 $

" This just makes sense.
nnoremap * *N

" Another way to save a file, I do it on accident, so I just mapped it.
noremap ;s<CR> :w<CR>

" Don't make me hit it twice.
" nnoremap z zz

" Move up and down faster.
nnoremap E 3kzz
nnoremap D 3jzz

" Copy and paste from (actual) clipboard.
noremap <C-c> "*y
noremap <C-v> "*p
" noremap <C-a> ggVG

" (Experimental) Auto-indent pasted code (see `:h =`).
nnoremap P P==
nnoremap p p==
vnoremap P P=
vnoremap p p=

" assign tab to `
nnoremap ` <TAB>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compile and Run - Mappings
"
" Note: Must be in same directory of file to get correct output.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Javascript
nnoremap <Leader>js<CR> :w<CR>:AsyncRun node %<CR>:copen<CR>:wincmd k<CR>

" Java
nnoremap <Leader>j1<CR> :w<CR>:AsyncRun javac %<CR>:copen<CR>:wincmd k<CR>
nnoremap <Leader>j2<CR> :w<CR>:AsyncRun java %:t:r<CR>:copen<CR>:wincmd k<CR>

" C#
nnoremap <Leader>cs<CR> :w<CR>:AsyncRun csc /nologo /t:exe %<CR>:copen<CR>:wincmd k<CR>

" Shell
nnoremap <Leader>sh<CR> :w<CR>:AsyncRun bash %:p<CR>:copen<CR>:wincmd k<CR>

" Python
nnoremap <Leader>py<CR> :w<CR>:AsyncRun py %<CR>:copen<CR>:wincmd k<CR>

" Ruby
nnoremap <Leader>rb<CR> :w<CR>:AsyncRun ruby %:p<CR>:copen<CR>:wincmd k<CR>

" C
nnoremap <Leader>c1<CR> :w<CR>:AsyncRun gcc %<CR>:copen<CR>:wincmd k<CR>
nnoremap <Leader>c2<CR> :w<CR>:AsyncRun ./a.exe<CR>:wincmd k<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" http://vim.wikia.com/wiki/Automatically_fitting_a_quickfix_window_height
" Set quickfix window default to 5 lines.
au FileType qf call AdjustWindowHeight(3, 15)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$")+1, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

scriptencoding utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Highlighting
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call clearmatches()
" highlight Comment cterm=italic
" highlight Special cterm=italic

highlight mySpecificSyntax ctermfg=darkblue
2match mySpecificSyntax /\s=\s\|\s\W==\s\|\s?\s\|\s:\s\|!\|&\|\s|\s\|+\|-\|\<\w\+\ze(/

highlight swagReturn ctermfg=magenta
call matchadd("swagReturn", "return ")
call matchadd("swagReturn", "new ")
call matchadd("swagReturn", "=>")
call matchadd("swagReturn", "? ")
call matchadd("swagReturn", ": ")

highlight jsSpecial ctermfg=darkmagenta
call matchadd("jsSpecial", "__dirname")
call matchadd("jsSpecial", "__filename")
call matchadd("jsSpecial", "true")
call matchadd("jsSpecial", "false")
