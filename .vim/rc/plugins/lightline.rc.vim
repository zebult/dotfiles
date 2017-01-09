let g:lightline = {
    \ 'colorscheme': 'landscape',
    \ 'active': {
    \   'left': [
    \       ['mode', 'paste'],
    \       ['readonly', 'filename', 'modified', 'anzu']
    \   ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive',
    \   'anzu': 'anzu#search_status'
    \ }
    \ }

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head())
      return ' ' . fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction
