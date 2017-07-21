# Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

ENHANCD_HYPHEN_ARG="-ls"
ENHANCD_DOT_ARG="-up"
. $HOME/.enhancd/init.sh

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
# zplug "b4b4r07/zle-vimode"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"

if ! zplug check; then
    zplug install
fi
zplug load

# shell path
export PATH=$PATH:$HOME/.bin/sh
# vim path
export PATH=/usr/local/bin:${PATH}
# swift path
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$PATH
# perl path
# export PATH=/usr/bin/perl:$PATH
# go path(go get glide)
export GOPATH=$HOME/.go:~/Documents/workspace/Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
# MacPorts command
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

# cocos2d-x
COCOS_VERSION="3.11.1"
# N
# NDK_VERSION="android-ndk-r10e"
# A
NDK_VERSION="android-ndk-r10d"
# S
# NDK_VERSION="android-ndk-r12b"
# NDK_VERSION="android-ndk-r14b"
SDK_VERSION="22"
## Use vim
export COCOS_LIBRARY=/Applications/Cocos/Cocos2d-x/cocos2d-x-$COCOS_VERSION/cocos
## Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-$COCOS_VERSION/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH
## Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-$COCOS_VERSION/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH
## Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Applications/Cocos/Cocos2d-x
export PATH=$COCOS_X_ROOT:$PATH
## Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/usr/local/Cellar/android-ndk/$NDK_VERSION
export PATH=$NDK_ROOT:$PATH
## Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/$SDK_VERSION
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
## ant
# export ANT_ROOT=/usr/local/Cellar/ant/1.9.7/bin
export ANT_ROOT=/usr/local/bin
export PATH=$ANT_ROOT:$PATH
## wip
# export CPATH=$CPATH:/usr/local/include
# export CPATH=$CPATH:/Applications/Cocos/Cocos2d-x/cocos2d-x-3.11.1
export CPATH=$CPATH:/Applications/Cocos/Cocos2d-x/cocos2d-x-3.11.1/cocos
# unset CPATH
# unset LIBRARY_PATH
# export CPATH=$CPATH:/Applications/Cocos/Cocos2d-x/wip
# export CPATH=$CPATH:/Applications/Cocos/Cocos2d-x/wip/cocos
# export LIBRARY_PATH=$LIBRARY_PATH:/Applications/Cocos/Cocos2d-x/cocos2d-x-3.11.1
# export LIBRARY_PATH=$LIBRARY_PATH:/Users/a14198/Documents/workspace/Goodroid/alarm/proj.ios_mac

# ccache
export NDK_CCACHE=/usr/local/bin/ccache

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
alias gcm="gst; git commit -v"
alias gst="git status -sb"
alias gdf="git diff"
alias gmg="git merge"
alias gdt="git difftool"
alias gmt="git mergetool"
alias gbr="git branch"
alias grbd="git push origin --delete"
alias gco="git checkout"
alias gfc="git fetch"
alias glo="git log --oneline"
alias glnm="git log --no-merges"
alias grh="git reset --hard"
alias grs="git reset --soft"
alias gcl="git clean -df"
alias gsw="git show"
alias gbl="git blame"
alias glp="git log -p -1"
alias gsu="git submodule update"
alias gsv="git stash save"
alias glist="git stash list"
alias gfu="git ls-files -u"
alias gcp="git cherry-pick"
alias grb="git rebase"
alias grv="git revert"
alias gcf="git diff --diff-filter=U"

alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags' # TODO: シンボリックリンク指したほうが良さそう
alias vim8="/usr/local/bin/vim"
alias vim=nvim
# alias vi=vim -u NONE --noplugin
alias mvim='macvim'
alias vimm='vim **/*'
alias perl='/usr/bin/perl'

alias gip='curl ipecho.net/plain; echo'
alias sssh='sshrc'
alias tre="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'"
alias c7='chmod 755'
alias ag='ag -u'
alias fn='find . -name'
alias mf='mdfind'

alias cp='cp -v'
alias cdn='peco-tree-vim'

alias vtr='vim <(tree)'
alias ouch='say -v Alex "ouch"'
alias tokyo='curl wttr.in/Tokyo'

set -o vi
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^K'  kill-line
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^R'  history-incremental-pattern-search-backward
bindkey -M viins '^W'  backward-kill-word

function gifo() { git-foresta --style=10 "$@" | less -RSX }
function gifa() { git-foresta --all --style=10 "$@" | less -RSX }
compdef _git gifo=git-log
compdef _git gifa=git-log

mc () {
    mkdir -p "$@" && eval cd "\"\$$#\"";
}

macvim () {
    if [ -d /Applications/MacVim.app ]
    then
        [ ! -f $1 ] && touch $1
        open -a MacVim $1
    else
        im $1
    fi
}

zipr() {
    zip -r $1 $1;
}

tmp() {
    mkdir tmp;
    cd tmp;
}

mkcd() {
    mkdir $1;
    cd $1
}

gacm() {
    gst
    git add .
# alias gacm="gst; git add .; git commit -m"
    if [ -n "$1" ]; then
        git commit -m $1
    else
        git commit -v
    fi
}

