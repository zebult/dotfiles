" C, C++, Yacc, Java, PHP4, (python)
" http://uguisu.skr.jp/Windows/gtags.html
" https://www.machu.jp/diary/20090308.html

" 定義
nnoremap <C-j> :GtagsCursor<CR>
" 参照(Caller)
nnoremap <C-k> :Gtags -r <C-r><C-w><CR>
" Grep
nnoremap <C-g> :Gtags -g <C-r><C-w>
" このファイルの関数一覧
nnoremap <C-t> :Gtags -f %<CR>

" function! Caller() abort
"   :Gtags -r
" endfunction
" command -bar Caller call Caller()
