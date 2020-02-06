autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

nnoremap [denite] <Nop>

nnoremap <silent> so :<C-u>Denite file/rec<CR>/
vnoremap <silent> so <Esc>:vs<CR><C-w>l:Denite file/rec<CR>/
" nnoremap <silent> s; :<C-u>Denite file/rec<CR>
" vnoremap <silent> s; <Esc>:vs<CR><C-w>l:Denite file/rec<CR>
nnoremap <silent> s<Bslash> :<C-u>DeniteCursorWord file/rec<CR>
vnoremap <silent> s<Bslash> <Esc>:vs<CR><C-w>l:DeniteCursorWord file/rec<CR>
nnoremap <silent> sT :<C-u>Denite -default-action=tabopen file/rec<CR>
nnoremap <silent> sO :<C-u>Denite file/old<CR>/
" nnoremap <silent> do :<C-u>Denite -auto-preview buffer<CR>
nnoremap <silent> do :<C-u>Denite buffer<CR>
nnoremap <silent> sf :<C-u>Denite outline<CR>

nnoremap <silent> \h :<C-u>Denite help<CR><C-w>o
nnoremap <silent> \H :<C-u>DeniteCursorWord help<CR><C-w>o
nnoremap <silent> \f  :<C-u>Denite filetype<CR>
nnoremap <silent> \y  :<C-u>Denite neoyank<CR>

" カーソルキー, cn, cpで移動
call denite#custom#map('insert' , '<Down>' , '<denite:move_to_next_line>')
call denite#custom#map('insert' , '<Up>'   , '<denite:move_to_previous_line>')
call denite#custom#map('insert' , '<C-n>'  , '<denite:move_to_next_line>')
call denite#custom#map('insert' , '<C-p>'  , '<denite:move_to_previous_line>')

if executable('rg')
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
else
  call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

call denite#custom#source('file/rec', 'matchers',
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

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
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
