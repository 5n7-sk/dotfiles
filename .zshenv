# exit if not interactive shell
# if [[ $- != *i* ]]; then return; fi

# basic
export EDITOR="nvim"
export LANG="en_US.UTF-8"

# XDG
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Docker
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Python
export PATH="$HOME/.poetry/bin:$PATH"

# dotfiles
export DOTFILES="$HOME/src/github.com/skmatz/dotfiles"
export PATH="$DOTFILES/bin:$PATH"

# vin
export PATH="$HOME/.vin/bin:$PATH"

# Starship
if hash "starship" >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# local
[[ -f "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
