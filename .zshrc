# .zshrc

# Helper functions
containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}


source $HOME/dotfiles/antigen.zsh


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


pkgs=("")

# Load zshrc local machine settings
[ -f .zshrc.local ] && source .zshrc.local


# Load the theme.
BULLETTRAIN_PROMPT_ORDER=(
  context
  dir
  git
	status
)

if (( ${+CONTEXT_BG_COLOR} )); then
  BULLETTRAIN_CONTEXT_BG=$CONTEXT_BG_COLOR
else
  BULLETTRAIN_CONTEXT_BG=red
fi

antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train


# Tell Antigen that you're done.
antigen apply


# User aliases
alias rake="noglob bundle exec rake"
alias "cd.."="cd .."
alias "dcc"="docker-compose"


# Active rbenv if needed
if containsElement "rbenv" "${pkgs[@]}"; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
  eval "$(rbenv init -)"
fi

