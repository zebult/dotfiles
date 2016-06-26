#!/bin/zsh
# tmux new-window -n zsh # 新しいwindowを開きたくない場合は以下
# tmux rezsh-window zsh
tmux split-window -h
tmux split-window -v -t zsh.1
tmux split-window -v -t zsh.2

# tmux send-keys -t zsh.1 'curl wttr.in/Moon' C-m
tmux send-keys -t zsh.2 'curl wttr.in/Moon' C-m
# tmux send-keys -t zsh.3 'curl wttr.in/Tokyo' C-m
tmux send-keys -t zsh.4 'curl wttr.in/Tokyo' C-m
tmux select-pane -t zsh.1
