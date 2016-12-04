" 行末の空白削除
function! ClearEnd() abort
    silent %s/\s\+$//ge
endfunction
