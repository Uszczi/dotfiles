#!/bin/bash

sudo apt update
sudo apt upgrade

sudo apt install -y curl make cmake ninja-build gettext libtool-bin cmake g++ pkg-config unzip 
sudp apt install -y libssl-dev liblzma-dev # pyenv
sudo apt install -y thefuck exa python3-pip suckless-tools fd-find ripgrep tmux nitrogen fzf


if [ ! -e ~/src/neovim ] 
then
    git clone https://www.github.com/neovim/neovim ~/src/neovim
    cd ~/src/neovim
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
fi

if [ ! -e /usr/bin/1password ] 
then
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    sudo apt update && sudo apt install 1password
fi

if [ ! -e /usr/bin/fish ]
then
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt update
    sudo apt install -y fish

    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fi


if [ ! -e ~/.local/bin/qtile ]
then
    pip install xcffib qtile
    sudo curl https://raw.githubusercontent.com/qtile/qtile/master/resources/qtile.desktop --output  /usr/share/xsessions/qtile.desktop
fi


if [ ! -e ~/.local/kitty.app/bin/kitty ]
then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi


if [ ! -e ~/.pyenv/bin/pyenv ]
then
    curl https://pyenv.run | bash
fi



cd ~/dotfiles
python3 dotbot/bin/dotbot -c install.conf.yaml
