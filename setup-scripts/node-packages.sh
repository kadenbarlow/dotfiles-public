#! /usr/bin/env bash

NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

packages=(
  eslint
  eslint_d
  eslint-plugin-perfectionist
  eslint-plugin-react
  eslint-plugin-sort-destructure-keys
  eslint-plugin-unused-imports
  lint-staged
  lua-fmt
  prettier
  yarn
  @trivago/prettier-plugin-sort-imports
)

for package in ${packages[@]}; do
  npm install -g $package
done
