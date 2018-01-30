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
set laststatus=0               " force vim to display status line always
" set laststatus=2               " force vim to display status line always
autocmd VimEnter * set laststatus=0 " force set 0 on start. for some reasong it wasnt working on its own

set showtabline=2              " Display list of buffers at the top, uses airline plugin.

set showfulltag                " display more info when auto-completing
set smartcase                  " smart (case-sensitive when you specify) search matching
set modeline                   " i have no idea what this does tbh
set modelines=5                " see above
set formatoptions+=j           " delete comment character when Joining comments
set formatoptions-=t           " stop vim  from auto-wrapping lines at a ruler
set undofile                   " save undo's after file closes
set undodir=~/.vim/undo        " where to save undo histories
set undolevels=1000            " how many undos
set undoreload=10000           " num of lines to save for undo
set nowrap                     " stop vim from auto-wrapping lines when there's not enough horizontal space http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set shiftround                 " number of spaces for autoindenting
set wildignore=*.swp,*.bak,*.pyc,*.class,*/.git/*
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
set complete-=i
set wildmenu                  " visual autocomplete
set wildmode=longest,list:longest 
set previewheight=8
set completeopt=longest,menuone,preview
set path+=**

" Visual.
set noruler
set number      " show line numbers on left
set cursorline  " highlight current line
set hlsearch    " search highlighting
set ttyfast     " assume fast terminal
set noshowmatch " do not jump to matching brackets/parens when typing
set noshowmode  " do not show me which mode im in
" set showcmd     " show me what command im typing as i type it (see `timeoutlen`)
set timeoutlen=400
set ttimeoutlen=50
" set lazyredraw  " redraw only when you need to
" set relativenumber


" Make :Q and :W work like :q and :w
command! W w
command! Q q
