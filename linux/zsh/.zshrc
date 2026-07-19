ZSH_CONF="$HOME/.config/zsh"

# ---- Zinit bootstrap ----
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# -------------------------

# ---- Sourcing files ----
source "$ZSH_CONF/options.zsh"
source "$ZSH_CONF/completion.zsh"
source "$ZSH_CONF/plugins.zsh"
source "$ZSH_CONF/aliases.zsh"
source "$ZSH_CONF/functions.zsh"
source "$ZSH_CONF/keybinds.zsh"
# ------------------------

# ---- Evals ----
eval "$(zoxide init zsh)"
# ---------------

# ---- Prompt (theme) ----
# Disable Starship theme in plain TTY
if [[ "$TERM" != "linux" ]]; then
    eval "$(starship init zsh)"
fi
# ------------------------

# ---- Post-load ----
greet --name $USER --image $HOME/Pictures/zsh/tokyo-night.png
# -------------------
