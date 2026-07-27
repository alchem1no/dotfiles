# XDG base dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# XDG-ify tools that don't respect it by default
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"

# Default tools
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export PAGER="less"

# Deduplicate automatically, keep path/PATH tied together
typeset -gU path PATH fpath

# PATH
path=(
    "$CARGO_HOME/bin"
    "$NPM_CONFIG_PREFIX/bin"
    "$XDG_CONFIG_HOME/emacs/bin"
    "$HOME/.local/bin"
    $path
)
