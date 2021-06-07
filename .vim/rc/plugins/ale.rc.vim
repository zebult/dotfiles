" http://wonderwall.hatenablog.com/entry/2017/03/01/223934

let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1

let g:ale_lint_on_text_changed = 'never'

nmap <silent> ck <Plug>(ale_previous)
nmap <silent> cj <Plug>(ale_next)
nmap <silent> <Subleader>a <Plug>(ale_toggle)

function! s:ale_list()
  let g:ale_open_list = 1
  call ale#Queue(0, 'lint_file')
endfunction
command! ALEList call s:ale_list()
nnoremap <Subleader>m  :ALEList<CR>
autocmd FileType qf nnoremap <silent> <buffer> q :let g:ale_open_list = 0<CR>:q!<CR>
autocmd FileType help,qf,man,ref let b:ale_enabled = 0

if dein#tap('lightline.vim')
  autocmd User ALELint call lightline#update()
endif

let g:ale_sh_shellcheck_options = '-e SC1090,SC2059,SC2155,SC2164'

let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'javascript': ['eslint'],
\}

" eslint
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
