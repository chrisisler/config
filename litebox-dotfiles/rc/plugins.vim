"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')


" ----- Language -----
Plug 'ekalinin/dockerfile.vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
" Plug 'pangloss/vim-javascript'
" Plug 'jparise/vim-graphql'
" Plug 'posva/vim-vue'
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'flowtype/vim-flow'
" Plug 'fsharp/vim-fsharp'
" Plug 'ElmCast/elm-vim'
" Plug 'quramy/tsuquyomi'
" Plug 'leafgarland/typescript-vim'
" Plug 'mattn/emmet-vim'
" Plug 'eagletmt/neco-ghc'
" Plug 'neovimhaskell/haskell-vim'
" Plug 'xuyuanp/nerdtree-git-plugin'


" ----- Interface -----
" Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
" Plug 'altercation/vim-colors-solarized'
" Plug 'docunext/closetag.vim'


" ----- Integrations -----
Plug 'tpope/vim-commentary' " sane (un)commenting
Plug 'w0rp/ale'             " async linter
" Plug 'tpope/vim-fugitive'   " git integration


" ----- Commands -----
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin >/dev/null' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'jmcantrell/vim-diffchanges'
" Plug 'prettier/vim-prettier'


" ----- Completion -----
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'shougo/neocomplete.vim'
Plug 'sirver/ultisnips'
Plug 'ternjs/tern_for_vim'


" ----- Random -----
Plug 'airblade/vim-rooter'
" Plug 'EinfachToll/DidYouMean'
" Plug 'godlygeek/tabular'
" Plug 'metakirby5/codi.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'yggdroot/indentline'
" Plug 'severin-lemaignan/vim-minimap'


" ----- Broken plugins; these do NOT work -----
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'luochen1990/rainbow'
" Plug 'kien/rainbow_parentheses.vim'


call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" automaticaly add closure thingies in rust
" autocmd FileType rust let g:AutoPairs['|']='|'
" if &filetype == "rust"
"     let g:AutoPairs['|']='|'
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" java-complete2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType java setlocal omnifunc=javacomplete#Complete