gps() {
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

gpsu() {
    gst
    if [ -n "$1" ]; then
        # force push
        if [ $1 = "-f" ]; then
            echo "git push -f upstream `git rev-parse --abbrev-ref HEAD`"
            git push -f upstream `git rev-parse --abbrev-ref HEAD`
        fi
    else
        echo "git push upstream `git rev-parse --abbrev-ref HEAD`"
        git push upstream `git rev-parse --abbrev-ref HEAD`
    fi
}

# don't use submodule
gpl() {
    gst
    if [ -n "$1" ]; then
        echo "git pull origin $1"
        git pull origin $1
    else
        echo "git pull origin `git rev-parse --abbrev-ref HEAD`"
        git pull origin `git rev-parse --abbrev-ref HEAD`
    fi
}

gplu() {
    gst
    if [ -n "$1" ]; then
        echo "git pull upstream $1"
        git pull upstream $1
    else
        echo "git pull upstream `git rev-parse --abbrev-ref HEAD`"
        git pull upstream `git rev-parse --abbrev-ref HEAD`
    fi
}

# git rebase origin
gro() {
    # gst
    branch=`git rev-parse --abbrev-ref HEAD`
    echo $branch
    echo 'Clean "temporary" branch? y/n'
    read answer
    if [ $answer = "n" ]; then
        echo 'see you🍣'
    fi
        if [ $answer = "y" ]; then
        git branch -D temporary
        git checkout -b temporary
        git checkout $branch
        git reset --hard @~
        git pull origin $branch
        git checkout temporary
        git rebase $branch
        git checkout $branch
        git merge temporary
        gst
        echo 'success year🍣'
    fi
}

gamd() {
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

gbo()  {
    git show-branch | grep '*' | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -1 | awk -F'[]~^[]' '{print $2}'
}

gbrrd()  {
    git branch | grep $1 | xargs git branch -d
}

guu()
{
    if [ -n "$1" ]; then
        echo "update "$1
        git checkout $1
        git fetch upstream
        git pull upstream $1
        git submodule update
    else
        echo "update develop"
        git checkout develop
        git fetch upstream
        git pull upstream develop
        git submodule update
    fi
}

dush()
{
    du -sh * | grep G
}

xp()
{
    defaults write com.apple.dt.Xcode IDEBuildOperationMaxNumberOfConcurrentCompileTasks $1
}

peco-tree-vim(){
  local SELECTED_FILE=$(tree --charset=o -i -f | peco | xargs echo)
  BUFFER="vim $SELECTED_FILE"
  zle accept-line
}
zle -N peco-tree-vim
bindkey '^n' peco-tree-vim

peco-tree-dir(){
  local SELECTED_DIRECTORY=$(tree --charset=o -i -f -d | peco | xargs echo)
  cd $SELECTED_DIRECTORY
  zle accept-line
}
zle -N peco-tree-dir
bindkey '^s' peco-tree-dir

peco-branch () {
    local branch=$(git branch -a | peco | tr -d ' ' | tr -d '*')
    if [ -n "$branch" ]; then
      if [ -n "$LBUFFER" ]; then
        local new_left="${LBUFFER%\ } $branch"
      else
        local new_left="$branch"
      fi
      BUFFER=${new_left}${RBUFFER}
      CURSOR=${#new_left}
    fi
}
zle -N peco-branch
bindkey '^b' peco-branch

peco-select-history() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history

git-remote-vim(){
    BUFFER="vim <(git remote -v)"
  zle accept-line
}
zle -N git-remote-vim

fileRecVimOpen() {
    BUFFER='vim -c "DeniteFileRec"'
    zle accept-line
}
zle -N fileRecVimOpen
bindkey '^j' fileRecVimOpen

fileOldVimOpen() {
    BUFFER='vim -c "DeniteFileOld"'
    zle accept-line
}
zle -N fileOldVimOpen
bindkey '^k' fileOldVimOpen

pwdcp() {
    pwd | pbcopy
    echo `pwd`
    zle accept-line
}
zle -N pwdcp
bindkey '^p' pwdcp

# defaultcolor() {
#     bcolor 45 45 45
#     zle accept-line
# }
# zle -N defaultcolor
# bindkey '^z' defaultcolor

vimfiler() {
    BUFFER="vim ."
    zle accept-line
}
zle -N vimfiler
bindkey '^f' vimfiler

sourcezshrc() {
    echo 'source ~/.zshrc'
    source ~/.zshrc
    zle accept-line
}
zle -N sourcezshrc
bindkey '^t' sourcezshrc

currentopen() {
    echo "open "`pwd`
    open .
    zle accept-line
}
zle -N currentopen
bindkey '^o' currentopen

memodiary() {
    BUFFER="vim ~/Dropbox/Saichi/Diary/$(date "+%Y/%m/%d.md")"
    zle accept-line
}
zle -N memodiary
bindkey '^y' memodiary

zshrcopen() {
    BUFFER="vim ~/.zshrc"
    zle accept-line
}
zle -N zshrcopen
bindkey '^z' zshrcopen

# tmux起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete
