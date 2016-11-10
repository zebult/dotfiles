# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

ENHANCD_HYPHEN_ARG="-ls"
ENHANCD_DOT_ARG="-up"
. $HOME/.enhancd/init.sh

# Customize to your needs...
export PATH=$PATH:$HOME/.bin/sh
export PATH=$PATH:~/Plugins/android-sdk-macosx
export PATH=$PATH:~/Plugins/android-sdk-macosx/platform-tools
# vim path
export PATH="/usr/local/bin:${PATH}"
# swift path
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$PATH
# go (go get glide)
# export GOPATH=$HOME/.go:~/Documents/workspace/Go
export GOPATH=~/Documents/workspace/Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
# port command
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=$HOME/Documents/workspace/cocos2d-x/cocos2d-x-3.6/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
#export COCOS_TEMPLATES_ROOT=/Users/zebra/Documents/workspace/cocos2d-x/cocos2d-x-3.6/templates
#export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# docker
# eval $(docker-machine env default)

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

export EDITOR=/usr/local/bin/vim
export VISUAL=vim
# nvim
export XDG_CONFIG_HOME=~/.config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export ELASTICPATH=/usr/local/Cellar/elasticsearch/2.3.2/libexec/bin
export PATH=$PATH:$ELASTICPATH

export ENHANCD_FILTER=peco

# alias
alias ll='ls -alh'
alias gacm="gst; git add .; git commit -m"
alias gst="git status -sb"
alias gdf="git diff"
alias gmg="git merge"
alias gdt="git difftool"
alias gmt="git mergetool"
alias gbr="git branch"
alias gco="git checkout"
alias gfc="git fetch"
alias glo="git log --oneline"
alias grh="git reset --hard"
alias gcl="git clean -df"
alias gsw="git show"
alias gbl="git blame"
alias glp="git log -p -1"

alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags' # TODO: シンボリックリンク指したほうが良さそう
alias vim8="/usr/local/bin/vim"
alias vim=nvim
alias gvim='open /Applications/MacVim.app'

alias ag='ag -u'
alias findn='find . -name'
alias F='vim .'
alias pwdcp='pwd | pbcopy'
alias ouch='say -v Alex "ouch"'
alias tokyo='curl wttr.in/Tokyo'

# set -o vi

function vag() {
    vim <(ag -u $1)
}
functions zipr() {
    zip -r $1 $1;
}

functions tmp() {
    mkdir tmp;
    cd tmp;
}

function img() {
    imageNames=()
    imageCount=0
    for i in `seq 1 ${#}`
    do
        imageNames+=(${1})
        imageCount=`expr $imageCount + 1`
        shift
    done
    percentage=`expr 100 / $imageCount`
    convert -geometry $percentage% +append $imageNames out.png
}

functions mkcd() {
    mkdir $1;
    cd $1
}

functions gps() {
    gst
    if [ -n "$1" ]; then
        # force push
        if [ $1 = "-f" ]; then
            echo "git push -f origin `git rev-parse --abbrev-ref HEAD`"
            git push -f origin `git rev-parse --abbrev-ref HEAD`
        fi
    else
        echo "git push origin `git rev-parse --abbrev-ref HEAD`"
        git push origin `git rev-parse --abbrev-ref HEAD`
    fi
}

functions gpl() {
    gst
    echo "git pull origin `git rev-parse --abbrev-ref HEAD`"
    git pull origin `git rev-parse --abbrev-ref HEAD`
}

functions gamd() {
    gst
    checkRecentLog
    if [ -n "$2" ]; then
        echo 'ERROR: You need surround ""'
    else
        git add .
        if [ -n "$1" ]; then
            git commit --amend -m $1
        else
            git commit --amend
        fi
        checkRecentLog
    fi
}

checkRecentLog() {
    echo "======="
    glo -2
    echo "======="
}

functions gbo()  {
    git show-branch | grep '*' | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -1 | awk -F'[]~^[]' '{print $2}'
}

function peco-tree-vim(){
  local SELECTED_FILE=$(tree --charset=o -f | peco | tr -d '\||`|-' | xargs echo)
  BUFFER="vim $SELECTED_FILE"
  zle accept-line
}
zle -N peco-tree-vim
bindkey '^j' peco-tree-vim

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=$HOME/Plugins/android-ndk-r9d
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=$HOME/Plugins/android-sdk-macosx
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# ant(cocos terminal)
ANT_ROOT=$HOME/Plugins/apache-ant-1.9.7/bin
export ANT_ROOT

# tmux起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

# 天気
# curl wttr.in/Moon
# curl wttr.in/Tokyo


# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Applications/Cocos/Cocos2d-x
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/a14198/Documents/workspace/Goodroid/live/cocos2d-x-3.5/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/a14198/Documents/workspace/Goodroid/live/cocos2d-x-3.5/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/a14198/Documents/workspace/Goodroid/live/cocos2d-x-3.5/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/a14198/Documents/workspace/Goodroid/live/cocos2d-x-3.5/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.5/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.5/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH
