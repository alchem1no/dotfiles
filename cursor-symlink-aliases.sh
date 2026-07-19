#!/bin/bash

status() {
    local source="$1"
    local target="$2"
    if [ $? -eq 0 ]; then
        echo "✓ $source -> $target"
#   else
#       echo "✗ Error: $source -> $target"
    fi
}

echo "Enter full path to cursors you want to create symlinks for"
read -p "> " path
path=$(eval echo "$path")

declare -A aliases=(
    [default]="left_ptr"
    [wait]="watch"
    [text]="xterm"
    [not-allowed]="crossed_circle"
    [move]="fleur"
    [alias]="dnd-link"
    [progress]="left_ptr_watch"
)

for source in "${!aliases[@]}"; do
    target="${aliases[$source]}"
    ln -s "$path/$source" "$path/$target"
    status "$source" "$target" $?
done
