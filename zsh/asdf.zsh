if [[ -d "$HOME/.asdf" ]]; then
  . "$HOME/.asdf/asdf.sh"

  fpath+="$ASDF_DIR/completions"
  autoload -Uz compinit && compinit
fi
