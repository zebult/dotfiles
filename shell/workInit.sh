#!/bin/zsh
# tmux new-window -n default # 新しいwindowを開きたくない場合は以下
cd ~/Documents/Memo/grenge
tmux rename-window default
tmux split-window -h
tmux split-window -v -t default.1
tmux split-window -v -t default.2

tmux send-keys -t default.1 'vim popolo.md' C-m
tmux send-keys -t default.2 'vim /0CheatSheet/mCocos2dx.md' C-m
tmux send-keys -t default.3 'vim nippo.md' C-m
tmux send-keys -t default.4 'curl wttr.in/Tokyo' C-m
tmux select-pane -t default.1
