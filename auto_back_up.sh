#!/bin/sh

# 0 22 * * * ~/dotfiles/auto_back_up.sh

cd /0cheatseat
git add .
git commit -m "Auto update "`date +%Y_%m_%d_%H` 
git pull origin master
git push origin master

cd ~/dotfiles
git add .
git commit -m "Auto update "`date +%Y_%m_%d_%H` 
git pull origin master
git push origin master
