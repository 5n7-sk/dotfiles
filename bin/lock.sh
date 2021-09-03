#!/usr/bin/env sh

i3lock \
  --nofork \
  --no-unlock-indicator \
  --image="$DOTFILES/images/calvin-and-hobbes.jpg" \
  --ignore-empty-password \
  --tiling \
  \
  --clock \
  --pass-media-keys \
  --pass-screen-keys \
  --pass-power-keys \
  --pass-volume-keys \
  --indpos="w-540:h-400" \
  --timecolor=2e3440ff \
  --timestr="%H:%M:%S" \
  --timepos="ix:iy+200" \
  --time-font="Calvin and Hobbes" \
  --timesize=140 \
  --datecolor=2e3440ff \
  --datestr="%A, %d %B" \
  --datepos="tx:ty+120" \
  --date-font="Calvin and Hobbes" \
  --datesize=100
