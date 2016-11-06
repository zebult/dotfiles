nnoremap <C-j> :Denite file-rec<CR>

" カーソル位置の単語をgrep検索
" nnoremap <silent> <Leader>* :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" unite grep に ag(The Silver Searcher) を使う
" if executable('ag')
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
"   let g:unite_source_grep_recursive_opt = ''
"   nnoremap <Leader>* :ouch
" endif
