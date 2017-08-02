" C, C++, Yacc, Java, PHP4, (python)
" http://uguisu.skr.jp/Windows/gtags.html
" https://www.machu.jp/diary/20090308.html

" 定義
autocmd FileType cpp nnoremap <C-j> :GtagsCallees<CR>
autocmd FileType cpp nnoremap t<C-j> :tab sp<CR>:GtagsCallees<CR>
autocmd FileType cpp vnoremap <C-j> <Esc>:vs<CR><C-w>l:GtagsCallees<CR>
autocmd FileType cpp nnoremap s<C-j> :sp<CR><C-w>j:GtagsCallees<CR>
" 参照(Caller)
autocmd FileType cpp nnoremap <C-k> :GtagsCaller<CR>
autocmd FileType cpp nnoremap t<C-k> :tab sp<CR>:GtagsCaller<CR>
autocmd FileType cpp vnoremap <C-k> <Esc>:vs<CR><C-w>l:GtagsCaller<CR> snippetsの展開に使う
autocmd FileType cpp nnoremap s<C-k> :sp<CR><C-w>j:GtagsCaller<CR>

" Grep
autocmd FileType cpp nnoremap g/ :Gtags -g 
autocmd FileType cpp nnoremap g* :Gtags -g <C-r><C-w><CR>

" このファイルの関数一覧
autocmd FileType cpp nnoremap g<C-t> :Gtags -f %<CR>

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
