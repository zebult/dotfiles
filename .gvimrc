" タブを表示
set showtabline=2
" GUIツールバーを非表示
set guioptions-=T
" mac os x環境固有の設定
if has('mac')
   " フォントサイズを14ポイントに設定
   set guifont=Ricty-RegularForPowerline:h15
   " 半透明化
   set transparency=4
   " 暗い背景色用の配色を使う?
   set background=dark
endif
