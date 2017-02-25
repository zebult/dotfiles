" vimが最後に読み込むファイル

" 改行時、コメントアウト引き継がないようにする
au FileType * setlocal formatoptions-=ro

" plugin不要コマンド
" airblade/vim-gitgutter
nunmap <Leader>hu
nunmap <Leader>hs
nunmap <Leader>hp
nunmap <Leader>hr
