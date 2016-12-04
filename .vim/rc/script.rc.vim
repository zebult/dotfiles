" 行末の空白削除
function! ClearEnd() abort
    silent %s/\s\+$//ge
endfunction
command -bar ClearEnd  call ClearEnd()

" 行末空白ハイライト消去
function! ClearHighlightTrailingSpaces() abort
    highlight clear TrailingSpaces
endfunction
command -bar ClearHighlightTrailingSpaces  call ClearHighlightTrailingSpaces()
