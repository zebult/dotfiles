nnoremap [denite] <Nop>
nmap <Bslash> [denite]

nnoremap <silent> so :<C-u>Denite -highlight-mode-insert=Search file_rec<CR>
nnoremap <silent> su :<C-u>Denite -highlight-mode-insert=Search file_old<CR>
nnoremap <silent> s; :<C-u>Denite -highlight-mode-insert=Search buffer<CR>
nnoremap <silent> sf  :<C-u>Denite -highlight-mode-insert=Search outline<CR>

nnoremap <silent> [denite]h :<C-u>Denite -highlight-mode-insert=Search help<CR><C-w>o
nnoremap <silent> [denite]H :<C-u>DeniteCursorWord -highlight-mode-insert=Search help<CR><C-w>o
nnoremap <silent> [denite]f  :<C-u>Denite -highlight-mode-insert=Search filetype<CR>
nnoremap <silent> [denite]y  :<C-u>Denite -highlight-mode-insert=Search neoyank<CR>

" カーソルキー, cn, cpで移動
call denite#custom#map('insert' , '<Down>' , '<denite:move_to_next_line>')
call denite#custom#map('insert' , '<Up>'   , '<denite:move_to_previous_line>')
" call denite#custom#map('insert' , '<C-n>'  , '<denite:move_to_next_line>')
" call denite#custom#map('insert' , '<C-p>'  , '<denite:move_to_previous_line>')

if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
else
  call denite#custom#var('file_rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

call denite#custom#source('file_rec', 'matchers',
      \ ['matcher_regexp', 'matcher_project_files', 'matcher_ignore_globs'])
      " \ ['matcher_fuzzy', 'matcher_project_files', 'matcher_ignore_globs'])

call denite#custom#map('insert', '<C-r>',
      \ '<denite:toggle_matchers:matcher_substring>', 'noremap')
call denite#custom#map('insert', '<C-s>',
      \ '<denite:toggle_sorters:sorter_reverse>', 'noremap')
call denite#custom#map('insert', '<C-j>',
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>',
      \ '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "'",
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', 'r',
      \ '<denite:do_action:quickfix>', 'noremap')
call denite#custom#map('insert', ';',
      \ 'vimrc#sticky_func()', 'expr')

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#option('default', {
      \ 'auto_accel': v:true,
      \ 'prompt': '>',
      \ 'source_names': 'short',
      \ })

let s:menus = {}
let s:menus.vim = {
    \ 'description': 'Vim',
    \ }
let s:menus.vim.file_candidates = [
    \ ['    > Edit configuation file (init.vim)', '~/.config/nvim/init.vim']
    \ ]
call denite#custom#var('menu', 'menus', s:menus)

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   '*.meta',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

