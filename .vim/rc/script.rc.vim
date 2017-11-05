" 行末の空白削除
function! ClearEndSpace() abort
  silent %s/\s\+$//ge
endfunction
command -bar ClearEndSpace  call ClearEndSpace()

" スペース全削除
function! ClearLineSpace() range
  for linenum in range(a:firstline, a:lastline)
    let curr_line = getline(linenum)
    let repl = substitute(curr_line,' ','','g')
    call setline(".", repl)
    let curr_line = getline(linenum)
    let repl = substitute(curr_line,'　','','g')
    call setline(".", repl)
  endfor
endfunction
command! -range ClearLineSpace <line1>,<line2>call ClearLineSpace()

" 全角スペース全削除
function! ClearZenkakuSpace() abort
  silent %s/　/ /ge
endfunction
command -bar ClearZenkakuSpace  call ClearZenkakuSpace()

" 行末空白ハイライト消去
function! NoHighlightTrailingSpaces() abort
  highlight clear TrailingSpaces
endfunction
command -bar NoHighlightTrailingSpaces  call NoHighlightTrailingSpaces()

function! JsonPretty() abort
  silent! %!jq '.'
endfunction
command -bar JsonPretty  call JsonPretty()

function! JsonLine() abort
  norm! 10000J
  silent %s/\ //ge
endfunction
command -bar JsonLine call JsonLine()

function! JsonLineEscape() abort
  norm! 10000J
  silent %s/\ //ge
  silent %s/"/\\"/ge
endfunction
command -bar JsonLineEscape call JsonLineEscape()

function! XmlPretty() abort
  %s/></>\r</g | filetype indent on | setf xml | normal gg=G
endfunction
command -bar XmlPretty  call XmlPretty()


function! LogcatD(...) abort
  if a:0 >= 1
    execute "r! adb logcat -v time -d | grep ".a:1
  else
    r! adb logcat -v time -d
  end
  1d
  set filetype=logcat
  source $MYVIMRC
endfunction
command! -nargs=? LogcatD call LogcatD(<f-args>)

function! LogcatCocosDebug(...) abort
  if a:0 >= 1
    execute "r! adb logcat -v time -d | grep 'debug info' | grep ".a:1
  else
    r! adb logcat -v time -d | grep 'debug info'
  end
  1d
  set filetype=logcat
  source $MYVIMRC
endfunction
command! -nargs=? LogcatCocosDebug call LogcatCocosDebug(<f-args>)

function! AdbDumpsysAlarm() abort
  r! adb shell dumpsys alarm
  set filetype=log
  QuickhlManualAdd when=
  QuickhlManualAdd RTC_WAKEUP
  execute "normal /RTC.*"
endfunction
command -bar AdbDumpsysAlarm call AdbDumpsysAlarm()

function! AdbDumpsysAlarmTriming() abort
  normal n3jVnkdk
endfunction
command -bar AdbDumpsysAlarmTriming call AdbDumpsysAlarmTriming()

" TODO: add optionj
function! CocosRunAndroid() abort
  !cocos run -p android --android-studio -j 2
endfunction
command -bar CocosRunAndroid call CocosRunAndroid()

function! Pwd() abort
  echo expand("%:p")
endfunction
command -bar Pwd call Pwd()

function! CCCreatorLog() abort
  cd `git rev-parse --show-toplevel`
  VimShell
  norm! atail -f local/logs/project.log
  " (vimshell_enter)
endfunction
command -bar CCCreatorLog call CCCreatorLog()

function! s:qfGitDiff(...) "{{{
  let [lnum, ret] = [0, []]
  let dir = matchstr(system('git rev-parse --show-toplevel'), '\v^\f+\ze[\r\n]')

  if empty(dir) | return | endif

  for line in split(system(printf('git diff %s', a:0 ? a:1 : '')), '\v\r\n|\n|\r')
    if line[:3] ==# 'diff'
      let [lnum, fname] = [0, dir . '/' . matchstr(line, '\v\sb/\zs\f+$')]
      continue
    endif
    let char = line[0]
    if char ==# '@'
      let lnum = str2nr(matchstr(line, '\v\+\d+'))
      continue
    endif
    if lnum
      if char ==# '+'
        call add(ret, {
        \ 'filename': fname, 'type': 'i', 'lnum': lnum, 'col': 1, 'text': line})
      endif
      let lnum = stridx('-\', char) + 1 ? lnum : lnum + 1
    endif
  endfor

  call setqflist(ret, 'r')

  if len(ret)
    return 1
  endif
endfunction "}}}
command! -nargs=? QfGitDiff if s:qfGitDiff('<args>') | copen | endif

function! DeinRefresh() abort
   call dein#clear_state()
   call dein#recache_runtimepath()
endfunction
command -bar DeinRefresh call DeinRefresh()

function! CursorLineColorHighlight() abort
  set cursorline
  hi CursorLine ctermfg=black ctermbg=yellow
endfunction
command! -bar CHL call CursorLineColorHighlight()

function! CursorLineColorMiddlelight() abort
  set cursorline
  set cursorcolumn
  hi CursorLine cterm=NONE ctermbg=232
  hi CursorColumn ctermbg=232
  hi Cursor ctermbg=lightgreen
endfunction
command! -bar CML call CursorLineColorMiddlelight()

function! CursorLineColorLowlight() abort
  set cursorline
  set cursorcolumn
  hi CursorLine cterm=NONE ctermbg=235
  hi CursorColumn ctermbg=235
  hi Cursor ctermbg=lightgreen
endfunction
command! -bar CLL call CursorLineColorLowlight()
noremap <Plug>(cursor-line-color-lowlight) :<C-u>call CursorLineColorLowlight()<CR>

function! VmailInit() abort
  set relativenumber
  CHL
endfunction
command! -bar VmailInit call VmailInit()

function! LogcatSearchError() abort
  norm! /FATAL EXCEPTION: main
endfunction
command! -bar LogcatSearchError call LogcatSearchError()

function! MacvimOpen() abort
  !open %:p
endfunction
command! -bar MacvimOpen call MacvimOpen()

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
command! -bar SynStack call SynStack()

function! QuickFixNext() abort
  if (len(getqflist()) <= 1)
    lopen
    normal 
  else
    lnext
  endif
endfunction
command! -bar QuickFixNext call QuickFixNext()

function! QuickFixPrev() abort
  if (len(getqflist()) <= 1)
    lopen
    normal 
  else
    lprev
  endif
endfunction
command! -bar QuickFixPrev call QuickFixPrev()

" 文字数カウント
function! CountWord() abort
  %s/./&/g
endfunction
command -bar CountWord  call CountWord()

" 重複チェック
function! Uniq() abort
  r!uniq -c %
  /   2
endfunction
command! -bar Uniq call Uniq()

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

" 可変長引数
" command! -nargs=* ZXcodeProjectOpen call zxcode#open_xcode(<f-args>)
" function! zxcode#open_xcode(...) abort
" let a:count = get(a:, 1)

function! PlayGround() abort
  " let ps = system('ps')
  " if match(ps, 'gtags.*-v') != -1
  "   echo 'exist'
  " else
  "   echo 'none'
  " endif
  " tagbar#TagbarShowTag()
  " tagbar#
endfunction
command! -bar PlayGround call PlayGround()

