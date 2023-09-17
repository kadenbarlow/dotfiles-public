#! /usr/bin/env bash

set -e

install_brew_packages () {
  brew bundle --file ~/.dotfiles/setup-scripts/Brewfile
}

install_shared_dependencies () {
  bash ~/.dotfiles/setup-scripts/shared.sh
}

main () {
  install_brew_packages
  install_shared_dependencies
}

main $@
