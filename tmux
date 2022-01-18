set -g default-terminal "screen-256color" # colors!
setw -g xterm-keys on
set -s escape-time 10                     # faster command sequences
set -sg repeat-time 600                   # increase repeat timeout
set -s focus-events on

set -g prefix C-a
set-option -g default-shell /bin/zsh

bind | split-window -h -c '#{pane_current_path}'
bind - split-window -v -c '#{pane_current_path}'

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

#set -g mouse on

# From https://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/
######################
### DESIGN CHANGES ###
######################

# panes
set -g pane-border-style fg=black
set -g pane-active-border fg=brightred

## Status bar design
# status line
set -g status-justify left
set -g status-bg default
set -g status-fg colour12
set -g status-interval 2

# messaging
set -g message-style fg=black,bg=yellow
set -g message-command-style fg=blue,bg=black

#window mode
setw -g mode-style fg=colour0,bg=colour6

# window status
setw -g window-status-format " #F#I:#W#F "
setw -g window-status-current-format " #F#I:#W#F "
setw -g window-status-format "#[fg=magenta]#[bg=black] #I #[bg=cyan]#[fg=colour8] #W "
setw -g window-status-current-format "#[bg=brightmagenta]#[fg=colour8] #I #[fg=colour8]#[bg=colour14] #W "
setw -g window-status-current-style fg=colour11,bg=colour0,dim
setw -g window-status-style fg=black,bg=green,reverse

# Info on left (I don't have a session display for now)
set -g status-left ''

# loud or quiet?
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none

set -g default-terminal "screen-256color"

# The modes {
setw -g clock-mode-colour colour135
setw -g mode-style fg=colour196,bg=colour238,bold

# }
# The panes {

set -g pane-border-style fg=colour239,bg=colour236
set -g pane-active-border fg=colour51,bg=colour236

# }
# The statusbar {

set -g status-position bottom
set -g status-bg colour234
set -g status-fg colour137
set -g status-style dim
set -g status-left ''
set -g status-right '#[fg=colour233,bg=colour241,bold] %d/%m #[fg=colour233,bg=colour245,bold] %H:%M:%S '
set -g status-right-length 50
set -g status-left-length 20

setw -g window-status-current-style fg=colour81,bg=colour238,bold
setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '

setw -g window-status-style fg=colour138,bg=colour235,none
setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '

setw -g window-status-bell-style fg=colour255,bg=colour1,bold

# }
# The messages {

set -g message-style fg=colour232,bg=colour166,bold

# }

set -g pane-border-status top

# If the pane has a child process, show the command its running and the PID.
# Otherwise just show the pane's current command.
set -g pane-border-format "#([[ ! -z $(pgrep -P #{pane_pid}) ]] && ps -o command -p $(pgrep -P #{pane_pid}) | sed '2!d' || echo #{pane_current_command})#([[ ! -z $(pgrep -P #{pane_pid}) ]] && echo ' '[$(pgrep -P #{pane_pid})])"

set -g @plugin "jlipps/tmux-safekill"
