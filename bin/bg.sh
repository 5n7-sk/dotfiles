#!/usr/bin/env sh

# This script prints the (dir) path to the bg image(s).
# Create ~/.bgrc and write the (dir) path to the bg image(s) to customize.

BGRC="$HOME/.bgrc"
DEFAULT="$DOTFILES/images/bg/default"

if [ -f "$BGRC" ]; then
  head -1 "$BGRC"
else
  echo "$DEFAULT"
fi
