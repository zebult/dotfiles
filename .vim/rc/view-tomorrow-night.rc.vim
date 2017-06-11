" GUI
" サーチ色変更
autocmd ColorScheme * highlight Search ctermbg=108
autocmd ColorScheme * highlight IncSearch ctermbg=108
" 選択した範囲文字色
autocmd ColorScheme * highlight Visual ctermfg=31 guifg=#008800
" 背景色をターミナルと同じにする
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermfg=241
" colorscheme one-dark
colorscheme Tomorrow-Night
" colorscheme tomorrow-night-org

" 256に制限をかける
set t_Co=256
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
" " 微調整
" hi Function ctermfg=67
" hi diffAdded ctermfg=2
" hi SpecialKey ctermfg=2
hi cType        ctermfg=139 guifg=139
hi cppType      ctermfg=139 guifg=139
hi cppAccess    ctermfg=139 guifg=139
hi cppStatement ctermfg=139 guifg=139
hi cppSTLtype   ctermfg=173 guifg=173
hi CCClass ctermfg=173 guifg=173

hi GlobalConstant ctermfg=173 guifg=173
hi GlobalVariable ctermfg=173 guifg=173
hi LocalVariable ctermfg=173 guifg=173

hi GitGutterAddLine ctermbg=236 guibg=black
hi GitGutterChangeLine ctermbg=238 guibg=yellow
hi GitGutterDeleteLine ctermbg=238 guibg=darkgray
hi GitGutterChangeDeleteLine ctermbg=238 guibg=yellow

" ============
" " 現在行ハイライト
" set cursorline
" hi CursorLine term=bold cterm=NONE ctermfg=NONE ctermbg=238
" " hi CursorLine cterm=underline
" " 現在列ハイライト
" set cursorcolumn
" hi CursorColumn term=bold cterm=NONE ctermfg=NONE ctermbg=238
" " 挿入中は行列ハイライトしない
" autocmd WinEnter    * set cursorline
" autocmd WinEnter    * set cursorcolumn
" autocmd WinLeave    * set nocursorline
" autocmd WinLeave    * set nocursorcolumn
" autocmd InsertEnter * set nocursorline
" autocmd InsertEnter * set nocursorcolumn
" autocmd InsertLeave * set cursorline
" autocmd InsertLeave * set cursorcolumn
" " 行数色
" hi LineNr term=bold cterm=NONE ctermfg=241 ctermbg=NONE
" " 現在行数色
" hi CursorLineNr term=bold cterm=NONE ctermfg=9 ctermbg=NONE
" " コメント色
" hi Comment ctermfg=241
" " タブ色
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=239
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238
" " 検索をハイライトする
" set hlsearch
" " 補完色
" hi PmenuSel ctermfg=72
