export ZENO_ENABLE_SOCK=1
export ZENO_FZF_COMMAND="fzf --layout reverse"

if [[ -n $ZENO_LOADED ]]; then
  bindkey ' ' zeno-auto-snippet
  bindkey '^I' zeno-completion
fi
