let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0
" VimFilerCurrentDir
nnoremap <Leader>f :VimFilerBufferDir -split -simple -winwidth=40 -no-quit<CR>
nnoremap <Leader>F :VimFiler -simple -no-quit<CR>

function! UniteFileCurrentDir()
  let s  = ':Unite file -start-insert -path='
  let s .= vimfiler#helper#_get_file_directory()
  execute s
endfunction

" autocmd FileType vimfiler
"       \ nnoremap <buffer><silent>/
"       \ :DeniteBufferDir file_rec<CR>

      " \ :call UniteFileCurrentDir() <CR>
