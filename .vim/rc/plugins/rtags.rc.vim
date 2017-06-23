" 定義へジャンプ
nnoremap <silent> J :call rtags#JumpTo(g:SAME_WINDOW)<CR>
" 参照へジャンプ
nnoremap <silent> K :<C-u>Unite<Space>rtags/references<CR>
" クラス・関数定義内にいたらその先頭へジャンプ
nnoremap <silent> L :call rtags#JumpToParent()<CR>
