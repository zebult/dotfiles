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
        \       "outputter/buffer/split" : ":botright",
        \       "outputter/buffer/close_on_empty" :1 
        \   },
        \   'tex':{
        \     'command' : 'latexmk',
        \     'cmdopt': '-pv',
        \     'exec': ['%c %o %s']
        \   },
        \ }
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
  " VimScriptで作ってあるshell
  " 導入にはvimprocが必要で、加えてunite.vimとneocomplcacheがないと、一部の拡張機能が使えない。
  " vimprocはmakeしないとダメ
  " ~/.vim/bundle/vimproc/make
  NeoBundle 'Shougo/vimproc'
  NeoBundle 'Shougo/vimshell.vim'
  " VimShellでssh
  NeoBundle 'ujihisa/vimshell-ssh'
  NeoBundle 'Shougo/vimfiler.vim'
  NeoBundle 'kana/vim-submode'
  " markdown preview
  NeoBundle 'plasticboy/vim-markdown'
  NeoBundle 'kannokanno/previm'
  NeoBundle 'tyru/open-browser.vim'
  au BufRead,BufNewFile *.md set filetype=markdown
  let g:previm_open_cmd = 'open -a Safari'
  " Python用入力補完
  NeoBundle 'davidhalter/jedi-vim'
  " Git
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'rhysd/committia.vim'
  " コメントアウト
  NeoBundle 'tomtom/tcomment_vim'
  " ctags
  NeoBundle 'soramugi/auto-ctags.vim'
  " 構文チェック
  NeoBundle 'scrooloose/syntastic.git'
  " インデントに色を付けて見やすくする
  NeoBundle 'nathanaelkane/vim-indent-guides'
  " vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_start_level=2
  let g:indent_guides_auto_colors=0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=240
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238
  let g:indent_guides_color_change_percent = 30
  let g:indent_guides_guide_size = 1
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

" いわゆるタグジャンプについての設定(auto-ctagsの設定なわけだが)
" 読み込むタグファイルを設定
set tags+=tags;./**/tags
" ファイルの保存時にtagsファイルを作り直すよ(もともとtagsファイルが合った場合のみ）
if filereadable(expand('./tags'))
  let g:auto_ctags = 1
else
  let g:auto_ctags = 0
endif
" ctagsのオプションを設定してるよ
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes --edit_action'

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
" view
colorscheme zenburn
set nu
set list
set listchars=tab:\ \ ,eol:¶,extends:»,precedes:« " 可視化する文字の設定．お好みで tab:».
" set guifont=Ricty-Regular-for-Powerline:h14 
syntax on
set cursorline
hi clear CursorLine
set clipboard=unnamed,autoselect
" インデントをスペースだけにする "
set tabstop=3
set autoindent
set shiftwidth=3
set expandtab

set hlsearch
nnoremap<ESC><ESC> :nohlsearch<CR>
" 大文字小文字を区別しない
set ignorecase
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" buffer切り替え時ファイルを保存しなくてもよい
set hidden
set noswapfile
" 挿入モードで移動できない問題解決
imap <ESC>OA <Up>
imap <ESC>OB <Down>
imap <ESC>OC <Right>
imap <ESC>OD <Left>
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
" save and close
nnoremap gw :w<Cr>
nnoremap gq :q<Cr>
nnoremap g2 :wq<Cr>
nnoremap g! :q!<Cr>
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
"nnoremap so <C-w>_<C-w>|
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

" Git
nnoremap <Space>st :Gstatus<Cr>
nnoremap <Space>ad :Gwrite<Cr>
nnoremap <Space>cm :Gcommit<Cr>
nnoremap <Space>co :Gread<Cr>
nnoremap <Space>bl :Gblame<Cr>
nnoremap <Space>lg :Glog<Cr>
nnoremap <Space>df :Gdiff<Cr>
nnoremap <Space>fc :Gfetch<Cr>
nnoremap <Space>ps :Gpush<Cr>
nnoremap <Space>gr :Ggrep

nnoremap <Space>v :VimShell<CR>
nnoremap <Space>d :vertical diffsplit 
nnoremap <Space>u :Unite source<CR>
nnoremap <Space>f :VimFiler -split -simple -winwidth=45 -no-quit<CR>
nnoremap <Space>m :PrevimOpen<CR>
nnoremap <Space>r :QuickRun<CR>
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
