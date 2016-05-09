" サーチ色変更
autocmd ColorScheme * highlight Search ctermfg=9 guifg=#008800
autocmd ColorScheme * highlight IncSearch ctermfg=9 guifg=#008800
" 選択した範囲文字色
autocmd ColorScheme * highlight Visual ctermfg=31 guifg=#008800
" 背景色をターミナルと同じにする
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermfg=241
colorscheme Tomorrow-Night
colorscheme Tomorrow
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
" 背景と同化するため
hi Normal ctermfg=253 ctermbg=NONE cterm=None
hi Special ctermfg=196 ctermbg=None cterm=None
" インデントをスペース(4つ)だけにする "
set ts=4 sw=4 sts=0
" set tabstop=4 "タブ,画面上の見た目
" set shiftwidth=4
" set softtabstop=0 "タブ一回のスペース量(0はtsで指定して量)
set expandtab "タブをスペースに
set autoindent "インデントを自動でつける
" 検索をハイライトする
set hlsearch
