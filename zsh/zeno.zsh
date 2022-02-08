export ZENO_ENABLE_FZF_TMUX=1
export ZENO_FZF_COMMAND="fzf --layout reverse"
export ZENO_ENABLE_SOCK=1

if [[ -n $ZENO_LOADED ]]; then
  bindkey ' ' zeno-auto-snippet
  bindkey '^I' zeno-completion
fi
