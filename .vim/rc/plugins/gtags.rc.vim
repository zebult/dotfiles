" C, C++, Yacc, Java, PHP4, (python)
" http://uguisu.skr.jp/Windows/gtags.html
" https://www.machu.jp/diary/20090308.html

" 定義
nnoremap <C-j> :GtagsCursor<CR>
vnoremap <C-j> <Esc>:vs<CR><C-w>l:GtagsCursor<CR>
nnoremap s<C-j> :sp<CR><C-w>j:GtagsCursor<CR>
" 参照(Caller)
nnoremap <C-k> :Gtags -r <C-r><C-w><CR>
vnoremap <C-k> <Esc>:vs<CR><C-w>l:Gtags -r <C-r><C-w><CR>
nnoremap s<C-k> :sp<CR><C-w>j:Gtags -r <C-r><C-w><CR>
" Grep
nnoremap <C-g> :Gtags -g <C-r><C-w>
" このファイルの関数一覧
nnoremap <C-m> :Gtags -f %<CR>

" function! Caller() abort
"   :Gtags -r
" endfunction
" command -bar Caller call Caller()
