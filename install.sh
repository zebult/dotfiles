#!/bin/bash

# 1.dotfileのシンボリックリンクを$HOMEに張る
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    # [[ "$f" == ".vim" ]] && \cp -rf "$HOME"/"dotfiles"/".vim"/"userautoload" "$HOME"/"tmp" && continue

    echo "$f"
    ln -snfv "$HOME"/"dotfiles"/"$f" "$HOME"/"$f"
done

# userautoloadを.vimにいれたい
# \cp -rf "$HOME"/"dotfiles"/"userautoload" "$HOME"/"tmp"


# 2.必要なものインストール

# OS別の処理
os=''
if [[ "$(uname)" == 'Darwin' ]]; then
    os='mac'
elif [[ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]]; then
    os='linux'
elif [[ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]]; then
    os='cygwin'
fi

case "${os}" in
    'mac' )
        if ! type brew > /dev/null 2>&1; then
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
        export PATH=$PATH:/usr/local/bin/
        if ! type brew > /dev/null 2>&1; then
            brew install lua
            brew install vim --with-lua
            brew tap sanemat/font
            brew install --powerline --vim-powerline ricty
            cp -f /usr/local/Cellar/ricty/*/share/fonts/Ricty*.ttf ~/Library/Fonts/
            brew install tmux
            brew install macvim
            brew install htop-osx
            brew install nmap
            brew tig
            brew install wget
            brew install source-highlight
            source ${HOME}/.zshrc
            ./setupPrezto.sh
        fi
        ;;
esac

echo finish🍺

