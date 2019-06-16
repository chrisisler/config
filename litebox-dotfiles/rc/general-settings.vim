" General.
filetype plugin indent on      " automatically detect file types

if has('nvim')
  set nobackup
else
  set nocompatible
  set ttyfast     " assume fast terminal
endif

" tab length
set tabstop=2
set shiftwidth=2

set synmaxcol=300
set belloff+=ctrlg " If Vim beeps during completion
set softtabstop=0
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

set shortmess+=c
set showfulltag                " display more info when auto-completing
set smartcase                  " smart (case-sensitive when you specify) search matching
set modeline                   " i have no idea what this does tbh
set modelines=5                " see above
" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines
set formatoptions+=j " delete comment character when Joining comments

set backupdir=~/.vim/undodir
set undodir=~/.vim/undodir        " where to save undo histories
set directory=~/.vim/undodir
set undofile                   " save undo's after file closes
set undolevels=1000            " how many undos
set undoreload=10000           " num of lines to save for undo
set shiftround                 " number of spaces for autoindenting
set ff=unix
set fileformat=unix
set ignorecase
set incsearch
set gdefault
set noswapfile
set virtualedit=block
set encoding=utf-8

" disable safe write to enable hot module reload (for js)
" @see https://parceljs.org/hmr.html
set backupcopy=yes

" http://vim.wikia.com/wiki/Automatic_word_wrapping
set wrap linebreak
" set nowrap                     " stop vim from auto-wrapping lines when there's not enough horizontal space http://vim.wikia.com/wiki/Word_wrap_without_line_breaks

" https://robots.thoughtbot.com/vim-you-complete-me
" set complete=.,b,u,]
" set complete-=i
set wildmenu                  " visual autocomplete
set wildmode=list:longest 
set wildignore=*.swp,*.bak,*.pyc,*.class,*/.git/*,.hg,.svn,*~,*.png,*.gif,*.jpg,*.settings,Thumbs.db,*.min.js
set previewheight=8
set completeopt=menuone,preview,noselect,noinsert
set path+=**

" Visual.
set signcolumn=yes
set noruler
set number      " show line numbers on left?
set nocursorline  " highlight current line?
set norelativenumber " show line numbers relative to current line number?

set hlsearch    " search highlighting
set showmatch " do not jump to matching brackets/parens when typing
set matchtime=2
set noshowmode  " do not show me which mode im in
set timeout
set timeoutlen=250
set lazyredraw
set gdefault
set noshowcmd     " show me what command im typing as i type it (see `timeoutlen`)
" set ttimeoutlen=50
" set relativenumber

set iskeyword+=- " add `-` to count as part of a text object
set iskeyword+=$ " add `$` to count as part of a text object

" Make :Q and :W work like :q and :w
command! W w
command! Q q

" See: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" See: https://youtu.be/ycMiMDHopNc?t=1294
if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif
