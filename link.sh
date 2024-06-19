#!/bin/bash

echo "symlinking config files to user dir"
# move config files to user dir
PWD=$(pwd)
for filePath in $PWD/\,*; do
  fileName=$(basename $filePath)
  echo "synlinking: " ${fileName/\,/.}
  ln -s -f  $filePath $HOME/${fileName/\,/.}
done

ln -s -f '/Users/david/repos/dotfiles/nvim-init.vim' $HOME/.config/nvim/init.vim
ln -s -f '/Users/david/repos/dotfiles/Brave-Browser/Local State' '/Users/david/repos/dotfiles/Brave-Browser/Local State'
ln -s -f '/Users/david/repos/dotfiles/Brave-Browser/Default/Preferences' '/Users/david/repos/dotfiles/Brave-Browser/Default/Preferences'

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'