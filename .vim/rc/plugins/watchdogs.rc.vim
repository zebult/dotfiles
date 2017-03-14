" let g:quickrun_config = get(g:, 'quickrun_config', {})
" let g:quickrun_config['watchdogs_checker/_'] = {'outputter/quickfix/open_cmd': ''}
let g:watchdogs_check_BufWritePost_enable = 0
" let g:watchdogs_check_BufWritePost_enables = {
" \   "cpp" : 0
" \}

let g:watchdogs_check_CursorHold_enable = 0
" let g:watchdogs_check_CursorHold_enables = {
" \   "cpp" : 0
" \}
nnoremap <Leader>d :WatchdogsRun<CR>
