alias v=nvim
alias vi=v
alias tree="lsd --tree --color=never"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# go binary
export PATH=$PATH:$HOME/go/bin

# postgressql
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

export PATH="$PATH:/Users/chonlaphoom/projects/worldbanc/private/bin"

# python
export PATH="$(brew --prefix python)/libexec/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
