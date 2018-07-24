" Quickrun
let g:quickrun_config = {
\   '_' : {
\       'outputter/buffer/running_mark' : 'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\       'hook/close_quickfix/enable_hook_loaded' : 1,
\       'hook/close_quickfix/enable_success' : 1,
\       'hook/close_buffer/enable_failure' : 1,
\       'hook/close_buffer/enable_empty_data' : 1,
\       'outputter' : 'multi:buffer:quickfix',
\       'hook/inu/enable' : 1,
\       'hook/inu/wait' : 2,
\       'outputter/buffer/split' : ':botright 8sp',
\       'runner' : 'vimproc',
\       'runner/vimproc/updatetime' : 40,
\   }
\}

let g:quickrun_config['cs'] = {
			\ 'type'  : 'cs/mcs',
            \ 'exec': ['%c /reference:System.Net.Http.dll %o -out:%s:p:r.exe %s', 'mono %s:p:r.exe %a'],
            \ 'command': 'mcs',
			\ }
            " \ 'exec': ['%c /reference:System.Net.Http.dll %o -out:%s:p:r.exe %s', 'mono %s:p:r.exe %a'],
            " \ 'exec': ['%c /reference:System.Net.Http.dll /reference:Newtonsoft.Json.11.0.2/lib/net45/Newtonsoft.Json.dll %o -out:%s:p:r.exe %s', 'mono %s:p:r.exe %a'],

" c++11
let g:quickrun_config['cpp'] = {
\   'command': 'g++',
\   'cmdopt': '-std=c++11'
\ }

let g:quickrun_config['python'] = {
\   'command': 'python2'
\ }

let g:quickrun_config['javascript'] = {
\   "javascript/watchdogs_checker" : {
\     "type" : "eslint"
\   }
\ }

" tex
let g:quickrun_config['tex'] = {
    \ 'command' : 'latexmk',
    \ 'outputter' : 'error',
    \ 'outputter/error/success' : 'buffer',
    \ 'outputter/error/error' : 'quickfix',
    \ 'srcfile' : expand("%"),
    \ 'cmdopt': '-pdfdvi',
    \ 'hook/sweep/files' : [
        \ '%S:p:r.aux',
    \ '%S:p:r.bbl',
    \ '%S:p:r.blg',
    \ '%S:p:r.dvi',
    \ '%S:p:r.fdb_latexmk',
    \ '%S:p:r.fls',
    \ '%S:p:r.log',
    \ '%S:p:r.out',
    \ '%S:p:r.synctex.gz',
    \ ],
    \ 'exec': ['%c %o %a %s']
        \ }

" show success event
let g:quickrun_config["watchdogs_checker/_"] = {
  \ 'hook/qfstatusline_update/enable_exit': 1,
  \ 'hook/qfstatusline_update/priority_exit': 4,
  \ 'hook/qfsigns_update/enable_exit':   1,
  \ 'hook/qfsigns_update/priority_exit': 3,
  \ 'hook/echo/enable' : 1,
  \ 'hook/close_quickfix/enable_exit' : 1,
  \ 'hook/echo/output_success': '> No Errors Found.'
  \ }

nnoremap <silent> <Leader>r :QuickRun -mode n<CR>
vnoremap <silent> <Leader>r :QuickRun -mode v<CR>
" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

