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
   " カレンダー
   NeoBundle 'itchyny/calendar.vim'
   NeoBundle 'flazz/vim-colorschemes'
   " 非同期コンパイル (補完用ローカルサーバ自動起動?)
   NeoBundle 'tpope/vim-dispatch'
   " Uniteを利用してカラースキーム一覧表示を行う(:Unite colorscheme -auto-preview)
   NeoBundle 'ujihisa/unite-colorscheme'
   NeoBundle 'lervag/vimtex' " Vim上でtexの部分コンパイルをする
   " 単語の前後に入力
   NeoBundle 'tpope/vim-surround'
   NeoBundle 'fuenor/vim-wordcount'
   " putした後履歴選択
   " NeoBundle 'LeafCage/yankround.vim'
   " let g:yankround_max_history = 35
   " nmap p <Plug>(yankround-p)
   " nmap P <Plug>(yankround-P)
   " nmap gp <Plug>(yankround-gp)
   " nmap gP <Plug>(yankround-gP)
   " nmap <C-p> <Plug>(yankround-prev)
   " nmap <C-n> <Plug>(yankround-next)
   " Vim上でtexの部分コンパイルをする
   " vimから実行する
   NeoBundle 'thinca/vim-quickrun'
   let g:quickrun_config = {
     \ "_" : {
       \ "hook/unite_quickfix/enable_failure" : 1,
       \ "hook/close_unite_quickfix/enable_hook_loaded" : 1,
       \ "hook/close_quickfix/enable_exit" : 1,
       \ "hook/close_buffer/enable_failure" : 1,
       \ "hook/close_buffer/enable_empty_data" : 1,
       \ "hook/inu/enable" : 1,
       \ "hook/inu/wait" : 20,
       \ "outputter" : "multi:buffer:quickfix",
       \ "outputter/buffer/split" : ":botright 3sp",
       \ }
       \ }

       " \ "runner" : "vimproc",
       " \ "runner/vimproc/updatetime" : 60
 " texファイルをQuickRunでコンパイルする際の設定
  let g:quickrun_config['tex'] = {
    \ 'command' : 'latexmk',
    \ 'outputter' : 'error',
    \ 'outputter/error/success' : 'buffer',
    \ 'outputter/error/error' : 'quickfix',
    \ 'srcfile' : expand("%"),
    \ 'cmdopt': '-pdfdvi',
    \ 'hook/sweep/files' : [
      \ '%S:p:r.aux',
      \ '%S:p:r.bbl',
      \ '%S:p:r.blg',
      \ '%S:p:r.dvi',
      \ '%S:p:r.fdb_latexmk',
      \ '%S:p:r.fls',
      \ '%S:p:r.log',
      \ '%S:p:r.out',
      \ '%S:p:r.synctex.gz',
    \ ],
    \ 'exec': ['%c %o %a %s']
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
      NeoBundle 'keith/sourcekittendaemon.vim'
   endif
   " VimScriptで作ってあるshell
   " 導入にはvimprocが必要で、加えてunite.vimとneocomplcacheまたはneocompleteがないと、一部の拡張機能が使えない。
   " vimprocはmakeしないとダメ
   " ~/.vim/bundle/vimproc/make
   NeoBundle 'Shougo/vimshell.vim'
   " VimShellでssh
   NeoBundle 'ujihisa/vimshell-ssh'
   NeoBundle 'Shougo/vimfiler.vim'
   NeoBundle 'kana/vim-submode'
   " Vimproc（非同期処理を実現するプラグイン：重たい処理実施時にVimがフリーズしない様にします）
   NeoBundle 'Shougo/vimproc.vim', {
               \ 'build' : {
               \ 'windows' : 'tools\\update-dll-mingw',
               \ 'cygwin' : 'make -f make_cygwin.mak',
               \ 'mac' : 'make -f make_mac.mak',
               \ 'linux' : 'make',
               \ 'unix' : 'gmake',
               \ },
               \ }
   " markdown preview
   NeoBundle 'plasticboy/vim-markdown' " シンタックスハイライト,自動折り畳み
   NeoBundle 'kannokanno/previm'
   NeoBundle 'tyru/open-browser.vim'
   au BufRead,BufNewFile *.md set filetype=markdown
   let g:previm_open_cmd = 'open -a Safari'
   " Python用入力補完
   " NeoBundle 'davidhalter/jedi-vim'
   " Goのなにか
   NeoBundle 'fatih/vim-go'
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
   " undoをツリーで可視化
   NeoBundle 'sjl/gundo.vim'
   nmap U :<C-u>GundoToggle<CR>
   " Visualモードで*使える
   NeoBundle 'thinca/vim-visualstar'
   " ローマ字で日本語検索(g/)(brew install cmigemo)(gvim限定)
   NeoBundle 'haya14busa/vim-migemo'
   " html爆速
   NeoBundle 'mattn/emmet-vim'
   " kotlin
   NeoBundle 'udalov/kotlin-vim'
   " c++
   NeoBundle 'justmao945/vim-clang'
   let g:clang_c_options = '-std=c11'
   let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'
   " vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
   let g:indent_guides_enable_on_vim_startup=1
   let g:indent_guides_start_level=2
   let g:indent_guides_auto_colors=0
   " タブ色
   " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=240
   " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=239
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

   call neobundle#end()
endif

"--------
    "go
    NeoBundleLazy 'fatih/vim-go', {
                \ 'autoload' : { 'filetypes' : 'go'  }
                \ }
"--------


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
   let g:neocomplete#max_list = 30
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
   " autocm FileType python setlocal omnifunc=jedi#completions completeopt-=preview
   " let g:jedi#completions_enabled = 0
   " let g:jedi#auto_vim_configuration = 0
   " if !exists('g:neocomplete#force_omni_input_patterns')
   "     let g:neocomplete#force_omni_input_patterns = {}
   " endif

   " オムニ補完設定
   " c用
   " let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
   " cpp用
   " let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
   " Python用
   " let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

   " 補完メニューの色
   " highlight Pmenu     ctermbg=80
   " highlight PmenuSel  ctermbg=10
   " highlight PmenuSbar ctermbg=10
   "
" ローカルサーバ?と通信してC#の補完をしてくれる
    NeoBundleLazy 'OmniSharp/omnisharp-vim', {
      \   'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] },
      \   'build': {
      \     'windows' : 'msbuild server/OmniSharp.sln',
      \     'mac': 'xbuild server/OmniSharp.sln',
      \     'unix': 'xbuild server/OmniSharp.sln',
      \   },
      \ }

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
" let g:lightline = {
"          \'colorscheme': 'hybrid',
"          \ 'mode_map': {'c': 'NORMAL'},
"          \ 'active': {
"          \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename'] ],
"          \   'right': [ [ 'syntastic', 'lineinfo' ],
"          \              [ 'percent' ],
"          \              [ 'filetype', 'fileencoding', 'pyenv' ] ]
"          \ },
"          \ 'component_expand':{
"          \   'syntastic': 'SyntasticStatuslineFlag'
"          \ },
"          \ 'component_type':{
"          \   'syntastic': 'error'
"          \ },
"          \ 'component_function': {
"          \   'modified': 'MyModified',
"          \   'readonly': 'MyReadonly',
"          \   'fugitive': 'MyFugitive',
"          \   'filename': 'MyFilename',
"          \   'fileformat': 'MyFileformat',
"          \   'filetype': 'MyFiletype',
"          \   'fileencoding': 'MyFileencoding',
"          \   'mode': 'MyMode',
"          \   'pyenv': 'pyenv#statusline#component'
"          \ }
"          \}

" vim-easymotion {{{
nmap g/ <Plug>(easymotion-s)
xmap g/ <Plug>(easymotion-s)
" nmap g/ <Plug>(easymotion-sn)
" xmap g/ <Plug>(easymotion-sn)
" omap g/ <Plug>(easymotion-tn)
" let g:EasyMotion_smartcase = 1
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map gl <Plug>(easymotion-w)
map gh <Plug>(easymotion-b)
let g:EasyMotion_startofline = 0
" let g:EasyMotion_use_upper = 1
" let g:EasyMotion_enter_jump_first = 1
" let g:EasyMotion_space_jump_first = 1
" hi EasyMotionTarget guifg=#80a0ff ctermfg=81
" }}}

" Undo ツリー
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
