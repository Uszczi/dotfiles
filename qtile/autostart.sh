#! /bin/bash

set-random-wallpaper
xrandr --output "eDP1"  --right-of "HDMI2" &
# /bin/emacs  --daemon &
guake &
sudo systemctl start docker.service

