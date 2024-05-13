#!/bin/bash
echo "Have you already:"
echo "  copyied over ssh keys or generated new ones?"
echo "  installed homebrew from https://https://brew.sh/"
echo "  setup touchpad manually"

read -p "y/n: " choice
case "$choice" in
  y|Y ) ;;
  * ) exit 1;;
esac

defaults write -g ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

echo "If everthing looks good, run './install.sh'"