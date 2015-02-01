#!/bin/bash

# install home brew and cask
rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

# install tmuxinator
sudo gem install tmuxinator
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh
mv tmuxinator.zsh ,tmuxinator.zsh

# install some apps
brew install zsh tmux wget tree htop nodejs icdiff direnv coreutils direnv
brew install --HEAD vim
brew cask install transmission google-chrome-canary vlc iterm2 sublime-text3 nosleep flux java

# install neovim
brew tap neovim/homebrew-neovim
brew install --HEAD neovim

# install vim-plug
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
touch ~/.zsh.user.zsh

# caps to esc utility
brew cask install seil karabiner
mv karabiner.xml ~/Library/Application\ Support/Karabiner/private.xml

# install mathiasbynens dotfile osx defaults
git clone https://github.com/mathiasbynens/dotfiles.git mathiasbynens-dotfiles  && cd mathiasbynens-dotfiles && ./.osx
# revert some of those defaults
defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
defaults write -g com.apple.mouse.scaling 3
defaults write com.apple.screensaver askForPassword -int 0
defaults write com.apple.screensaver askForPasswordDelay -int 30
sudo systemsetup -setcomputersleep 15 > /dev/null
cd ..

./link.sh

# generate pub/private key, copy to clipboard and prompt to add to github
echo "generating ssh keypair"
ssh-keygen -t rsa
pbcopy < ~/.ssh/id_rsa.pub


# transmission settings
defaults write org.m0k.transmission DeleteOriginalTorrent  1
defaults write org.m0k.transmission DownloadAsk 0
defaults write org.m0k.transmission DownloadLocationConstant 1
defaults write org.m0k.transmission NSNavLastRootDirectory "~/Downloads"

mkdir ~/repos
mkdir ~/projects

# generate pub/private key, copy to clipboard and prompt to add to github
echo "generating ssh keypair"
ssh-keygen -t rsa
pbcopy < ~/.ssh/id_rsa.pub

 generate pub/private key, copy to clipboard and prompt to add to github
echo "generating ssh keypair"
ssh-keygen -t rsa
pbcopy < ~/.ssh/id_rsa.pub


echo "things you need to do:"
echo "======================"
echo "  1) map esc/ctrl to caps lock"
echo "    1.1) Launch Seil and map caps lock to f19 (80)"
echo "    1.2) Launch Karabiner and select F19 escape/control keys"
echo "    1.2) Under system prefs > keyboard > modifier keys > set caps lock to no op"
echo "  2) config iterm2 to use solorized color palate"
echo "  3) add ssh public key to github. Its in your paste buffer"

