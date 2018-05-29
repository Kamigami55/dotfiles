#!/bin/bash

# ##########
# install.sh
#
# Install my dotfiles
#
# It will do the following things:
# - Install packages
# - Create soft links to my dotfiles
# ##########


# Install zsh and oh-my-zsh if not installed
if [ $(dpkg-query -W -f='${Status}' zsh 2>/dev/null | grep -c "ok installed") == 0 ]
then
    if [[ "$OSTYPE" == "linux-gnueabihf" ]] # For raspbien
    then
        sudo apt-get --force-yes --yes install zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
fi

# Install tmux  if not installed
if [ $(dpkg-query -W -f='${Status}' tmux 2>/dev/null | grep -c "ok installed") == 0 ]
then
    if [[ "$OSTYPE" == "linux-gnueabihf" ]] # For raspbien
    then
        sudo apt-get --force-yes --yes install tmux
    fi
fi


source config.sh

# Decode linkFiles array HACK
oIFS=$IFS
IFS=$array_separator
linkFiles=( $linkFilesArray )
IFS=$oIFS


# Create file links
for file in "${linkFiles[@]}"
do
  target="$HOME/$file"
  if [ -e $target ]; then
    # old file exist, ask to rename old file to .old and continue
    echo -n "'$target' exist, rename old one to '$file.old' and continue(Y/n)? "
    read answer
    if [ "$answer" != "${answer#[Nn]}"  ] ;then
      # No, leave the old file
      echo "Keep the old '$file'"
      continue
    else
      # (default) Yes, rename old one
      mv $target "$target.old"
      echo "Rename '$file' to '$file.old'"
    fi
  fi
  # create new link
  ln -s "$HOME/$confDir/$file" $target
  echo "Create soft link: '$target'"
done

