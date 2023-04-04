#!/bin/bash
echo "Have you already:"
echo "  copyied over ssh keys or generated new ones?"
echo "  install homebrew from https://https://brew.sh/"
echo "  setup touchpad manually"
echo "  set osx defaults `git clone git@github.com:mathiasbynens/dotfiles.git ~/repos/mathiasbynens-dotfiles` and run `~r/mathiasbynens-dotfiles/.macos`"

read -p "y/n: " choice
case "$choice" in
  y|Y ) ;;
  * ) exit 1;;
esac

# setup git config
[ ! -d "~/.gitconfig" ] && curl -s https://raw.githubusercontent.com/davidhampgonsalves/dotfiles/master/,gitconfig >> ~/.gitconfig

# Setup Dirs
mkdir -p ~/repos ~/work
cd ~/repos
[ ! -d "dotfiles" ] && git clone git@github.com:davidhampgonsalves/dotfiles.git
cd dotfiles

echo "If everthing looks good, run `./install.sh`"
