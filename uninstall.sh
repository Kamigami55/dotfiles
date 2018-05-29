#!/bin/bash

# ##########
# uninstall.sh
#
# Uninstall my dotfiles
#
# It will do the following things:
# - Remove soft links to my dotfiles
# ##########


# Import configurations from config.sh
source config.sh

# Decode linkFiles array from config.sh (HACK)
oIFS=$IFS
IFS=$array_separator
linkFiles=( $linkFilesArray )
IFS=$oIFS


# Remove soft links to dotfiles
for file in "${linkFiles[@]}"
do
  target="$HOME/$file"
  if [ -e $target ]; then
    # Remove soft link
    unlink $target
    echo "Remove soft link: '$target'"
  fi
done

echo "Succesfully uninstall dotfiles"

