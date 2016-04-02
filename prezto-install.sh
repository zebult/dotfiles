#!/bin/sh

// zsh起動
zsh

// リポジトリをclone
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

// 設定ファイルを作成
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

  // Shellのデフォルトに設定
  chsh -s /bin/zsh

  echo "finish!!! try logout after in"
