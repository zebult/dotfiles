" 定義へジャンプ
nnoremap <silent> <C-j> :call rtags#JumpTo(g:SAME_WINDOW)<CR>
" 参照へジャンプ
nnoremap <silent> <C-K> :<C-u>Unite<Space>rtags/references<CR>
" クラス・関数定義内にいたらその先頭へジャンプ
nnoremap <silent> gl :call rtags#JumpToParent()<CR>
" rename
nnoremap <silent> gr :call rtags#RenameSymbolUnderCursor()<CR>
