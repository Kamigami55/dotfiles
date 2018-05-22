#!/bin/bash


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


# Create file links
cd ~/
if [ -e .vimrc ]; then
	mv .vimrc .vimrc-old
fi
ln -s ~/dotfiles/.vimrc .vimrc

if [ -e .vim ]; then
	mv .vim .vim-old
fi
ln -s ~/dotfiles/.vim .vim

if [ -e .gitconfig ]; then
	mv .gitconfig .gitconfig-old
fi
ln -s ~/dotfiles/.gitconfig .gitconfig

if [ -e .tmux.conf ]; then
	mv .tmux.conf .tmux.conf-old
fi
ln -s ~/dotfiles/.tmux.conf .tmux.conf

if [ -e .tmux ]; then
	mv .tmux .tmux-old
fi
ln -s ~/dotfiles/.tmux .tmux

if [ -e .zshrc ]; then
	mv .zshrc .zshrc-old
fi
ln -s ~/dotfiles/.zshrc .zshrc

