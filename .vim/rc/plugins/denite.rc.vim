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
nmap <Bslash> [denite]

nnoremap <silent> [denite]j  : <C-u>DeniteBufferDir file_rec<CR>
nnoremap <silent> [denite]tj : <C-u>DeniteBufferDir -default-action=tabopen file_rec<CR>
nnoremap <silent> [denite]vj : <C-u>DeniteBufferDir -default-action=vsplit file_rec<CR>
nnoremap <silent> [denite]sj : <C-u>DeniteBufferDir -default-action=split file_rec<CR>
nnoremap <silent> [denite]J  : <C-u>Denite file_rec<CR>
nnoremap <silent> [denite]k  : <C-u>Denite file_old<CR>
nnoremap <silent> [denite]K  : <C-u>Denite buffer<CR>: Denite -immediately file_old<CR><C-c>
nnoremap <silent> [denite]g  : <C-u>Denite -auto_preview grep<CR>
nnoremap <silent> [denite]G  : <C-u>DeniteCursorWord -auto_preview grep<CR>
nnoremap <silent> [denite]h  : <C-u>Denite help<CR>
nnoremap <silent> [denite]H  : <C-u>DeniteCursorWord help<CR>

nnoremap <silent> [denite]r  : <C-u>Denite -resume<CR>
nnoremap <silent> [denite]n  : <C-u>Denite -resume -select=+1 -immediately<CR>
nnoremap <silent> <M-n>      : <C-u>Denite -resume -select=+1 -immediately<CR><C-c>
nnoremap <silent> [denite]p  : <C-u>Denite -resume -select=-1 -immediately<CR>
nnoremap <silent> <M-p>      : <C-u>Denite -resume -select=-1 -immediately<CR><C-c>
nnoremap <silent> [denite]T  : <C-u>Denite filetype<CR>
nnoremap <silent> [denite]y  : <C-u>Denite neoyank<CR>

" nnoremap g<C-j> :Denite file_rec<CR>
" nnoremap <C-j> :DeniteBufferDir file_rec<CR>
" nnoremap <C-k> :Denite file_old<CR>
" nnoremap <C-g> :Denite -auto_preview grep<CR>
" nnoremap g<C-g> :DeniteCursorWord -auto_preview grep<CR>
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
