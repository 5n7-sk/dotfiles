# exit if not interactive shell
# if [[ $- != *i* ]]; then return; fi

# basic
export EDITOR="nvim"
export LANG="en_US.UTF-8"
export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Docker
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"

# go
export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# python
export PATH="$HOME/.poetry/bin:$PATH"

# dotfiles
export DOTFILES="$HOME/src/github.com/skmatz/dotfiles"
export PATH="$DOTFILES/bin:$PATH"

# vin
export PATH="$HOME/.vin/bin:$PATH"

# starship
if hash "starship" >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# local
[[ -f "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
