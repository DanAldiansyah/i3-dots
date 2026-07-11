# Path:
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Zsh History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt correct

setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_expire_dups_first

# Autocompletion Zsh
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Aliases
alias ls="ls --color=auto"
alias la="ls -a"
alias cls="clear"

# Plugin Autosuggestions
source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Plugin Syntax Highlighting
source ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship Prompt
eval "$(starship init zsh)"
