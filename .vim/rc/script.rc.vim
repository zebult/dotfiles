" 行末の空白削除
function! ClearEnd() abort
    silent %s/\s\+$//ge
endfunction
command -bar ClearEnd  call ClearEnd()

" スペース全削除
function! ClearSpace() range
    for linenum in range(a:firstline, a:lastline)
        let curr_line = getline(linenum)
        let repl = substitute(curr_line,' ','','g')
        call setline(".", repl)
        let curr_line = getline(linenum)
        let repl = substitute(curr_line,'　','','g')
        call setline(".", repl)
    endfor
endfunction
command! -range ClearSpace <line1>,<line2>call ClearSpace()

" 行末空白ハイライト消去
function! NoHighlightTrailingSpaces() abort
    highlight clear TrailingSpaces
endfunction
command -bar NoHighlightTrailingSpaces  call NoHighlightTrailingSpaces()

function! JsonPretty() abort
    silent! %!jq '.'
endfunction
command -bar JsonPretty  call JsonPretty()

function! AutoMethodMake() abort
    normal 0wms"my$?classw"cyiwGo"mpxa {}kk0w"cPa::'sj
endfunction
command -bar AutoMethodMake  call AutoMethodMake()

function! DeniteClassesDir() abort
    echo "ouch"
endfunction
command -bar DeniteClassesDir  call DeniteClassesDir()

function! Logcat() abort
    :r! adb logcat -v time -d
endfunction
command -bar Logcat  call Logcat()

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

