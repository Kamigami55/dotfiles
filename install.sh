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


# Import configurations from config.sh
source config.sh

# Decode linkFiles array from config.sh (HACK)
oIFS=$IFS
IFS=$array_separator
linkFiles=( $linkFilesArray )
IFS=$oIFS


# Install zsh and oh-my-zsh if not installed
if [ $(dpkg-query -W -f='${Status}' zsh 2>/dev/null | grep -c "ok installed") == 0 ]
then
    if [[ "$OSTYPE" == "linux-gnueabihf" ]] # For raspbien
    then
        sudo apt-get --force-yes --yes install zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
fi

# Install tmux if not installed
if [ $(dpkg-query -W -f='${Status}' tmux 2>/dev/null | grep -c "ok installed") == 0 ]
then
    if [[ "$OSTYPE" == "linux-gnueabihf" ]] # For raspbien
    then
        sudo apt-get --force-yes --yes install tmux
    fi
fi


# Create soft links to dotfiles
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


# Init git submodules for tpm(tmux plugin manager)
echo "Init git submodule(for tmux plugin manager)..."
git submodule init
git submodule update

# Prompt to change default shell to zsh
zshPath=$(which zsh)
echo -n "Do you want to change default shell to $zshPath (will need password) (Y/n)? "
read answer
if [ "$answer" != "${answer#[Nn]}"  ] ;then
  # No, do nothing
  echo "Leave default shell as $SHELL"
else
  # Yes, change shell to /usr/bin/zsh
  chsh -s $zshPath
  echo "Your previous shell '$SHELL' has changed to '$zshPath'"
  echo "Re-login to apply changes"
fi

# Installation done!
echo "Succesfully install dotfiles"
