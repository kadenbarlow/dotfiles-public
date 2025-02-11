[ ! -d ~/.config/tmux/plugins/catppuccin/tmux ] &&
  git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux >/dev/null 2>&1
[ ! -d ~/.config/tmux/plugins/battery/tmux ] &&
  git clone https://github.com/tmux-plugins/tmux-battery ~/.config/tmux/plugins/tmux-battery >/dev/null 2>&1
[ ! -d ~/.config/tmux/plugins/battery/tmux ] &&
  git clone https://github.com/tmux-plugins/tmux-cpu ~/.config/tmux/plugins/tmux-cpu >/dev/null 2>&1

# Function to set the terminal title
function set_title() {
  local title="${1:0:20}" # Truncate to 20 characters
  echo -ne "\033]0;${title}\007"
}

# Set title to current directory before prompt
function precmd() {
  set_title "zsh"
}

# Set title to current command when executing
function preexec() {
  set_title "$1"
}
