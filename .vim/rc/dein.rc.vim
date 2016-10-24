" Dein setting

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " tomlから読み込めなかったためここで書く
    call dein#add('kannokanno/previm')
    call dein#add('tyru/operator-camelize.vim')
    call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('kana/vim-submode')
    call dein#add('jacquesbh/vim-showmarks')
    call dein#add('tpope/vim-fugitive')

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif

" if dein#check_update()
"   call dein#update()
" endif
"
" if dein#clear_state()
"     call dein#clear_state()
" endif
"
" if dein#recache_runtimepath()
"     call dein#recache_runtimepath()
" endif

" lazyにしても意味ないプラギン洗い出し
function! s:check_lazy_plugins() abort
    let check_lazy_plugins = dein#check_lazy_plugins()
    if len(check_lazy_plugins) > 0
        echom 'There are nonsense lazy plugins: ' . string(check_lazy_plugins)
    endif
endfunction

" call s:check_lazy_plugins()

