#!/bin/bash
brew tap homebrew/cask-fonts

echo "# Installing Packages"
brew install neovim zsh tree htop go coreutils rbenv fzf n yarn ripgrep gpg pinentry-mac fswatch terraform awscli antidote python transmission vlc visual-studio-code font-source-code-pro slack maccy brave-browser

pip3 install aws-mfa

# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

touch ~/.zsh.user.zsh

# transmission settings
defaults write org.m0k.transmission DeleteOriginalTorrent  1
defaults write org.m0k.transmission DownloadAsk 0
defaults write org.m0k.transmission DownloadLocationConstant 1
defaults write org.m0k.transmission NSNavLastRootDirectory "~/Downloads"

echo "If everthing looks good, run link.sh"
