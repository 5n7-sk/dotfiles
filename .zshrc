if [[ -f "$HOME/.fzf.zsh" ]]; then
  source "$HOME/.fzf.zsh"
fi

if [[ -f "$HOME/.p10k.zsh" ]]; then
  source "$HOME/.p10k.zsh"
fi

source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/completion.zsh"
source "$HOME/.zsh/general.zsh"
source "$HOME/.zsh/history.zsh"
source "$HOME/.zsh/keymap.zsh"
source "$HOME/.zsh/zinit.zsh"
