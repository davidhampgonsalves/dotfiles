#!/bin/bash

echo "Have you already:"
echo "  copyied over ssh keys or generated new ones?"
echo "  set caps-lock to ctrl in keyboard settings?"

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
[ ! -d "dotfiles" ] && git clone git@github.com:mathiasbynens/dotfiles.git mathiasbynens-dotfiles

cd dotfiles

echo "If everthing looks good, run `./install.sh`"
