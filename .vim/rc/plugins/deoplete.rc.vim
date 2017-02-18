" deopleteを有効化
let g:deoplete#enable_at_startup = 1
" 補完が自動で開始される文字数
let g:deoplete#auto_completion_start_length = 1
" Smart caseを有効化（大文字が入力されるまで，大文字小文字の区別を考慮しない）
let g:deoplete#enable_smart_case = 1
" camle caseを有効化（大文字を区切りとしたワイルドカードのように振る舞う）
let g:deoplete#enable_camel_case_completion = 1
" アンダーバー区切りの補完を有効化
let g:deoplete#enable_underbar_completion = 1
" シンタックスをキャッシュするときの最大文字長を25に設定
let g:deoplete#min_syntax_length = 25
" deoplete を自動的にロックするバッファ名のパターン
let g:deoplete#lock_buffer_name_pattern = '\*ku\*'
" 日本語入力時、無効化
let g:deoplete#lock_iminsert = 1
" ハイフンの入力による候補番号の標示
let g:deoplete#enable_quick_match = 1
" 提示される候補の最大数（初期値：100）
let g:deoplete#max_list = 100
" 補完候補提示の際に先頭を選択状態へ
let g:deoplete#enable_auto_select = 1
set completeopt+=noinsert
" 補完（小文字を無視して検索）
let g:deoplete#enable_refresh_always = 1
" marching.vimをauto complete
let g:marching_enable_deoplete = 1
" SKK使えるように(日本語入力の補完)
let g:eskk#enable_completion = 1
" " 辞書(C-x-k)も自動補完対象にする
let g:neosnippet#enable_snipmate_compatibility = 1
" " 辞書ファイルの定義 deopleteには辞書ない?
" let g:deoplete#keyword_patterns = {
" let g:deoplete#sources#dictionary#dictionaries = {
"     \ 'default' : '',
"     \ 'vimshell' : $CACHE.'/vimshell/command-history',
"     \ 'cpp' : '~/.vim/dict/cpp.dict',
"     \ 'cs' : '~/.vim/dict/cs.dict',
"     \ 'html' : '~/.vim/dict/html.dict',
"     \ }
" 'tokorom/swift-dict.vim'を補完対象にする
" let g:swift_dict_with_deoplete = 1
" " キーワードの定義
" if !exists('g:deoplete#keyword_patterns')
"     let g:deoplete#keyword_patterns = {}
" endif
" let g:deoplete#keyword_patterns._ = '\h\w*'
" jedi-vimの設定(omni補完の自動補完に必要)
autocm FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
" 文脈を考慮した補完(.や::の後に補完してくれる)(これがないとEnterで決まらない?)
if !exists('g:deoplete#force_omni_input_patterns')
    let g:deoplete#force_omni_input_patterns = {}
endif
if !exists('g:deoplete#sources#omni#input_patterns')
    let g:deoplete#sources#omni#input_patterns = {}
endif
let g:deoplete#force_overwrite_completefunc = 1
let g:deoplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:deoplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:deoplete#sources#omni#input_patterns.cs = '.*[^=\);]'
let g:deoplete#sources#omni#input_patterns.java = '\h\w*\.\w*'
let g:deoplete#sources#omni#input_patterns.m = '\h\w*\.\w*'
" use zchee/deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'

" FileType毎のOmni補完を設定
autocmd FileType java       setlocal omnifunc=javacomplete#Complete

" 補完候補閉じる
inoremap <expr><C-e> deoplete#cancel_popup()
" 補完候補確定
inoremap <expr><C-y> deoplete#close_popup()
inoremap <expr> <CR>    pumvisible() ? "\<C-y>"  : "\<CR>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>"  : "\<Tab>"
inoremap <expr> <C-j>   pumvisible() ? "\<Down>" : "\<C-x>\<C-o>"
