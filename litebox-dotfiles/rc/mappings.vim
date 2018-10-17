"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Mappings
" Note: Mappings using `<Leader>` must be declared after the leader mapping is
" set (i.e., in the "Leader Mappings" section).
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv

nnoremap `` ``zz

" Go to next/previous buffer.
nnoremap <silent> ] :silent bn<CR>
nnoremap <silent> } :silent bp<CR>

" Next buffer.
nnoremap <silent> [ <C-w>w

" pressing enter key when auto-complete (pop-up) menu is open will press enter
" inoremap <expr><CR> pumvisible()? "\3" : "\<CR>" 

vnoremap 3 5

" <C-r> is hard to type, man.
nnoremap U <C-r>

" Open nerdtree.
nnoremap <silent> \ :NERDTreeToggle<CR>

" Open nerdtree and keep cursor in editor.
nnoremap <silent> \| :NERDTreeToggle<CR><C-w>l

" Not highlighting things happens pretty often.
nnoremap <silent> <space> :nohlsearch<CR>

" keep cursor where it is when joining lines.
" nnoremap J mzJ`z

" X is uncomfortable to type, ' is better.
nnoremap ' X

" I dont like accidently pressing these.
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
nnoremap <C-u> <nop>

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

" Best mapping ever.
noremap ; :
noremap : ;

" ^ is uncomfortable to press.
noremap 8 ^
" $ is uncomfortable to press.
noremap 9 $

" This just makes sense.
nnoremap * *N
nnoremap # #n

" Move up and down faster.
nnoremap E 5kzz
nnoremap D 5jzz

" nnoremap <C-a> ggVG

" (Experimental) Auto-indent pasted code (see `:h =`).
nnoremap P P==
nnoremap p p==
vnoremap P P=
vnoremap p p=

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

nnoremap <Leader>u :let g:ale_open_list=

" repeat previous command
" nnoremap <silent> <Leader><Leader><CR> @:

" Cool new thing: http://mlsamuelson.com/content/vim-search-word-under-cursor
nnoremap <Leader>[ [I

" Open ~/.vimrc quickly.
nnoremap <Leader>v<CR> :e ~/.vimrc<CR>

" open onejs syntax file quickly
nnoremap <Leader>vs<CR> :e ~/.vim/rc/syntax-highlighting/one-javascript.vim<CR>

" Horizontal and vertical resizing like my tmux key-bindings.
nnoremap <silent> <Leader>H :vertical res -6<CR>
nnoremap <silent> <Leader>J :res -6<CR>
nnoremap <silent> <Leader>K :res +6<CR>
nnoremap <silent> <Leader>L :vertical res +6<CR>

" Navigate between splits like my tmux key-bindings.
nnoremap <silent> <Leader>h :wincmd h<CR>
nnoremap <silent> <Leader>j :wincmd j<CR>
nnoremap <silent> <Leader>k :wincmd k<CR>
nnoremap <silent> <Leader>l :wincmd l<CR>

" Move horizontal splits to vertical splits
nnoremap <silent> <Leader>O <C-w>t <C-w>K
nnoremap <silent> <Leader>o <C-w>t <C-w>H

" Delete current buffer.
nnoremap <silent> <Leader>q<CR> :bdelete %<CR>

" Close current window without closing current buffer.
nnoremap <silent> <Leader><Leader>q<CR> <C-w>q

" Set ruler.
nnoremap <silent> <Leader>r :set cc=

" Make local/loclist, preview, and quickfix windows go away.
nnoremap <silent> <Leader>w :lclose<CR>:cclose<CR>:pclose<CR>

" Mappings for saving and sourcing .vimrc.
nnoremap <silent> <Leader>5<CR> :w<CR>:so %<CR>
nnoremap <silent> <Leader>4<CR> :so ~/.vimrc<CR>

" Copy the currently hovered word and console.log it on the next line.
nnoremap <Leader>cl "xyiwoconsole.log(<ESC>"xpA)<ESC>
" Same as above, except: console.log('variable is:', variable);
nnoremap <Leader>clv "xyiwoconsole.log('<ESC>"xpa<Space>is:',<Space><ESC>"xpa)<ESC>

" echo a cursor-hovered variable for shell scripts.
nnoremap <Leader>en "xyiwoecho "${}"hh"xp

" Make <C-x><C-l> (whole-line auto-completion) easier to type.
inoremap <Leader>l <C-x><C-l>
" inoremap <Leader>; <C-x><C-l>

" Fast mapping to call Tabular plugin (error if not installed).
" nnoremap <Leader>t :Tab /
" vnoremap <Leader>t :Tab /

" Remove trailing whitespace
" nnoremap <Leader>nows<CR> :%s/\s\+$//e<CR>:nohlsearch<CR>:w<CR>

" Change tab width/length.
nnoremap <Leader>t2 :set shiftwidth=2<CR>:set tabstop=2<CR>
nnoremap <Leader>t4 :set shiftwidth=4<CR>:set tabstop=4<CR>

" switch to last open buffer
nnoremap <Leader><Leader> :b#<CR>

" Add a semi-colon to the end of the cursor's current line.
" disabled/commented out for whole-line auto-completion
" nnoremap <Leader>; A;<ESC>

nnoremap <Leader>z :NeoCompleteToggle<CR>
nnoremap <Leader>g :GitGutterToggle<CR>
nnoremap <Leader>x :ALEToggle<CR>

" Linter mappings
nnoremap <Leader>p :ALEPreviousWrap<CR>kj
nnoremap <Leader>n :ALENextWrap<CR>kj
nnoremap <Leader>a :ALELint<CR>kj

nnoremap <silent> <Leader>; :set nocursorline<CR>
nnoremap <silent> <Leader>: :set cursorline<CR>
" nnoremap <silent> <Leader>I :set nocursorline<CR>:set nonumber<CR>
" nnoremap <silent> <Leader>i :set cursorline<CR>:set number<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Mappings for Mathematical Symbols
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" inoremap <silent> <Leader>intersection ∩
" inoremap <silent> <Leader>is ∩
" inoremap <silent> <Leader>union ∪
" inoremap <silent> <Leader>and ∧
" inoremap <silent> <Leader>or ∨

" inoremap <silent> <Leader>congruent ≡

" inoremap <silent> <Leader>propersubset ⊂
" inoremap <silent> <Leader>subset ⊆

" inoremap <silent> <Leader>roughlyequal ≈
" inoremap <silent> <Leader>notequal ≠

" inoremap <silent> <Leader>plusorminus ±
" inoremap <silent> <Leader>therefore ∴
" inoremap <silent> <Leader>foreach ∀
" inoremap <silent> <Leader>forany ∀
" " commented out to make whole-line auto-complete faster (see approx Line168)
" inoremap <silent> <Leader>lambda λ
" inoremap <silent> <Leader>lamda λ
" inoremap <silent> <Leader>emptyset ∅
" inoremap <silent> <Leader>sum Σ
" inoremap <silent> <Leader>mult ∏
" inoremap <silent> <Leader>multiply ∏
" inoremap <silent> <Leader>times ∙
" inoremap <silent> <Leader>integral ∫
" inoremap <silent> <Leader>derivative ∂
" inoremap <silent> <Leader>not ¬
" inoremap <silent> <Leader>in ∈
" inoremap <silent> <Leader>cartesianproduct ×
" inoremap <silent> <Leader>by ×
" inoremap <silent> <Leader>beta ∝
" inoremap <silent> <Leader>thereexists ∃
" inoremap <silent> <Leader>perp ⊥
" inoremap <silent> <Leader>suchthat ﬆ
" inoremap <silent> <Leader>st ﬆ
" inoremap <silent> <Leader>xor ⊕
" inoremap <silent> <Leader>degree °
" inoremap <silent> <Leader>composition °
" inoremap <silent> <Leader>compo °
" inoremap <silent> <Leader>divide ÷
" inoremap <silent> <Leader>sigma σ
" inoremap <silent> <Leader>std σ
" inoremap <silent> <Leader>stddev σ

" inoremap <silent> <Leader>complement ⁽
" inoremap <silent> <Leader>compl ⁽

" inoremap <silent> <Leader>floor ┗ x┛
" inoremap <silent> <Leader>ceiling ┏ x┓

" inoremap <silent> <Leader>greaterthanequal ≥
" inoremap <silent> <Leader>lessthanequal ≤

" inoremap <silent> <Leader>ifftaut ⇔
" inoremap <silent> <Leader>iff ↔
" inoremap <silent> <Leader>thentaut ⇒
" inoremap <silent> <Leader>then →


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Compile and Run - Mappings
"
" Note: Must be in same directory of file to get correct output.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nnoremap <silent> <Leader>doing :Dispatch doing<Space>

" Rust (if you want _less_ output, switch to `Dispatch`.)
" nnoremap <silent> <Leader>rs<CR> :w<CR>:AsyncRun cargo run % --color=never --quiet<CR> :copen<CR>:wincmd k<CR>
nnoremap <silent> <Leader>rs1 :w<CR>:AsyncRun rustc %<CR>:copen<CR>:wincmd k<CR>
nnoremap <silent> <Leader>rs2 :w<CR>:AsyncRun %:p:r<CR>:copen<CR>:wincmd k<CR>
nnoremap <silent> <Leader>rst :w<CR>:AsyncRun cargo test --color=never<CR>:copen<CR>:wincmd k<CR>

" Custom dispatch call
nnoremap <Leader>d<CR> :Dispatch 

" Javascript
" nnoremap <Leader>js<CR> :w<CR>:AsyncRun node % 2>/dev/null<CR>:copen<CR>:wincmd k<CR><CR>
" nnoremap <Leader>js<CR> :w<CR>:Dispatch! node %<CR>:cw<CR>:wincmd k<CR>
nnoremap <Leader>js<CR> :w<CR>:Dispatch node %<CR>

" Haskell
" nnoremap <Leader>hs<CR> :w<CR>:Dispatch ghc -o ./%:t:r % && ./%:t:r<CR>

" Python
" nnoremap <Leader>py<CR> :w<CR>:AsyncRun python %<CR>:copen<CR>:wincmd k<CR>
" nnoremap <Leader>py<CR> :w<CR>:Dispatch python3 %<CR>

" Java
nnoremap <Leader>j1<CR> :w<CR>:AsyncRun javac %<CR>:copen<CR>:wincmd k<CR>
nnoremap <Leader>j2<CR> :w<CR>:AsyncRun java %:t:r<CR>:copen<CR>:wincmd k<CR>

" C#
" nnoremap <Leader>cs<CR> :w<CR>:AsyncRun csc /nologo /t:exe %<CR>:copen<CR>:wincmd k<CR>

" Shell
" nnoremap <Leader>sh<CR> :w<CR>:AsyncRun bash %:p<CR>:copen<CR>:wincmd k<CR>

" Ruby
" nnoremap <Leader>rb<CR> :w<CR>:AsyncRun ruby %:p<CR>:copen<CR>:wincmd k<CR>

" C
" nnoremap <Leader>c1<CR> :w<CR>:AsyncRun gcc %<CR>:copen<CR>:wincmd k<CR>
" nnoremap <Leader>c2<CR> :w<CR>:AsyncRun ./a.exe<CR>:wincmd k<CR>

" C++
" nnoremap <Leader>cpp :w<CR>:AsyncRun g++ % && ./a.out<CR>:copen<CR>:wincmd k<CR>
