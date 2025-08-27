# ----- PATH -----
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# ----- Starship Prompt -----
eval "$(starship init zsh)"

# ----- Autocompletion -----
autoload -Uz compinit && compinit

# ----- History -----
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt sharehistory hist_ignore_all_dups hist_reduce_blanks

# ----- NVM (Node Version Manager) -----
export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  \. "/opt/homebrew/opt/nvm/nvm.sh" 2>/dev/null || echo "Warning: NVM initialization failed"
fi
if [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ]; then
  \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" 2>/dev/null
fi

# ----- Plugins -----
# zsh-autosuggestions (disabled due to parse error - may be version incompatibility)
# if [ -f "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
#   source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null || echo "Warning: zsh-autosuggestions failed to load"
# fi
# zsh-syntax-highlighting
if [ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null || echo "Warning: zsh-syntax-highlighting failed to load"
fi

# ----- zoxide (better cd) -----
eval "$(zoxide init zsh)"

# ----- Aliases -----
# Navigation
alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias doc="cd ~/Documents"
alias dl="cd ~/Downloads"
alias p="cd ~/projects"
alias reload="source ~/.zshrc"

# Git
alias g="git"
alias gs="git status"
alias gst="git stash"
alias gstp="git stash pop"
alias gl="git log --oneline --graph --decorate"
alias gp="git push"
alias gpl="git pull"
alias ga="git add ."
alias gc="git commit -am"
alias gd="git diff"
alias gb="git branch"
alias gco="git checkout"

# Outils
alias k="kubectl"
alias d="docker"
