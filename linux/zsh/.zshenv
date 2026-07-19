# XDG base dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Default tools
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export PAGER="less"
export BROWSER="brave-origin-beta"

# PATH
path=(
    "$CARGO_HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.local/share/cargo/bin"
    "$HOME/.local/share/cargo/env"
    "$HOME/.local/share/npm/bin"
    "$(npm config get prefix)/bin"
    "$XDG_CONFIG_HOME/emacs/bin"
    $path
)
