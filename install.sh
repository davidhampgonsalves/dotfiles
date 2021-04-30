#!/bin/bash

# install home brew and cask
[ ! "$(command -v brew)" ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/cask-fonts
brew tap heroku/brew && brew install heroku

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
installPkg "brew" "neovim/neovim/neovim zsh tmux tree htop go leiningen coreutils rbenv fzf ag postgres redis reattach-to-user-namespace n yarn heroku ripgrep gpg pinentry-mac fswatch terraform alacritty awscli"
installPkg "brew cask" "transmission google-chrome vlc flux java font-source-code-pro slack flycut firefox shiftit"

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

chsh -s /bin/zsh
touch ~/.zsh.user.zsh

/usr/local/opt/fzf/install

# transmission settings
defaults write org.m0k.transmission DeleteOriginalTorrent  1
defaults write org.m0k.transmission DownloadAsk 0
defaults write org.m0k.transmission DownloadLocationConstant 1
defaults write org.m0k.transmission NSNavLastRootDirectory "~/Downloads"

echo "If everthing looks good, run `./link.sh`"