call denite#custom#action('file', 'buffer',
      \ {context -> denite#do_action(context, 'open', context['targets'])})

" call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
"       \ [ '.git/', '.ropeproject/', '__pycache__/',
"       \   '*.png', '*.jpg',
"       \   '*.caf', '*.mp3', '*.mp4',
"       \   '*.csd', '*.csb', '*.bin', '*.jar', '*.cmake',
"       \   '*.o', '*.d', '*.3', '*.a', '*.inl', '*.pch', '*.filters', '*.props', '*dll', '*.lib', '*.so', '*.cl', '*.vcxproj', '*.bat', '*.def', '*.vcxitems', '*.aidl', '*.xaml',
"       \   '*.meta', '*.vert', '*.frag', '*.hlsl', '*.sln', '*.unity',
"       \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
"       " \   '*.cpp', '*.hpp', '*.h', '*.mm', '*.c', '*.txt', '*.java', '*.m', '*.mk', '*.xml',

      " \ {'key': 'j', 'command': 'Denite',  'source': 'file_rec'},
" let mapping_list = [
"       \ {'key': 'J', 'command': 'DeniteBufferDir',           'source': 'file_rec'},
"       \ {'key': 'k', 'command': 'Denite',           'source': 'file_old'},
"       \ {'key': 'K', 'command': 'Denite',           'source': 'Denite buffer<CR>: Denite -immediately file_old<CR><C-c>'},
"       \ {'key': 'g', 'command': 'Denite',           'source': '-winheight=3 -auto_preview grep'},
"       \ {'key': 'G', 'command': 'DeniteCursorWord', 'source': '-winheight=3 -auto_preview grep'}
"       \ ]
" let options      = [
"       \ {'key':  '', 'option' : '-default-action=open'}
"       \ ]
"       " \ {'key': 't', 'option' : '-default-action=tabopen'},
"       " \ {'key': 'v', 'option' : '-default-action=vsplit'},
"       " \ {'key': 's', 'option' : '-default-action=split'}
"
" for mapping in mapping_list
"   for option in options
"     let prefix = 'nnoremap <silent> [denite]'
"     " let middle = ' :<C-u>CHL<CR>:'
"     let middle = ' :<C-u>'
"     let dhighlight = '-highlight-mode-insert=Search'
"     let suffix = '<CR>'
"     let map_str = prefix . option['key'] . mapping['key'] . middle . mapping['command'] . ' ' . option['option'] . ' ' . dhighlight . ' ' . mapping['source'] . suffix
"     execute map_str
"   endfor
" endfor

" nnoremap <silent> [denite]b :<C-u>Denite -default-action=open -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> [denite]t :<C-u>Denite -default-action=tabopen -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> [denite]v :<C-u>Denite -default-action=vsplit -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> [denite]s :<C-u>Denite -default-action=split -highlight-mode-insert=Search file_rec<CR>

" nnoremap <silent> [denite]j :<C-u>Denite buffer -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> so :<C-u>Denite -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> sO :<C-u>DeniteBufferDir -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> s; :<C-u>Denite -default-action=vsplit -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> sdo :<C-u>Denite -default-action=split -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> sdO :<C-u>DeniteBufferDir -default-action=split -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> vso :<C-u>Denite -default-action=vsplit -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> vsO :<C-u>DeniteBufferDir -default-action=vsplit -highlight-mode-insert=Search file_rec<CR>
" nnoremap sdo :Denite -default-action=split file_rec<CR>
" nnoremap sdo :Denite -default-action=tabopen file_rec<CR>
" nnoremap t<C-J> :Denite -default-action=tabopen file_rec<CR>
" nnoremap <silent> sdO :<C-u>DeniteBufferDir -default-action=split -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> [denite]j :<C-u>Denite -default-action=tabopen -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> [denite]k :<C-u>Denite -highlight-mode-insert=Search file_old<CR>
" nnoremap <silent> dk :<C-u>Denite -highlight-mode-insert=Search file_old<CR>
" nnoremap <silent> [denite]T :<C-u>Unite tab<CR>

" nnoremap <silent> [denite]ct :<C-u>DeniteBufferDir -default-action=tabopen -highlight-mode-insert=Search file_rec<CR>
" nnoremap <silent> [denite]r  :<C-u>Denite -resume -highlight-mode-insert=Search<CR>
" nnoremap <silent> [denite]n  :<C-u>Denite -resume -select=+1 -immediately -highlight-mode-insert=Search<CR>
" nnoremap <silent> [denite]p  :<C-u>Denite -resume -select=-1 -immediately -highlight-mode-insert=Search<CR>
"
" function! DeniteFileRec() abort
"   " CHL
"   Denite -highlight-mode-insert=Search file_rec
" endfunction
" command! DeniteFileRec call DeniteFileRec()
"
" function! DeniteFileOld() abort
"   " CHL
"   Denite -highlight-mode-insert=Search file_old
" endfunction
" command! DeniteFileOld call DeniteFileOld()

" nnoremap <silent> <M-n>      :<C-u>Denite -resume -select=+1 -immediately<CR>
" nnoremap <silent> <M-p>      :<C-u>Denite -resume -select=-1 -immediately<CR>

" nnoremap <C-j> :Denite file_rec<CR>
" nnoremap g<C-J> :DeniteBufferDir file_rec<CR>
" nnoremap t<C-J> :Denite -default-action=tabopen file_rec<CR>
" nnoremap <C-k> :Denite file_old<CR>
" nnoremap t<C-k> :Denite -default-action=tabopen file_old<CR>

" call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nogroup', '-g', ''])
" call denite#custom#source('file_old', 'converters',
"       \ ['converter_relative_word'])
