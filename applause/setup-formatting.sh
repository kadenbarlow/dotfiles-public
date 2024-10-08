#! /usr/bin/env bash

starting_dir=$(pwd)
base_dir=~/Documents/projects/
cd "$base_dir" || { echo "Failed to cd into $base_dir"; exit 1; }
for dir in applause-*; do
  if [ -d "$dir" ]; then
    echo "Setting up formatting for $dir"
    cd "$dir" || { echo "Failed to cd into $dir"; continue; }
    rm ./eslint.config.mjs 2>/dev/null
    cp $HOME/.dotfiles/applause/config/eslint.config.mjs ./eslint.config.mjs 2>/dev/null
    rm ./prettier.config.mjs 2>/dev/null
    cp $HOME/.dotfiles/applause/config/prettier.config.mjs ./prettier.config.mjs 2>/dev/null
    rm ./.lint-staged.config.mjs 2>/dev/null
    cp $HOME/.dotfiles/applause/config/lint-staged.config.mjs ./lint-staged.config.mjs 2>/dev/null
    rm ./.git/info/exclude 2>/dev/null
    cp $HOME/.dotfiles/applause/git/exclude ./.git/info/exclude 2>/dev/null
    rm ./.git/hooks/pre-commit 2>/dev/null
    cp $HOME/.dotfiles/applause/git/pre-commit ./.git/hooks/pre-commit 2>/dev/null
    cd "$base_dir" || { echo "Failed to return to $base_dir"; exit 1; }
  fi
done

cd "$starting_dir" || { echo "Failed to return to the starting directory ($starting_dir)"; exit 1; }

