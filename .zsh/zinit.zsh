if [[ ! -f "$HOME/.zinit/bin/zinit.zsh" ]]; then
  sh -c "$(curl -L https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

source "$HOME/.zinit/bin/zinit.zsh"

zinit light romkatv/powerlevel10k

zinit wait lucid light-mode for \
  mollifier/cd-gitroot \
  zdharma/fast-syntax-highlighting \
  zsh-users/zsh-autosuggestions

zinit snippet OMZ::plugins/dotenv/dotenv.plugin.zsh
