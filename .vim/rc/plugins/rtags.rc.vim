let g:rtagsUseDefaultMappings = 0
" 定義へジャンプ
nnoremap <silent> r<C-j> :call rtags#JumpTo(g:SAME_WINDOW)<CR>
" 参照へジャンプ
nnoremap <silent> r<C-k> :<C-u>Unite<Space>rtags/references<CR>
" クラス・関数定義内にいたらその先頭へジャンプ
nnoremap <silent> cc :call rtags#JumpToParent()<CR>
" rename
nnoremap <silent> r<C-r> :call rtags#RenameSymbolUnderCursor()<CR>
