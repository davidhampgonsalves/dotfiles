#!/bin/bash

echo "symlinking config files to user dir"
# move config files to user dir
PWD=$(pwd)
for filePath in $PWD/\,*; do
  fileName=$(basename $filePath)
  echo "synlinking: " ${fileName/\,/.}
  ln -s -f  $filePath $HOME/${fileName/\,/.}
done

git config --global core.excludesfile ~/.gitignore_global
