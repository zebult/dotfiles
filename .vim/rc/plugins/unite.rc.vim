" Start insert.
call unite#custom#profile('default', 'context', {
      \   'start_insert': 1
      \ })

nnoremap <Bar><Bar> :<C-u>CHL<CR>:Unite outline<CR>
