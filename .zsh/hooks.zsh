chpwd-ls() {
  if [[ $(ls -al | wc -l) -gt 32 ]]; then
    echo "so many files"
    return
  fi

  if hash "exa" >/dev/null 2>&1; then
    exa -ahl --git
  else
    ls -al
  fi
}

chpwd-rename-tmux() {
  autoload -Uz vcs_info
  vcs_info

  if [[ -n "$vcs_info_msg_0_" ]]; then
    dir="$(git rev-parse --show-toplevel)"
    IFS="/" read -Ar array <<<"$dir"
    tmux rename-window "${array[-2]}/${array[-1]}"
  else
    tmux rename-window "${PWD##*/}"
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd chpwd-ls
if hash "tmux" >/dev/null 2>&1; then
  add-zsh-hook chpwd chpwd-rename-tmux
fi
