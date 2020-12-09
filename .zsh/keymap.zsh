bindkey -v

bindkey -M viins "jj" vi-cmd-mode

bindkey -M viins "^U" backward-kill-line
bindkey -M viins "^W" backward-kill-word
bindkey -M viins "^K" kill-line

fzf::branch() {
  git switch $(git branch -a | tr -d " " | fzf --height 100% --preview "git log --color=always {}" | head -n 1 | sed -e "s/^\*\s*//g" | perl -pe "s/remotes\/origin\///g")
}
zle -N fzf::branch
bindkey "^B" fzf::branch

fzf::history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER")
  CURSOR=$#BUFFER
}
zle -N fzf::history
bindkey "^H" fzf::history

fzf::ghq() {
  cd $(ghq list -p | fzf --preview "bat --color=always --style=header {}/README.*")
}
zle -N fzf::ghq
bindkey "^G" fzf::ghq
