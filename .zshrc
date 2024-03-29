# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"
# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
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
#antigen bundle pip
#antigen bundle pyenv
antigen bundle docker
#antigen bundle gem
antigen bundle macos
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
ZSHRC_LOCAL="$HOME/.zshrc.local"
[ -f "$ZSHRC_LOCAL" ] && source "$ZSHRC_LOCAL"

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

# Set prompt comtext background color (config in .zshrc.local, default is Magenta)
if (( ${+CONTEXT_BG_COLOR} )); then
  BULLETTRAIN_CONTEXT_BG=$CONTEXT_BG_COLOR
else
  BULLETTRAIN_CONTEXT_BG=magenta
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

# NPM
alias ns='npm start'
alias ni='npm install'
alias nci='npm ci'
alias nd='npm run dev'
alias nb='npm run build'

# Yarn
alias y='yarn'
alias ys='yarn start'
alias yb='yarn build'
alias ybt='yarn build:test'
alias ybp='yarn build:production'
alias yt='yarn test'
alias ytw='yarn test:watch'
alias yd='yarn dev'
alias yde='yarn develop'
alias yst='yarn storybook'
alias ya='yarn add'
alias yad='yarn add --dev'
alias yr='yarn remove'
alias ydp='yarn deploy'
alias ync='yarn new-component'
alias yc='yarn cypress'

# pnpm
alias pn="pnpm"
alias pi="pnpm install"
alias pd="pnpm dev"
alias pa="pnpm add"
alias pb='pnpm build'
alias pad="pnpm add --save-dev"
alias pr="pnpm remove"
alias pst='pnpm storybook'
alias pnc='pnpm new-component'
alias pnx="pnpm nx"

# Tauri
alias ptd="pnpm tauri dev"

# Gatsby
alias gd='gatsby develop'

# Tmux
alias tma='tmux a'

# Open in webstorm
alias webstorm='open -na "WebStorm.app" --args "$@"'

# ===============
# Active some modules
# ===============

# Active pyenv if needed (config in .zshrc.local)
if containsElement "pyenv" "${pkgs[@]}"; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

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

# Active fnm if needed (config in .zshrc.local)
if containsElement "fnm" "${pkgs[@]}"; then
  # https://github.com/Schniz/fnm#shell-setup
  eval "$(fnm env --use-on-cd)"
fi

# Active gvm if needed (config in .zshrc.local)
if containsElement "gvm" "${pkgs[@]}"; then
  [[ -s "/Users/eason_y_chang/.gvm/scripts/gvm" ]] && source "/Users/eason_y_chang/.gvm/scripts/gvm"

  _change_go_version() {
    if [ -f "go.mod" ]; then
      # local version=(`grep -Po "^go \K([0-9\.]*)$" go.mod`)
      local version=(`perl -nle'print $& while m{^go \K([0-9\.]*)$}g' go.mod`)
      gvm use ${version}
    fi
  }
  add-zsh-hook chpwd _change_go_version
  _change_go_version
fi

# Apply all Antigen settings (should be places in the very bottom of .zshrc)
antigen apply

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

PATH=~/.console-ninja/.bin:$PATH

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
