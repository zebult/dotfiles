" Quickrun
" let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config = {
\   '_' : {
\       "hook/close_quickfix/enable_hook_loaded" : 1,
\       "hook/close_quickfix/enable_success" : 1,
\       "hook/close_buffer/enable_failure" : 1,
\       "hook/close_buffer/enable_empty_data" : 1,
\       "outputter" : "multi:buffer:quickfix",
\       'hook/inu/enable' : 1,
\       'hook/inu/wait' : 10,
\       'outputter/buffer/split' : ':botright 8sp',
\       'runner' : 'vimproc',
\       'runner/vimproc/updatetime' : 40,
\   }
\}

" \       'outputter' : 'error',
" \       'outputter/error/success' : 'buffer',
" \       'outputter/error/error'   : 'quickfix',
"use c++11
let g:quickrun_config.cpp = {
\   'command': 'g++',
\   'cmdopt': '-std=c++11'
\ }

" texファイルをQuickRunでコンパイルする際の設定
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
  \ "hook/echo/enable" : 1,
  \ "hook/echo/output_success": "> No Errors Found."
  \ }

nnoremap <Leader>r :QuickRun<CR> " TODO: 数秒後できたら(:HierUpdate<CR> )
" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

