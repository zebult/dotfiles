" Mappings

nnoremap <silent> <ESC><ESC> :cclose<CR>:nohlsearch<CR>:NoHighlightTrailingSpaces<CR>:set nocursorline<CR>:set nocursorcolumn<CR>:args<CR>:redraw!<CR>
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
" 行数切り替え
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>

inoremap jj <ESC><ESC><ESC>
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap ;  :
noremap :  ;

noremap <C-e> 2<C-e>
noremap <C-y> 2<C-y>
" タグジャンプやりやすく
nnoremap tj gD
" diffすぐ出す
ca difff vertical diffsplit
ca ccd lcd %:h
" 指定範囲インデント調節の連続化
vnoremap > >gv
vnoremap < <gv
" 前回編集した箇所選択
nnoremap gc  `[v`]
" 全選択
nnoremap g0 ggVG
" 全インデント揃える
nnoremap gi miggVG='izz
" ブロックのインデント揃える
nnoremap gI mivip='izz
" 貼り付けたらテキストの末尾へ
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap ml :marks<CR>

nnoremap & :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
" setter, getter自動生成
" map Kk mawv/ <CR>"ty/ <CR>wve"ny/getters<CR>$a<CR><CR><Esc>xxa<Tab>public <Esc>"tpa<Esc>"npbiget<Esc>l~hea() {<CR><Tab>return <Esc>"npa;<CR>}<Esc>=<CR><Esc>/setters<CR>$a<CR><CR><Esc>xxa<Tab>public void <Esc>"npbiset<Esc>l~hea (<Esc>"tpa<Esc>"npa) {<CR><Tab>this.<Esc>"npa = <Esc>"npa;<CR>}<Esc>=<CR>`ak
" メンバ変数アクセサ生成(m_付き限定)
nnoremap KK w"tyiww"myiwf_lve"vyopublic <Esc>"tpa <Esc>"vpb~higet<Esc>$a() {return <Esc>"mpa;}<Esc>opublic void <Esc>"vpb~hiset<Esc>$a(<Esc>"tpa <Esc>"vpa) {<Esc>"mpa=<Esc>"vpa;}<Esc>kk0w
" filename to  clipboard
nnoremap <Leader>N mfi<C-r>%<ESC>v'fyu

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
" tagsジャンプを新規タブで開く
nnoremap sgf <C-w>gf
" tagsジャンプを画面分割で開く
nnoremap s<C-]> :<C-u>vs<CR><C-w>l<C-]>
nnoremap g<C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" nnoremap S<C-]> :<C-u>sp<CR><C-w>j<C-]>
nnoremap sw <C-w>w
nnoremap so <C-w>o
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp new<CR><C-w>J
nnoremap sv :<C-u>vs new<CR><C-w>L
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
vnoremap s% y:%s ///g<Left><Left><Left><C-r>0<Right><C-r>0
nnoremap s% :%s ///g<Left><Left><Left><C-r><C-w><Right><C-r><C-w>
nnoremap S% :%s ///g<Left><Left><Left>\<<C-r><C-w>\><Right><C-r><C-w>

" Memo日付移動
" nnoremap g, i
" nnoremap g. i

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
" logical search
cnoremap <Bar><Bar> <Bslash><Bar>
cnoremap && .*
""""""""""""""""""""""""""""""

" Power tools
nnoremap <Leader>u :Unite source<CR>
nnoremap <Leader>R :!cocos run -s . -p ios<Cr>" TODO: . want git path
nnoremap <Leader>v :VimShell<CR>
" nnoremap <Leader>f :vim %<Left><Left>
" nnoremap <Leader>F :vim <C-r><C-w> %<CR>
nnoremap ga :CLL<CR>:Ag<Space>
nnoremap g/ :CLL<CR>:Ag<Space>
nnoremap <Leader>g :CLL<CR>:Ag<Space>

" includeへ移動
" nnoremap <buffer><silent> <Space>k :execute "?".&include<CR> :noh<CR> o
" nnoremap gt :Calendar -view=clock<CR>
autocmd FileType html nnoremap <Leader>r :!open %<CR>
autocmd FileType tex nnoremap <Leader>r :QuickRun<CR>:!latexmk -c<CR>
nnoremap <Leader>f :VimFiler -split -simple -winwidth=25 -no-quit<CR>
nnoremap <Leader>F :VimFiler -simple -no-quit<CR>
nnoremap <Leader>O :!open .<CR><CR>
" nnoremap <Leader>A :VimFiler -split -simple -winwidth=25 -no-quit<CR>:SrcExplToggle<CR>:TagbarToggle<CR><C-w>l
nnoremap <Leader>A :VimFiler -split -simple -winwidth=25 -no-quit<CR>:TagbarToggle<CR><C-w>l
nnoremap <Leader>$ :%s/\s\+$//ge<CR>

" save and close
nnoremap <Leader>w :w<Cr>
nnoremap <Leader>q :q<Cr>
nnoremap <Leader>Q :qa<Cr>
nnoremap <Leader>2 :wq<Cr>
nnoremap <Leader>! :q!<Cr>
nnoremap <Leader># :qa!<Cr>

nnoremap t$ v$:TogglSelectStart<CR>

set completeopt=menuone
inoremap <silent> <expr> <Tab> pumvisible() ? "\<C-x>\<C-o>\<C-p>" : "\<Tab>"
let MyAutoComplete_StartLength = 3

" 対応する括弧へ移動しやすく
nnoremap <Tab> %
vnoremap <Tab> %

nnoremap <F11> <C-i>

nmap gp Riw
" nmap cp Riw

" nnoremap gh ,
" nnoremap gl ;

nnoremap <silent> <C-n> :cn<CR>:CML<CR>zz
nnoremap <silent> <C-p> :cp<CR>:CML<CR>zz

" マーク周りの改善
noremap ' `

noremap <Bar> =

" 選択してもそのまま貼り付けられるようにする
vnoremap <silent> p "0p
