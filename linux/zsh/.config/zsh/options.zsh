HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY AUTO_PUSHD PUSHD_IGNORE_DUPS CORRECT NO_BEEP autocd extendedglob nomatch 

export FZF_DEFAULT_OPTS="
  --color=bg+:#1e2030,bg:#1e1e2e,spinner:#f4dbd6,hl:#ed8796
  --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6
  --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796
"
