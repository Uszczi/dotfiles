#! /bin/bash

set -euo pipefail

mkdir -p "$HOME/p"

APT_PACKAGES=(
	fish
	curl
	ripgrep
	fd-find
	flameshot
	blueman
	tmux
	guake
	fzf
	nnn
	gh
	cmake
	playerctl
	vlc
	ffmmpeg
)

SNAP_PACKAGES=(
	astral-uv
	obsidian
	todoist
	spotify
)

sudo apt -y update & sudo apt -y upgrade
sudo apt install -y "${APT_PACKAGES[@]}"
sudo apt autoremove -y

for package in "${SNAP_PACKAGES[@]}"; do
    sudo snap install "$package" --classic
done

if [[ ! -d "$HOME/.local/share/omf" ]]; then
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fi

if [[ ! -d "$HOME/.local/kitty.app" ]]; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

if [[ ! -d "$HOME/.local/share/fnm" ]]; then
    curl -fsSL https://fnm.vercel.app/install | bash
fi

# Cargo and rust has to be run by hand
echo "Rust and Cargo has to be installed by hand"
echo "curl https://sh.rustup.rs -sSf | sh"
