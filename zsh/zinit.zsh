if [[ ! -f "$HOME/.zinit/bin/zinit.zsh" ]]; then
  sh -c "$(curl -L https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

source "$HOME/.zinit/bin/zinit.zsh"

zinit wait lucid light-mode for \
  agkozak/zsh-z \
  darvid/zsh-poetry \
  mollifier/cd-gitroot \
  NullSense/fuzzy-sys \
  paulirish/git-open \
  reegnz/jq-zsh-plugin \
  wfxr/forgit \
  zdharma/fast-syntax-highlighting \
  zsh-users/zsh-autosuggestions
