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
	--ind-pos="w-540:h-400" \
	--time-color=2e3440ff \
	--time-str="%H:%M:%S" \
	--time-pos="ix:iy+200" \
	--time-font="Calvin and Hobbes" \
	--time-size=140 \
	--date-color=2e3440ff \
	--date-str="%A, %d %B" \
	--date-pos="tx:ty+120" \
	--date-font="Calvin and Hobbes" \
	--date-size=100
