# ##########
# config.sh
#
# Some configurations of my dotfiles
# ##########


# Name of my configuration directory
# Assume it should be places in ~/
export confDir="dotfiles"

# Array of files those should be linked
# export array variable HACK
# src: https://www.unix.com/shell-programming-and-scripting/84104-export-arrays-ksh.html
array_separator='
' ## a newline character
array=( .vim .vimrc .gitconfig .tmux .tmux.conf .zshrc .zshrc.local )
linkFilesArray=$( printf "%s$array_separator" "${array[@]}"  )
export array_separator linkFilesArray
