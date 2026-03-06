#!/usr/bin/bash

set -euo pipefail

if [[ ! -d "$HOME/paru" ]]; then
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git ~/paru
    pushd ~/paru
    makepkg -si
    popd
else
    echo "Paru installed, skipped."
fi
