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
# vim path
export PATH="/usr/local/bin:${PATH}"
# swift path
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$PATH
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
alias gch="git checkout"
alias ll='ls -lah'
alias gst="git status -s"
alias ga="git add ."
alias gcm="git commit -m"
alias gacm='git add .;  git commit -m'
alias gdt="git difftool"
alias gmt="git mergetool"
alias gbr="git branch"
alias gps="git push"
alias gpl="git pull"
alias glo="git log --oneline"
alias gfc="git fetch"

alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
alias gvim='open -a macvim'

alias ouch='say -v Alex "ouch"'
# alias find='find . -name'

functions zipr() {
zip -r $1 $1;
}
functions tmp() {
mkdir tmp;
cd tmp;
}
functions mc() {
mkdir $1;
cd $1
}

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/zebra/Plugins/android-ndk-r9d
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Users/zebra/Plugins/android-sdk-macosx
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# プロンプト
# autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git svn
# zstyle ':vcs_info:*' max-exports 6 # formatに入る変数の最大数
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats '%b@%r' '%c' '%u'
# zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'
# setopt prompt_subst
# function vcs_echo {
#     local st branch color
#     STY= LANG=en_US.UTF-8 vcs_info
#     st=`git status 2> /dev/null`
#     if [[ -z "$st" ]]; then return; fi
#     branch="$vcs_info_msg_0_"
#     if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[green]} #staged
#     elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} #unstaged
#     elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg[blue]} # untracked
#     else color=${fg[cyan]}
#     fi
#     echo "%{$color%}(%{$branch%})%{$reset_color%}" | sed -e s/@/"%F{yellow}@%f%{$color%}"/
# }
# PROMPT='
# %F{yellow}[%~]%f `vcs_echo`
# %(?.$.%F{red}$%f) '

# tmux起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

# nvm設定
if [ -e ~/.nvm ]; then
    [[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh
    nvm use default
    npm_dir=${NVM_PATH}_modules
    export NODE_PATH=$npm_dir
    # 毎回実行しなくていいように設定を反映させるコマンドも書いておく
    source ~/.nvm/nvm.sh
    export NVM_DIR="/Users/zebra/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi
