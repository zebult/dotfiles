" use ag
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'default_opts',
      \ ['--nocolor', '--nogroup'])

call denite#custom#source('file_rec', 'matcher', ['matcher_cpsm'])
call denite#custom#map('insert', "<Down>", 'move_to_next_line')
call denite#custom#map('insert', "<Up>", 'move_to_prev_line')
call denite#custom#map('insert', "<C-n>", 'move_to_next_line')
call denite#custom#map('insert', "<C-p>", 'move_to_prev_line')

nnoremap <C-j> :Denite file_rec<Cr>
nnoremap <C-g> :Denite grep<Cr>
nnoremap <BS> :Denite file_mru<Cr>
nnoremap <C-y> :Denite neoyank<Cr>
" カーソル位置の単語をgrep検索
nnoremap <silent> <Leader>* :<C-u>Denite grep:. -buffer-name=search-buffer<Cr><C-r><C-w><Cr>
