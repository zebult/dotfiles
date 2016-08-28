augroup template
  autocmd!
  autocmd BufNewFile *.c 0r $HOME/.vim/template/skeleton.c
  autocmd BufNewFile *.cpp 0r $HOME/.vim/template/skeleton.cpp
  autocmd BufNewFile *.cs 0r $HOME/.vim/template/skeleton.cs
  autocmd BufNewFile *.html 0r $HOME/.vim/template/skeleton.html
  autocmd BufNewFile *.php 0r $HOME/.vim/template/skeleton.php
  autocmd BufNewFile *.py 0r $HOME/.vim/template/skeleton.py
  autocmd BufNewFile *.sh 0r $HOME/.vim/template/skeleton.sh
augroup END
