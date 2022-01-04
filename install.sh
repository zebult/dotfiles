#!/bin/bash

DOTFILES=$HOME/dotfiles

cd $DOTFILES

DIR=${PWD##*/}
if [ $DIR != "dotfiles" ]; then
    exit
fi

# 1.dotfileのシンボリックリンクを$HOMEに張る(ドット限定)
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    echo "###link -> $f"
    ln -snfv "$DOTFILES"/"$f" "$HOME"/"$f"
done

# .gitconfig.local settings
cp gitconfig.local $HOME/.gitconfig.local
# input
echo 'Input your email... (use gitconfig)'
read MAIL
sed -i -e 's/xxx/'$MAIL'/g' $HOME/.gitconfig.local
rm -rf $HOME/.gitconfig.local-e

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
        export PATH=$PATH:/usr/local/bin/

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        brew install zplug
        # brew tap sanemat/font
        # brew install --powerline --vim-powerline ricty
        # cp -f /usr/local/Cellar/ricty/*/share/fonts/Ricty*.ttf ~/Library/Fonts/
        brew install tmux
        brew install reattach-to-user-namespace
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        brew install peco
        brew install jq
        brew install wget
        brew install tree
        brew install ag
        brew install uncrustify
        # brew install mono
        # brew install argon/mas/mas
        curl -L git.io/enhancd | sh
        git clone https://github.com/b4b4r07/enhancd $HOME/.enhancd
        mkdir -p $HOME/.config
        ln -snfv $DOTFILES/peco $HOME/.config/peco
        ln -snfv $DOTFILES/karabiner $HOME/.config/karabiner
        ln -snfv $HOME/.vim $HOME/.config/nvim
        ln -snfv $HOME/.vim/vimrc $HOME/.config/nvim/init.vim
        chmod 755 $DOTFILES/setupPrezto.sh
        $DOTFILES/setupPrezto.sh
        source ${HOME}/.zshrc
        # brew cask install dash
        # brew cask install hyperswitch
        # brew cask install mamp
        # brew cask install nosleep
        # brew cask install shady

        # 3. Cheat sheet clone(URLが動的に変わりそうなので注意)
        cd $HOME/Documents
        git clone https://gist.github.com/d5ee659c9d2bc1575cbc93aaca6988a4.git
        mv d5ee659c9d2bc1575cbc93aaca6988a4 CheatSheet
        sudo ln -snfv $HOME/Documents/CheatSheet /0CheatSheet

        # 4. Karabiner setting
        cd $HOME/Library/Application\ Support/Karabiner
        DIR=${PWD##*/}
        if [ $DIR != "Karabiner" ]; then
            echo ERROR: Karabiner clone.
            exit
        fi
        cd ..
        rm -rf Karabiner
        git clone https://github.com/zebult/Karabiner.git

        # 5. keygen
        # cd $HOME mkdir .ssh
        # cd .ssh
        # ssh-keygen

        # util shell link
        cd $HOME
        mkdir -p .bin/sh
        cd $DOTFILES/shell
        for FILE in *; do
            ln -snfv $DOTFILES/shell/$FILE $HOME/.bin/sh/$FILE
        done
        chmod 755 $HOME/.bin/sh/*

        # AquaSKK 補完10、インライン表示1
        cd $HOME/Library/Application\ Support
        ln -snfv $HOME/Dropbox/Saichi/AquaSKK AquaSKK

        cd $HOME

        # Mac Settings
        # defaults write com.apple.dashboard mcx-disabled -boolean true; killall Dock # DashBoard消去
        defaults write com.apple.dock autohide-delay -float 0; killall Dock # Dock表示時間0
        defaults write com.apple.desktopservices DSDontWriteNetworkStores true # ネットワークドライブで.DS_Storeファイルを作成しないようにする
        defaults write -g QLPanelAnimationDuration -float 0 # クイックルックアニメーション無し
        defaults write com.apple.dock workspaces-edge-delay -float 0.2; killall Dock # アプリがデスクトップ間を移動する際の速度を変更 ???

esac
echo finish🍺

# branch 表示
# vim $HOME/.zpreztorc
# zstyle ':prezto:load' pmodule \ に'git' 追加

