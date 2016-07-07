#!/bin/bash

# 1.dotfileのシンボリックリンクを$HOMEに張る(.file限定)
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    echo "###link -> $f"
    ln -snfv "$HOME"/"dotfiles"/"$f" "$HOME"/"$f"
done

# 2.必要なものインストール

## OS別の処理
os=''
if [[ "$(uname)" == 'Darwin' ]]; then
    os='mac'
elif [[ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]]; then
    os='linux'
elif [[ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]]; then
    os='cygwin'
fi

echo "OS:"$os

case "${os}" in
    'mac' )
        if ! type brew > /dev/null 2>&1; then
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
        export PATH=$PATH:/usr/local/bin/
        # if ! type brew > /dev/null 2>&1; then
        brew cask install xquartz
        brew install lua
        brew install vim --with-lua --with-client-server # XQuartzないとダメ
        brew install ctags
        brew tap sanemat/font
        brew install --powerline --vim-powerline ricty
        cp -f /usr/local/Cellar/ricty/*/share/fonts/Ricty*.ttf ~/Library/Fonts/
        brew install tmux
        brew install reattach-to-user-namespace
        brew install macvim
        brew install htop-osx
        brew install nmap
        brew tig
        brew install wget
        brew install tree
        brew install source-highlight
        source ${HOME}/.zshrc
        ./setupPrezto.sh
        # fi
        ;;
esac

echo finish🍺

# branch 表示
# vim .zpreztorc
# zstyle ':prezto:load' pmodule \ に'git' 追加
