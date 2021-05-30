if [[ -d "$HOME/.asdf" ]]; then
  . "$HOME/.asdf/asdf.sh"
  fpath+="$ASDF_DIR/completions"
fi
