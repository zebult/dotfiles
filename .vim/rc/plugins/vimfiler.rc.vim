let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0

function! UniteFileCurrentDir()
  let s  = ':Unite file -start-insert -path='
  let s .= vimfiler#helper#_get_file_directory()

  execute s
endfunction

autocmd FileType vimfiler
      \ nnoremap <buffer><silent>/
      \ :Denite file_rec<CR>

      " \ :call UniteFileCurrentDir() <CR>
