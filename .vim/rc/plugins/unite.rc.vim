" Start insert.
call unite#custom#profile('default', 'context', {
      \   'start_insert': 1
      \ })

call unite#custom_source("file_rec", "ignore_pattern", ".meta$")

nnoremap <Bar><Bar> :<C-u>CHL<CR>:Unite outline<CR>
nnoremap so :Unite file_rec/git<CR>
