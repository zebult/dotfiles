let g:tagbar_width = 40
let g:tagbar_autoshowtag = 1 "TagbarShowTag を叩かなくても有効にする(HoldCusor時なので、遅い)
let g:tagbar_sort = 0 " sortさせない
let g:tagbar_map_togglesort = "S" "sキーを使うため別に割り当てる
nnoremap <Leader>t :TagbarClose<CR>:TagbarOpen<CR>
nnoremap <Leader>T :TagbarClose<CR>

" :set modifiable
" :set write
