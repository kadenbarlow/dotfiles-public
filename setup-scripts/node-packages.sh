#! /usr/bin/env bash

NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

packages=(
  eslint
  eslint_d
  yarn
  # chrome-remote-interface
)

for package in ${packages[@]}; do
  npm install -g $package
done
