" C, C++, Yacc, Java, PHP4, (python)
" http://uguisu.skr.jp/Windows/gtags.html
" https://www.machu.jp/diary/20090308.html

" 定義
nnoremap <C-j> :GtagsCallees<CR>
nnoremap t<C-j> :tab sp<CR>:GtagsCallees<CR>
vnoremap <C-j> <Esc>:vs<CR><C-w>l:GtagsCallees<CR>
nnoremap s<C-j> :sp<CR><C-w>j:GtagsCallees<CR>
" 参照(Caller)
nnoremap <C-k> :GtagsCaller<CR>
nnoremap t<C-k> :tab sp<CR>:GtagsCaller<CR>
" vnoremap <C-k> <Esc>:vs<CR><C-w>l:GtagsCaller<CR> snippetsの展開に使う
nnoremap s<C-k> :sp<CR><C-w>j:GtagsCaller<CR>
" Grep
nnoremap g/ :Gtags -g 
nnoremap g* :Gtags -g <C-r><C-w><CR>
" このファイルの関数一覧
nnoremap <C-t> :Gtags -f %<CR>

function! QuickFixHidden() abort
  if (len(getqflist()) <= 1)
    cclose
  endif
endfunction

function! GtagsCallees() abort
  let g:Gtags_OpenQuickfixWindow = 1
  GtagsCursor
  call QuickFixHidden()
endfunction
command -bar GtagsCallees call GtagsCallees()

function! GtagsCaller() abort
  let g:Gtags_OpenQuickfixWindow = 1
  normal ;Gtags -r 
  call QuickFixHidden()
endfunction
command -bar GtagsCaller call GtagsCaller()
