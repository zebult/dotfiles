let g:calendar_views = ['year', 'month', 'week', 'day_4', 'day', 'clock']
let g:show_calendar = 0

" nnoremap <Leader>c :call CTodo()<CR>
nnoremap <Leader>c :call CCalendarShowMine()<CR>
nnoremap <Leader>C :call CCalendarShowEmpty()<CR>
nnoremap <Leader>CC :call CCalendarShowMine()<CR>
nnoremap <Leader>Cc :call CCalendarShowEmpty()<CR>

function! CCalendarShowMine() abort
  let g:calendar_google_calendar = 1
  let g:calendar_google_task = 1
  Calendar
endfunction
command -bar CCalendarShowMine call CCalendarShowMine()

function! CTodo() abort
  let g:calendar_google_calendar = 1
  let g:calendar_google_task = 1
  Calendar -view=day -split=vertical -width=40
endfunction
command -bar CTodo call CTodo()

function! Cal() abort
  let g:calendar_google_calendar = 1
  let g:calendar_google_task = 1
  Calendar -view=day
endfunction
command -bar Cal call Cal()

function! CCalendarShowEmpty() abort
  let g:calendar_google_calendar = 0
  let g:calendar_google_task = 0
  Calendar -view=month
endfunction
command -bar CCalendarShowEmpty call CCalendarShowEmpty()
