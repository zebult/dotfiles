" Vim で swift の設定

" filetype=swift が設定された時に呼ばれる関数
function! s:swift()

endfunction


augroup vimrc-swift
    autocmd!
    " filetype=swift が設定された場合に関数を呼ぶ
    autocmd FileType swift call s:swift()
    nnoremap <leader>r :! make<CR>
augroup END
" ライブラリパス設定
" augroup swift_path
    " autocmd!
    " autocmd FileType swift setlocal path+=.,/usr/include,/usr/local/include
" augroup END
