nmap gn <Plug>(cursor-line-color-lowlight)<Plug>(anzu-mode-n)
" nmap gp <Plug>(cursor-line-color-lowlight)<Plug>(anzu-mode-N)
nmap N <Plug>(cursor-line-color-lowlight)<Plug>(anzu-N)
nmap n <Plug>(cursor-line-color-lowlight)<Plug>(anzu-n)
nmap * <Plug>(cursor-line-color-lowlight)<Plug>(anzu-star)
" nmap # <Plug>(cursor-line-color-lowlight)<Plug>(anzu-sharp)
" augroup vim-anzu
"     " 一定時間キー入力がないとき、ウインドウを移動したとき、タブを移動したときに
"     " 検索ヒット数の表示を消去する
"     autocmd!
"     autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
" augroup END

" 画面上に表示
" nmap n <Plug>(anzu-mode-n)
" nmap N <Plug>(anzu-mode-N)
" nmap * <Plug>(anzu-star-with-echo)
" nmap # <Plug>(anzu-sharp-with-echo)
" nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
