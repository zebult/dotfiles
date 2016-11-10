" Grep(very slow)
nnoremap <C-g> :Gtags -g %<CR><CR>
" このファイルの関数一覧
nnoremap <C-m> :Gtags -f %<CR><CR>
" カーソル以下の定義元を探す
nnoremap <C-;> :Gtags <C-r><C-w><CR><CR>
" 定義箇所
nnoremap <C-t> :GtagsCursor<CR><CR>
" カーソル以下の使用箇所を探す(callerと思われる, ただのgrepのようにも思われる)
nnoremap <C-k> :Gtags -r <C-r><C-w><CR><CR>
" 次の検索結果
nnoremap <C-n> :cn<CR>
" 前の検索結果
nnoremap <C-p> :cp<CR>

