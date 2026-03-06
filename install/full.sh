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

paru -S --noconfirm --needed fzf
paru -S --noconfirm --needed btop
paru -S --noconfirm --needed bc
paru -S --noconfirm --needed tldr
paru -S --noconfirm --needed rofi-wayland
# Switch to nvm
paru -S --noconfirm --needed nodejs npm bun
paru -S --noconfirm --needed go
paru -S --noconfirm --needed gimp
paru -S --noconfirm --needed stylua
