export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

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
export PATH=$PATH:$HOME/.go/bin
# MacPorts command
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

# Xamarin
export PATH=$PATH:$HOME/tee

# cocos2d-x
# COCOS_VERSION="3.11.1"
COCOS_VERSION="3.12"
# N
# NDK_VERSION="android-ndk-r10e"
# A
NDK_VERSION="android-ndk-r10d"
# S
# NDK_VERSION="android-ndk-r12b"
# NDK_VERSION="android-ndk-r14b"
# SDK_VERSION="22"
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
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
# export PATH=$ANDROID_SDK_ROOT/bin:$PATH
## ant
# export ANT_ROOT=/usr/local/Cellar/ant/1.9.7/bin
export ANT_ROOT=/usr/local/bin
export PATH=$ANT_ROOT:$PATH
## wip
# export CPATH=$CPATH:/usr/local/include
# export CPATH=$CPATH:/Applications/Cocos/Cocos2d-x/cocos2d-x-3.11.1
# export CPATH=$CPATH:/Applications/Cocos/Cocos2d-x/cocos2d-x-3.12
# alias cocos=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.12/tools/cocos2d-console/bin/cocos
# export CPATH=$CPATH:/Applications/Cocos/Cocos2d-x/cocos2d-x-$COCOS_VERSION/cocos
# unset CPATH
# unset LIBRARY_PATH
# export CPATH=$CPATH:/Applications/Cocos/Cocos2d-x/wip
# export CPATH=$CPATH:/Applications/Cocos/Cocos2d-x/wip/cocos
# export LIBRARY_PATH=$LIBRARY_PATH:/Applications/Cocos/Cocos2d-x/cocos2d-x-3.11.1
# export LIBRARY_PATH=$LIBRARY_PATH:/Users/a14198/Documents/workspace/Goodroid/alarm/proj.ios_mac

## React-Native
export ANDROID_HOME=$HOME/Library/Android/sdk

# ccache
export NDK_CCACHE=/usr/local/bin/ccache

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

export EDITOR=/usr/local/bin/nvim
export VISUAL=nvim
# nvim
export XDG_CONFIG_HOME=~/.config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export ELASTICPATH=/usr/local/Cellar/elasticsearch/2.3.2/libexec/bin
export PATH=$PATH:$ELASTICPATH

export ENHANCD_FILTER=peco
export MANPAGER="/bin/sh -c \"col -b -x|nvim -R -c 'set ft=man nolist nonu noma' -\""

# alias
alias ll='ls -alh'
alias llp='ls -alh | peco'
alias gad="git add ."
alias gcm="git commit -m"
alias gst="git status -sb"
alias gdf="git diff"
alias gmg="git merge"
alias gdt="git difftool"
alias gmt="git mergetool"
alias gbr="git branch"
alias gbrd="git push origin --delete"
alias gfc="git fetch"
alias glo="git log --oneline"
alias glz="git log --author=zebult"
alias glonm="git log --oneline --no-merges"
alias grh="git reset --hard"
alias grs="git reset --mixed"
alias gcl="git clean -df"
# alias gsw="ggsw"
alias gsw='git show'
alias gbl="git blame"
alias glp="git log -p -1"
alias gsu="git submodule update"
alias gsb="git submodule"
alias gsh="git stash"
alias gpop="git stash pop"
alias gsv="git stash save"
alias glist="git stash list"
alias gdrop="git stash drop stash@\{0\}"
alias gcp="git cherry-pick"
alias grb="git rebase"
alias grv="git revert"
# alias gcl="git ls-files -u"
alias gcf="git diff --diff-filter=U"
alias gtr="git tree"
alias gclo="git clone"
alias gth="git checkout --theirs"
alias gbd="git branch --merged|egrep -v '\\*|develop|master|design|design/design-mock'|xargs git branch -d"
alias gbdr="git branch -r --merged develop | grep -v -e master -e develop -e design/design-mock -e planner-v2 | sed -e 's% *origin/%%' | xargs -I% git push --delete origin %"
alias rdev="git rebase develop"
alias dev="git checkout develop"
alias master="git checkout master"

alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags' # TODO: シンボリックリンク指したほうが良さそう
alias vim8="/usr/local/bin/vim"
alias vim=nvim
# alias vi=vim -u NONE --noplugin
alias mvim='macvim'
alias vimm='vim **/*'
alias cal='vim -c "Cal"'
alias seat='vim -c "SimpleNoteSeat"'
alias perl='/usr/bin/perl'

alias gip='curl ipecho.net/plain; echo'
alias sssh='sshrc'
alias tre="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'"
alias c7='chmod 755'
alias ag='ag -u'
alias fn='find . -name'
alias mf='mdfind'
alias uncs='uncrustify -l cs -c ~/.uncrustify.cfg --replace --no-backup **/*.cs'
alias using='vim -c "silent call UsingClean()" **/*.cs >&/dev/null'
alias cdp='cd ~/Library/MobileDevice/Provisioning\ Profiles/'

alias libcocos='cd ~/Library/Developer/Xcode/DerivedData/'
alias prov='cd ~/Library/MobileDevice/Provisioning\ Profiles/'

alias cp='cp -rc'
alias cdn='peco-tree-vim'

alias vtr='vim <(tree)'
alias ouch='say -v Alex "ouch"'
alias tokyo='curl wttr.in/Tokyo'
alias noti='terminal-notifier -message "コマンド完了"'

alias sc="cd Assets/Scripts"
alias slack="~/Dropbox/Saichi/sh/slack"
alias gdu="gdu"
alias dufile="tree -ifF --si --noreport | sed -e 's/\[//g' -e 's/\]//g' -e 's/\.\// \.\//g' | grep -v /$ | sort -h"

alias cleos='docker exec -it eosio /opt/eosio/bin/cleos --url http://127.0.0.1:7777 --wallet-url http://127.0.0.1:5555'
# alias cleos="cleos -u http://nodeos:8888"
# alias cleos="cleos -u https://api-kylin.eosasia.one"

set -o vi
bindkey "jj" vi-cmd-mode
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

omni () {
    mono ~/.cache/dein/repos/github.com/yucchiy/omnisharp-vim/server/OmniSharp/bin/Debug/OmniSharp.exe -s $1
    # mono ~/.omnisharp/omnisharp-roslyn/artifacts/publish/OmniSharp.Http.Driver/mono/OmniSharp.exe -s $1
}

