# Login-shell only. XDG/PATH live in .zshenv

# Host-specific browser
if [[ -n "$WSL_DISTRO_NAME" ]]; then
    export BROWSER="wslview"
else
    export BROWSER="brave-origin-beta"
fi
