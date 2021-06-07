augroup template
  autocmd!
  autocmd BufNewFile *.c 0r $HOME/.vim/template/skeleton.c
  autocmd BufNewFile *.cpp 0r $HOME/.vim/template/skeleton.cpp
  autocmd BufNewFile *.h 0r $HOME/.vim/template/skeleton.h
  autocmd BufNewFile *.hpp 0r $HOME/.vim/template/skeleton.h
  autocmd BufNewFile *.cs 0r $HOME/.vim/template/skeleton.cs
  autocmd BufNewFile *.html 0r $HOME/.vim/template/skeleton.html
  autocmd BufNewFile *.php 0r $HOME/.vim/template/skeleton.php
  autocmd BufNewFile *.py 0r $HOME/.vim/template/skeleton.py
  autocmd BufNewFile *.sh 0r $HOME/.vim/template/skeleton.sh
  autocmd BufNewFile *.swift 0r $HOME/.vim/template/skeleton.swift
  autocmd BufNewFile *.java 0r $HOME/.vim/template/skeleton.java
  autocmd BufNewFile *.js 0r $HOME/.vim/template/skeleton.js
  autocmd BufNewFile *.json 0r $HOME/.vim/template/skeleton.json
  autocmd BufNewFile *.css 0r $HOME/.vim/template/skeleton.css
augroup END
