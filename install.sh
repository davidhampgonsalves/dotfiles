#!/bin/bash

# install home brew and cask
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew tap caskroom/fonts
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

# install some apps
echo "# Installing Packages"
function installPkg {
  for pkg in $2; do
    if $1 list  | grep -q "^${pkg}"; then
      echo "  package '$pkg' is already installed"
    else
      eval $1 install $pkg
    fi
  done
}
installPkg "brew cask" "transmission google-chrome vlc iterm2 flux ctags java font-source-code-pro slack screenhero harvest"
installPkg "brew" "neovim/neovim/neovim zsh tmux tree htop nodejs go leiningen coreutils rbenv fzf ag tmate postgres redis"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# setup glutentags folder
mkdir -p ~/.tag-cache
mkdir -p ~/repos ~/work

chsh -s /bin/zsh
touch ~/.zsh.user.zsh

/usr/local/opt/fzf/install

# install mathiasbynens dotfile osx defaults
git clone https://github.com/mathiasbynens/dotfiles.git mathiasbynens-dotfiles  && cd mathiasbynens-dotfiles && ./.macos
# revert some of those defaults
defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
defaults write -g com.apple.mouse.scaling 3
defaults write com.apple.screensaver askForPassword -int 0
defaults write com.apple.screensaver askForPasswordDelay -int 30
sudo systemsetup -setcomputersleep 15 > /dev/null
defaults write NSGlobalDomain KeyRepeat -int 0

# Disabe the webview and open captive wifi spots in default browser
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -boolean false
cd ..

./link.sh

git config --global core.excludesfile ~/.gitignore_global

# transmission settings
defaults write org.m0k.transmission DeleteOriginalTorrent  1
defaults write org.m0k.transmission DownloadAsk 0
defaults write org.m0k.transmission DownloadLocationConstant 1
defaults write org.m0k.transmission NSNavLastRootDirectory "~/Downloads"

echo "things you need to do:"
echo "======================"
echo "  1) config iterm2 to use solorized color palate"
echo "  2) setup GPG/SSH keys git config --global user.signingkey 44C4AF3D"

