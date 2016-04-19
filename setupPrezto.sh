#!/bin/zsh

# preztoをクローン
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# テーマを変更
# theme=`cat ${ZDOTDIR:-$HOME}/.zpreztorc | grep '^[zstyle].*theme'`
# echo $theme
# old=`echo "$theme" | awk '{print $4}'`
# new="'steeef'"
# new=`echo "$theme" | sed -e "s/$old/$new/g"`
# sed -i '' -e "s/^[zstyle].*theme.*/$new/g" ${ZDOTDIR:-$HOME}/.zpreztorc
