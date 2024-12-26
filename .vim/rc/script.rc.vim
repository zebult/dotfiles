let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
let wday = strftime("%w")
let content = " |
      \===========================
      \04:00-05:00    | 起床〜4:30
      \05:00-06:00    | 準備
      \06:00-07:00    | MS
      \07:00-08:00    | MS
      \08:00-09:00    | 
      \09:00-10:00    | 
      \10:00-11:00    | 
      \11:00-12:00    | 
      \12:00-13:00    | 
      \13:00-14:00    | sleep
      \14:00-15:00    | 
      \15:00-16:00    | 
      \16:00-17:00    | 
      \17:00-18:00    | 
      \18:00-19:00    | 
      \19:00-20:00    | 
      \20:00-21:00    | 
      \21:00-22:00    | 
      \22:00-23:00    | 
      \23:00-24:00    | 
      \00:00-01:00    | 
      \01:00-02:00    | 風呂、sleep1:15〜
      \02:00-03:00    | sleep
      \03:00-04:00    | sleep
      \==========================="
inoremap <expr> ,dw strftime('%Y-%m-%d ').weeks[wday].content

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

" 空行削除
function! ClearEmptyLine() abort
  silent v/./d
endfunction
command -bar ClearEmptyLine  call ClearEmptyLine()

" 行末空白ハイライト消去
function! NoHighlightTrailingSpaces() abort
  highlight clear TrailingSpaces
endfunction
command -bar NoHighlightTrailingSpaces  call NoHighlightTrailingSpaces()