let g:JavaComplete_EnableDefaultMappings = 0 
let g:JavaComplete_LibsPath = "/Users/litebox/Main/Uni/Compilers/Project-2/j--/lib"
let g:JavaComplete_SourcesPath = "/Users/litebox/Main/Uni/Compilers/Project-2/j--/src/jminusminus"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo (distraction free)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:goyo_height=90
" let g:goyo_width=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow (parenthesis)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:rainbow#max_level = 16
" let g:rainbow#pairs = [['(', ')'], ['{', '}']]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tables
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:table_mode_corner_corner='+'
" let g:table_mode_header_fillchar='='

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rooter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rooter_silent_chdir = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rustfmt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" rust code auto-formatting via `rustfmt` (format upon saving file)
let g:rustfmt_command = "rustfmt"
" let g:rustfmt_command = "rustfmt +nightly"
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-racer (for rust auto-completion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:racer_experimental_completer = 1
let g:racer_cmd = "/Users/litebox/.cargo/bin/racer"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:indentLine_enabled=1
" let g:indentLine_char='│'
" let g:indentLine_char='・'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" codi (live/inline evaluation)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:codi#rightsplit=1
" let g:codi#rightalign=0
" let g:codi#width=60

" let g:codi#aliases = {
"       \ 'javascript.jsx': 'javascript',
"       \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:gitgutter_enabled=1
" you think you can just walk into my house and add configuration? oh heck no.
let g:gitgutter_map_keys=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" haskell-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:haskell_enabled_quantification=1
" let g:haskell_enabled_recursivedo=1
" let g:haskell_enabled_arrowsyntax=1
" let g:haskell_enabled_pattern_synonyms=1
" let g:haskell_enabled_typeroles=1
" let g:haskell_enabled_static_pointers=1
" let g:haskell_backpack=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neco-ghc (haskell auto-completion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:necoghc_enable_detailed_browse=1
" let g:haskellmode_completion_ghc=1
" autocmd FileType hs,haskell setlocal omnifunc=necoghc#omnifunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntactically highlight matching parenthesis/brackets/etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" avoid loading match parenthesis syntax plugin?
" (may slow down vim if enabled)
let loaded_matchparen = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tern (js auto-completion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tern#is_show_argument_hints_enabled=1
let g:tern_show_argument_hints=1
let g:tern_show_signature_in_pum=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsSnippetsDir="~/.vim/snippets"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" emmet (html auto-completion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:user_emmet_mode='a'         " enable emmet in all vim modes
" let g:user_emmet_install_global=0 " enable emmet for just the below types
" " autocmd FileType html,css,js,jsx EmmetInstall
" let g:user_emmet_leader_key='<C-u>' " remap the default emmet leader from <C-y> to <C-j>. Note: trailing comma still needed. See docs.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_lint_on_text_changed='always'
" let g:ale_lint_on_text_changed='never'
" let g:ale_lint_on_save = 0
" let g:ale_lint_on_enter = 0

let g:ale_enabled=1
let g:ale_sign_error='✕'
let g:ale_sign_warning='--'
let g:ale_set_signs=1
let g:ale_lint_delay=800
let g:ale_fix_on_save=1
let g:ale_open_list=0
let g:ale_set_highlights=0
let g:ale_sign_column_always=1

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['rust'] = ['rustfmt']

" let g:ale_rust_cargo_use_check = 1
" let g:ale_rust_cargo_check_all_targets = 1


" suppress warnings when browsing files ignored by `.eslintignore` file
let g:ale_javascript_eslint_suppress_eslintignore=1
" let g:ale_javascript_eslint_use_global=1

" only use home config `~/.flowconfig` when ...? idk
" let g:ale_javascript_flow_executable='/usr/local/bin/flow'
" let g:ale_javascript_flow_use_home_config=1
" let g:ale_javascript_flow_use_global=1

" let g:ale_echo_msg_warning_str=''
" let g:ale_echo_msg_error_str=''
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_linters={
\   'javascript': ['eslint', 'flow'],
\   'java': ['javac'],
\}
" \   'cpp': ['g++'],
" \   'rust': ['cargo', 'rls', 'rustc'],

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf (fuzzy finder (better than ctrl-p plugin)) - best plugin ever!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:fzf_layout = { 'down': '~25%' }

" https://github.com/junegunn/fzf.vim
" mappings for fzf plugin
nnoremap <C-p> :GFiles<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-h> :History<CR>
nnoremap <C-c> :Commands<CR>

" difficult to find good mappings for these (case-insensitive!):
" <C-m> is a native alias for <Enter>
" <C-[> is a native alias for <ESC>
" <C-l> is a native alias for screen refresh
" <C-o> is a native alias for jumping to latest edited file && location
" <C-v> is a native alias for visual-block mode
" <C-z> is a native alias for background
nnoremap <C-i> :Files<CR>
nnoremap <C-x> :Lines<CR>
nnoremap <C-y> :Maps<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete (language-agnostic autocompleter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tab to select
" inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")

" the neocomplete auto complete should NOT hijack my enter key when
" autocomplete menu is displayed
" inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

" Enabled?
let g:neocomplete#enable_at_startup=1

" refreshes candidates automatically, setting to 1 increases screen flicker
let g:neocomplete#enable_refresh_always=0

" if getting completion options is longer than this time than skip it.
let g:neocomplete#skip_auto_completion_time="0.5"
let g:neocomplete#auto_complete_delay=150
let g:neocomplete#enable_smart_case=1
let g:neocomplete#max_list=16
let g:neocomplete#sources#syntax#min_keyword_length=2
let g:neocomplete#enable_auto_close_preview=0
" Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"             \ 'default' : '',
"             \ 'text' : '/usr/share/dict/connectives',
"             \ 'javascript' : $HOME.'/Code/JS/Dictionary/all.txt',
"             \ 'cpp' : $HOME.'/Code/Cpp/Dictionary/cpp-dictionary-keywords.txt'
"             \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"     let g:neocomplete#sources#omni#input_patterns = {}
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree (file explorer)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeShowFiles=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '◇'
" let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeMinimalUI=1
let NERDTreeMouseMode=2
let NERDTreeShowLineNumbers=0
let NERDTreeShowBookmarks=0
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=0
" off
let NERDTreeStatusLine=''
" let NERDTreeStatusLine=-1
let NERDTreeAutoDeleteBuffer=1
" the CWD is changed whenever the tree root is changed
" let NERDTreeChDirMode=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jsx extension settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:jsx_ext_required=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" asyncrun (async task runner)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mode=0 is asynchronous mode, mode=1 is sync, mode=2 is just using `!`.
" Sync mode (`mode=1`) allows quickfix resizing hook to work successfully, use sync mode.
let g:asyncrun_mode=1
" Trim=1 trims empty lines in quickfix window.
let g:asyncrun_trim=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multi cursors (like sublime)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When set to 0, <ESC>ing in the following modes will not quit multi-cursor mode.
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-signature settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove mappings which use `]` so that `:bn` mapping is faster.
let g:SignatureMap = {
      \ 'Leader'             :  "m",
      \ 'PlaceNextMark'      :  "m",
      \ 'ToggleMarkAtLine'   :  "",
      \ 'PurgeMarksAtLine'   :  "",
      \ 'DeleteMark'         :  "",
      \ 'PurgeMarks'         :  "",
      \ 'PurgeMarkers'       :  "",
      \ 'GotoNextLineAlpha'  :  "",
      \ 'GotoPrevLineAlpha'  :  "",
      \ 'GotoNextSpotAlpha'  :  "",
      \ 'GotoPrevSpotAlpha'  :  "",
      \ 'GotoNextLineByPos'  :  "",
      \ 'GotoPrevLineByPos'  :  "",
      \ 'GotoNextSpotByPos'  :  "",
      \ 'GotoPrevSpotByPos'  :  "",
      \ 'GotoNextMarker'     :  "",
      \ 'GotoPrevMarker'     :  "",
      \ 'GotoNextMarkerAny'  :  "",
      \ 'GotoPrevMarkerAny'  :  "",
      \ 'ListBufferMarks'    :  "",
      \ 'ListBufferMarkers'  :  ""
      \ }
let g:SignatureDeleteConfirmation=1
let g:SignaturePurgeConfirmation=1

"  Highlight signs of marks dynamically based upon state indicated by vim-gitgutter.
let g:SignatureMarkTextHLDynamic=1
