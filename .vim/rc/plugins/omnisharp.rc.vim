let g:OmniSharp_stop_server = 0

" 定義
autocmd FileType cs nnoremap <C-j> :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap t<C-j> :tab sp<CR>:OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap s<C-j> :sp<CR><C-w>j:OmniSharpGotoDefinition<CR>
" 参照(Caller)
autocmd FileType cs nnoremap <C-k> :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap t<C-k> :tab sp<CR>:OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap s<C-k> :sp<CR><C-w>j:OmniSharpFindUsages<CR>

autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
autocmd FileType cs nnoremap <leader>Fx :OmniSharpFixUsings<cr>

autocmd FileType cs nnoremap [[ :OmniSharpNavigateUp<cr>
autocmd FileType cs nnoremap ]] :OmniSharpNavigateDown<cr>

autocmd FileType cs nnoremap <Leader>R :OmniSharpReloadSolution<cr>
autocmd FileType cs nnoremap <Leader>S :OmniSharpRename<cr>

" autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
" autocmd FileType cs nnoremap <leader>d  :OmniSharpDocumentation<cr>
" autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
" autocmd FileType cs nnoremap <Leader>b :OmniSharpBuild<cr> " BUild failed
" autocmd FileType cs nnoremap <Leader>O :OmniSharpFindImplementations<cr>
