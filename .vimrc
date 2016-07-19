let mapleader = "\<Space>"

" 分割したファイルの読み込み(view)
"-------------------------
" set runtimepath+=~/.vim/
" runtime! userautoload/*.vim
source ~/.vim/userautoload/neobundle.vim
source ~/.vim/userautoload/view.vim
source ~/.vim/userautoload/cpp.vim
source ~/.vim/userautoload/swift.vim
source ~/.vim/userautoload/go.vim
source ~/.vim/userautoload/md.vim
source ~/.vim/userautoload/cs.vim
"-------------------------
" テンプレート用意
autocmd BufNewFile *.html 0r $HOME/.vim/template/html.txt
autocmd BufNewFile *.cs 0r $HOME/.vim/template/cs.txt
autocmd BufNewFile *.php 0r $HOME/.vim/template/php.txt
autocmd BufNewFile *.sh 0r $HOME/.vim/template/sh.txt
autocmd BufNewFile *.py 0r $HOME/.vim/template/py.txt
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.txt
"-------------------------
"
au BufRead,BufNewFile *.md set filetype=markdown
" 入力完了を待たずに検索
set incsearch
" コマンドラインモードでtab保管
set wildmenu wildmode=list:full

nnoremap <ESC><ESC> :nohlsearch<CR>:args<CR>:redraw!<CR>
set laststatus=2
set statusline=%F%r%h%=
" 検索時大文字小文字を区別しない
set ignorecase
" カーソルを行頭、行末で止まらないようにする
" set whichwrap=b,s,h,l,<,>,[,]
" buffer切り替え時ファイルを保存しなくてもよい
set hidden
" '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set shiftround
" 補完時に大文字小文字を区別しない
set infercase
" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>
" macでクリップボード使用
" set clipboard=unnamed,autoselect
" set clipboard+=unnamed
" set clipboard=unnamed
" set clipboard+=unnamedplus,unnamed
set clipboard=unnamed
" ~(バックアップ)ファイル作成しない
set nobackup
set noswapfile
set nowritebackup
" セッションを超えたバックアップファイル作成しない(.un~)
set noundofile
" 挿入モードで移動できない問題解決
imap <ESC>OA <Up>
imap <ESC>OB <Down>
imap <ESC>OC <Right>
imap <ESC>OD <Left>
" 挿入モードで文字消せない問題解決
set backspace=indent,eol,start
" デフォルトを相対行数にする
" set relativenumber
" 相対行数トグル
" nnoremap N :<C-u>setlocal relativenumber!<CR>
" オリジナルヤンク
noremap yu 0wv$hy
" 単語をヤンクレジスタで置換
nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" ペースト直後に選択
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" Insertモードのときカーソルの形状を変更
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
inoremap <Esc> <Esc>
inoremap jj <ESC><ESC><ESC>
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" Insertモードで日本語の時色変更
if has('multi_byte_ime') || has('xim')
   highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
   highlight CursorIM guifg=NONE guibg=#ecbcbc
endif
"検索語が画面の真ん中に来るようにする
" nmap n nzz
"nmap N Nzz
" nmap * *zz
" nmap # #zz
" nmap g* g*zz
" nmap g# g#zz
" Visual line やりやすく
" nmap vv V
" nmap vb viw
" v押す度拡大
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" 矩形をブロックにする
set virtualedit=block
" ビープ音ならさない
set vb t_vb=
" 折りたたみしやすく
noremap \ zA
" 履歴数増量
set history=200
" 保存時行末の余分なスペースを取り除く
" autocmd BufWritePre * :%s/\s\+$//ge
" 貼り付けたらテキストの末尾へ
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" タグジャンプやりやすく
nnoremap tt gD
" メモ取りやすくする
inoremap <S-Tab> <Left><Left><backspace><backspace><backspace><backspace><Right><Right>
inoremap g<Tab> <Left><Left><tab><Right><Right>
inoremap <Tab> <tab>
" トグル(プラギン使用) < >ペア追加したい
nnoremap si :Switch<CR>
" 自動補完on/off
inoremap jn <ESC>:NeoCompleteToggle<CR>a
nnoremap gn :NeoCompleteToggle<CR>
" カレンダー
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
" diffすぐ出す
nnoremap diff :vertical diffsplit f
" 指定範囲インデント調節の連続化
vnoremap > >gv
vnoremap < <gv
" 全選択
nnoremap g0 ggVG
" 全インデント揃える
nnoremap gi ggVG=''zz
" 選択範囲文字数カウント
vnoremap gwc :s/./&/gn<CR>
" 文字出現数カウント
nnoremap <Leader>C :%s /<C-r><C-w>//gn<CR>
" 対応する括弧へ移動しやすく
nmap <Tab> %
vmap <Tab> %
" json整形
nnoremap g<Space>jq :%!jq '.'<CR>
" ファイル更新
nnoremap <Leader>L :e!<CR>
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
nnoremap s% :%s ///g<Left><Left><Left><C-r><C-w><Right><C-r><C-w>
nnoremap g<Space>wc :%s /<C-r><C-w>//gn<CR>

