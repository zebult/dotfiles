let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [
            \       ['mode', 'paste'],
            \       ['fugitive', 'gitgutter', 'readonly', 'filename', 'modified', 'anzu']
            \   ],
            \   'right': [ [ 'syntastic', 'lineinfo' ],
            \              [ 'toggl_task', 'toggl_time', 'percent' ],
            \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'component_expand': {
            \   'syntastic': 'SyntasticStatuslineFlag',
            \ },
            \ 'component_function': {
            \   'fugitive': 'MyFugitive',
            \   'gitgutter': 'MyGitGutter',
            \   'toggl_task': 'toggl#task',
            \   'toggl_time': 'toggl#time',
            \   'anzu': 'anzu#search_status', 
            \ },
            \ 'component_type': {
            \   'syntastic': 'error',
            \ }
            \ }

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

" 保存時Error時自動で更新し、表示する
let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp,*js,*py call s:syntastic()
augroup END
function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

