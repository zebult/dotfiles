"---------------------------
" Start Neobundle Settings.
"---------------------------
" NeoBundle が無ければインストール
if !isdirectory(expand('$HOME/.vim/bundle'))
   call system('mkdir -p $HOME/.vim/bundle')
   call system('git clone https://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim')
   source $HOME/.vimrc
   NeoBundleInstall
   q
endif

" Vim 起動時のみ実行
if has('vim_starting')
   if &compatible
      set nocompatible               " Be iMproved
   endif
   set runtimepath+=~/.vim/bundle/neobundle.vim/
   call neobundle#begin(expand('~/.vim/bundle/'))

   "--------------------------------------------"
   " Let NeoBundle manage NeoBundle
   "--------------------------------------------"
   " NeoBundle 自体を NeoBundle で管理
   NeoBundleFetch 'Shougo/neobundle.vim'
   " Vim上でデータを操作するためのインターフェース
   NeoBundle 'Shougo/unite.vim'
   NeoBundle 'flazz/vim-colorschemes'
   " Uniteを利用してカラースキーム一覧表示を行う(:Unite colorscheme -auto-preview)
   NeoBundle 'ujihisa/unite-colorscheme'
   NeoBundle 'thinca/vim-quickrun'
   let g:quickrun_config = {
            \   "_" : {
            \       "outputter/buffer/close_on_empty" : 1,
            \       "outputter/buffer/split" : ":botright 8sp"
            \   },
            \   'tex':{
            \     'command' : 'latexmk',
            \     'cmdopt': '-pv',
            \     'exec': ['%c %o %s']
            \   },
            \ 'java' : {
            \ 'hook/output_encode/enable' : 1,
            \ 'hook/output_encode/encoding' : 'sjis',
            \ }
            \ }
   " 横分割をするようにする
   " let g:quickrun_config={'*': {'vsplit': ''}}
   " <C-c> で実行を強制終了させる
   " quickrun.vim が実行していない場合には <C-c> を呼び出す
   nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
   " 入力補完
   if has('lua')
      " luaインタプリタがある場合はNeoCompleteがインストールされるよ
      " NeoCompleteはNeoComplcacheの新しいバージョンだよ
      " NeoComplcacheと比較して高速化等がなされてるらしいよ
      NeoBundle 'Shougo/neocomplete.vim', {
               \ 'depends' : 'Shougo/vimproc.vim',
               \ 'autoload' : { 'insert' : 1,}
               \ }
   else
      " luaインタプリタが無い場合はNeoComplcacheがインストールされるよ
      " NeoComplcacheはNeoCompleteの古いバージョンだよ
      NeoBundle 'Shougo/neocomplcache.vim'
   endif
   " swift
   if has("mac")
      NeoBundle 'toyamarinyon/vim-swift'

      let g:quickrun_config['swift'] = {
               \ 'command': 'xcrun',
               \ 'cmdopt': 'swift',
               \ 'exec': '%c %o %s',
               \}
   endif
   let mapleader = "\<Space>"
   " VimScriptで作ってあるshell
   " 導入にはvimprocが必要で、加えてunite.vimとneocomplcacheがないと、一部の拡張機能が使えない。
   " vimprocはmakeしないとダメ
   " ~/.vim/bundle/vimproc/make
   NeoBundle 'Shougo/vimproc'
   NeoBundle 'Shougo/vimshell.vim'
   " ヘルプ日本語化:h
   NeoBundle 'vim-jp/vimdoc-ja'
   " VimShellでssh
   NeoBundle 'ujihisa/vimshell-ssh'
   NeoBundle 'Shougo/vimfiler.vim'
   NeoBundle 'kana/vim-submode'
   " markdown preview
   NeoBundle 'plasticboy/vim-markdown' " シンタックスハイライト,自動折り畳み
   NeoBundle 'kannokanno/previm'
   NeoBundle 'tyru/open-browser.vim'
   au BufRead,BufNewFile *.md set filetype=markdown
   let g:previm_open_cmd = 'open -a Safari'
   " Python用入力補完
   NeoBundle 'davidhalter/jedi-vim'
   " Git
   NeoBundle 'tpope/vim-fugitive'
   " 選択範囲拡大
   NeoBundle "terryma/vim-expand-region"
   " コメントアウト
   NeoBundle 'tomtom/tcomment_vim'
   " 検索爆速
   NeoBundle 'haya14busa/vim-easymotion'
   " ctags (brew install ctagsしておく必要がある)
   NeoBundle 'soramugi/auto-ctags.vim'
   " 構文チェック
   NeoBundle 'scrooloose/syntastic.git'
   " マークを可視化
   NeoBundle 'jacquesbh/vim-showmarks'
   " NeoBundle 'vim-scripts/ShowMarks'
   " インデントに色を付けて見やすくする
   NeoBundle 'nathanaelkane/vim-indent-guides'
   " html爆速
   NeoBundle 'mattn/emmet-vim'
   " vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
   let g:indent_guides_enable_on_vim_startup=1
   let g:indent_guides_start_level=2
   let g:indent_guides_auto_colors=0
   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=240
   autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238
   let g:indent_guides_color_change_percent = 30
   let g:indent_guides_guide_size = 1
   " ctagsのタグリスト一覧
   NeoBundleLazy "majutsushi/tagbar", {
            \ "autoload": { "commands": ["TagbarToggle"] }}
   if ! empty(neobundle#get("tagbar"))
      " Width (default 40)
      let g:tagbar_width = 20
      " Map for toggle
      nnoremap <silent> <leader>t :TagbarToggle<CR>
   endif


   " My Bundles here:
   " Refer to |:NeoBundle-examples|.
   " Note: You don't set neobundle setting in .gvimrc!

   call neobundle#end()
endif

"--------
"TNaky 補完,ctags
"--------
" 入力補完設定
if neobundle#is_installed('neocomplete.vim')
   " NeoComplete用設定
   " Neocompleteを有効化
   let g:neocomplete#enable_at_startup = 1
   " 補完が自動で開始される文字数
   let g:neocomplete#auto_completion_start_length = 1
   " Smart caseを有効化（大文字が入力されるまで，大文字小文字の区別を考慮しない）
   let g:neocomplete#enable_smart_case = 1
   " camle caseを有効化（大文字を区切りとしたワイルドカードのように振る舞う）
   let g:neocomplete#enable_camel_case_completion = 1
   " アンダーバー区切りの補完を有効化
   let g:neocomplete#enable_underbar_completion = 1
   " シンタックスをキャッシュするときの最大文字長を25に設定
   let g:neocomplete#min_syntax_length = 25
   " neocomplete を自動的にロックするバッファ名のパターン
   let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
   " 日本語入力時、無効化
   let g:neocomplete#lock_iminsert = 1
   " ハイフンの入力による候補番号の標示
   let g:neocomplete#enable_quick_match = 1
   " 提示される候補の最大数（初期値：100）
   let g:neocomplete#max_list = 5
   " 補完候補提示の際に先頭を選択状態へ
   let g:neocomplete#enable_auto_select = 1
   " 補完（小文字を無視して検索）
   let g:neocomplete#enable_refresh_always = 1
   " 辞書ファイルの定義
   let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ }
   " キーワードの定義
   if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
   endif
   let g:neocomplete#keyword_patterns._ = '\h\w*'

   " jedi-vimの設定
   autocm FileType python setlocal omnifunc=jedi#completions completeopt-=preview
   let g:jedi#completions_enabled = 0
   let g:jedi#auto_vim_configuration = 0
   if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
   endif

   " オムニ補完設定
   " c用
   let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
   " cpp用
   let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
   " Python用
   let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

