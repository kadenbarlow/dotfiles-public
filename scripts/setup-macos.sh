#! /usr/bin/env bash

set -e

function install-brew-packages() {
  brew bundle --file ~/.dotfiles/Brewfile
}

function install-shared-dependencies() {
  bash ~/.dotfiles/scripts/setup-shared-dependencies.sh
}

function main() {
  install-brew-packages
  install-shared-dependencies
}

main $@
