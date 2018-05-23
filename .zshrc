source $HOME/dotfiles/antigen.zsh

# raspbian gcc toolchain for cross compile
# export PATH=$PATH:~/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles
antigen bundle git
antigen bundle pip
antigen bundle pyenv
antigen bundle docker
antigen bundle gem
antigen bundle osx
antigen bundle sudo
antigen bundle tmux
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle dirhistory
antigen bundle autojump
antigen bundle common-aliases
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting


# Load the theme.
BULLETTRAIN_PROMPT_ORDER=(
  context
  dir
  git
	status
)
BULLETTRAIN_CONTEXT_BG=red

antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# Tell Antigen that you're done.
antigen apply


# User aliases
alias rake="noglob bundle exec rake"
alias "cd.."="cd .."
alias "dcc"="docker-compose"

