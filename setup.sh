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
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 0.9
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

echo "If everthing looks good, run install.sh"
