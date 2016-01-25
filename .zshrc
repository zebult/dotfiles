#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=$PATH:$HOME/.bin/sh
export PATH=$PATH:~/Plugins/android-sdk-macosx
export PATH=$PATH:~/Plugins/android-sdk-macosx/platform-tools
# port command
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/zebra/Documents/workspace/cocos2d-x/cocos2d-x-3.6/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
#export COCOS_TEMPLATES_ROOT=/Users/zebra/Documents/workspace/cocos2d-x/cocos2d-x-3.6/templates
#export PATH=$COCOS_TEMPLATES_ROOT:$PATH

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

export EDITOR=/usr/bin/vim
export VISUAL=vim

# alias
alias ll='ls -la'
alias gco="git checkout"
alias gst="git status"
alias ga="git add ."
alias gcm="git commit -m"
alias gacm="git commit -am"
alias gd="git diff"
alias gb="git branch"
alias gps="git push"
alias gpo="git push -u origin master"
alias gpl="git pull"
alias gl="git log"
alias glo="git log --oneline"
alias gm="git merge"
alias gr="git reset"

alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
alias gvim='open -a macvim'

alias ouch='say -v Alex "ouch"'

functions zipr() {
    zip -r $1 $1
}

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/zebra/Plugins/android-ndk-r9d
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Users/zebra/Plugins/android-sdk-macosx
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
