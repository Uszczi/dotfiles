#! /bin/bash

sudo apt -y update & sudo apt -y upgrade
sudo apt-get -y update & sudo apt-get -y upgrade

sudo apt install fish exa ripgrep fd-find flameshot blueman tmux guake

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
echo "Rust and Cargo has to be install by hand"
echo "curl https://sh.rustup.rs -sSf | sh"


