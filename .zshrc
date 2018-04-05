source $HOME/unix-settings/antigen.zsh


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




