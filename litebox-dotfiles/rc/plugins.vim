"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Install Plugin Manager
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')


" ----- Language -----
Plug 'ekalinin/dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'wellle/tmux-complete.vim'
" Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'othree/yajs.vim', { 'for': 'javascript.jsx' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript.jsx' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
" Plug 'wlangstroth/vim-racket', { 'for': 'racket', 'commit': '365a2aff8fa1d08fc8ab4ab9b1cff27d87d86fbf' }
" Plug 'pangloss/vim-javascript'
" Plug 'jparise/vim-graphql'
" Plug 'posva/vim-vue'
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'flowtype/vim-flow'
" Plug 'fsharp/vim-fsharp'
" Plug 'ElmCast/elm-vim'
" Plug 'mattn/emmet-vim'
" Plug 'eagletmt/neco-ghc'
" Plug 'neovimhaskell/haskell-vim'
" Plug 'xuyuanp/nerdtree-git-plugin'


" ----- Interface -----
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'andymass/vim-matchup'
" Plug 'altercation/vim-colors-solarized'
Plug 'docunext/closetag.vim', { 'for': 'javascript.jsx.html' }


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
Plug 'rhysd/clever-f.vim'
" Plug 'skywind3000/asyncrun.vim'
" Plug 'easymotion/vim-easymotion'


" ----- Completion -----
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'shougo/neocomplete.vim'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'sirver/ultisnips'
Plug 'ternjs/tern_for_vim', { 'for': 'javascript.jsx', 'do': 'npm install' }


" ----- Random -----
Plug 'airblade/vim-rooter'
Plug 'metakirby5/codi.vim'
Plug 'machakann/vim-highlightedyank'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'EinfachToll/DidYouMean'
" Plug 'godlygeek/tabular'
" Plug 'junegunn/goyo.vim'
" Plug 'yggdroot/indentline'
" Plug 'severin-lemaignan/vim-minimap'


" A rainbow parenthesis plugin that finally works!
Plug 'amdt/vim-niji', { 'for': [] }

" Niji breaks JavaScript
let g:niji_matching_filetypes = []


call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:matchup_mappings_enabled = 0
let g:matchup_text_obj_enabled = 0
let g:matchup_motion_enabled = 0

let g:tmuxcomplete#trigger = ''

let g:dispatch_no_maps = 1

let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

let g:highlightedyank_highlight_duration = 300

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tagbar_compact = 1
" au FileType tagbar setlocal nocursorline statusline=Overview
nnoremap <silent> ,a :TagbarToggle<CR>

function! TagbarStatusFunc(current, sort, fname, flags, ...) abort
  return 'Overview'
endfunction
let g:tagbar_status_func = 'TagbarStatusFunc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: disable auto closing single-quotes for `.rkt` filetypes

" TODO: automaticaly add closure thingies in rust
" autocmd FileType rust let g:AutoPairs['|']='|'
" if &filetype == "rust"
"     let g:AutoPairs['|']='|'
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minimap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:minimap_highlight='Special'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo (distraction free)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:goyo_height=90
" let g:goyo_width=80


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
" let g:racer_cmd = "/Users/litebox/.cargo/bin/racer"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nate kane :: vim-indent-guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" hi IndentGuidesOdd  ctermbg=white
" hi IndentGuidesEven ctermbg=white
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_indent_levels = 10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:indentLine_enabled=1
let g:indentLine_char='┊'
let g:indentLine_first_char='┊'
" let g:indentLine_char='│'
" let g:indentLine_faster=1
let g:indentLine_showFirstIndentLevel=1
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'json', 'racket', 'tagbar', 'markdown', 'Dockerfile']
let g:vim_json_syntax_conceal = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" codi (live/inline evaluation)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:codi#rightsplit=1
let g:codi#rightalign=0
let g:codi#width=60

let g:codi#aliases = {
      \ 'javascript.jsx': 'javascript',
      \ }

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
" let g:loaded_matchparen = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tern (js auto-completion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tern_map_keys=0
let g:tern_show_argument_hints="on_hold"
let g:tern_show_signature_in_pum=1

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent", "--no-port-file"]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsSnippetsDir="~/.vim/snippets"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Milliseconds before requesting language completion after stopped typing
let g:ale_completion_delay = 1000
" LSP autocomplete
let g:ale_completion_enabled = 1
let g:ale_completion_max_suggestions = 24

let g:ale_enabled=1

let g:ale_sign_error='✕'
let g:ale_sign_warning='--'
let g:ale_sign_column_always=1

let g:ale_lint_delay=2000
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed='never'

let g:ale_set_signs=1
let g:ale_set_highlights=0
" Auto-open preview window when cursor is hovering line with problems?
let g:ale_cursor_detail=0
let g:ale_open_list=0
let g:ale_fix_on_save=1

" let g:ale_rust_cargo_use_check = 1
" let g:ale_rust_cargo_check_all_targets = 1

" suppress warnings when browsing files ignored by `.eslintignore` file
let g:ale_javascript_eslint_suppress_eslintignore=1

let g:ale_echo_delay = 300
let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str='Error'
let g:ale_echo_msg_warning_str='Warning'
let g:ale_echo_msg_info_str='Info'
let g:ale_echo_msg_format = '%severity% %code% [%linter%]: %s'
let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}}
let g:ale_linters={
      \   'javascript': ['eslint', 'flow'],
      \   'java': ['javac'],
      \   'rust': ['cargo', 'rls', 'rustc'],
      \   'python': ['pylint'],
      \   'cpp': ['g++'],
      \}

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
" let g:ale_fixers['rust'] = ['rustfmt']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf (fuzzy finder (better than ctrl-p plugin)) - best plugin ever!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:fzf_layout = { 'down': '~40%' }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neocomplete (language-agnostic autocompleter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

" Enabled?
let g:neocomplete#enable_at_startup=1

" refreshes candidates automatically, setting to 1 increases screen flicker
let g:neocomplete#enable_refresh_always=0

" if getting completion options is longer than this time than skip it.
let g:neocomplete#skip_auto_completion_time="0.3"
let g:neocomplete#auto_complete_delay=100
let g:neocomplete#enable_smart_case=1
let g:neocomplete#max_list=16
let g:neocomplete#sources#syntax#min_keyword_length=2
let g:neocomplete#enable_auto_close_preview=0
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree (file explorer)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeShowFiles=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '◇'
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

"  Highlight signs of marks dynamically based upon state indicated by vim-gitgutter?
let g:SignatureMarkTextHLDynamic=0
