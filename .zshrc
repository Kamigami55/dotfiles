# .zshrc

# ===============
# Helper functions
# ===============

# Check whether a element is in a array
containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}


# ===============
# Use antigen to manage zsh plugins
# ===============

source $HOME/dotfiles/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# My Bundles
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


# ===============
# Load local configs from .zshrc.local
# ===============

# Default config values (may be changed when local .zshrc.local)
pkgs=("")
export TMUX_THEME='powerline/block/orange'

# Load local machine settings from .zshrc.local
[ -f .zshrc.local ] && source .zshrc.local


# ===============
# Appearence (User Interface)
# ===============

# Set prompt order of bullet-train theme
BULLETTRAIN_PROMPT_ORDER=(
  context
  dir
  git
	status
)

# Set prompt comtext background color (config in .zshrc.local, default is Red)
if (( ${+CONTEXT_BG_COLOR} )); then
  BULLETTRAIN_CONTEXT_BG=$CONTEXT_BG_COLOR
else
  BULLETTRAIN_CONTEXT_BG=red
fi

# Use theme: bullet-train
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# ===============
# User aliases
# ===============

# Basic
alias "cd.."="cd .."

# Ruby
alias rake="noglob bundle exec rake"

# Docker
alias "dcc"="docker-compose"

# Yarn
alias ys='yarn start'
alias yb='yarn build'
alias ybt='yarn build:test'
alias ybp='yarn build:production'
alias yt='yarn test'

# Tmux
alias tma='tmux a'

# ===============
# Active some modules
# ===============

# Active rbenv if needed (config in .zshrc.local)
if containsElement "rbenv" "${pkgs[@]}"; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Active nvm if needed (config in .zshrc.local)
if containsElement "nvm" "${pkgs[@]}"; then
  # TODO: only tested in MacOSX, and nvm was installed by brew
  # other platform may cause error
  #source /usr/local/opt/nvm/nvm.sh
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # Auto switch node version by nvm when enter directory that contains .nvmrc
  # place this after nvm initialization!
  autoload -U add-zsh-hook
  load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$node_version" ]; then
        nvm use
      fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi

# Apply all Antigen settings (should be places in the very bottom of .zshrc)
antigen apply

