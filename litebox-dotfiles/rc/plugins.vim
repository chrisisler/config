"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Language
" Plug 'fsharp/vim-fsharp'                      " awesome syntax highlighting for ya boi f#
Plug 'othree/yajs.vim'                        " ECMAScript syntax highlighting
Plug 'posva/vim-vue'
" Plug 'othree/es.next.syntax.vim'              " es7 syntax
" Plug 'hail2u/vim-css3-syntax'                 " css3 syntax
Plug 'mxw/vim-jsx'                            " jsx syntax highlighting
Plug 'ElmCast/elm-vim'
" Plug 'artur-shaik/vim-javacomplete2' " java stuff
" Plug 'Quramy/vim-js-pretty-template' " syntax highlighting for js template strings
" Plug 'quramy/tsuquyomi' " typescript ide features
Plug 'leafgarland/typescript-vim' " typescript syntax highlighting
" Plug 'mattn/emmet-vim'                        " the only way to write html in vim
Plug 'eagletmt/neco-ghc'
Plug 'neovimhaskell/haskell-vim'              " syntax highlighting and indentation for haskell (and cabal)
" Plug 'hynek/vim-python-pep8-indent' " python correct indentation
" Plug 'octol/vim-cpp-enhanced-highlight'       " better c++ highlighting
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer' " rust auto-complete

" Plug 'tpope/vim-vinegar' " idk

