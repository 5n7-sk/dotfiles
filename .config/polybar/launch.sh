#!/usr/bin/env bash

killall -q polybar
killall -q zscroll

while pgrep -u "$UID" -x polybar >/dev/null; do sleep 1; done

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  MONITOR=$m polybar -c ~/.config/polybar/config.ini main &
done