""""""""""""""""""""""""""""""
"  git
""""""""""""""""""""""""""""""
" nnoremap gst :Gstatus<Cr>
" nnoremap gad :Gwrite<Cr>
" nnoremap gcm :Gcommit<Cr>
" nnoremap gco :Gread<Cr>
" nnoremap gbl :Gblame<Cr>
" nnoremap glg :Glog<Cr>
" nnoremap gdf :Gdiff<Cr>
" nnoremap gfc :Gfetch<Cr>
" nnoremap gpu :Gpush<Cr>
" nnoremap gr :Ggrep
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

" マーク情報再描画
nnoremap mm :NoShowMarks!<CR>:DoShowMarks!<CR>
nnoremap ml :marks<CR>
nnoremap <Leader>d :vertical diffsplit
nnoremap <Leader>u :Unite source<CR>
nnoremap <Leader>f :VimFiler -split -simple -winwidth=25 -no-quit<CR>
" nnoremap <Leader>r :QuickRun<CR> <C-w>H
nnoremap <Leader>r :QuickRun<CR>
nnoremap <Leader>v :VimShell<CR>
nnoremap <Leader>c :Calendar<CR>
nnoremap gt :Calendar -view=clock<CR>
autocmd FileType markdown nnoremap <Leader>r :PrevimOpen<CR>
autocmd FileType html nnoremap <Leader>r :!open %<CR>
autocmd FileType tex nnoremap <Leader>r :QuickRun<CR>:!latexmk -c<CR>
nnoremap <Leader>I :VimFiler -split -simple -winwidth=25 -no-quit<CR>:TagbarToggle<CR>
nnoremap <Leader>o :!open .<CR><CR>
" タグジャンプを別タブで開く
nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

rv! " 履歴共有
" save and close
nnoremap <Leader>w :w<Cr>
nnoremap <Leader>q :q<Cr>
nnoremap <Leader>2 :wq<Cr>
nnoremap <Leader>! :q!<Cr>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

""""""""""""""""""""""""""""""
" 空白まで囲む
""""""""""""""""""""""""""""""
noremap <Leader>{ wbi{<Esc>f<Space>i}<Esc><Cr>
noremap <Leader>[ wbi[<Esc>f<Space>i]<Esc><Cr>
noremap <Leader>( wbi(<Esc>f<Space>i)<Esc><Cr>
noremap <Leader>< wbi<<Esc>f<Space>i><Esc><Cr>
noremap <Leader>~ wbi~~<Esc>f<Space>i~~<Esc><Cr>
noremap <Leader>" wbi"<Esc>f<Space>i"<Esc><Cr>

set completeopt=menuone
inoremap <silent> <expr> <Tab> pumvisible() ? "\<C-x>\<C-o>\<C-p>" : "\<Tab>"
let MyAutoComplete_StartLength = 3
""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
   autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
endif
""""""""""""""""""""""""""""""
" grepをQuickFixで開く
""""""""""""""""""""""""""""""
augroup grepopen
    " autocmd!
    " autocmd QuickfixCmdPost vimprep cw
    autocmd QuickFixCmdPost *grep* cwindow
augroup END
"""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" マーク周りの改善
""""""""""""""""""""""""""""""
noremap ' `
" 最初からマークを表示する
aug show-marks-sync
   au!
   au BufReadPost * sil! DoShowMarks
aug END

" オムニ補完
inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "\<C-x>\<C-o>"
" Plugin key-mappings.  " <C-k>でsnippetの展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" 選択してもそのまま貼り付けられるようにする----------
vnoremap <silent> p "0p<CR>
