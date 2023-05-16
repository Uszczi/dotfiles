#! /bin/bash

os=$(cat /etc/*-release | rg ^ID= | awk -F '=' '{print $2}')

if [[ "$os" == "ubuntu" ]]; then
  echo "hello"
  # compton &
  # guake &
  set-random-wallpaper
  # xrandr --output eDP-1 --mode 1920x1080 --pos 2560x360 --rotate normal --output HDMI-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-1 --off
  # xrandr --output eDP-1 --mode 1920x1080 --pos 0x360 --rotate normal --output HDMI-1 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output DP-1 --off
elif [[ "$os" == "arch" ]]; then

  xrandr --output "eDP1" --right-of "HDMI2" &

  set-random-wallpaper

  # /bin/emacs  --daemon &
  guake &
  sudo systemctl start docker.service
fi

# obsidian
