" use ag
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source('file_rec', 'matcher', ['matcher_cpsm'])
" call denite#custom#var('grep', 'command', ['ag'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'final_opts', [])
" call denite#custom#var('grep', 'separator', [])
" call denite#custom#var('grep', 'default_opts',
"       \ ['--nocolor', '--nogroup'])
" カーソルキー, cn, cpで移動
call denite#custom#map('insert' , "<Down>" , '<denite:move_to_next_line>')
call denite#custom#map('insert' , "<Up>"   , '<denite:move_to_previous_line>')
call denite#custom#map('insert' , "<C-n>"  , '<denite:move_to_next_line>')
call denite#custom#map('insert' , "<C-p>"  , '<denite:move_to_previous_line>')

nnoremap [denite] <Nop>
nmap <C-m> [denite]

nnoremap [denite]l :Denite 
nnoremap <Bar> :Denite 
" nnoremap [denite]j :Denite file_rec<CR>
" nnoremap [denite]k :Denite file_old<CR>
" nnoremap [denite]g :Denite -auto_preview grep<CR>
" nnoremap [denite]G :DeniteCursorWord -auto_preview grep<CR>
" nnoremap <silent> [denite]g :<C-u>Denite grep -auto_preview<CR>
nnoremap <silent> [denite]r :<C-u>Denite -resume<CR>
nnoremap <silent> [denite]n :<C-u>Denite -resume -select=+1 -immediately<CR>
nnoremap <silent> [denite]p :<C-u>Denite -resume -select=-1 -immediately<CR>
nnoremap <C-j> :Denite file_rec<CR>
nnoremap <C-k> :Denite file_old<CR>
nnoremap Y :Denite neoyank<CR>
nnoremap <C-g> :Denite -auto_preview grep<CR>
nnoremap g<C-g> :DeniteCursorWord -auto_preview grep<CR>
" <C-h> は <BS> と同じ
" nnoremap <BS> :Denite file_mru<Cr>
" nnoremap <C-y> :Denite neoyank<Cr>

" nnoremap <C-j> :DeniteCursorLineColorChange<Cr>:Denite file_rec<Cr>
" Denite入る際、カーソルラインを見やすくする
" autocmd BufWinEnter * hi CursorLine ctermfg=black ctermbg=yellow
" Denite抜ける際、カーソルラインをデフォルトに戻す
" autocmd BufWinLeave * hi CursorLine cterm=NONE ctermfg=NONE

" function! DeniteCursorLineColorChange() abort
"     hi CursorLine ctermfg=black ctermbg=yellow
" endfunction
" command! -bar DeniteCursorLineColorChange  call DeniteCursorLineColorChange()
