#!/bin/bash
brew tap homebrew/cask-fonts
brew tap heroku/brew && brew install heroku

echo "# Installing Packages"
brew install docker neovim zsh tmux tree htop go leiningen coreutils rbenv fzf ag postgresql redis reattach-to-user-namespace n yarn heroku ripgrep gpg pinentry-mac fswatch terraform alacritty awscli antidote python
brew install --cask transmission vlc visual-studio-code flux font-source-code-pro slack maccy brave-browser authy

pip install aws-mfa

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

chsh -s /bin/zsh
touch ~/.zsh.user.zsh

# transmission settings
defaults write org.m0k.transmission DeleteOriginalTorrent  1
defaults write org.m0k.transmission DownloadAsk 0
defaults write org.m0k.transmission DownloadLocationConstant 1
defaults write org.m0k.transmission NSNavLastRootDirectory "~/Downloads"

echo "If everthing looks good, run `./link.sh`"
