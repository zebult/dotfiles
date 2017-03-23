" use ag
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source('file_rec', 'matcher', ['matcher_cpsm'])
" カーソルキー, cn, cpで移動
call denite#custom#map('insert' , '<Down>' , '<denite:move_to_next_line>')
call denite#custom#map('insert' , '<Up>'   , '<denite:move_to_previous_line>')
call denite#custom#map('insert' , '<C-n>'  , '<denite:move_to_next_line>')
call denite#custom#map('insert' , '<C-p>'  , '<denite:move_to_previous_line>')
" ignore TODO
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.meta'])

nnoremap [denite] <Nop>
nmap <Bslash> [denite]

let mapping_list = [{'key': 'j', 'command': 'Denite',  'source': 'file_rec'},
      \ {'key': 'J', 'command': 'DeniteBufferDir',           'source': 'file_rec'},
      \ {'key': 'k', 'command': 'Denite',           'source': 'file_old'},
      \ {'key': 'K', 'command': 'Denite',           'source': 'Denite buffer<CR>: Denite -immediately file_old<CR><C-c>'},
      \ {'key': 'g', 'command': 'Denite',           'source': '-winheight=3 -auto_preview grep'},
      \ {'key': 'G', 'command': 'DeniteCursorWord', 'source': '-winheight=3 -auto_preview grep'}]
let options      = [{'key':  '', 'option' : '-default-action=open'},
      \ {'key': 't', 'option' : '-default-action=tabopen'},
      \ {'key': 'v', 'option' : '-default-action=vsplit'},
      \ {'key': 's', 'option' : '-default-action=split'}]

for mapping in mapping_list
  for option in options
    let prefix = 'nnoremap <silent> [denite]'
    let middle = ' :<C-u>DCLCC<CR>:'
    let suffix = '<CR>'
    let map_str = prefix . option['key'] . mapping['key'] . middle . mapping['command'] . ' ' . option['option'] . ' ' . mapping['source'] . suffix
    execute map_str
  endfor
endfor
let bar_height = 5
execute "nnoremap <silent> [denite]h :<C-u>DCLCC<CR>:Denite -winheight=".bar_height." help<CR><C-w>o"
execute "nnoremap <silent> [denite]H :<C-u>DCLCC<CR>:DeniteCursorWord -winheight=".bar_height." help<CR><C-w>o"

nnoremap <silent> [denite]r  :<C-u>DCLCC<CR>:Denite -resume<CR>
nnoremap <silent> [denite]n  :<C-u>DCLCC<CR>:Denite -resume -select=+1 -immediately<CR>
nnoremap <silent> [denite]p  :<C-u>DCLCC<CR>:Denite -resume -select=-1 -immediately<CR>
" nnoremap <silent> <M-n>      :<C-u>DCLCC<CR>:Denite -resume -select=+1 -immediately<CR>
" nnoremap <silent> <M-p>      :<C-u>DCLCC<CR>:Denite -resume -select=-1 -immediately<CR>
nnoremap <silent> [denite]T  :<C-u>DCLCC<CR>:Denite filetype<CR>
nnoremap <silent> [denite]y  :<C-u>DCLCC<CR>:Denite neoyank<CR>

nnoremap <C-j> :DCLCC<CR>:Denite file_rec<CR>
nnoremap g<C-J> :DCLCC<CR>:DeniteBufferDir file_rec<CR>
nnoremap t<C-J> :DCLCC<CR>:Denite -default-action=tabopen file_rec<CR>
nnoremap <C-k> :DCLCC<CR>:Denite file_old<CR>
nnoremap t<C-k> :DCLCC<CR>:Denite -default-action=tabopen file_old<CR>

augroup DeniteEnd
  autocmd!
  autocmd BufWinLeave * hi CursorLine cterm=NONE ctermfg=NONE ctermbg=236
  autocmd BufWinLeave * set norelativenumber
  autocmd BufWinLeave * set nocursorline
augroup END

function! DeniteCursorLineColorChange() abort
  set relativenumber
  set cursorline
  hi CursorLine ctermfg=black ctermbg=yellow
endfunction
command! -bar DCLCC  call DeniteCursorLineColorChange()