function! SubMark() abort
  norm mz
  silent %s/ ?/?/ge
  silent %s/ !/!/ge
  silent %s/ \././ge
  silent %s/=\./= ./ge
  silent %s/\*s/* s/ge
  silent %s/\* \//*\//ge
  norm 'z
endfunction
command -bar SubMark  call SubMark()

function! JsonPretty() abort
  norm <silent> mz
  silent! %!jq '.'
  norm <silent> 'z
endfunction
command -bar JsonPretty  call JsonPretty()

function! JsonLine() abort
  norm! 100000J
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
  " %s/></>\r</g | filetype indent on | setf xml | normal gg=G
  %!xmllint --format -
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

function! UnityLog() abort
  " Platform dependent. See https://docs.unity3d.com/Manual/LogFiles.html
  let logfile = '~/Library/Logs/Unity/Editor.log'
  " Project dependent.
  let g:project_root = '/Users/a14198/Documents/workspace/Goodroid/beast'

  if !isdirectory(g:project_root .'/Assets')
      echoerr "project_root should be the root of your Unity project"
      return
  endif
  let logfile = fnamemodify(logfile, ":p")
  " Unity logs can be massive (GBs) when you have spam, so only take the last chunk.
  exec '!tail -n 5000 '. logfile .'> /tmp/shortened.log'
  exec 'cd '. g:project_root
  compiler cs
  cgetfile /tmp/shortened.log
  copen
endfunction
command! -bar UnityLog call UnityLog()

" function! MemoDiary() abort
"   execute 'lcd ~/Dropbox/Saichi/Diary'
"   execute 'CHADopen'
" endfunction
" command! -bar MemoDiary call MemoDiary()

" function! Memo() abort
"   execute 'lcd ~/Dropbox/Saichi/memo'
"   execute 'CHADopen'
" endfunction
" command! -bar Memo call Memo()
" nnoremap mm :Memo<CR>

function! Integrate () abort
  execute 'lcd ~/Dropbox/Saichi/memo'
  execute 'e memo.md'
  execute 'tabe comp.md'
  execute 'tabe book.md'
  execute 'tabe chat.md'
  norm sn
endfunction
command! -bar Integrate call Integrate()

function! Schedule() abort
  execute 'lcd ~/Dropbox/Saichi/memo'
  execute 'e schedule.md'
endfunction
command! -bar Schedule call Schedule()

function! Memo() abort
  execute 'lcd ~/Dropbox/Saichi/memo'
  execute 'e memo.md'
endfunction
command! -bar Memo call Memo()

function! Chat() abort
  execute 'lcd ~/Dropbox/Saichi/memo'
  execute 'e chat.md'
endfunction
command! -bar Chat call Chat()

function! Crm() abort
  execute 'lcd ~/Dropbox/Saichi/memo/code'
  execute 'e mCrm.md'
endfunction
command! -bar Crm call Crm()

function! MemoToday() abort
  " TODO Dl, Dh で日付前後してメモ開く
  let file_name = expand("%")
  let today = localtime()
  let now = localtime()
  "# => 1203574847
  let day = (60 * 60 * 24)
  echo strftime("%Y/%m/%d %H:%M:%S (%A)", now - day)
  "# => 2008/02/20 15:20:47 (水曜日)
  let memo_path     = "~/Dropbox/Saichi/Diary/".strftime("%Y/%m/%d", ).".md"
  execute 'e '.memo_path
endfunction
command! -bar MemoToday call MemoToday()

function! MemoDone() abort
  execute 'vs ~/Dropbox/Saichi/done.md'
endfunction
command! -bar MemoDone call MemoDone()

function! SplitPanel() abort
  if IsNewBuffer()
    new
    norm J
  else
    new
    " sp
    " norm j
  endif
endfunction
command! -bar SplitPanel call SplitPanel()

function! VSplitPanel() abort
  if IsNewBuffer()
    vert new
    norm L
  else
    " vs
    " norm l
    vert new
    norm L
  endif
endfunction
command! -bar VSplitPanel call VSplitPanel()

function! IsNewBuffer() abort
  let file_name = expand("%")

  if file_name == ""
    return 1
  endif

  return 0
endfunction

function! s:SnippetOpen()
  let ft = &filetype
  echo ft
  let file =  "$HOME/.vim/snippets/".ft.".snip"
  execute "vs ".file
endfunction
command! SnippetOpen call s:SnippetOpen()

function! ByteToKiloByte()
  norm "zdiw
  let byte = @z
  let kiloByte = byte / 1024
  let @z=kiloByte
  norm "zPaKB
endfunction
command! ByteToKiloByte call ByteToKiloByte()

function! NextStep()
  if len(getqflist()) == 0
    bn
    Lsh
  else
    silent cn
    CML
    norm *Nzz
  endif
endfunction
command! NextStep call NextStep()

function! PrevStep()
  if len(getqflist()) == 0
    bp
    Lsh
  else
    silent cp
    CML
    norm *Nzz
  endif
endfunction
command! PrevStep call PrevStep()

function! Lsh()
  let ls = execute(":ls")
  let isFirst = 1

  for line in split(ls,'\n')
    if isFirst
      let isFirst = 0
      echo "\n"
    endif

    let isMainBuffer = stridx(line, "%") != -1
    if isMainBuffer
      echohl WarningMsg | echo line | echohl None
    else
      echo line
    endif
  endfor
endfunction
command! Lsh call Lsh()

ca <silent> ls Lsh

function! LogSearch()
  " norm /\c.*\<\(FATAL\|ERROR\|ERRORS\|FAIL\|FAILED\|FAILURE\).*
   " \c.*\<\(FATAL\|ERROR\|ERRORS\|FAIL\|FAILED\|FAILURE\).*
endfunction
command! LogSearch call LogSearch()

function! LogOnly()
  v/\c.*\<\(FATAL\|ERROR\|ERRORS\|FAIL\|FAILED\|FAILURE\).*/d
endfunction
command! LogOnly call LogOnly()

function! Google()
  W3m google 
endfunction
command! Google call Google()

function! Kosu()
  norm g0ysvPsvP
  g/d/d
  norm sh
  g/h/d
endfunction
command! Kosu call Kosu()

function! SumRegi()
    echo sumit#count_selected_text()
    " let result = sumit#count_selected_text()
    " execute ":normal a " . result
endfunction
command! SumRegi call SumRegi()

function! SuperWrite()
    let bufname = expand("%:p")

    if bufname != ""
      execute ":w"
      return
    endif

    " let filename = strftime("%Y_%m%d_%H%M_%S")
    let filename = strftime("%Y%m%d%H%M%S")
    let title = getline(1)
    let title = substitute(title, '# ', '', 'g')
    let title = substitute(title, '#', '', 'g')
    let title = substitute(title, ' ', '_', 'g')
    let title = substitute(title, '/', '_', 'g')

    execute ":w ~/Dropbox/Saichi/memo/daily/old/2024/".filename."_".title.".md"
    execute ":lcd ~/Dropbox/Saichi/memo/daily"
endfunction
command! SuperWrite call SuperWrite()

function! UltraWrite()
    call SuperWrite()
    let file_name = expand("%:t")
    echo file_name
    echo ":e /Users/saichi/Dropbox/Saichi/memo/daily/".file_name
    execute ":!mv %:p /Users/saichi/Dropbox/Saichi/memo/daily/"
    execute ":e /Users/saichi/Dropbox/Saichi/memo/daily/".file_name
endfunction
command! UltraWrite call UltraWrite()

" function! VafToggle()
"     let is_vaffle = stridx(expand('%s'), "vaffle") == 0
"     if is_vaffle == 1
"       normal q
"     else
"       execute ":Vaffle"
"     endif
" endfunction
" command! VafToggle call VafToggle()

set autochdir

function! NextFileOpen()
    let filename = expand("%:t")
    let filelist = systemlist("ls")
    let matchnum = match(filelist, filename)
    let nextnum = matchnum + 1

    if nextnum >= len(filelist)
      let nextnum = 0
      echo "ファイル末尾に到達しました"
    endif

    let nextfile = filelist[nextnum]
    execute ":e ".nextfile
endfunction
command! NextFileOpen call NextFileOpen()

function! PrevFileOpen()
    let filename = expand("%:t")
    let filelist = systemlist("ls")
    let matchnum = match(filelist, filename)
    let nextnum = matchnum - 1

    if nextnum == -1
      let nextnum = len(filelist) - 1
      echo "ファイル先頭に到達しました"
    endif

    let nextfile = filelist[nextnum]
    execute ":e ".nextfile
endfunction
command! PrevFileOpen call PrevFileOpen()

function! Week () abort
  execute 'lcd ~/Dropbox/Saichi/memo/weekly'
  execute 'e sun.md'
  syntax match warningword /^\.$/
  execute 'vsplit sat.md'
  syntax match warningword /^\.$/
  execute 'vsplit fri.md'
  syntax match warningword /^\.$/
  execute 'vsplit thu.md'
  syntax match warningword /^\.$/
  execute 'vsplit wed.md'
  syntax match warningword /^\.$/
  execute 'vsplit tue.md'
  syntax match warningword /^\.$/
  execute 'vsplit mon.md'
  syntax match warningword /^\.$/

  " move column
  let week = strftime("%w")
  if week == 0
    let week = 7
  endi
  if week != 1
    execute "normal " . (week - 1) . "sl"
  endif

  " move line
  let hour = strftime("%H")
  execute "normal gg" . hour . "jk"

  execute "HighLightWord"
  syntax match highlightword /^\.$/

endfunction
command! -bar Week call Week()

function! HighLightWord () abort
  let lineword = getline('.')
  execute "syntax keyword highlightword " . lineword
  highlight link highlightword Error
  highlight Ignore guibg=#ffff00
  highlight link warningword Ignore

endfunction
command! -bar HighLightWord call HighLightWord()

if has("gui_running")
  nnoremap mm :HighLightWord<CR>
end

set foldtext=FoldText()

function! FoldText()
  let l:fs = match(getline(v:foldstart, v:foldend), '"label":')
  if l:fs < 0
    let list = split(foldtext(),' ')
    " return list[0].list[1].list[2].list[3].list[4].list[5].list[-1]
    " return list[4].list[-1]
    " return list[4].list[-1]
    return foldtext()
  endif
  let l:label = matchstr(getline(v:foldstart + l:fs),
        \ '"label":\s\+"\zs[^"]\+\ze"')
  let l:ft = substitute(foldtext(), ': \zs.\+', l:label, '')
  return l:ft
endfunction

" カーソル下のhighlight情報を表示する {{{
function! s:get_syn_id(transparent)
    let synid = synID(line('.'), 5, 1)
    return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
    return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
    execute "highlight " . s:get_syn_name(s:get_syn_id(0))
    execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()

" function! IsXamarin()
"   return stridx(expand("%:p"), "Xamarin") != -1
" endfunction

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

" function! PlayGround() abort
"   " let ps = system('ps')
"   " if match(ps, 'gtags.*-v') != -1
"   "   echo 'exist'
"   " else
"   "   echo 'none'
"   " endif
"   " tagbar#TagbarShowTag()
"   " tagbar#
" endfunction
" command! -bar PlayGround call PlayGround()
