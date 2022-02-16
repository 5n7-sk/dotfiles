if hash "brew" >/dev/null 2>&1; then
  fpath+="$(brew --prefix)/share/zsh/site-functions"
  autoload -Uz compinit && compinit
fi