elseif neobundle#is_installed('neocomplcache')
   " NeoComplcache用設定
   let g:neocomplcache_enable_at_startup = 1
   let g:neocomplcache_enable_ignore_case = 1
   let g:neocomplcache_enable_smart_case = 1
   if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}e*
   endif
   let g:neocomplcache_keyword_patterns._ = '\h\w*'
   let g:neocomplcache_enable_camel_case_completion = 1
   let g:neocomplcache_enable_underbar_completion = 1
   " 日本語入力時、無効化
   let g:neocomplcache#lock_iminsert = 1
endif

" タグジャンプについての設定
" " 保存時tags生成
let g:auto_ctags = 1
" " 保存場所指定
let g:auto_ctags_directory_list = ['.git', '.svn']
" " ctagsのオプションを設定してるよ
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes --edit_action'
" " 拡張子毎に作成
let g:auto_ctags_filetype_mode = 1

if executable('ctags')
   " LaTeXでtexファイルからpdfを生成するコマンドを叩く際の設定ファイルが有るかどうか確認
   if !filereadable(expand('$HOME/.ctags'))
      " 設定ファイルが無い場合生成して，設定内容を書込
      :let outputfile = '$HOME/.ctags'
      :execute ':redir! > ' . outputfile
      :silent! echon "--sort=yes" . "\n"
      :silent! echon "--append=yes" . "\n"
      :silent! echon "--recurse=yes" . "\n"
      :redir END
   endif
