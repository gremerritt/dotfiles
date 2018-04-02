set -g default-terminal "screen-256color" # colors!
setw -g xterm-keys on
set -s escape-time 10                     # faster command sequences
set -sg repeat-time 600                   # increase repeat timeout
set -s focus-events on

set -g prefix C-a
set-option -g default-shell /bin/zsh

bind | split-window -h
bind - split-window -v

bind-key -n S-Up resize-pane -U 2
bind-key -n S-Down resize-pane -D 2
bind-key -n S-Left resize-pane -L 2
bind-key -n S-Right resize-pane -R 2

bind-key -n M-Up select-pane -U
bind-key -n M-Down select-pane -D
bind-key -n M-Left select-pane -L
bind-key -n M-Right select-pane -R

bind r source-file ~/.tmux.conf

set-window-option -g automatic-rename on
set-option -g set-titles on

set -g mouse on
