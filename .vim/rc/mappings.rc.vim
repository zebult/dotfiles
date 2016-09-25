" Mappings

nnoremap <ESC><ESC> :nohlsearch<CR>:args<CR>:redraw!<CR>
" ファイル名クリップボードにコピー
nnoremap <Leader>F i<C-r>%<ESC>vbbbyu
" 単語をヤンクレジスタで置換 ???
nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" and検索
nnoremap <Leader>& /\(A.*B\)
" or検索
nnoremap <Leader>\| /\(A\\|B\)
" ペースト直後に選択
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

inoremap jj <ESC><ESC><ESC>
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" タグジャンプやりやすく
nnoremap tt gD
" メモ取りやすくする
inoremap <S-Tab> <Left><Left><backspace><backspace><Right><Right>
inoremap g<Tab> <Left><Left><tab><Right><Right>
" 自動補完on/off
inoremap jn <ESC>:NeoCompleteToggle<CR>a
nnoremap gn :NeoCompleteToggle<CR>
" diffすぐ出す
nnoremap diff :vertical diffsplit f
" 指定範囲インデント調節の連続化
vnoremap > >gv
vnoremap < <gv
" 全選択
nnoremap g0 ggVG
" 全インデント揃える
nnoremap gi miggVG='izz
" 選択範囲文字数カウント
vnoremap gwc :s/./&/gn<CR>
" 文字出現数カウント
nnoremap <Leader>W :%s /<C-r><C-w>//gn<CR>
" json整形
nnoremap <Leader>J :%!jq '.'<CR>
" ファイル更新
nnoremap <Leader>L :e!<CR>
" フルパス挿入
nnoremap <Leader>p i<C-R>=expand('%:p')<CR>

" 貼り付けたらテキストの末尾へ
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap ml :marks<CR>

" setter, getter自動生成
map Kk mawv/ <CR>"ty/ <CR>wve"ny/getters<CR>$a<CR><CR><Esc>xxa<Tab>public <Esc>"tpa<Esc>"npbiget<Esc>l~hea() {<CR><Tab>return <Esc>"npa;<CR>}<Esc>=<CR><Esc>/setters<CR>$a<CR><CR><Esc>xxa<Tab>public void <Esc>"npbiset<Esc>l~hea (<Esc>"tpa<Esc>"npa) {<CR><Tab>this.<Esc>"npa = <Esc>"npa;<CR>}<Esc>=<CR>`ak

" Screen split key mappings
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>o
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
noremap s% :%s ///g<Left><Left><Left><C-r><C-w><Right><C-r><C-w>

""""""""""""""""""""""""""""""
"  git
""""""""""""""""""""""""""""""
nnoremap gst :Gstatus<Cr>
nnoremap gad :Gwrite<Cr>
nnoremap gcm :Gcommit<Cr>
nnoremap gacm :Gwrite<Cr>:Gcommit<Cr>
nnoremap gco :Gread<Cr>
nnoremap gbl :Gblame<Cr>
nnoremap glo :Glog<Cr>
nnoremap gdf :Gdiff<Cr>
nnoremap gfc :Gfetch<Cr>
nnoremap gpu :Gpush<Cr>
nnoremap gr :Ggrep
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
"  ex mode
""""""""""""""""""""""""""""""
" ディレクトリを手早く展開
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
" 強制保存
cnoreabbrev wq!! w !sudo tee > /dev/null %<CR>:q!<CR>
cnoreabbrev w!! w !sudo tee > /dev/null %
" emacs
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
""""""""""""""""""""""""""""""

" Power tools
nnoremap <Leader>d :vertical diffsplit
nnoremap <Leader>u :Unite source<CR>
nnoremap <Leader>f :VimFiler -split -simple -winwidth=25 -no-quit<CR>
nnoremap <Leader>r :QuickRun<CR>" TODO: 数秒後できたら(:HierUpdate<CR> )
nnoremap <Leader>v :VimShell<CR>
nnoremap <Leader>G :Calendar<CR>
nnoremap <Leader>g :vim %<Left><Left> 
nnoremap gt :Calendar -view=clock<CR>
autocmd FileType markdown nnoremap <Leader>r :PrevimOpen<CR>
autocmd FileType html nnoremap <Leader>r :!open %<CR>
autocmd FileType tex nnoremap <Leader>r :QuickRun<CR>:!latexmk -c<CR>
nnoremap <Leader>I :VimFiler -split -simple -winwidth=25 -no-quit<CR>:TagbarToggle<CR>
nnoremap <Leader>o :!open .<CR><CR>

" save and close
nnoremap <Leader>w :w<Cr>
nnoremap <Leader>q :q<Cr>
nnoremap <Leader>2 :wq<Cr>
nnoremap <Leader>! :q!<Cr>

set completeopt=menuone
inoremap <silent> <expr> <Tab> pumvisible() ? "\<C-x>\<C-o>\<C-p>" : "\<Tab>"
let MyAutoComplete_StartLength = 3

" 対応する括弧へ移動しやすく
nnoremap <Tab> %
vnoremap <Tab> %
" マーク周りの改善
noremap ' `

" 選択してもそのまま貼り付けられるようにする
vnoremap <silent> p "0p<CR>

