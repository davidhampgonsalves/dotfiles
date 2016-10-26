#!/bin/bash

# install home brew and cask
rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
brew tap caskroom/fonts
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

# install some apps
echo "installing pkgs with brew/cask"
installPkg "brew cask" "transmission google-chrome vlc iterm2 sublime-text nosleep flux ctags java caskroom/versions/firefoxdeveloperedition font-source-code-pro"
echo "installing pkgs with brew"
brew tap neovim/homebrew-neovim
installPkg "brew" "vim neovim/neovim/neovim zsh tmux wget tree htop nodejs go leiningen icdiff direnv coreutils direnv rbenv aspell ant, fzf"

~/.config/nvim/init.vim
# install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# setup glutentags folder
mkdir ~/.tag-cache

# install prezto
[[ ! -a ~/.prezto ]] {
  echo "installing prezto"
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
}
chsh -s /bin/zsh
touch ~/.zsh.user.zsh

# install mathiasbynens dotfile osx defaults
git clone https://github.com/mathiasbynens/dotfiles.git mathiasbynens-dotfiles  && cd mathiasbynens-dotfiles && ./.osx
# revert some of those defaults
defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
defaults write -g com.apple.mouse.scaling 3
defaults write com.apple.screensaver askForPassword -int 0
defaults write com.apple.screensaver askForPasswordDelay -int 30
sudo systemsetup -setcomputersleep 15 > /dev/null
# Disabe the webview and open captive wifi spots in default browser
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -boolean false
cd ..

./link.sh


git config --global core.excludesfile ~/.gitignore_global

# generate pub/private key, copy to clipboard and prompt to add to github
# echo "generating ssh keypair"
# ssh-keygen -t rsa
# pbcopy < ~/.ssh/id_rsa.pub

# transmission settings
defaults write org.m0k.transmission DeleteOriginalTorrent  1
defaults write org.m0k.transmission DownloadAsk 0
defaults write org.m0k.transmission DownloadLocationConstant 1
defaults write org.m0k.transmission NSNavLastRootDirectory "~/Downloads"

mkdir ~/repos
mkdir ~/work

installPkg() {
  for pkg in $2; do
    if $1 list  | grep -q "^${pkg}"; then
      echo "  package '$pkg' is already installed"
    else
      eval $1 install $pkg
    fi
  done
}


echo "things you need to do:"
echo "======================"
echo "  1) config iterm2 to use solorized color palate"
echo "  2) setup GPG/SSH keys git config --global user.signingkey 44C4AF3D"

