if hash "brew" >/dev/null 2>&1; then
  fpath+="$(brew --prefix)/share/zsh/site-functions"
  autoload -Uz compinit && compinit
fi

if hash "asdf" >/dev/null 2>&1; then
  . $(brew --prefix asdf)/libexec/asdf.sh
fi
