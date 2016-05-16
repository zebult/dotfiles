" タブを表示
set showtabline=2
" GUIツールバーを非表示
set guioptions-=T
"メニューバーなし
set guioptions-=m
"右スクロールバーなし
set guioptions-=r
set guioptions-=R
"左スクロールバーなし
set guioptions-=l
"下スクロールバーなし
set guioptions-=b
" mac os x環境固有の設定
if has('mac')
   " フォントサイズを15ポイントに設定
   set guifont=Ricty-RegularForPowerline:h16
   " 半透明化
   set transparency=4
   " 暗い背景色用の配色を使う?
   set background=dark
endif
