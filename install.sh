#!/bin/bash

# install home brew and cask
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap getantibody/homebrew-antibody

# install some apps
function installPkg {
  for pkg in $2; do
    if $1 list  | grep -q "^${pkg}"; then
      echo "  package '$pkg' is already installed"
    else
      eval $1 install $pkg
    fi
  done
}

echo "# Installing Packages"
installPkg "brew cask" "transmission google-chrome vlc flux java font-source-code-pro slack flycut firefox-nightly"
installPkg "brew" "neovim/neovim/neovim zsh antibody tmux tree htop go leiningen coreutils rbenv fzf ag postgres redis reattach-to-user-namespace n yarn heroku ripgrep gpg pinentry-mac"

# Setup Dirs
mkdir -p ~/repos ~/work
cd ~/repos
git clone git@github.com:davidhampgonsalves/dotfiles.git
cd dotfiles

# VIM PLUG
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# For Glutentags
mkdir -p ~/.tag-cache

chsh -s /bin/zsh
touch ~/.zsh.user.zsh

/usr/local/opt/fzf/install

git submodule init
git submodule update --recursive --remote

cd mathiasbynens-dotfiles && ./.macos
cd ..

# revert some of those defaults
defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
defaults write -g com.apple.mouse.scaling 3
defaults write com.apple.screensaver askForPassword -int 0
defaults write com.apple.screensaver askForPasswordDelay -int 30
sudo systemsetup -setcomputersleep 15 > /dev/null
<<<<<<< HEAD
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 0.8
defaults write NSGlobalDomain InitialKeyRepeat -int 10
=======
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
>>>>>>> updates
# Disabe the webview and open captive wifi spots in default browser
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -boolean false

./link.sh

git config --global core.excludesfile ~/.gitignore_global

# transmission settings
defaults write org.m0k.transmission DeleteOriginalTorrent  1
defaults write org.m0k.transmission DownloadAsk 0
defaults write org.m0k.transmission DownloadLocationConstant 1
defaults write org.m0k.transmission NSNavLastRootDirectory "~/Downloads"

echo "things you need to do:"
echo "======================"
echo "  config terminal.app to use dracula"
echo "  copy over ssh keys or generate new ones"
echo "  caps-lock to ctrl in keyboard settings"
echo "  run :PlugInstall in neovim"
echo "  slack dracula color scheme"
#echo "  setup GPG/SSH keys git config --global user.signingkey 44C4AF3D"


