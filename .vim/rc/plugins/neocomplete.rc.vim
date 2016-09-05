" Neocompleteを有効化
let g:neocomplete#enable_at_startup = 1
" 補完が自動で開始される文字数
let g:neocomplete#auto_completion_start_length = 2
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
let g:marching_enable_neocomplete = 1
" 辞書(C-x-k)も自動補完対象にする
let g:neosnippet#enable_snipmate_compatibility = 1
" 辞書ファイルの定義
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $CACHE.'/vimshell/command-history',
    \ 'cpp' : '~/.vim/dict/cpp.dict',
    \ }
" 'tokorom/swift-dict.vim'を補完対象にする
let g:swift_dict_with_neocomplete = 1
" キーワードの定義
if !exists('g:neocomplete#keyword_patterns')
let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
" jedi-vimの設定(omni補完の自動補完に必要)
autocm FileType python setlocal omnifunc=jedi#completions completeopt-=preview
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
" 文脈を考慮した補完(これがないとEnterで決まらない)
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

" 補完候補閉じる
inoremap <expr><C-e> neocomplete#cancel_popup()
" 補完候補確定
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"

