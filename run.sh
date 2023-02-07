#!/usr/bin/env bash

# I am adopting the original files and then resetting the git repo to apply my changes.
# This is done to avoid issues when original files already exist on the machine and cannot be stowed.

stowit() {
    stow -t ~ -S $1 --adopt
}

stowit zsh
stowit git

git reset --hard