" Interface
" Plug 'altercation/vim-colors-solarized' " solarized colorscheme for vim
Plug 'joshdick/onedark.vim'             " the only good one dark plugin
" Plug 'flazz/vim-colorschemes'           " some solid colorschems! (:

" Plug 'chriskempson/base16-vim'          " base16 colorschemes
Plug 'scrooloose/nerdtree'              " side-bar (tree explorer)
Plug 'bling/vim-airline'                " vim status bar and tabline (at top)
" Plug 'airblade/vim-gitgutter'           " git diff in gutter
Plug 'kshenoy/vim-signature'            " display marks in gutter
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
" Plug 'easymotion/vim-easymotion'        " vim motions on speed
" Plug 'tpope/vim-abolish'            " easily search/substitute/whatever multiple variants of a word
" Plug 'andrewradev/splitjoin.vim'    " easily transition between single/multi line code
Plug 'tpope/vim-dispatch' "async commands
Plug 'skywind3000/asyncrun.vim'

" Completion
Plug 'jiangmiao/auto-pairs'   " auto-match all brackets, parenthesis, quotes, etc.
Plug 'ervandew/supertab'      " hit <tab> for autocomplete
Plug 'shougo/neocomplete.vim' " code-completion
Plug 'sirver/ultisnips'       " snippies
Plug 'ternjs/tern_for_vim'    " vim -> js-ide. omni-comp, jump-to-def, docs, types, refs, renames, etc.

" Other
" Plug 'godlygeek/tabular' " for auto-aligning things easily (use the mapping)
Plug 'metakirby5/codi.vim' " inline/automatic evaluation
" Plug 'yggdroot/indentline' " cool indent lines 
" Plug 'heavenshell/vim-jsdoc' " auto-gen docs for js funcs
" Plug 'prettier/prettier' " auto-fmt js
Plug 'severin-lemaignan/vim-minimap' " sublime text-like minimap. ,mm to open and ,mc to close

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" rust code auto-formatting via `rustfmt` (format upon saving file)
let g:rustfmt_autosave = 1
" vim-racer settings
let g:racer_experimental_completer = 1
let g:racer_cmd = "/Users/litebox/.cargo/bin/racer"

" vim-minimap
let g:minimap_highlight='visual'

"vim-jsdoc settings
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_return=1
let g:jsdoc_return_type=1
let g:jsdoc_return_description=1
let g:jsdoc_underscore_private=1
let g:jsdoc_enable_es6=1
let g:jsdoc_param_description_separator=' - '

" let g:indentLine_enabled=1
" let g:indentLine_char='・'
" let g:indentLine_char='⎸'

let g:codi#rightsplit=1
let g:codi#rightalign=0

" must be 16
let g:onedark_termcolors=16
let g:onedark_terminal_italics=1

" git diff in gutter, default setting:
let g:gitgutter_enabled=1

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

let g:user_emmet_mode='a'         " enable emmet in all vim modes
let g:user_emmet_install_global=0 " enable emmet for just the below types
" autocmd FileType html,css,js,jsx EmmetInstall
let g:user_emmet_leader_key='<C-u>' " remap the default emmet leader from <C-y> to <C-j>. Note: trailing comma still needed. See docs.

let g:ale_fixers = {
            \ 'javascript': ['eslint', 'prettier']
            \}
let g:ale_set_highlights=0
let g:ale_enabled=0
let g:ale_echo_msg_warning_str=''
let g:ale_echo_msg_error_str=''
let g:ale_lint_delay=800
" Idea : set function mapping for g:ale_open_list : see `stackoverflow.com/questions/20579142`
let g:ale_open_list=1 " auto-open the loclist to show errs/warnings
let g:ale_sign_column_always=1
" let g:airline_section_error='%{ale#statusline#Status()}'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_statusline_format=['[%d Errors]', '[%d Warnings]', '']
let g:ale_linters={
\   'javascript': ['eslint'],
\   'cpp': ['g++'],
\}

let g:ctrlp_regexp=0
let g:ctrlp_custom_ignore='node_modules'
let g:ctrlp_show_hidden=1
let g:ctrlp_max_depth=4
let g:ctrlp_match_window='max:10'

" neocomplete settings.
let g:neocomplete#enable_refresh_always=1 " refreshes candidates automatically
let g:neocomplete#enable_at_startup=1
let g:neocomplete#auto_complete_delay=150
let g:neocomplete#enable_smart_case=1
let g:neocomplete#max_list=20
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

let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=0
let NERDTreeShowBookmarks=0
let NERDTreeShowHidden=1
" off
let NERDTreeStatusLine=-1
let NERDTreeAutoDeleteBuffer=1
" the CWD is changed whenever the tree root is changed
" let NERDTreeChDirMode=2

" jsx extension settings
let g:jsx_ext_required=0

" Airline settings. See `vert h statusline`
let g:airline_theme='onedark'
" let g:airline_powerline_fonts=0
" let g:airline_detect_iminsert=1
" let g:airline_skip_empty_sections=1
" let g:airline#extensions#ale#enabled=1
" `tabline` from airline displays all buffers at top of vim
let g:airline#extensions#tabline#enabled=1

" Display buffer number
let g:airline#extensions#tabline#buffer_nr_show=1
" show buffer number before name
let g:airline#extensions#tabline#buffer_nr_format = ' [%s] '

" minimal ui
let airline#extensions#tabline#middle_click_preserves_windows=1

" how should buffer name be displayed? (see `help filename-modifiers`)
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#buffers_label=''
let g:airline#extensions#tabline#tabs_label=''

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#wordcount#format=''
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline_extensions = ['tabline']
let g:airline_section_a=''
let g:airline_section_b=''
let g:airline_section_c=''
" let g:airline_section_c=airline#section#create(['%t'])
" let g:airline_section_x='%l, %c '
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z=''
let g:airline_section_error=''
let g:airline_section_warning=''
let g:airline_left_sep=''
let g:airline_right_sep=''
" call airline#parts#define_accent('mode', 'blue')

" Mode=0 is asynchronous mode, mode=1 is sync, mode=2 is just using `!`.
" Sync mode (`mode=1`) allows quickfix resizing hook to work successfully, use sync mode.
let g:asyncrun_mode=1
" Trim=1 trims empty lines in quickfix window.
let g:asyncrun_trim=1

" When set to 0, <ESC>ing in the following modes will not quit multi-cursor mode.
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0

" --------------- vim-signature settings ---------------

"  Highlight signs of marks dynamically based upon state indicated by vim-gitgutter.
let g:SignatureMarkTextHLDynamic=1
let g:SignatureDeleteConfirmation=1
let g:SignaturePurgeConfirmation=1

" *g:SignatureMap['Leader']*
" String, Default: 'm'

" Set the key used to toggle marks and markers.
" For eg. If this key is set to `<leader>m`,
" `<leader>ma`       will toggle the mark 'a' on the current line
" `<leader>m,`       will place the next available mark
" `<leader>m.`       will place the next available mark if there are no
" marks already on the line; otherwise, will remove
" first mark from line
" `<leader>m<Space>` will delete all marks
" `<leader>m1`       will toggle the marker '!'
" `<leader>m!`       will remove all the '!' markers
" `<leader>m<BS>`    will remove all markers
