" Quickrun
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
    \ 'runner'    : 'vimproc',
    \ 'runner/vimproc/updatetime' : 60,
    \ 'outputter' : 'error',
    \ 'outputter/error/success' : 'buffer',
    \ 'outputter/error/error'   : 'quickfix',
    \ 'outputter/buffer/split'  : ':rightbelow 5sp',
    \ 'outputter/buffer/close_on_empty' : 1,
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

" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

