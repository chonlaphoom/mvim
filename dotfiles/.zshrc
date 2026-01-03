alias v=nvim
alias tree="lsd --tree --color=never"
alias ls="ls --color=auto"
alias ll="ls -la"
alias ..="cd .."
alias home="cd ~"
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias glog="git --no-pager log --oneline --graph --decorate --parents --all"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NOTE: go binaries are installed in $HOME/go/bin
if [[ ":$PATH:" != *":$HOME/go/bin:"* ]]; then
		export PATH="$PATH:$HOME/go/bin"
fi

# NOTE: that postgresql@15 is installed via homebrew in /opt/homebrew/opt/postgresql@15/bin
if [[ ":$PATH:" != *":/opt/homebrew/opt/postgresql@15/bin:"* ]]; then
		export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
fi

# NOTE: that python is installed via homebrew
if [[ ":$PATH:" != *":$(brew --prefix python)/libexec/bin:"* ]]; then
		export PATH="$(brew --prefix python)/libexec/bin:$PATH"
fi

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
