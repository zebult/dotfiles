#!/bin/bash

cd $HOME
git clone https://github.com/zebult/dotfiles.git
cd dotfiles

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
    ln -snfv "$HOME"/"dotfiles"/"$f" "$HOME"/"$f"
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
        if ! type brew > /dev/null 2>&1; then
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
        export PATH=$PATH:/usr/local/bin/
        brew update
        brew upgrade
        brew install caskroom/cask/brew-cask
        brew cask install xquartz
        brew install llvm --with-clang #c++ auto complete
        brew install zsh
        brew install cscope
        brew install python
        brew install python3
        brew install lua
        brew install cmigemo
        brew install Caskroom/versions/macvim-kaoriya --with-lua --with-cscope --with-python --with-python3
        brew instal pyenv
        brew install vim --with-lua
        brew install neovim/neovim/neovim
        brew install ctags
        brew install boost
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
        brew install imagemagick
        brew install jq
        brew install tig
        brew install wget
        brew install tree
        brew install w3m
        brew install ag
        brew install global # gtags
        brew install sshrc
        brew install sourcekitten
        brew install source-highlight
        brew install argon/mas/mas
        curl -L git.io/enhancd | sh
        git clone https://github.com/b4b4r07/enhancd $HOME/.enhancd
        mkdir -p $HOME/.config
        ln -snfv $HOME/dotfiles/peco $HOME/.config/peco
        ln -snfv $HOME/.vim $HOME/.config/nvim
        ln -snfv $HOME/.vim/vimrc $HOME/.config/nvim/init.vim
        sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"
        chsh -s /usr/local/bin/zsh
        zsh
        source ${HOME}/.zshrc
        chmod 755 $HOME/dotfiles/setupPrezto.sh
        $HOME/dotfiles/setupPrezto.sh
        source ${HOME}/.zshrc
        pyenv install -list
        echo 'Input python 3.x version...'
        read PYTHON_VERSION
        pyenv install $PYTHON_VERSION
        # Error: zlib not available($xcode-select --install)
        echo 'python old version->'
        python --version
        pyenv global $PYTHON_VERSION
        pyenv rehash
        echo 'python new version->'
        python --version
        pip3 install neovim
        # TODO: 2系を標準にするべき?  pyenv global 2.7.9 3.4.3 #手前から優先
        brew install go
        go get github.com/sachaos/todoist
        # Web download app
        brew cask install audacity
        brew cask install android-studio
        brew cask install accessmenubarapps
        brew cask install appcleaner
        brew cask install bettertouchtool
        brew cask install caffeine
        brew cask install cheatsheet
        brew cask install dash
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
        brew cask install eclipse-java
        brew install ant
        brew install android-ndk
        brew install android-sdk

        # App store
        mas install 421358730 # MenuTab for Facebook
        mas install 439277582 # iCleanMemory
        mas install 409183694 # Keynote
        mas install 408981434 # iMovie
        # mas install 406056744 # Evernote
        mas install 425955336 # Skitch
        # mas install 472226235 # LanScan
        mas install 411246225 # Caffeine
        mas install 803453959 # Slack
        mas install 585829637 # Todoist
        # mas install 409201541 # Pages
        mas install 539883307 # LINE
        # mas install 682658836 # GarageBand
        mas install 896624060 # Kobito
        mas install 585829637 # Todoist
        # mas install 409203825 # Numbers
        ;;
esac

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
cd $HOME
mkdir .ssh
cd .ssh
ssh-keygen

# util shell link
cd $HOME
mkdir -p .bin/sh
ln -snfv $HOME/dotfiles/shell/dpull $HOME/.bin/sh/dpull
ln -snfv $HOME/dotfiles/shell/dpush $HOME/.bin/sh/dpush
ln -snfv $HOME/dotfiles/shell/git-imgdiff $HOME/.bin/sh/git-imgdiff
chmod 755 $HOME/.bin/sh/*

# Alfred
cd $HOME/Library/Application\ Support/Alfred\ 3/Alfred.alfredpreferences/preferences/features/
DIR=${PWD##*/}
if [ $DIR != "features" ]; then
    echo "Please set alfred plist. $ln -snfv $HOME/Dropbox/Saichi/Alfred/prefs.plist prefs.plist"
else
    mkdir websearch
    cd websearch
    ln -snfv $HOME/Dropbox/Saichi/Alfred/prefs.plist prefs.plist
fi

# cocos2d-x
mkdir -p /Applications/Cocos/Cocos2d-x
wget http://www.cocos2d-x.org/filedown/cocos2d-x-3.6.zip -P /Applications/Cocos/Cocos2d-x
cd /Applications/Cocos/Cocos2d-x
unzip -o /Applications/Cocos/Cocos2d-x/cocos2d-x-3.6.zip
rm -rf cocos2d-x-3.6.zip
/Applications/Cocos/Cocos2d-x/cocos2d-x-3.6/setup.py
echo "you call don't python3->pyenv global 2.7.9 3.4.3"
# ln -snfv /Applications/Cocos/Cocos2d-x/cocos2d-x-3.6/cocos /usr/local/include/

cd $HOME

echo finish🍺

# branch 表示
# vim .zpreztorc
# zstyle ':prezto:load' pmodule \ に'git' 追加

