#!/bin/sh

cd /0CheatSheet
git add .
git commit -m "Auto update"`date +%Y_%m_%d_%H` 
git pull origin master
git push origin master
