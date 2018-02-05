" vim終了する度サーバー終了するので手動にする
let g:Omnisharp_start_server = 0
let g:Omnisharp_stop_server  = 0
" OmniSharpStartServer

" 定義
autocmd FileType cs nnoremap zj :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap tzj :tab sp<CR>:OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap szj :sp<CR><C-w>j:OmniSharpGotoDefinition<CR>
autocmd FileType cs vnoremap zj <Esc>:vsp<CR><C-w>l:OmniSharpGotoDefinition<CR>

nnoremap <Leader>L gg}j$:vsp<CR><C-w>l:OmniSharpGotoDefinition<CR>

" 参照(Caller)
autocmd FileType cs nnoremap zk :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap tzk :tab sp<CR>:OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap szk :sp<CR><C-w>j:OmniSharpFindUsages<CR>
autocmd FileType cs vnoremap zk <Esc>:vsp<CR><C-w>l:OmniSharpFindUsages<CR>

autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
autocmd FileType cs nnoremap <leader>Fx :OmniSharpFixUsings<cr>

" autocmd FileType cs nnoremap [[ :OmniSharpNavigateUp<cr>
" autocmd FileType cs nnoremap ]] :OmniSharpNavigateDown<cr>

autocmd FileType cs nnoremap <Leader>R :OmniSharpReloadSolution<cr>
autocmd FileType cs nnoremap <Leader>S :OmniSharpRename<cr>

" autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
" autocmd FileType cs nnoremap <leader>d  :OmniSharpDocumentation<cr>
" autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
" autocmd FileType cs nnoremap <Leader>b :OmniSharpBuild<cr> " BUild failed
" autocmd FileType cs nnoremap <Leader>O :OmniSharpFindImplementations<cr>