endif

"--------
" lightline Settings
let g:lightline = {
         \'colorscheme': 'hybrid',
         \ 'mode_map': {'c': 'NORMAL'},
         \ 'active': {
         \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename'] ],
         \   'right': [ [ 'syntastic', 'lineinfo' ],
         \              [ 'percent' ],
         \              [ 'filetype', 'fileencoding', 'pyenv' ] ]
         \ },
         \ 'component_expand':{
         \   'syntastic': 'SyntasticStatuslineFlag'
         \ },
         \ 'component_type':{
         \   'syntastic': 'error'
         \ },
         \ 'component_function': {
         \   'modified': 'MyModified',
         \   'readonly': 'MyReadonly',
         \   'fugitive': 'MyFugitive',
         \   'filename': 'MyFilename',
         \   'fileformat': 'MyFileformat',
         \   'filetype': 'MyFiletype',
         \   'fileencoding': 'MyFileencoding',
         \   'mode': 'MyMode',
         \   'pyenv': 'pyenv#statusline#component'
         \ }
         \}

" vim-easymotion {{{
nmap <Leader>s <Plug>(easymotion-s2)
xmap <Leader>s <Plug>(easymotion-s2)
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
hi EasyMotionTarget guifg=#80a0ff ctermfg=81
" }}}

function! MyFugitive()
   try
      if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
         let _ = fugitive#head()
         return strlen(_) ? '⭠ '._ : ''
      endif
   catch
   endtry
   return ''
endfunction

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"-------------------------
" End Neobundle Settings.
"-------------------------
"
au BufRead,BufNewFile *.md set filetype=markdown
"-------------------------
" view
"-------------------------
" サーチ色変更
autocmd ColorScheme * highlight Search ctermfg=9 guifg=#008800
autocmd ColorScheme * highlight IncSearch ctermfg=9 guifg=#008800
" 選択した範囲文字色
autocmd ColorScheme * highlight Visual ctermfg=31 guifg=#008800
colorscheme zenburn
" 256に制限をかける
set t_Co=256
set nu
set list
set listchars=tab:\ \ ,eol:¶,extends:»,precedes:« " 可視化する文字の設定．お好みで tab:».
set guifont=Ricty-Regular-for-Powerline:h14 
syntax on
" 現在行ハイライト
set cursorline
hi CursorLine term=bold cterm=NONE ctermfg=NONE ctermbg=239
" 現在列ハイライト
set cursorcolumn
hi CursorColumn term=bold cterm=NONE ctermfg=NONE ctermbg=238
" 行数色
hi CursorLineNr term=bold cterm=NONE ctermfg=15 ctermbg=NONE
" hi clear CursorLine
set clipboard=unnamed,autoselect
" インデントをスペース(4つ)だけにする "
set ts=4 sw=4 sts=0
" set tabstop=4 "タブ,画面上の見た目
" set shiftwidth=4
" set softtabstop=0 "タブ一回のスペース量(0はtsで指定して量)
set expandtab "タブをスペースに
set autoindent
" 検索をハイライトする
set hlsearch
" 入力完了を待たずに検索
set incsearch
" コマンドラインモードでtab保管
set wildmenu wildmode=list:full
nnoremap<ESC><ESC> :nohlsearch<CR>:args<CR>
set laststatus=2
set statusline=%F%r%h%=
" 大文字小文字を区別しない
set ignorecase
" カーソルを行頭、行末で止まらないようにする
" set whichwrap=b,s,h,l,<,>,[,]
" buffer切り替え時ファイルを保存しなくてもよい
set hidden
set noswapfile
" ~(バックアップ)ファイル作成しない
set nobackup
" 挿入モードで移動できない問題解決
imap <ESC>OA <Up>
imap <ESC>OB <Down>
imap <ESC>OC <Right>
imap <ESC>OD <Left>
" 挿入モードで文字消せない問題解決
set backspace=indent,eol,start
" オリジナルヤンク
noremap yu 0wv$hy
" Insertモードのときカーソルの形状を変更
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
inoremap <Esc> <Esc>
inoremap jj <ESC><ESC><ESC> 
noremap j gj
noremap k gk
" Insertモードで日本語の時色変更
if has('multi_byte_ime') || has('xim') 
   highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
   highlight CursorIM guifg=NONE guibg=#ecbcbc
