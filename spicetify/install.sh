#!/usr/bin/env bash

set -eu

SPICETIFY_DIR="$HOME/.spicetify"

if [[ ! -d $SPICETIFY_DIR ]]; then
  curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
  mv "$HOME"/spicetify-cli "$SPICETIFY_DIR"
fi

sudo chmod a+rw /opt/spotify
sudo chmod a+rw /opt/spotify/Apps -R

SPICETIFY_CONFIG_DIR="$HOME/.config/spicetify"
if [[ ! -d "$SPICETIFY_CONFIG_DIR" ]]; then
  "$SPICETIFY_DIR"/spicetify
  "$SPICETIFY_DIR"/spicetify backup
fi

THEMES_DIR="$SPICETIFY_CONFIG_DIR/Themes"
TMP_DIR="$SPICETIFY_DIR/tmp"

if [[ ! $(ls -A "$THEMES_DIR") ]]; then
  git clone --depth 1 https://github.com/morpheusthewhite/spicetify-themes "$TMP_DIR"
  cd "$TMP_DIR"
  mkdir -p "$THEMES_DIR"
  cp -r * "$THEMES_DIR"
  rm -fr "$TMP_DIR"
fi

# cd "$THEMES_DIR/Dribbblish"
# cp dribbblish.js ../../Extensions

# "$SPICETIFY_DIR/spicetify" config current_theme Dribbblish color_scheme beach-sunset
# "$SPICETIFY_DIR/spicetify" config extensions dribbblish.js
# "$SPICETIFY_DIR/spicetify" config inject_css 1 replace_colors 1 overwrite_assets 1

cd "$THEMES_DIR/Sleek"
"$SPICETIFY_DIR/spicetify" config current_theme Sleek color_scheme Coral

# awesome custom-apps
"$SPICETIFY_DIR/spicetify" config custom_apps lyrics-plus
"$SPICETIFY_DIR/spicetify" config custom_apps new-releases

# awesome extensions
"$SPICETIFY_DIR/spicetify" config extensions fullAppDisplay.js
"$SPICETIFY_DIR/spicetify" config extensions popupLyrics.js

"$SPICETIFY_DIR/spicetify" apply
