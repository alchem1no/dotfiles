# Navigation
alias ...='cd ../..'

# Listing
alias ls='eza --icons=auto'
alias ll='eza -lh --icons=auto --git'
alias la='eza -lah --icons=auto --git'
alias lt='eza --tree --icons=auto'

alias eza='eza --icons=auto'

# Cat
alias cat='bat --paging=never'
alias catp='bat --paging=always'

# df/du
alias df='df -h'
alias du='du -h'

# Safety nets (use trash-put instead of rm btw)
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Shortcuts
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias g='git'
alias gc='git clone'
alias c='clear'
alias q='exit'

# Dotfiles
alias zshrc='nvim ~/.zshrc'
alias reload='source ~/.zshrc'

# Global aliases
alias -g L='| less'
# alias -g G='| rg'
alias -g N='| nvim -'

# Suffix aliases
alias -s pdf='zathura'
alias -s md='nvim'
alias -s png='img'
