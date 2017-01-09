" use ag
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'default_opts',
      \ ['--nocolor', '--nogroup'])

call denite#custom#source('file_rec', 'matcher', ['matcher_cpsm'])
call denite#custom#map('insert' , "<Down>" , '<denite:move_to_next_line>')
call denite#custom#map('insert' , "<Up>"   , '<denite:move_to_prev_line>')
" 以下変更不可になった感じがする
" call denite#custom#map('insert' , "<C-n>"  , '<denite:move_to_next_line>')
" call denite#custom#map('insert' , "<C-p>"  , '<denite:move_to_prev_line>')

nnoremap <C-j> :DeniteCursorLineColorChange<Cr>:Denite file_rec<Cr>
nnoremap <C-g> :Denite grep<Cr>
" <C-h> は <BS> と同じ
nnoremap <BS> :Denite file_mru<Cr>
" nnoremap <C-y> :Denite neoyank<Cr>
" カーソル位置の単語をgrep検索
nnoremap <silent> <Leader>* :<C-u>Denite grep<Cr><C-r><C-w><Cr>

" Denite抜ける際、カーソルラインをデフォルトに戻す
autocmd BufWinLeave * hi CursorLine cterm=NONE ctermfg=NONE

function! DeniteCursorLineColorChange() abort
    hi CursorLine ctermfg=black ctermbg=yellow
endfunction
command! -bar DeniteCursorLineColorChange  call DeniteCursorLineColorChange()

" autocmd CmdwinEnter * hi CursorLine term=bold cterm=NONE ctermfg=NONE ctermbg=28
" autocmd CmdwinLeave * hi CursorLine term=bold cterm=NONE ctermfg=NONE ctermbg=238

