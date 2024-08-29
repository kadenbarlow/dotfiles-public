#! /usr/bin/env bash

set -e

NODE_VERSION="18.17.0"
PYTHON_VERSION="3.12.5"
RUBY_VERSION="3.3.4"

install_awsctx () {
  if [[ ! -f /usr/local/bin/awsctx ]]; then
    echo "Installing awsctx..."
    git clone https://github.com/kadenbarlow/awsctx.git ~/Documents/projects/awsctx-code
    cp ~/Documents/projects/awsctx-code/awsctx /usr/local/bin/awsctx
    chmod +x /usr/local/bin/awsctx
  else
    echo "Skipping awsctx install..."
  fi
}

install_file_structure () {
  mkdir -p ~/Documents/google-drive
  mkdir -p ~/Documents/projects
  # mkdir -p ~/Documents/work
}

install_gems () {
  bundle install --system --gemfile=~/.dotfiles/setup-scripts/Gemfile
}

install_node_packages () {
  bash ~/.dotfiles/setup-scripts/node-packages.sh
}

install_node () {
  if ! command -v nvm; then
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
    echo "The next command will fail - restart your terminal and run this script again"
  else
    echo "Skipping nvm install..."
  fi

  if ! nvm ls --no-colors --no-alias | grep $NODE_VERSION; then
    echo "Installing node $NODE_VERSION..."
    nvm install $NODE_VERSION
    nvm use $NODE_VERSION
  else
    echo "Skipping node version install..."
  fi
}

install_python () {
  if ! pyenv versions | grep $PYTHON_VERSION; then
    echo "Installing python $PYTHON_VERSION..."
    pyenv install $PYTHON_VERSION
    pyenv global $PYTHON_VERSION
    pipx install posting
  else
    echo "Skipping python version install..."
  fi
}

install_ruby () {
  if ! rbenv versions | grep $RUBY_VERSION; then
    echo "Installing ruby $RUBY_VERSION..."
    rbenv install $RUBY_VERSION
    rbenv global $RUBY_VERSION
  else
    echo "Skipping ruby version install..."
  fi
}

install_zsh () {
  if [[ ! -f ~/.zinit/bin/zinit.zsh ]]; then
    echo "Installing zsh dependencies..."
    mkdir ~/.zinit
    git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
    chsh -s $(which zsh)
  else
    echo "Skipping zsh install..."
  fi
}

main () {
  install_awsctx
  install_file_structure
  install_node
  install_python
  install_ruby
  install_zsh
  install_gems
  install_node_packages
}

main $@
