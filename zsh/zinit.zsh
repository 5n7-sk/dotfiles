ZINIT_PATH="$HOME/.local/share/zinit/zinit.git/zinit.zsh"

if [[ ! -f "$ZINIT_PATH" ]]; then
  sh -c "$(curl -L https://git.io/zinit-install)"
fi

source "$ZINIT_PATH"

zinit wait lucid light-mode for \
  agkozak/zsh-z \
  mollifier/cd-gitroot \
  NullSense/fuzzy-sys \
  paulirish/git-open \
  reegnz/jq-zsh-plugin \
  wfxr/forgit \
  zdharma-continuum/fast-syntax-highlighting \
  zsh-users/zsh-autosuggestions
