#! /bin/bash

os=$(cat /etc/*-release | rg ^ID= | awk -F '=' '{print $2}')
echo $os


if [[ "$os" == "ubuntu" ]]; then
    compton &
    guake &
    set-random-wallpaper
    xrandr --output  "eDP-1" --right-of  "HDMI-1"
elif [[ "$os" == "arch" ]]; then
    xrandr --output "eDP1"  --right-of "HDMI2" &
    set-random-wallpaper
    # /bin/emacs  --daemon &
    guake &
    sudo systemctl start docker.service
fi
