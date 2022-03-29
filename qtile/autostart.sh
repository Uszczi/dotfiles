#! /bin/bash

os=$(cat /etc/*-release | rg ^ID= | awk -F '=' '{print $2}')
echo $os


if [[ "$os" == "ubuntu" ]]; then
    compton &
    guake &
    nitrogen --restore &
    xrandr --output  "eDP-1" --right-of  "HDMI-1"
elif [[ "$os" == "arch" ]]; then
    set-random-wallpaper
    xrandr --output "eDP1"  --right-of "HDMI2" &
    # /bin/emacs  --daemon &
    guake &
    sudo systemctl start docker.service
fi
