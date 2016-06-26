" サーチ色変更
autocmd ColorScheme * highlight Search ctermfg=160 ctermbg=252
autocmd ColorScheme * highlight IncSearch ctermfg=160 ctermbg=252
" 選択した範囲文字色
autocmd ColorScheme * highlight Visual ctermfg=31 guifg=#008800
" 背景色をターミナルと同じにする
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermfg=241
" colorscheme Tomorrow
" colorscheme xterm16
colorscheme one-dark
" 256に制限をかける
set t_Co=256
set nu
set list
set listchars=tab:\ \ ,eol:¶,extends:»,precedes:« " 可視化する文字の設定．お好みで tab:».
set guifont=Ricty-Regular-for-Powerline:h16
syntax on
" 現在行ハイライト
set cursorline
hi CursorLine term=bold cterm=NONE ctermfg=NONE ctermbg=238
" 現在列ハイライト
set cursorcolumn
hi CursorColumn term=bold cterm=NONE ctermfg=NONE ctermbg=238
" 現在行数色
hi CursorLineNr term=bold cterm=NONE ctermfg=15 ctermbg=NONE
" コメント色
hi Comment ctermfg=8
" インデントをスペース(4つ)だけにする "
set ts=4 sw=4 sts=0
" set tabstop=4 "タブ,画面上の見た目
" set shiftwidth=4
" set softtabstop=0 "タブ一回のスペース量(0はtsで指定して量)
set expandtab "タブをスペースに
set autoindent "インデントを自動でつける
" 検索をハイライトする
set hlsearch

" 補完色
highlight PmenuSel  ctermbg=33