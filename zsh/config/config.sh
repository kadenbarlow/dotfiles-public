# ZSH Spelling Correction ---------------------------------------------------------------------------
setopt correct
autoload -U colors && colors
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

# Variables -----------------------------------------------------------------------------------------
export EDITOR="nvim"
export FZF_DEFAULT_OPTS="--height 33% --layout=reverse"
export GPG_TTY=$(tty) # Random env variable needed for GPG commit signing
export NODE_OPTIONS="--require $HOME/.dotfiles/noderc.js"

# Initialization ------------------------------------------------------------------------------------
if [ $commands[rbenv] ]; then eval "$(rbenv init -)"; fi
if [ $commands[pyenv] ]; then eval "$(pyenv init --path)"; fi
if [ $commands[atuin] ]; then eval "$(atuin init zsh --disable-up-arrow)"; fi
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# Options -------------------------------------------------------------------------------------------
setopt inc_append_history
setopt share_history

# Source Config -------------------------------------------------------------------------------------
function source-directory() {
  local dir="$1"
  if [ -d "$dir" ]; then
    for file in "$dir"/*; do
      [ -f "$file" ] && source "$file"
    done
  fi
}

source ~/.dotfiles/zsh/config/aliases.sh
source-directory ~/.dotfiles/zsh/config/aescrypt
source-directory ~/.dotfiles/zsh/config/aws
source-directory ~/.dotfiles/zsh/config/git
source-directory ~/.dotfiles/zsh/config/node
source-directory ~/.dotfiles/zsh/config/tmux

bindkey -s ^f "~/.dotfiles/zsh/scripts/open-tmux-session.sh\n"
