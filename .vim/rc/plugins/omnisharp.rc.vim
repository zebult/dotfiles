" let g:OmniSharp_server_path = '~/.cache/dein/repos/github.com/OmniSharp/omnisharp-vim/server/OmniSharp/bin/Debug/OmniSharp.exe'
"
" let g:OmniSharp_typeLookupInPreview = 1
" let g:OmniSharp_timeout = 1
" " set completeopt=longest,menuone,preview
" " set previewheight=5
" let g:syntastic_cs_checkers = ['code_checker']
" augroup omnisharp_commands
"     autocmd!
"
"     " Synchronous build (blocks Vim)
"     "autocmd FileType cs nnoremap <buffer> <F5> :wa!<CR>:OmniSharpBuild<CR>
"     " Builds can also run asynchronously with vim-dispatch installed
"     autocmd FileType cs nnoremap <buffer> <Leader>b :wa!<CR>:OmniSharpBuildAsync<CR>
"     " Automatic syntax check on events (TextChanged requires Vim 7.4)
"     autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
"
"     " Automatically add new cs files to the nearest project on save
"     autocmd BufWritePost *.cs call OmniSharp#AddToProject()
"
"     " Show type information automatically when the cursor stops moving
"     autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
"
"     " The following commands are contextual, based on the cursor position.
"     autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
"
"     " Finds members in the current buffer
"     autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
"
"     " Cursor can be anywhere on the line containing an issue
"     autocmd FileType cs nnoremap <buffer> <Leader>x  :OmniSharpFixIssue<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
"
"     " Navigate up and down by method/property/field
"     autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
"     autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
" augroup END
"
" " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
" nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" " Run code actions with text selected in visual mode to extract method
" xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
"
" " Rename with dialog
" nnoremap <Leader>nm :OmniSharpRename<CR>
" nnoremap <F2> :OmniSharpRename<CR>
" " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
" command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
"
" " Force OmniSharp to reload the solution. Useful when switching branches etc.
" nnoremap <Leader>rl :OmniSharpReloadSolution<CR>
" nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
" " Load the current .cs file to the nearest project
" nnoremap <Leader>tp :OmniSharpAddToProject<CR>
"
" " Start the omnisharp server for the current solution
" nnoremap <Leader>ss :OmniSharpStartServer<CR>
" nnoremap <Leader>sp :OmniSharpStopServer<CR>
"
" " Add syntax highlighting for types and interfaces
" nnoremap <Leader>th :OmniSharpHighlightTypes<CR>
" " let g:OmniSharp_want_snippet=1

" let g:OmniSharp_selector_ui = 'unite'
" let g:OmniSharp_server_type = 'roslyn'
" let g:OmniSharp_server_path = '~/.build/omnisharp-osx/omnisharp/OmniSharp.exe'
" let g:OmniSharp_server_path = '~/.omnisharp/omnisharp-roslyn/artifacts/publish/OmniSharp.Http.Driver/mono/OmniSharp.exe'
" let g:OmniSharp_server_path = '~/.omnisharp/tmp/omnisharp-roslyn/artifacts/publish/OmniSharp.Http.Driver/mono/OmniSharp.exe'
" let g:OmniSharp_server_path = '~/.omnisharp/omnisharp-roslyn/omnisharp/OmniSharp.exe'
let g:OmniSharp_server_use_mono = 1
" set completeopt=longest,menuone,preview
" set previewheight=5

" vim終了する度サーバー終了するので手動にする
" let g:Omnisharp_start_server = 0
" let g:Omnisharp_stop_server  = 0
" OmniSharpStartServer

autocmd FileType cs nnoremap zj :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap <C-]> :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap tzj :tab sp<CR>:OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap t<C-]> :tab sp<CR>:OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap szj :sp<CR><C-w>j:OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap s<C-]> :sp<CR><C-w>j:OmniSharpGotoDefinition<CR>
autocmd FileType cs vnoremap zj <Esc>:vsp<CR><C-w>l:OmniSharpGotoDefinition<CR>
autocmd FileType cs vnoremap <C-]> <Esc>:vsp<CR><C-w>l:OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap 8( :OmniSharpGotoDefinition<CR>

" nnoremap <Leader>L gg}j$:vsp<CR><C-w>l:OmniSharpGotoDefinition<CR>
nnoremap <Leader>L :vsp<CR><C-w>lgg/:<CR>$:OmniSharpGotoDefinition<CR>:nohlsearch<CR>

" 参照(Caller)
" autocmd FileType cs nnoremap zk :OmniSharpFindUsages<cr>
" autocmd FileType cs nnoremap tzk :tab sp<CR>:OmniSharpFindUsages<CR>
" autocmd FileType cs nnoremap szk :sp<CR><C-w>j:OmniSharpFindUsages<CR>
" autocmd FileType cs vnoremap zk <Esc>:vsp<CR><C-w>l:OmniSharpFindUsages<CR>

autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
autocmd FileType cs nnoremap <leader>Fx :OmniSharpFixUsings<cr>

" autocmd FileType cs nnoremap [[ :OmniSharpNavigateUp<cr>
" autocmd FileType cs nnoremap ]] :OmniSharpNavigateDown<cr>

autocmd FileType cs nnoremap <Leader>R :OmniSharpReloadSolution<cr>
" autocmd FileType cs nnoremap <Leader>S :OmniSharpRename<cr>

" autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
" autocmd FileType cs nnoremap <leader>d  :OmniSharpDocumentation<cr>
" autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
" autocmd FileType cs nnoremap <Leader>b :OmniSharpBuild<cr> " BUild failed
" autocmd FileType cs nnoremap <Leader>O :OmniSharpFindImplementations<cr>
