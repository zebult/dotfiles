let g:tagbar_width = 40
let g:tagbar_autoshowtag = 1 "TagbarShowTag を叩かなくても有効にする(HoldCusor時なので、遅い)
let g:tagbar_sort = 0 " sortさせない
let g:tagbar_map_togglesort = "S" "sキーを使うため別に割り当てる
nnoremap <Leader>t :TagbarClose<CR>:TagbarOpen<CR>:TagbarClose<CR>
nnoremap <Leader>T :TagbarToggle<CR>
" nnoremap <Leader>Tt :TagbarClose<CR>:TagbarOpen<CR>
" nnoremap <Leader>TT :TagbarClose<CR>
nnoremap <Bar><Bar> :TagbarOpen<CR>:wincmd l<CR>/

" :set modifiable
" :set write
