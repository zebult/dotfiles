#!/bin/bash

git clone https://github.com/zebult/dotfiles.git
cd dotfiles

DIR=${PWD##*/}
if [ $DIR != "dotfiles" ]; then
    exit
fi

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
        brew update
        brew upgrade
        brew install caskroom/cask/brew-cask
        brew cask install xquartz
        brew install lua
        brew install vim --with-lua
        brew install ctags
        brew tap sanemat/font
        brew install --powerline --vim-powerline ricty
        cp -f /usr/local/Cellar/ricty/*/share/fonts/Ricty*.ttf ~/Library/Fonts/
        brew install tmux
        brew install reattach-to-user-namespace
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        brew install macvim
        brew install htop-osx
        brew install peco
        brew install nmap
        brew install tig
        brew install wget
        brew install tree
        brew install ag
        brew install global # gtags
        brew install sourcekitten
        brew install source-highlight
        brew install argon/mas/mas
        curl -L git.io/enhancd | sh
        git clone https://github.com/b4b4r07/enhancd ~/.enhancd
        mkdir -p ~/.config
        ln -snfv $HOME/dotfiles/peco $HOME/.config/peco
        source ${HOME}/.zshrc
        ./setupPrezto.sh

        # Web download app
        brew cask install audacity
        brew cask install android-studio
        brew cask install accessmenubarapps
        brew cask install appcleaner
        brew cask install bettertouchtool
        brew cask install caffeine
        brew cask install dropbox
        brew cask install flux
        brew cask install hyperswitch
        brew cask install genymotion
        brew cask install google-chrome
        brew cask install google-japanese-ime
        brew cask install iterm2
        brew cask install macvim
        brew cask install mamp
        brew cask install nosleep
        brew cask install shady
        brew cask install karabiner
        brew cask install unity
        brew cask install xtrafinder
        brew cask install java
        # Android
        # brew cask install eclipse-ide
        # brew install android-ndk
        # brew install android-sdk

        # App store
        mas install 421358730 # MenuTab for Facebook
        mas install 439277582 # iCleanMemory
        mas install 409183694 # Keynote
        mas install 408981434 # iMovie
        mas install 430173763 # Degrees
        mas install 406056744 # Evernote
        mas install 425955336 # Skitch
        mas install 472226235 # LanScan
        mas install 411246225 # Caffeine
        mas install 803453959 # Slack
        mas install 585829637 # Todoist
        mas install 409201541 # Pages
        mas install 539883307 # LINE
        mas install 682658836 # GarageBand
        mas install 896624060 # Kobito
        mas install 409203825 # Numbers
        ;;
esac

echo finish🍺

# branch 表示
# vim .zpreztorc
# zstyle ':prezto:load' pmodule \ に'git' 追加

