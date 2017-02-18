function! CCalendarShowMine() abort
  let g:calendar_google_calendar = 1
  let g:calendar_google_task = 1
  Calendar
endfunction
command -bar CCalendarShowMine call CCalendarShowMine()

function! CCalendarShowEmpty() abort
  let g:calendar_google_calendar = 0
  let g:calendar_google_task = 0
  Calendar
endfunction
command -bar CCalendarShowEmpty call CCalendarShowEmpty()

nnoremap <Leader>c :call CCalendarShowMine()<CR>
nnoremap <Leader>C :call CCalendarShowEmpty()<CR>

