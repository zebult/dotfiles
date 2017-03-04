" View
colorscheme nefertiti

" 256に制限をかける
set t_Co=256
set list
if !has('gui_running')
    set listchars=tab:\ \ ,eol:$,extends:»,precedes:« " 可視化する文字の設定．お好みで tab:».¶
endif
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
    highlight Cursor term=NONE cterm=NONE ctermbg=241 ctermfg=fg
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=Purple
endif

" 現在行ハイライト
set cursorline
hi CursorLine term=bold cterm=NONE ctermfg=NONE ctermbg=236
" hi CursorLine cterm=underline
" 現在列ハイライト
" set cursorcolumn
" hi CursorColumn term=bold cterm=NONE ctermfg=NONE ctermbg=236
" サーチ色変更
hi Search ctermbg=lightyellow guibg=lightyellow
hi IncSearch ctermfg=lightyellow guifg=lightyellow
" 検索をハイライトする
" set hlsearch
" 選択した範囲文字色
hi Visual ctermfg=red guifg=red
" 行番号
hi LineNr ctermfg=darkgray ctermbg=NONE
" 現在行番号
hi CursorLineNr ctermfg=yellow guifg=yellow
" キャリッジリターン(CR)
hi NonText ctermfg=darkgray
" コメント色
hi Comment ctermfg=darkgray guifg=darkgray
" 補完色
hi PmenuSel ctermbg=yellow
" 微調整
hi SpecialKey ctermfg=blue
hi SpellBad ctermbg=NONE cterm=underline ctermfg=DarkRed
" lightblue
hi PreProc ctermfg=yellow
" lightgreen
hi MoreMsg ctermfg=red
hi Question ctermfg=red
hi Type ctermfg=red
" original color
" hi Function guifg=#FF0000
hi Function ctermfg=blue
hi Constant ctermfg=darkblue
" hi Structure ctermfg=blue
" hi Type ctermfg=blue
" hi CCClass ctermfg=blue

" color customise
" lightblue
hi GitGutterAddLine ctermbg=236 guibg=black
hi GitGutterChangeLine ctermbg=238 guibg=yellow
hi GitGutterDeleteLine ctermbg=238 guibg=darkgray
hi GitGutterChangeDeleteLine ctermbg=238 guibg=yellow
