#!/usr/bin/env bash

# I am adopting the original files and then resetting the git repo to apply my changes.
# This is done to avoid issues when original files already exist on the machine and cannot be stowed.

# Definitions #
stowit() {
    stow -t ~ -S $1 --adopt
}

moveFonts() {
  unzip -d ./fonts/$1 ./fonts/$1.zip
  cp -n -a ./fonts/$1/. ~/Library/Fonts/
  rm -rf ./fonts/$1
}
# END #

stowit zsh
stowit git
stowit ssh
stowit config
stowit tmux
stowit bin

moveFonts base

git reset --hard