endif
"検索語が画面の真ん中に来るようにする
nmap n nzz 
"nmap N Nzz 
nmap * *zz 
nmap # #zz 
nmap g* g*zz 
nmap g# g#zz
" Visual line やりやすく
" nmap vv V
" nmap vb viw
" v押す度拡大
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" 貼り付けたらテキストの末尾へ
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" メモ取りやすくする
inoremap <S-Tab> <Left><Left><backspace><backspace><backspace><backspace><Right><Right>
inoremap g<Tab> <Left><Left><tab><Right><Right>
inoremap <Tab> <tab>
" 対応する括弧へ移動しやすく
nmap <Tab> %
vmap <Tab> %
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
nnoremap s% :%s ///g

" Git(もっと単純化したいが待ち時間が発生するため一文字多い)
" nnoremap <leader>gst :Gstatus<Cr>
" nnoremap <leader>gad :Gwrite<Cr>
" nnoremap <leader>gcm :Gcommit<Cr>
" nnoremap <leader>gco :Gread<Cr>
" nnoremap <leader>gbl :Gblame<Cr>
" nnoremap <leader>glg :Glog<Cr>
" nnoremap <leader>gdf :Gdiff<Cr>
" nnoremap <leader>gfc :Gfetch<Cr>
" nnoremap <leader>gpu :Gpush<Cr>
" nnoremap <leader>gr :Ggrep 

nnoremap gst :Gstatus<Cr>
nnoremap gad :Gwrite<Cr>
nnoremap gcm :Gcommit<Cr>
nnoremap gco :Gread<Cr>
nnoremap gbl :Gblame<Cr>
nnoremap glg :Glog<Cr>
nnoremap gdf :Gdiff<Cr>
nnoremap gfc :Gfetch<Cr>
nnoremap gpu :Gpush<Cr>
nnoremap gr :Ggrep 

nnoremap <leader>ma :marks<CR>
nnoremap <leader>v :VimShell<CR>
nnoremap <leader>d :vertical diffsplit 
nnoremap <leader>u :Unite source<CR>
nnoremap <leader>f :VimFiler -split -simple -winwidth=25 -no-quit<CR>
nnoremap <leader>ml :DoShowMarks!<CR>
nnoremap <leader>md :NoShowMarks!<CR>
nnoremap <leader>r :QuickRun<CR>
autocmd FileType markdown nnoremap <Space>r :PrevimOpen<CR>
autocmd FileType html nnoremap <Space>r :!open %<CR>
autocmd FileType tex nnoremap <Space>r :QuickRun<CR>:!latexmk -c<CR>
nnoremap <Leader>o :Unite file<CR>
nnoremap <Leader>a :VimFiler -split -simple -winwidth=25 -no-quit<CR>:TagbarToggle<CR>

