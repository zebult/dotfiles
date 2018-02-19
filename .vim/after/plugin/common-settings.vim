" vimが最後に読み込むファイル

" 改行時、コメントアウト引き継がないようにする
" au FileType * setlocal formatoptions-=ro
autocmd BufEnter * setlocal formatoptions-=r
autocmd BufEnter * setlocal formatoptions-=o
" au FileType * RainbowParenthesesToggle

" viewに書いていると、一部反映されないため
" colorscheme tomorrow-night-org
" source ~/.vim/rc/view-tomorrow-night.rc.vim
