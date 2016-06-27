#!/bin/zsh
# tmux new-window -n default # 新しいwindowを開きたくない場合は以下
tmux rename-window default
tmux split-window -h
tmux split-window -v -t default.1
tmux split-window -v -t default.2

# tmux send-keys -t default.1 'curl wttr.in/Moon' C-m
tmux send-keys -t default.2 'curl wttr.in/Moon' C-m
# tmux send-keys -t default.3 'curl wttr.in/Tokyo' C-m
tmux send-keys -t default.4 'curl wttr.in/Tokyo' C-m
tmux select-pane -t default.1
