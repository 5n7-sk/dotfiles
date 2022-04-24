ASDF_ROOT="/opt/asdf-vm"
[[ -d "$ASDF_ROOT" ]] && . "$ASDF_ROOT/asdf.sh"

if hash "direnv" >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi
