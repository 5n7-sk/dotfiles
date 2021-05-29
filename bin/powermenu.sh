#!/usr/bin/env bash

lock=""
logout=""
reboot=""
shutdown=""
suspend="鈴"

options="$lock\n$logout\n$reboot\n$shutdown\n$suspend"

uptime=$(uptime -p | sed -e 's/up //g')

chosen="$(
  echo -e "$options" |
    rofi \
      -dmenu \
      -p "$uptime" \
      -theme "$HOME/.config/rofi/themes/powermenu.rasi"
)"

case $chosen in
"$lock")
  lock.sh
  ;;
"$logout")
  i3-msg exit
  ;;
"$reboot")
  systemctl reboot
  ;;
"$shutdown")
  systemctl poweroff
  ;;
"$suspend")
  systemctl suspend && lock.sh
  ;;
esac
