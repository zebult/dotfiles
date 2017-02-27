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
  normal 0wms"my$gg/classw"cyiwGo"mpxa {}kk0w"cPa::'sj
endfunction
command -bar AutoMethodMake  call AutoMethodMake()

function! Logcat() abort
  r! adb logcat -v time -d
  1d
  source $MYVIMRC
endfunction
command -bar Logcat  call Logcat()

function! LogcatCocosDubug() abort
  r! adb logcat -v time -d | grep 'debug info'
endfunction
command -bar LogcatCocosDubug call LogcatCocosDubug()

" TODO: add optionj
function! CocosRunAndroid() abort
  !cocos run -p android --android-studio -j 2
endfunction
command -bar CocosRunAndroid call CocosRunAndroid()

function! Pwd() abort
  echo expand("%:p")
endfunction
command -bar Pwd call Pwd()

function! Lo() abort
  VimShell
  " less -f projectj.log
endfunction
command -bar Lo call Lo()
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