cs () {
    params_2nd_later=${@:2:($#-1)}
    mcs $1.cs
    mono $1.exe $params_2nd_later
    rm -rf $1.exe
}

mc () {
    mkdir -p "$@" && eval cd "\"\$$#\"";
}

vag () {
    vim -p `ag $1 -l`
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

memo () {
    mvim ~/Dropbox/Saichi/memo.txt
}

v () {
    COMMAND="vim <("$@")"
    eval $COMMAND
}

vf () {
    COMMAND="vim -p \`"$@"\`"
    eval $COMMAND
}

zip() {
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

# prezto
unalias gg
gg() {
    # alias gg="gst; git add .; git commit -m"
    gst
    git add .
    COMMAND="git commit -m "\"$@\"
    eval $COMMAND
}

gacm() {
    gst
    git add .
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

gsww() {
    if [ -n "$1" ]; then
        git stash show stash@\{$1\} -p
    else
        git stash show stash@\{0\} -p
    fi
}

ggsw() {
    if [ -n "$1" ]; then
        if [[ $1 =~ ^[0-9]$ ]] ; then
            git show stash@\{$1\}
        else
            git show $1
        fi
    else
        git show
    fi
}

# git rebase origin
# gro() {
#     # gst
#     branch=`git rev-parse --abbrev-ref HEAD`
#     echo $branch
#     echo 'Clean "temporary" branch? y/n'
#     read answer
#     if [ $answer = "n" ]; then
#         echo 'see you🍣'
#     fi
#         if [ $answer = "y" ]; then
#         git branch -D temporary
#         git checkout -b temporary
#         git checkout $branch
#         git reset --hard @~
#         git pull origin $branch
#         git checkout temporary
#         git rebase $branch
#         git checkout $branch
#         git merge temporary
#         gst
#         echo 'success year🍣'
#     fi
# }

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

# gplb() {
#     git log --oneline -1
#     git push . origin/"$1":"$1"
#     git log --oneline -10
# }

checkRecentLog() {
    glo -2
}

unalias gco
gco()  {
   git checkout $@

   if echo $@ | grep -q '\-b\ release'; then
       echo 'You should update version😸'
   fi
}

gbu()  {
   checkRecentLog
   git branch -D $1
   git checkout -b $1 origin/$1
   checkRecentLog
}

gbo()  {
    git show-branch | grep '*' | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -1 | awk -F'[]~^[]' '{print $2}'
}

gbrrd()  {
    git branch | grep $1 | xargs git branch -d
}

gop() {
    COMMAND=diff
    REV=HEAD
    OPT='--relative'

    if [ $1 ]; then
        COMMAND=$1
    fi

    if [ $2 ]; then
        REV=$2
    fi

    if [ $COMMAND = "show" ]; then
        PARAM='--pretty=format: --name-only'
    else
        PARAM='--name-only'
    fi

    git $COMMAND $PARAM $OPT $REV | xargs $EDITOR
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

gdfv()
{
    if [ -n "$1" ]; then
        vim -p `git show --pretty="format:" --relative --name-only $1`
    else
        vim -p `git diff --pretty="format:" --relative --name-only`
    fi
}

gcfv()
{
    vim -p `git diff --diff-filter=U --relative --name-only`
}

gdft()
{
    vim -c "GdfTool"
}

xp()
{
    defaults write com.apple.dt.Xcode IDEBuildOperationMaxNumberOfConcurrentCompileTasks $1
}

battery()
{
    cap=`ioreg -l | grep Capacity`
    full=`echo $cap | sed -e "s/^.*MaxCapacity\" = \([0-9]*\).*/\1/"`
    curr=`echo $cap | sed -e "s/^.*CurrentCapacity\" = \([0-9]*\).*/\1/"`
    pct=`echo "scale=3; $curr / $full * 100" | bc`
    echo -----
    printf "%.1f%%\n" $pct
}

peco-tree-vim(){
  local SELECTED_FILE=$(tree --charset=o -i -f | peco | xargs echo)
  if [ ! -z $SELECTED_FILE ] ; then
      BUFFER="vim $SELECTED_FILE"
  fi
  zle accept-line
}
zle -N peco-tree-vim
bindkey '^n' peco-tree-vim

agv(){
  local SELECTED_FILE=$(ag -l $1 | peco | xargs echo)
  if [ ! -z $SELECTED_FILE ] ; then
      BUFFER="vim -p "$SELECTED_FILE
      eval $BUFFER
  fi
}

peco-tree-dir(){
  local SELECTED_DIRECTORY=$(tree --charset=o -i -f -d | peco | xargs echo)
  if [ ! -z $SELECTED_DIRECTORY ] ; then
      cd $SELECTED_DIRECTORY
  fi
  zle accept-line
}
zle -N peco-tree-dir
bindkey '^f' peco-tree-dir

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

# peco-branch-copy () {
br () {
    local branch=$(git branch -a | peco | tr -d ' ' | tr -d '*')
    if [ -n "$branch" ]; then
        echo -n $branch | pbcopy
    fi
}

copy-branch() {
    branch=`git rev-parse --abbrev-ref HEAD`
    echo $branch
    echo -n $branch | pbcopy
    zle reset-prompt
}
zle -N copy-branch
bindkey '^x' copy-branch

checkout-branch() {
    local branch=$(git branch -a | peco | tr -d ' ' | tr -d '*')
    if [ -n "$branch" ]; then
        echo "git checkout "$branch
        gco $branch
    fi
    zle accept-line
}
zle -N checkout-branch
bindkey '^g' checkout-branch

peco-select-history() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# peco-cheatsheet () {
#     local SELECTED_FILE=$(tree /0CheatSheet --charset=o -i -f | peco | xargs echo)
#     if [ ! -z $SELECTED_FILE ] ; then
#         BUFFER="vim -p $SELECTED_FILE"
#     fi
#     zle accept-line
# }
# zle -N peco-cheatsheet
# bindkey '^x' peco-cheatsheet

git-remote-vim(){
    BUFFER="vim <(git remote -v)"
    zle accept-line
}
zle -N git-remote-vim

# fileRecVimOpen() {
#     BUFFER='vim -c "DeniteFileRec"'
#     zle accept-line
# }
# zle -N fileRecVimOpen
# bindkey '^f' fileRecVimOpen

# fileOldVimOpen() {
#     BUFFER='vim -c "DeniteFileOld"'
#     zle accept-line
# }
# zle -N fileOldVimOpen
# bindkey '^k' fileOldVimOpen

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

# vimfiler() {
#     BUFFER="vim ."
#     zle accept-line
# }
# zle -N vimfiler
# bindkey '^f' vimfiler

sourcezshrc() {
    echo 'source ~/.zshrc'
    source ~/.zshrc
    zle accept-line
}
zle -N sourcezshrc
bindkey '^s' sourcezshrc

currentopen() {
    echo "open "`pwd`
    open .
    zle accept-line
}
zle -N currentopen
bindkey '^o' currentopen

memodiary() {
    BUFFER="vim ~/Dropbox/Saichi/Diary/$(date "+%Y/%m/%d.txt")"
    zle accept-line
}
zle -N memodiary
bindkey '^y' memodiary

# todolist() {
#     BUFFER="vim ~/Dropbox/Saichi/Diary/todo.md"
#     zle accept-line
# }
# zle -N todolist
# bindkey '^t' todolist

memoGlobal() {
    BUFFER='vim -c "Org"'
    # BUFFER="vim ~/Dropbox/Saichi/memo.txt"
    zle accept-line
}
zle -N memoGlobal
bindkey '^t' memoGlobal

zshrcopen() {
    BUFFER="vim ~/.zshrc"
    zle accept-line
}
zle -N zshrcopen
bindkey '^z' zshrcopen

ulog() {
    BUFFER="vim <(tail -n +2 ~/Library/Logs/Unity/Editor.log) -c 'setfiletype log'"
    zle accept-line
}
zle -N ulog
bindkey '^u' ulog

# tmux起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

tm()
{
    if [ -n "$1" ]; then
        if [ $1 = "h" ]; then
            tmux select-pane -L
        elif [ $1 = "j" ]; then
            tmux select-pane -D
        elif [ $1 = "k" ]; then
            tmux select-pane -U
        elif [ $1 = "l" ]; then
            tmux select-pane -R
        elif [ $1 = "v" ]; then
            tmux split-window -h
        elif [ $1 = "s" ]; then
            tmux split-window -v
        fi
    else
        echo "usage tm h, j, k, l, v, s"
    fi
}

### Added by the Bluemix CLI
# source /usr/local/Bluemix/bx/zsh_autocomplete

PROMPT+='$(if [ $(date +"%k") -gt 15 ] && [ $(date +"%k") -lt 17 ]; then echo "! "; fi)'
PROMPT+='$(if [ $(date +"%k") -gt 16 ] && [ $(date +"%k") -lt 19 ]; then echo "!!! "; fi)'

# export LC_ALL="en_US.UTF-8"
