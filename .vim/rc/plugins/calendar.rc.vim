let g:calendar_views = ['year', 'month', 'week', 'day_4', 'day', 'clock']
let g:show_calendar = 0

let g:calendar_google_calendar = 1
"E event
"T task
"t today move
"> change view

" nnoremap <Leader>c :call CalendarGoogle()<CR>
" nnoremap <Leader>c :call CalendarEmpty()<CR>
" nnoremap <Leader>C :call CalendarEmpty()<CR>
" nnoremap <Leader>W :call CalenderWeek()<CR>

function! Cal() abort
  call CalendarGoogle()
endfunction
command -bar Cal call Cal()

function! CalE() abort
  call CalendarEmpty()
endfunction
command -bar CalE call CalE()

function! CalendarEmpty() abort
  let g:calendar_google_calendar = 0
  let g:calendar_google_task = 0
  Calendar -view=month
endfunction
command -bar CalendarEmpty call CalendarEmpty()

function! CalendarGoogle() abort
  let g:calendar_google_calendar = 1
  " let g:calendar_google_task = 1
  Calendar
endfunction
command -bar CalendarGoogle call CalendarGoogle()

function! CalendarSide() abort
  let g:calendar_google_calendar = 1
  " let g:calendar_google_task = 1
  Calendar -view=day -split=vertical -width=40
endfunction
command -bar CalendarSide call CalendarSide()

function! CalenderToday() abort
  let g:calendar_google_calendar = 1
  " let g:calendar_google_task = 1
  Calendar -view=day
endfunction
command -bar CalenderToday call CalenderToday()

function! CalenderWeek() abort
  let g:calendar_google_calendar = 1
  " let g:calendar_google_task = 1
  Calendar -view=week
endfunction
command -bar CalenderWeek call CalenderWeek()
