set expandtab
" タブをスペース2にする
set ts=2 sw=2 sts=0
" メモ取りやすくする
inoremap <S-Tab> <Left><Left><backspace><Right><Right>
inoremap g<Tab> <Left><Left><tab><Right><Right>
" o(O)を先頭に合わせる
nnoremap o :call Action_o()<CR>
nnoremap O :call Action_O()<CR>

nnoremap go o
nnoremap gO O

" todoリストを簡単に入力する
abbreviate tl -[ ]
" cohama/lexima.vim
" abbreviate tl -[ <Right><BS><Right>
" abbreviate tl -[ ]xxa
" abbreviate tl -[ x$a

abbreviate gl ## g

" todoリストのon/offを切り替える
nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>

set syntax=markdown

" au FileType markdown syn region myMkdHeaderFold
"         \ start="\v^\s*\z(\#{1,6})"
"         \ skip="\v(\n\s*\z1\#)\@="
"         \ end="\v\n(\s*\#)\@="ms=s-1,me=s-1
"         \ fold contains=myMkdHeaderFold
"
" au FileType markdown syn sync fromstart
" au FileType markdown set foldmethod=syntax
