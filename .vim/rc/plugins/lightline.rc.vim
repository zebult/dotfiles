let g:lightline = {
            \ 'colorscheme': 'nord',
            \ 'active': {
            \   'left': [
            \      ['mode', 'paste', 'readonly'],
            \      ['fugitive'],
            \      ['my_filename'],
            \    ],
            \   'right': [
            \      ['filetype'],
            \      ['line'],
            \      ['syntastic', 'qfstatusline'],
            \    ],
            \ },
            \ 'inactive': {
            \   'right': [
            \    ],
            \ },
            \ 'component_expand': {
            \   'qfstatusline': 'qfstatusline#Update',
            \   'fugitive': 'MyFugitive',
            \   'gitgutter': 'MyGitGutter',
            \   'my_filename': 'MyFileName',
            \   'syntastic': 'SyntasticStatuslineFlag',
            \   'line_percent': 'LinePercent',
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

let g:lightline.component = {}
let g:lightline.component.line = '[%l/%L]'

" 端末によって文字がズレる事があるので使用しない
" \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
" \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },

" \      ['toggl_task'],
" \   'toggl_task': 'MyToggleTask',
" component_expand   : 文字列展開される 一定時間後に呼ばれる call lightline#update()
" component_function : カーソル動く度呼ばれる cursor move

let g:Qfstatusline#UpdateCmd = function('lightline#update')

function! MyToggleTask()
    return "Doing:".toggl#task()." ".toggl#time()
endfunction

function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            let _ = fugitive#head()
            return strlen(_) ? _ : ''
            " return strlen(_) ? _.' '.GetGitCleanStatus() : ''
            " return strlen(_) ? '⭠ '._ : ''
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

function! MyFileName()
  " return "%t"." ".GetGitCleanStatusForCurrentFile()
  return "%t"
endfunction

function! GetGitCleanStatus()
  let status = system('git status --porcelain')
  if strlen(status) > 0
    return "✱"
  endif
  return ""
endfunction

function! GetGitCleanStatusForCurrentFile()
  let status = system('git status --porcelain')
  if stridx(status, expand("%:t")) != -1
    return "✱"
  endif
  return ""
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
" endfunction"
