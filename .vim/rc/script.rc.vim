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

function! JsonPretty() abort
    silent! %!jq '.'
endfunction
command -bar JsonPretty  call JsonPretty()

function! AutoMethodMake() abort
    normal 0wms"my$?classw"cyiwGo"mpxa {}kk0w"cPa::'sj
endfunction
command -bar AutoMethodMake  call AutoMethodMake()

" 文字出現数カウント
" function! WordCount(word) abort
"     %s/a:word//gn
" endfunction
" command -bar WordCount  call WordCount()
"
" フルパス挿入
" function! EchoPath() abort
    " silent! i<C-R>=expand('%:p')
    " execute "normal i<C-R>=expand('%:p')<CR>"
" endfunction
" command -bar EchoPath  call EchoPath()

