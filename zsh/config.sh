# ZSH Spelling Correction ---------------------------------------------------------------------------
setopt correct
autoload -U colors && colors
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

# Variables -----------------------------------------------------------------------------------------
export EDITOR="vim"
export GPG_TTY=$(tty) # Random env variable needed for GPG commit signing

# Initialization ------------------------------------------------------------------------------------
if [ $commands[rbenv] ]; then eval "$(rbenv init -)"; fi
if [ $commands[pyenv] ]; then eval "$(pyenv init --path)"; fi
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# Options -------------------------------------------------------------------------------------------
setopt inc_append_history
setopt share_history

# Source Config -------------------------------------------------------------------------------------
source ~/.dotfiles/zsh/config/aescrypt.sh
source ~/.dotfiles/zsh/config/aliases.sh
source ~/.dotfiles/zsh/config/aws.sh
source ~/.dotfiles/zsh/config/fzf-tab.sh
source ~/.dotfiles/zsh/config/git.sh
source ~/.dotfiles/zsh/config/go.sh
source ~/.dotfiles/zsh/config/kubernetes.sh
source ~/.dotfiles/zsh/config/navigation.sh
source ~/.dotfiles/zsh/config/ruby.sh

bindkey -s ^f "~/.dotfiles/zsh/config/tmux-sessionizer.sh\n"
