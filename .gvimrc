" タブを表示
set showtabline=4
" GUIツールバーを非表示
set guioptions-=T
"メニューバーなし
set guioptions-=m
"右スクロールバーなし
set guioptions-=r
set guioptions-=R
"左スクロールバーなし
set guioptions-=l
set guioptions-=
"下スクロールバーなし
set guioptions-=b
let g:neocomplete#lock_iminsert = 1
" mac os x環境固有の設定
if has('mac')
   " フォントサイズを14ポイントに設定
   set guifont=Ricty-RegularForPowerline:h15
   " 半透明化
   set transparency=4
   " 暗い背景色用の配色を使う?
   set background=dark
endif
