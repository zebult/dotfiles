nnoremap [denite] <Nop>
nmap <Bslash> [denite]

let mapping_list = [
      \ {'key': 'j', 'command': 'Denite',  'source': 'file_rec'},
      \ {'key': 'J', 'command': 'DeniteBufferDir',           'source': 'file_rec'},
      \ {'key': 'k', 'command': 'Denite',           'source': 'file_old'},
      \ {'key': 'K', 'command': 'Denite',           'source': 'Denite buffer<CR>: Denite -immediately file_old<CR><C-c>'},
      \ {'key': 'g', 'command': 'Denite',           'source': '-winheight=3 -auto_preview grep'},
      \ {'key': 'G', 'command': 'DeniteCursorWord', 'source': '-winheight=3 -auto_preview grep'}
      \ ]
let options      = [
      \ {'key':  '', 'option' : '-default-action=open'}
      \ ]
      " \ {'key': 't', 'option' : '-default-action=tabopen'},
      " \ {'key': 'v', 'option' : '-default-action=vsplit'},
      " \ {'key': 's', 'option' : '-default-action=split'}

for mapping in mapping_list
  for option in options
    let prefix = 'nnoremap <silent> [denite]'
    " let middle = ' :<C-u>CHL<CR>:'
    let middle = ' :<C-u>'
    let dhighlight = '-highlight-mode-insert=Search'
    let suffix = '<CR>'
    let map_str = prefix . option['key'] . mapping['key'] . middle . mapping['command'] . ' ' . option['option'] . ' ' . dhighlight . ' ' . mapping['source'] . suffix
    execute map_str
  endfor
endfor

nnoremap <silent> [denite]k :<C-u>Denite -highlight-mode-insert=Search file_old<CR>

" New
nnoremap <silent> [denite]b :<C-u>Denite -default-action=open -highlight-mode-insert=Search file_rec<CR>
nnoremap <silent> [denite]t :<C-u>Denite -default-action=tabopen -highlight-mode-insert=Search file_rec<CR>
nnoremap <silent> [denite]v :<C-u>Denite -default-action=vsplit -highlight-mode-insert=Search file_rec<CR>
nnoremap <silent> [denite]s :<C-u>Denite -default-action=split -highlight-mode-insert=Search file_rec<CR>

" Show
nnoremap <silent> [denite]B :<C-u>Denite buffer -highlight-mode-insert=Search file_old<CR>
nnoremap <silent> [denite]f :<C-u>Denite buffer -highlight-mode-insert=Search file_old<CR>
nnoremap <silent> [denite]T :<C-u>Unite tab<CR>

nnoremap <silent> [denite]ct :<C-u>DeniteBufferDir -default-action=tabopen -highlight-mode-insert=Search file_rec<CR>

nnoremap <silent> [denite]r  :<C-u>Denite -resume -highlight-mode-insert=Search<CR>
nnoremap <silent> [denite]n  :<C-u>Denite -resume -select=+1 -immediately -highlight-mode-insert=Search<CR>
nnoremap <silent> [denite]p  :<C-u>Denite -resume -select=-1 -immediately -highlight-mode-insert=Search<CR>

nnoremap <silent> [denite]h :<C-u>Denite -highlight-mode-insert=Search help<CR><C-w>o
nnoremap <silent> [denite]H :<C-u>DeniteCursorWord -highlight-mode-insert=Search help<CR><C-w>o

nnoremap <silent> [denite]F  :<C-u>Denite -highlight-mode-insert=Search filetype<CR>
nnoremap <silent> [denite]y  :<C-u>Denite -highlight-mode-insert=Search neoyank<CR>
nnoremap <silent> [denite]a  :<C-u>Denite -highlight-mode-insert=Search outline<CR>

function! DeniteFileRec() abort
  " CHL
  Denite -highlight-mode-insert=Search file_rec
endfunction
command! DeniteFileRec call DeniteFileRec()

function! DeniteFileOld() abort
  " CHL
  Denite -highlight-mode-insert=Search file_old
endfunction
command! DeniteFileOld call DeniteFileOld()

" nnoremap <silent> <M-n>      :<C-u>Denite -resume -select=+1 -immediately<CR>
" nnoremap <silent> <M-p>      :<C-u>Denite -resume -select=-1 -immediately<CR>

" nnoremap <C-j> :Denite file_rec<CR>
" nnoremap g<C-J> :DeniteBufferDir file_rec<CR>
" nnoremap t<C-J> :Denite -default-action=tabopen file_rec<CR>
" nnoremap <C-k> :Denite file_old<CR>
" nnoremap t<C-k> :Denite -default-action=tabopen file_old<CR>

" use ag
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nogroup', '-g', ''])
" call denite#custom#source('file_rec', 'matchers', ['matcher_cpsm'])
" call denite#custom#source('file_rec', 'sorters', ['sorter_rank'])
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
" call denite#custom#source('file_rec', 'sorters', ['sorter_selecta'])
" call denite#custom#source('file_mru', 'converters', ['converter_relative_word'])

" カーソルキー, cn, cpで移動
call denite#custom#map('insert' , '<Down>' , '<denite:move_to_next_line>')
call denite#custom#map('insert' , '<Up>'   , '<denite:move_to_previous_line>')
call denite#custom#map('insert' , '<C-n>'  , '<denite:move_to_next_line>')
call denite#custom#map('insert' , '<C-p>'  , '<denite:move_to_previous_line>')

" ignore
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.meta'])

