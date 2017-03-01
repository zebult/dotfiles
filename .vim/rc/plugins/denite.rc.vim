" use ag
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source('file_rec', 'matcher', ['matcher_cpsm'])
" カーソルキー, cn, cpで移動
call denite#custom#map('insert' , "<Down>" , '<denite:move_to_next_line>')
call denite#custom#map('insert' , "<Up>"   , '<denite:move_to_previous_line>')
call denite#custom#map('insert' , "<C-n>"  , '<denite:move_to_next_line>')
call denite#custom#map('insert' , "<C-p>"  , '<denite:move_to_previous_line>')

nnoremap [denite] <Nop>
nmap <Bslash> [denite]

let mapping_list = [{'key': 'j', 'command': 'DeniteBufferDir',  'source': 'file_rec'},
                  \ {'key': 'J', 'command': 'Denite',           'source': 'file_rec'},
                  \ {'key': 'k', 'command': 'Denite',           'source': 'file_old'},
                  \ {'key': 'K', 'command': 'Denite',           'source': 'Denite buffer<CR>: Denite -immediately file_old<CR><C-c>'},
                  \ {'key': 'g', 'command': 'Denite',           'source': '-auto_preview grep'},
                  \ {'key': 'G', 'command': 'DeniteCursorWord', 'source': '-auto_preview grep'}]
let options      = [{'key':  '', 'option' : '-default-action=tabopen'},
                  \ {'key': 'c', 'option' : '-default-action=open'},
                  \ {'key': 'v', 'option' : '-default-action=vsplit'},
                  \ {'key': 's', 'option' : '-default-action=split'}]

for mapping in mapping_list
  for option in options
    let prefix = 'nnoremap <silent> [denite]'
    let middle = ' : <C-u>'
    let suffix = '<CR>'
    let map_str = prefix . option['key'] . mapping['key'] . middle . mapping['command'] . ' ' . option['option'] . ' ' . mapping['source'] . suffix
    execute map_str
  endfor
endfor

nnoremap <silent> [denite]h  :<C-u>Denite help<CR>
nnoremap <silent> [denite]H  :<C-u>DeniteCursorWord help<CR>

nnoremap <silent> [denite]r  :<C-u>Denite -resume<CR>
nnoremap <silent> [denite]n  :<C-u>Denite -resume -select=+1 -immediately<CR>
nnoremap <silent> [denite]p  :<C-u>Denite -resume -select=-1 -immediately<CR>
nnoremap <silent> <M-n>      :<C-u>Denite -resume -select=+1 -immediately<CR>
nnoremap <silent> <M-p>      :<C-u>Denite -resume -select=-1 -immediately<CR>
nnoremap <silent> [denite]T  :<C-u>Denite filetype<CR>
nnoremap <silent> [denite]y  :<C-u>Denite neoyank<CR>

nnoremap <C-j> :DeniteBufferDir file_rec<CR>
nnoremap <C-k> :Denite file_old<CR>
" nnoremap g<C-j> :Denite file_rec<CR>
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
