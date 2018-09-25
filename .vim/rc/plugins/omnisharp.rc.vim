let g:OmniSharp_selector_ui = 'unite'

" vim終了する度サーバー終了するので手動にする
let g:Omnisharp_start_server = 0
let g:Omnisharp_stop_server  = 0

autocmd FileType cs nnoremap <C-]> :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap t<C-]> :tab sp<CR>:OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap s<C-]> :sp<CR><C-w>j:OmniSharpGotoDefinition<CR>
autocmd FileType cs vnoremap <C-]> <Esc>:vsp<CR><C-w>l:OmniSharpGotoDefinition<CR>

nnoremap <Leader>L :vsp<CR><C-w>lgg/:<CR>$:OmniSharpGotoDefinition<CR>:nohlsearch<CR>

" 参照(Caller)
autocmd FileType cs nnoremap zk :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap tzk :tab sp<CR>:OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap szk :sp<CR><C-w>j:OmniSharpFindUsages<CR>
autocmd FileType cs vnoremap zk <Esc>:vsp<CR><C-w>l:OmniSharpFindUsages<CR>

" 子クラス検索
autocmd FileType cs nnoremap zi :OmniSharpFindImplementations<cr>

" using整理
autocmd FileType cs nnoremap zA :OmniSharpGetCodeActions<cr>

autocmd FileType cs nnoremap [[ :OmniSharpNavigateUp<cr>
autocmd FileType cs nnoremap ]] :OmniSharpNavigateDown<cr>

autocmd FileType cs nnoremap <Leader>S :OmniSharpReloadSolution<cr>
autocmd FileType cs nnoremap <Leader>R :OmniSharpRename<cr>

autocmd FileType cs nnoremap <leader>d  :OmniSharpDocumentation<cr>
" autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
" autocmd FileType cs nnoremap <leader>Fx :OmniSharpFixUsings<cr>

" autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>

function! UsingClean() abort
  for i in  range(1, bufnr("$"))
    if buflisted(i)
      execute "buffer" i
      silent! call OmniSharp#FixUsings()
      update
      bdelete
    endif
  endfor
  quit
endfunction
