# Vi mode
bindkey -v

# Better backspace in vi mode
bindkey '^?' backward-delete-char

# Ctrl+arrows for word jumping
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Ctrl+Backspace for word-by-word deletion
bindkey '^H' backward-kill-dir         # 0x08, most terminals
bindkey '^[[127;5u' backward-kill-dir  # kitty keyboard protocol

# Home/End keys
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Yazi keybind
zle -N y
bindkey '^f' y

# Neovim keybind
zle -N _open_nvim
bindkey '^N' _open_nvim

# Fzf keybinds
# Ctrl + R - fuzzy history search
# Ctrl + T - fuzzy file search
# Alt  + C - fuzzy cd into a directory
source <(fzf --zsh)
