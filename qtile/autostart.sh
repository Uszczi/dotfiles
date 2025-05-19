#! /bin/bash
set -euo pipefail

os=$(cat /etc/*-release | rg ^ID= | awk -F '=' '{print $2}')

~/dotfiles/tools/set-random-wallpaper

if [[ "$os" == "ubuntu" ]]; then
  set-random-wallpaper
elif [[ "$os" == "arch" ]]; then
  set-random-wallpaper
  sudo systemctl start docker.service
fi
