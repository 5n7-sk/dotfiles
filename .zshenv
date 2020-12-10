# basic
export EDITOR="nvim"
export LANG="en_US.UTF-8"
export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# Docker
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"

# fzf
export PATH="$HOME/.fzf/bin:$PATH"

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