" save and close
" nnoremap gw :w<Cr>
" nnoremap gq :q<Cr>
" nnoremap g2 :wq<Cr>
" nnoremap g! :q!<Cr>
nnoremap <leader>w :w<Cr>
nnoremap <leader>q :q<Cr>
nnoremap <leader>2 :wq<Cr>
nnoremap <leader>! :q!<Cr>
cnoreabbrev wq!! w !sudo tee > /dev/null %<CR>:q!<CR>
cnoreabbrev w!! w !sudo tee > /dev/null %

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>
""""""""""""""""""""""""""""""
" 2度押しで囲む
noremap {{ wbi{<Esc>f<Space>i}<Esc><Cr>
noremap g[[ wbi[<Esc>f<Space>i]<Esc><Cr>
noremap (( wbi(<Esc>f<Space>i)<Esc><Cr>
noremap g<< wbi<<Esc>f<Space>i><Esc><Cr>
noremap ~~ wbi~~<Esc>f<Space>i~~<Esc><Cr>

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
   autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
endif
"""""""""""""""""""""""""""""

"==============================================
" マーク周りの改善
"==============================================
"----------------------------------------------
" jacquesbh/vim-showmarks
"----------------------------------------------
" 最初からマークを表示する
aug show-marks-sync
   au!
   au BufReadPost * sil! DoShowMarks
aug END
"----------------------------------------------
" vimのマーク機能をできるだけ活用してみる - Make 鮫 noise
" http://saihoooooooo.hatenablog.com/entry/2013/04/30/001908
" mを押すことで現在位置に対して自動的にアルファベットを割り振る
"----------------------------------------------
" マーク設定 : {{{
" 基本マップ
nnoremap [Mark] <Nop>
nmap m [Mark]
" 現在位置をマーク
if !exists('g:markrement_char')
   let g:markrement_char = [
            \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
            \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
            \ ]
endif
nnoremap <silent>[Mark]m :<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
function! s:AutoMarkrement()
   if !exists('b:markrement_pos')
      let b:markrement_pos = 0
   else
      let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
   endif
   execute 'mark' g:markrement_char[b:markrement_pos]
   echo 'marked' g:markrement_char[b:markrement_pos]
endfunction
" 次にマークする文字を設定するExコマンドを定義
command! -nargs=? SetNextMarkChar call s:set_next_mark_char(<f-args>)
function! s:set_next_mark_char(...)
   if a:0 >= 1
      let b:markrement_pos=index(g:markrement_char,a:1)-1
   else
      echo "Next:".g:markrement_char[b:markrement_pos+1]
   end
endfunction
" 次にマークする文字を設定する
nnoremap [Mark]sa :SetNextMarkChar a<CR>
nnoremap [Mark]sb :SetNextMarkChar b<CR>
nnoremap [Mark]sc :SetNextMarkChar c<CR>
nnoremap [Mark]sd :SetNextMarkChar d<CR>
nnoremap [Mark]se :SetNextMarkChar e<CR>
nnoremap [Mark]sf :SetNextMarkChar f<CR>
nnoremap [Mark]sg :SetNextMarkChar g<CR>
nnoremap [Mark]sh :SetNextMarkChar h<CR>
nnoremap [Mark]si :SetNextMarkChar i<CR>
nnoremap [Mark]sj :SetNextMarkChar j<CR>
nnoremap [Mark]sk :SetNextMarkChar k<CR>
nnoremap [Mark]sl :SetNextMarkChar l<CR>
nnoremap [Mark]sm :SetNextMarkChar m<CR>
nnoremap [Mark]sn :SetNextMarkChar n<CR>
nnoremap [Mark]so :SetNextMarkChar o<CR>
nnoremap [Mark]sp :SetNextMarkChar p<CR>
nnoremap [Mark]sq :SetNextMarkChar q<CR>
nnoremap [Mark]sr :SetNextMarkChar r<CR>
nnoremap [Mark]ss :SetNextMarkChar s<CR>
nnoremap [Mark]st :SetNextMarkChar t<CR>
nnoremap [Mark]su :SetNextMarkChar u<CR>
nnoremap [Mark]sv :SetNextMarkChar v<CR>
nnoremap [Mark]sw :SetNextMarkChar w<CR>
nnoremap [Mark]sx :SetNextMarkChar x<CR>
nnoremap [Mark]sy :SetNextMarkChar y<CR>
nnoremap [Mark]sz :SetNextMarkChar z<CR>
" 次にマークする文字を設定して，同時にマークする
nnoremap [Mark]fa :SetNextMarkChar a<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fb :SetNextMarkChar b<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fc :SetNextMarkChar c<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fd :SetNextMarkChar d<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fe :SetNextMarkChar e<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]ff :SetNextMarkChar f<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fg :SetNextMarkChar g<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fh :SetNextMarkChar h<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fi :SetNextMarkChar i<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fj :SetNextMarkChar j<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fk :SetNextMarkChar k<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fl :SetNextMarkChar l<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fm :SetNextMarkChar m<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fn :SetNextMarkChar n<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fo :SetNextMarkChar o<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fp :SetNextMarkChar p<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fq :SetNextMarkChar q<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fr :SetNextMarkChar r<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fs :SetNextMarkChar s<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]ft :SetNextMarkChar t<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fu :SetNextMarkChar u<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fv :SetNextMarkChar v<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fw :SetNextMarkChar w<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fx :SetNextMarkChar x<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fy :SetNextMarkChar y<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
nnoremap [Mark]fz :SetNextMarkChar z<CR>:<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
" 次/前のマーク
nnoremap [Mark]n ]`
nnoremap [Mark]p [`
" 一覧表示
nnoremap [Mark]l :PreviewMarks<CR>
" マークの全削除を行うコマンドを設定する
com! -bar MarksDelete sil :delm! | :delm 0-9A-Z | :wv! | :DoShowMarks
nn <silent>[Mark]d :MarksDelete<CR>
" }}}


" 選択してもそのまま貼り付けられるようにする
vnoremap <silent> p "0p<CR>
