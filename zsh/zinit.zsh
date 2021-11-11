if [[ ! -f "$HOME/.zinit/bin/zinit.zsh" ]]; then
  sh -c "$(curl -L https://raw.githubusercontent.com/zdharma-continuum/zinit/master/doc/install.sh)"
fi

source "$HOME/.zinit/bin/zinit.zsh"

zinit wait lucid light-mode for \
  agkozak/zsh-z \
  mollifier/cd-gitroot \
  NullSense/fuzzy-sys \
  paulirish/git-open \
  reegnz/jq-zsh-plugin \
  wfxr/forgit \
  zdharma-continuum/fast-syntax-highlighting \
  zsh-users/zsh-autosuggestions
