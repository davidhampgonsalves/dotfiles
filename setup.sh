#!/bin/bash

# setup git config
[ ! -d "~/.gitconfig" ] && curl -s https://raw.githubusercontent.com/davidhampgonsalves/dotfiles/master/,gitconfig >> ~/.gitconfig

# Setup Dirs
mkdir -p ~/repos ~/work
cd ~/repos
[ ! -d "dotfiles" ] && git clone git@github.com:davidhampgonsalves/dotfiles.git
cd dotfiles

git submodule init
git submodule update --recursive --remote

#cd mathiasbynens-dotfiles && ./.macos
cd ..

# revert some of those defaults
#defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true
#defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
#defaults write -g com.apple.mouse.scaling 3
#defaults write com.apple.screensaver askForPassword -int 0
#defaults write com.apple.screensaver askForPasswordDelay -int 30
#sudo systemsetup -setcomputersleep 15 > /dev/null
#defaults write -g InitialKeyRepeat -int 10
#defaults write -g KeyRepeat -int 1

# Disabe the webview and open captive wifi spots in default browser
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -boolean false

./install.sh
./link.sh

git config --global core.excludesfile ~/.gitignore_global

echo "things you need to do:"
echo "======================"
echo "  copy over ssh keys or generate new ones"
echo "  caps-lock to ctrl in keyboard settings"
echo "  update"
echo "  slack dracula color scheme"
#echo "  setup GPG/SSH keys git config --global user.signingkey 44C4AF3D"
