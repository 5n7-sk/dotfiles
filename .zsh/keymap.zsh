bindkey "\ef" emacs-forward-word

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "^[[3~" delete-char

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

fzf::docker-remove-images() {
  local images="$(docker images | tail +2 | sort | fzf --multi | awk '{print $3}')"
  [[ -z "$images" ]] && return
  docker rmi $images
}

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
