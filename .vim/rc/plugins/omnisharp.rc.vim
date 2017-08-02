let g:OmniSharp_stop_server = 0

autocmd FileType cs nnoremap <C-j> :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap <C-k> :OmniSharpFindUsages<cr>

autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
autocmd FileType cs nnoremap <leader>Fx :OmniSharpFixUsings<cr>

autocmd FileType cs nnoremap [[ :OmniSharpNavigateUp<cr>
autocmd FileType cs nnoremap ]] :OmniSharpNavigateDown<cr>

autocmd FileType cs nnoremap <Leader>R :OmniSharpReloadSolution<cr>

" autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
" autocmd FileType cs nnoremap <leader>d  :OmniSharpDocumentation<cr>
" autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
" autocmd FileType cs nnoremap <Leader>b :OmniSharpBuild<cr> " BUild failed
" autocmd FileType cs nnoremap <Leader>O :OmniSharpFindImplementations<cr>
