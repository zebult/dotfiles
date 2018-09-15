" let g:xcode_application_name = "Xcode" " 未対応
" nnoremap <silent> <Leader>R :ZXcodeRun<CR>
autocmd FileType cpp nnoremap rr :ZXcodeRun<cr>
" nnoremap <silent> <Leader>b :ZXcodeBuild<CR>
autocmd FileType cpp nnoremap <Leader>X :ZXcodeProjectOpen<cr>
" nnoremap <silent> <Leader>x :ZXcodeFileOpen<CR>
" nnoremap <silent> <Leader>Q :ZXcodeClose<CR>
" nnoremap <silent> <Leader>e :ZXcodeFocus<CR>
