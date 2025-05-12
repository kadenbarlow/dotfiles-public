[ ! -d ~/.config/tmux/plugins/catppuccin/tmux ] &&
  git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux >/dev/null 2>&1
[ ! -d ~/.config/tmux/plugins/battery/tmux ] &&
  git clone https://github.com/tmux-plugins/tmux-battery ~/.config/tmux/plugins/tmux-battery >/dev/null 2>&1
[ ! -d ~/.config/tmux/plugins/battery/tmux ] &&
  git clone https://github.com/tmux-plugins/tmux-cpu ~/.config/tmux/plugins/tmux-cpu >/dev/null 2>&1
