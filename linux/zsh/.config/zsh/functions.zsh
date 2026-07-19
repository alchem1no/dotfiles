# Change directory and list its contents
cdls() {
    local -A opts
    zparseopts -D -E -A opts -- \
        a -all=a

    if (( ${+opts[-a]} )); then
        local params="-a"
    else
        local params=""
    fi

    cd "$1" || return
    if (( $+commands[eza] )); then
        eza $params
    else
        ls $params
    fi
}

# Greeting message shown on shell launch
greet() {
    local -A opts
    zparseopts -D -E -A opts -- \
        u -uppercase=u \
        n: -name:=n \
        i: -image:=i

    local name=${opts[--name]:-${opts[-n]:-$USER}}
    local msg="Hello, $name!"
    local image=${opts[--image]:-${opts[-i]}}

    # Image box in sells (not pixels)
    # Cells are ~2:1 tall:wide, so a square image needs img_h ≈ img_w /2
    # x = column where the image starts
    local img_w=15
    local img_h=8
    local img_gap=2 # rows to sit above the bottom of the image
    local img_margin=1
    local x=$(( COLUMNS - img_w - img_margin ))

    local has_image=0
    if [[ -n $KITTY_WINDOW_ID && -n $image ]]; then
        has_image=1

        # Reserve img_h rows (scrolls now, if the window is short),
        # them come back up to the top of the reserved block
        repeat $img_h print
        print -n -- "\e[${img_h}A"

        # Anchor: everything below is drawn relative to this settled position
        print -n -- "\e[s"
        kitty +kitten icat --align left --place ${img_w}x${img_h}@${x}x0 $image
        print -n -- "\e[u"
    fi

    # Greeting
    if [[ -v opts[--uppercase] || -v opts[-u] ]]; then
        print -r -- ${msg:u}
    else
        print -r -- $msg
    fi

    if (( $+commands[fortune] )); then
        print
        fortune -s | fmt -w $(( x - 2 ))
    fi

    # Jump unconditionally to just below the reserved block
    if (( has_image )); then
        print -n -- "\e[u\e[$(( img_h - img_gap ))B\r"
    fi
}

# Path-aware word deletion: temporarily narrows WORDCHARS so that
# backward-kill-word stops at `/` instead of eating an entire path.
# Bound to Ctrl+Backspace (^H in most terminals, ^[[127;5u in kitty).
backward-kill-dir() {
    local WORDCHARS='*?_-.[]~&;!#$%^(){}<>'
    zle backward-kill-word
}
zle -N backward-kill-dir

# Yazi integration
function y() {
    local tmp cwd
    tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
    zle && zle reset-prompt
}

# Neovim
function _open_nvim() {
    zle push-line # stash anything already typed
    BUFFER="v"
    zle accept-line
}
