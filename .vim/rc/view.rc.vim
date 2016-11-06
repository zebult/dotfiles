" GUI
" サーチ色変更
" autocmd ColorScheme * highlight Search ctermfg=160 ctermbg=252
" autocmd ColorScheme * highlight IncSearch ctermfg=160 ctermbg=252
autocmd ColorScheme * highlight Search ctermfg=160 ctermbg=108
autocmd ColorScheme * highlight IncSearch ctermfg=160 ctermbg=108
" 選択した範囲文字色
autocmd ColorScheme * highlight Visual ctermfg=31 guifg=#008800
" 背景色をターミナルと同じにする
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermfg=241
" colorscheme one-dark
" colorscheme solarized
" colorscheme spacegray
colorscheme tomorrow-night

" 256に制限をかける
set t_Co=256
set list
set listchars=tab:\ \ ,eol:¶,extends:»,precedes:« " 可視化する文字の設定．お好みで tab:».
set guifont=Ricty-Regular-for-Powerline:h16
syntax on

" カーソルの形状変更
if empty($TMUX)
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" Insertモードで日本語の時色変更
if has('multi_byte_ime') || has('xim')
    highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
    highlight CursorIM guifg=NONE guibg=#ecbcbc
    highlight Cursor guifg=#ff0000 guibg=#ff0000 gui=bold
    highlight CursorIM guifg=NONE guibg=#ff0000
    highlight Cursor       term=NONE cterm=NONE ctermbg=241 ctermfg=fg
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=Purple
endif

" 現在行ハイライト
set cursorline
hi CursorLine term=bold cterm=NONE ctermfg=NONE ctermbg=238
" 現在列ハイライト
set cursorcolumn
hi CursorColumn term=bold cterm=NONE ctermfg=NONE ctermbg=238
" 挿入中は行列ハイライトしない
autocmd WinEnter    * set cursorline
autocmd WinEnter    * set cursorcolumn
autocmd WinLeave    * set nocursorline
autocmd WinLeave    * set nocursorcolumn
autocmd InsertEnter * set nocursorline
autocmd InsertEnter * set nocursorcolumn
autocmd InsertLeave * set cursorline
autocmd InsertLeave * set cursorcolumn
" 行数色
hi LineNr term=bold cterm=NONE ctermfg=241 ctermbg=NONE
" 現在行数色
hi CursorLineNr term=bold cterm=NONE ctermfg=9 ctermbg=NONE
" コメント色
" hi Comment ctermfg=12
hi Comment ctermfg=241
" タブ色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238
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
" hi PmenuSel ctermbg=33
hi PmenuSel ctermfg=72
" 微調整
hi Type ctermfg=67
hi Function ctermfg=67
" hi	Comment ctermbg=33
" hi	Todo ctermbg=33
" hi	Title ctermbg=33
" hi	Identifier ctermbg=33
" hi	Statement ctermbg=33
" hi	Conditional ctermbg=33
" hi	Repeat ctermbg=33
" hi	Structure ctermbg=33
" hi	Constant ctermbg=33
" hi	Keyword ctermbg=33
" hi	String ctermbg=33
" hi	Special ctermbg=33
" hi	PreProc ctermbg=33
" hi	Operator ctermbg=33
" hi	Type ctermbg=33
" hi	Define ctermbg=33
" hi	Include ctermbg=33
" hi	Ignore ctermbg=33
