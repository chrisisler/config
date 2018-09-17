" General.
filetype plugin indent on      " automatically detect file types
set nocompatible

" tab length
set tabstop=2
set shiftwidth=2

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
autocmd VimEnter * set laststatus=2 " force set 0 on start. display status line always?

set showtabline=0              " Display list of buffers at the top

set showfulltag                " display more info when auto-completing
set smartcase                  " smart (case-sensitive when you specify) search matching
set modeline                   " i have no idea what this does tbh
set modelines=5                " see above
set formatoptions+=j           " delete comment character when Joining comments
set formatoptions-=t           " stop vim  from auto-wrapping lines at a ruler
set undodir=~/.vim/undo        " where to save undo histories
set undofile                   " save undo's after file closes
" set undolevels=1000            " how many undos
" set undoreload=10000           " num of lines to save for undo
set shiftround                 " number of spaces for autoindenting
set ff=unix
set fileformat=unix
set ignorecase
set incsearch
set noswapfile
set virtualedit=block
set encoding=utf-8

" disable safe write to enable hot module reload (for js)
" @see https://parceljs.org/hmr.html
set backupcopy=yes

" http://vim.wikia.com/wiki/Automatic_word_wrapping
" set wrap linebreak
set nowrap                     " stop vim from auto-wrapping lines when there's not enough horizontal space http://vim.wikia.com/wiki/Word_wrap_without_line_breaks

" https://robots.thoughtbot.com/vim-you-complete-me
" set complete=.,b,u,]
" set complete-=i
set wildmenu                  " visual autocomplete
set wildmode=list:longest 
set wildignore=*.swp,*.bak,*.pyc,*.class,*/.git/*,.hg,.svn,*~,*.png,*.gif,*.jpg,*.settings,Thumbs.db,*.min.js
set previewheight=8
set completeopt=noinsert,noselect,menuone
set path+=**

" Visual.
set noruler
set number      " show line numbers on left?
set nocursorline  " highlight current line?

set hlsearch    " search highlighting
set ttyfast     " assume fast terminal
set noshowmatch " do not jump to matching brackets/parens when typing
set noshowmode  " do not show me which mode im in
set timeout
set timeoutlen=250
set lazyredraw
" set showcmd     " show me what command im typing as i type it (see `timeoutlen`)
" set ttimeoutlen=50
" set relativenumber


" Make :Q and :W work like :q and :w
command! W w
command! Q q
