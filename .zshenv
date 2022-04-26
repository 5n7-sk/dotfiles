export EDITOR="nvim"
export LANG="en_US.UTF-8"
export PATH="$HOME/.local/bin:$PATH"

# Docker
[[ $(uname -s) == "Linux" ]] && export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"

# dotfiles
export DOTFILES="$HOME/src/github.com/5n7/dotfiles"
export PATH="$DOTFILES/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Starship
if hash "starship" >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# XDG
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# local
[[ -f "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
