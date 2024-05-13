#!/bin/bash

echo "symlinking config files to user dir"
# move config files to user dir
PWD=$(pwd)
for filePath in $PWD/\,*; do
  fileName=$(basename $filePath)
  echo "synlinking: " ${fileName/\,/.}
  ln -s -f  $filePath $HOME/${fileName/\,/.}
done

ln -s -f ${0:a:h}'/nvim-init.vim' $HOME/.config/nvim/init.vim
ln -s -f ${0:a:h}'/Brave-Browser/Local State' '/Users/davidhamp-gonsalves/repos/dotfiles/Brave-Browser/Local State'
ln -s -f ${0:a:h}'/Brave-Browser/Default/Preferences' '/Users/davidhamp-gonsalves/repos/dotfiles/Brave-Browser/Default/Preferences'