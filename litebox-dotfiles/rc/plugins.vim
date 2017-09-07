"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Language
" Plug 'fsharp/vim-fsharp'                      " awesome syntax highlighting for ya boi f#
Plug 'othree/yajs.vim'                        " ECMAScript syntax highlighting
Plug 'othree/es.next.syntax.vim'              " es7 syntax
Plug 'hail2u/vim-css3-syntax'                 " css3 syntax
Plug 'mxw/vim-jsx'                            " react-jsx syntax highlighting
" Plug 'mattn/emmet-vim'                        " the only way to write html in vim
Plug 'eagletmt/neco-ghc'
Plug 'neovimhaskell/haskell-vim'              " syntax highlighting and indentation for haskell (and cabal)
" Plug 'octol/vim-cpp-enhanced-highlight'       " better c++ highlighting

" Interface
Plug 'vim-airline/vim-airline-themes'   " themes for airline (status)
Plug 'altercation/vim-colors-solarized' " solarized colorscheme for vim
" Plug 'flazz/vim-colorschemes'           " abunch of random colorschemes for vim, mostly sucky
" Plug 'joshdick/onedark.vim'             " hopefully good
" Plug 'rakr/vim-one'                     " take #2 for one dark pro theme
" Plug 'chriskempson/base16-vim'          " base16 colorschemes
Plug 'scrooloose/nerdtree'              " side-bar (tree explorer)
Plug 'bling/vim-airline'                " vim status bar and tabline (at top)
Plug 'airblade/vim-gitgutter'           " git diff in gutter
" Plug 'kshenoy/vim-signature'            " display marks in gutter
Plug 'docunext/closetag.vim'            " auto-close ending (x)html tags like sublime-text

" Integrations
Plug 'tpope/vim-commentary' " sane (un)commenting
" Plug 'tpope/vim-fugitive'   " git integration
Plug 'w0rp/ale'             " async linter

" Commands
Plug 'terryma/vim-multiple-cursors' " sublime-like multi cursors
Plug 'ctrlpvim/ctrlp.vim'           " fuzzy finder
" Plug 'skywind3000/asyncrun.vim'     " run terminal commands and display them
Plug 'tpope/vim-surround'           " manipulating characters that surround text objects
Plug 'tpope/vim-repeat'             " repeat plugin-specific commands
Plug 'easymotion/vim-easymotion'        " vim motions on speed
" Plug 'tpope/vim-abolish'            " easily search/substitute/whatever multiple variants of a word
" Plug 'andrewradev/splitjoin.vim'    " easily transition between single/multi line code
Plug 'tpope/vim-dispatch' "async commands

" Completion
Plug 'jiangmiao/auto-pairs'   " auto-match all brackets, parenthesis, quotes, etc.
Plug 'ervandew/supertab'      " hit <tab> for autocomplete
Plug 'shougo/neocomplete.vim' " code-completion
Plug 'sirver/ultisnips'       " snippies
Plug 'ternjs/tern_for_vim'    " vim -> js-ide. omni-comp, jump-to-def, docs, types, refs, renames, etc.

" Other
Plug 'godlygeek/tabular' " for auto-aligning things easily (use the mapping)

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disabled by default
let g:gitgutter_enabled=0

" haskell settings
" haskell-vim
let g:haskell_enabled_quantification=1
let g:haskell_enabled_recursivedo=1
let g:haskell_enabled_arrowsyntax=1
let g:haskell_enabled_pattern_synonyms=1
let g:haskell_enabled_typeroles=1
let g:haskell_enabled_static_pointers=1
let g:haskell_backpack=1
" neco-ghc
let g:necoghc_enable_detailed_browse=1
let g:haskellmode_completion_ghc=1
autocmd FileType hs,haskell setlocal omnifunc=necoghc#omnifunc

let g:mta_use_matchparen_group=1

let g:tern#is_show_argument_hints_enabled=1
let g:tern_show_argument_hints=1
let g:tern_show_signature_in_pum=1


let g:UltiSnipsSnippetsDir="~/.vim/snippets"

" let g:user_emmet_mode='a'         " enable emmet in all vim modes
" let g:user_emmet_install_global=0 " enable emmet for just the below types
" autocmd FileType html,css,js,jsx EmmetInstall
" let g:user_emmet_leader_key='<C-u>' " remap the default emmet leader from <C-y> to <C-j>. Note: trailing comma still needed. See docs.

let g:ale_enabled=0
let g:ale_echo_msg_warning_str=''
let g:ale_echo_msg_error_str=''
let g:ale_lint_delay=750
let g:ale_open_list=0 " auto-open the loclist to show errs/warnings
let g:ale_sign_column_always=1
" let g:airline_section_error='%{ale#statusline#Status()}'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_statusline_format=['[%d Errors]', '[%d Warnings]', '']
let g:ale_linters={
\   'javascript': ['eslint'],
\   'cpp': ['g++'],
\}

let g:ctrlp_custom_ignore='node_modules'

" Use neocomplete.
let g:neocomplete#enable_at_startup=0
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=2
let g:neocomplete#enable_auto_close_preview=1
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'text' : '/usr/share/dict/connectives',
            \ 'javascript' : $HOME.'/Code/JS/Dictionary/all.txt',
            \ 'cpp' : $HOME.'/Code/Cpp/Dictionary/cpp-dictionary-keywords.txt'
            \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

" jsx extension settings
let g:jsx_ext_required=0

" Airline settings. See `vert h statusline`
" let g:airline_theme='solarized'
let g:airline_section_error=''
let g:airline_powerline_fonts=0
let g:airline_detect_iminsert=1
let g:airline_skip_empty_sections=1
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffers_label=''
let g:airline#extensions#tabline#tabs_label='tabs'
let g:airline#extensions#wordcount#format=''
" let g:airline#extensions#tabline#tab_min_count = 0
" let g:airline_extensions = ['tabline']
let g:airline_section_a=''
let g:airline_section_b=''
let g:airline_section_c=airline#section#create(['%t'])
let g:airline_section_x='%l, %c '
let g:airline_section_y=''
let g:airline_section_z=''
let g:airline_section_error=''
let g:airline_section_warning=''
let g:airline_left_sep=''
let g:airline_right_sep=''
" call airline#parts#define_accent('mode', 'blue')

" Mode=0 is asynchronous mode. Trim=1 trims empty lines in quickfix window.
" let g:asyncrun_mode=1
" let g:asyncrun_trim=1

" When set to 0, <ESC>ing in the following modes will not quit multi-cursor mode.
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0
