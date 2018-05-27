let g:lightline = {
            \ 'colorscheme': 'nord',
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
            \ 'active': {
            \   'left': [
            \      ['mode', 'paste'],
            \      ['fugitive', 'gitgutter', 'readonly'],
            \      [],
            \      ['filename'],
            \      ['modified'],
            \      [],
            \    ],
            \   'right': [
            \      [ 'syntastic', 'qfstatusline', 'lineinfo', 'percent'],
            \    ],
            \ },
            \ 'component_expand': {
            \   'qfstatusline': 'qfstatusline#Update',
            \   'fugitive': 'MyFugitive',
            \   'gitgutter': 'MyGitGutter',
            \   'tagbar': 'MyCurrentTag',
            \   'syntastic': 'SyntasticStatuslineFlag',
            \ },
            \ 'component_type': {
            \   'qfstatusline': 'error',
            \   'syntastic': 'error',
            \ },
            \ 'component_function': {
            \   'anzu': 'anzu#search_status',
            \   'ale': 'ALEGetStatusLine',
            \ },
            \ }
            " \      ['toggl_task'],
            " \   'toggl_task': 'MyToggleTask',
"  , 'auto_gtags_is_making_gtags'
" component_expand \   'auto_gtags_is_making_gtags': 'auto_gtags#is_making_gtags_str',

" component_expand   : 一定時間後に呼ばれる call lightline#update()
" component_function : カーソル動く度呼ばれる cursor move

let g:Qfstatusline#UpdateCmd = function('lightline#update')

function! MyToggleTask()
    return "Doing:".toggl#task()." ".toggl#time()
endfunction

function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            let _ = fugitive#head()
            return strlen(_) ? '⭠ '._ : ''
        endif
    catch
    endtry
    return ''
endfunction

" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

function! MyCurrentTag()
  return tagbar#currenttag('%s', '')
endfunction

" " 保存時Error時自動で更新し、表示する 同期処理で重いので不採用
" let g:syntastic_mode_map = { 'mode': 'passive' }
" augroup AutoSyntastic
"     autocmd!
"     autocmd BufWritePost *.cs,*js,*py call s:syntastic()
"     " autocmd BufWritePost *.c,*.cpp,*js,*py call s:syntastic()
" augroup END
" function! s:syntastic()
"     SyntasticCheck
"     call lightline#update()
" endfunction
"
