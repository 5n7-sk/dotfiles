alias s="source "$HOME/.zshrc" && source "$HOME/.zshenv""

alias apu="sudo apt update && sudo apt upgrade -y"

alias -g G="| grep"
alias -g H="| head"
alias -g L="| less"
alias -g T="| tail"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias ghhome="cd "$HOME/src/github.com/skmatz""
alias gohome="cd "$GOPATH/src/github.com/skmatz""

if [[ -d "$HOME/Desktop" ]]; then
  alias de="cd "$HOME/Desktop""
fi

if [ -d "$HOME/Downloads" ]; then
  alias dl="cd "$HOME/Downloads""
fi

if [ -d "$HOME/Dropbox" ]; then
  alias dr="cd "$HOME/Dropbox""
fi

if [ -d "$HOME/sandbox" ]; then
  alias sb="cd "$HOME/sandbox""
fi

alias h="history"
alias open="xdg-open"

alias cp="cp -ir"
alias mkdir="mkdir -p"
alias mv="mv -i"

if hash "docker" >/dev/null 2>&1; then
  alias d="docker"
  alias dim="docker images"
  alias dps="docker ps"
  alias dpsa="docker ps -a"
fi

if hash "docker-compose" >/dev/null 2>&1; then
  alias dc="docker-compose"
fi

if hash "exa" >/dev/null 2>&1; then
  alias l="exa -hl --git"
  alias la="exa -ahl --git"
  alias ls="exa"
else
  alias l="ls -l"
  alias la="ls -al"
fi

if hash "git" >/dev/null 2>&1; then
  alias g="git"
  alias ga="git add"
  alias gb="git branch"
  alias gc="git commit"
  alias gco="git checkout"
  alias gcp="git cherry-pick"
  alias gd="git diff"
  alias gf="git fetch"
  alias gl="git log"
  alias gm="git merge"
  alias gp="git push"
  alias gpl="git pull"
  alias gplo="git pull origin"
  alias gpo="git push origin"
  alias gr="git rebase"
  alias gs="git status"
  alias gst="git stash"
  alias gsw="git switch"
fi

if hash "gitui" >/dev/null 2>&1; then
  alias gu="gitui"
fi

if hash "gomi" >/dev/null 2>&1; then
  alias rm="gomi"
fi

if hash "htop" >/dev/null 2>&1; then
  alias top="htop"
fi

if hash "kubectl" >/dev/null 2>&1; then
  alias k="kubectl"
fi

if hash "nvim" >/dev/null 2>&1; then
  alias v="nvim"
fi

if hash "poetry" >/dev/null 2>&1; then
  alias po="poetry run"
  alias pp="poetry run python"
  alias popup="poetry run pip install --upgrade pip"

  pdev() {
    poetry add -D black flake8 isort pytest
  }
fi

if hash "python" >/dev/null 2>&1; then
  alias pipup="pip install --upgrade pip"
  alias py="python"
  alias py2="python2"
  alias py3="python3"
  alias venv="python -m venv .venv && source .venv/bin/activate"
fi

if hash "tmux" >/dev/null 2>&1; then
  alias tt="tmux attach -t default || tmux new -s default"
fi

if hash "xsel" >/dev/null 2>&1; then
  alias pbc="xsel --clipboard --input"
  alias pbp="xsel --clipboard --output"
fi

ghg() {
  curl -Ls https://api.github.com/repos/$1/releases/latest | jq -r ".assets[].browser_download_url" | fzf | wget -i -
}

mkcd() {
  mkdir -p $1
  cd $1
}

mozc-restart() {
  killall ibus-daemon
  ibus-daemon -d -x &
}

targz() {
  tar -cvzf $1.tar.gz $1
}
