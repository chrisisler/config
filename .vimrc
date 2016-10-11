set nocompatible " must be first line

" general
filetype plugin indent on " automatically detect file types
set tabstop=4 softtabstop=0 shiftwidth=4
set smarttab " no tabs
set showcmd
set expandtab " tabs are spaces now
set autoindent
set smartindent
set bs=2 " allow backspacing over everything in insert mode
set autoread " auto-read file when it's changed from the outside
set nocp
set noerrorbells
set visualbell t_vb= " no beeping
set novisualbell
set mousehide " hide mouse cursor while typing
set hidden " allow buffer switching w/o saving
set backspace=indent,eol,start " allow backspacing over everything
set scrolloff=5 " minimum number of lines to keep above and below cursor
set nolist " do not display eol signs ('$')
set nojoinspaces " prevents inserting 2 spaces when joining
set splitright " put new vertically split windows to the right of current
set splitbelow " put new split windows to bottom of current
set ff=unix
set laststatus=2 " force vim to display status line always
set lazyredraw " don't redraw while executing macros
set fileformats=unix,mac,dos " automatic fomat detection
set showfulltag " upon word-completion of a function, show args (I think.)
set modeline " ???
set modelines=5 " ???
set ignorecase
set smartcase " smart (sometimes case-sensitive) search matching
set incsearch
set noswapfile
set showmode
set linebreak
set virtualedit=block

" visual
set number
set cursorline " highlight current line
set hlsearch "search highlighting
set showmatch " when a bracket is inserted, briefly show its matching one
set matchtime=2 " number of seconds to show matching bracket for
set noshowmode
set noshowmatch
set ttyfast
set cc=80

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' " side-bar (tree explorer)
Plug 'majutsushi/tagbar' " UML-like namespace/class diagram

Plug 'kien/ctrlp.vim' " fuzzy finder

Plug 'othree/yajs.vim' " es6 syntax highlighting
Plug 'othree/javascript-libraries-syntax.vim' " js syntax highlighting

Plug 'bling/vim-airline' " status bar
Plug 'vim-airline/vim-airline-themes' " themes for airline (status)

Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'

Plug 'ervandew/supertab' " hit <tab> for autocomplete

Plug 'jiangmiao/auto-pairs' " auto-match all brackets

Plug 'skywind3000/asyncrun.vim' " run terminal commands and show in quickfix
Plug 'scrooloose/syntastic' " IDE-like syntax checks

Plug 'tpope/vim-commentary' " sane (un)commenting

Plug 'sirver/ultisnips' " snippets

Plug 'terryma/vim-multiple-cursors' " sublime-like multi cursors

Plug 'edkolev/tmuxline.vim' " tmux status bar

call plug#end()

scriptencoding utf8

" http://vim.wikia.com/wiki/Automatically_fitting_a_quickfix_window_height
au FileType qf call AdjustWindowHeight(3, 25)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$")+1, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

let mapleader=","
let g:mapleader=","
let maplocalleader=","
let g:maplocalleader=","

let g:loaded_matchparen=0

let g:buftabline_numbers=2
let g:buftabline_separators=1
let g:buftabline_indicators=1

" let g:ycm_path_to_python_interpreter='/usr/bin/python'

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

let g:UltiSnipsSnippetsDir="~/.vim/snippets"

syntax on
if !exists("g:syntax_on")
    syntax enable
endif
set background=dark
colorscheme solarized

" Good Airline themes: distinguished, cobalt2, sol
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_detect_iminsert=1
let g:airline_skip_empty_sections=0

autocmd BufWritePre * :%s/\s\+$//e

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <Leader>s<CR> :w<CR>:SyntasticCheck<CR>jkjk
let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_highlighting=1
let g:syntastic_stl_format="%E{[%e Errors]} %W{[%w Warnings]}"
let g:syntastic_check_on_wq=1

let g:used_javascript_libs='angularjs'

" stackoverflow.com/questions/3776117

nnoremap \| :TagbarToggle<CR>
nnoremap \ :NERDTreeToggle<CR>
nnoremap [ <C-w>w
nnoremap ] :bn<CR>
nnoremap <C-o> o<ESC>o<ESC>O<ESC>
nnoremap ' X
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap q <nop>
nnoremap DDD ggVGd<ESC>
" tmux uses C-k
noremap <C-k> <nop>
" switch to last open buffer (file(?))
nnoremap <Leader>] :b#<CR>

" mappings for saving and sourcing .vimrc
nnoremap <Leader>%<CR> :w<CR>:so %<CR>
nnoremap <Leader>5<CR> :w<CR>:so %<CR>

" make Y behave like C and D
nnoremap Y y$

" center screen after moving (to next search-match)
nnoremap n nzz
nnoremap N Nzz

" wrapped lines go up/down to next row, not next line
noremap j gj
noremap k gk

noremap ; :
noremap 8 ^
noremap 9 $
nnoremap * *N
noremap <Leader>noh :nohlsearch<CR>
nnoremap <Leader>l<CR> :lcl<CR>:ccl<CR>
inoremap <ESC> <ESC>l

" another way to save a file, I do it on accident, so I just mapped it
noremap ;s<CR> :w<CR>

" Move up and down
" nnoremap <?-k> 2kzz
" nnoremap <?-j> 2jzz
" Vertical resize with [shift -] and [shift =]
nnoremap _ :vertical res -4<CR>
nnoremap + :vertical res +4<CR>
" Copy and paste from (actual) clipboard
noremap <C-c> "*y
noremap <C-v> "*p

nnoremap <Leader>q<CR> :bdelete %<CR>

" replace all occurrences: 1) use this 2) type new name 3) repeat <ESC>n. ad nauseum
nnoremap <Leader>d<CR> *Ncw

" compile javascript and open quickfix window to view output
" uses 'skywind3000/asyncrun.vim' to run shell command 'node $thisFile'
let g:asyncrun_mode=1
nnoremap <Leader>js<CR> :w<CR>:AsyncRun node %<CR>:copen<CR><C-w>w

" compile java and open quickfix window to view output
" note: must be in same directory of file to get correct output
nnoremap <Leader>j1<CR> :w<CR>:AsyncRun javac %<CR>:copen<CR><C-w>w
nnoremap <Leader>j2<CR> :w<CR>:AsyncRun java %:t:r<CR>:copen<CR><C-w>w

" compile C# and open quickfix window to view output
nnoremap <Leader>cs<CR> :w<CR>:AsyncRun csc /nologo /t:exe %<CR>:copen<CR><C-w>w
" compile shell script and open quickfix window to view output
nnoremap <Leader>sh<CR> :w<CR>:AsyncRun bash %:p<CR>:copen<CR><C-w>w
" compile python and open quickfix window to view output
nnoremap <Leader>py<CR> :w<CR>:AsyncRun py %<CR>:copen<CR><C-w>w
" compile ruby and open quickfix window to view output
nnoremap <Leader>rb<CR> :w<CR>:AsyncRun ruby %:p<CR>:copen<CR><C-w>w
" compile c and open quickfix window to view output
nnoremap <Leader>c1<CR> :w<CR>:AsyncRun gcc %<CR>:copen<CR><C-w>w
nnoremap <Leader>c2<CR> :w<CR>:AsyncRun ./a.exe<CR><C-w>w

let g:tmuxline_preset = {
    \'a' : '%b%e, %a %I:%M %p',
    \'b' : ['#I', '#W'],
    \'z' : ['#(whoami)', '#H']}

