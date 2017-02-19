" .gitがあれば保存時自動生成(.git内なのでignoreは不必要)

" 保存時tags生成
let g:auto_ctags = 1
" 保存場所指定
let g:auto_ctags_directory_list = ['.git', '.svn']
" タグファイルの場所
set tags+=.git/tags

