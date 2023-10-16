#! /bin/bash

set -e

sudo apt install -y cmake make gettext

mkdir -p ~/src
cd ~/src

if [[ ! -d neovim ]];
then
	git clone https://github.com/neovim/neovim
fi

cd neovim

make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

echo 'Finished.'
