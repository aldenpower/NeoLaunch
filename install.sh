#!/usr/bin/env bash

set -e

check_dep() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Error: '$1' is not installed."
    exit 1
  }
}

check_dep alacritty
check_dep cmatrix

echo "All dependencies satisfied."

APP_DIR="$HOME/.local/share/NeoLaunch"
BIN_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"

mkdir -p "$APP_DIR" "$BIN_DIR" "$DESKTOP_DIR"

cp matrix.sh "$BIN_DIR/"
cp icon/matrix.png "$APP_DIR/"

cat > "$DESKTOP_DIR/NeoLaunch.desktop" <<EOF
[Desktop Entry]
Name=NeoLaunch
Comment=Fullscreen Matrix animation in Alacritty
Exec=alacritty --option 'window.startup_mode="Fullscreen"' -e $BIN_DIR/matrix.sh
Icon=$APP_DIR/matrix.png
Terminal=true
Type=Application
Categories=Utility;Fun;
EOF

update-desktop-database "$DESKTOP_DIR"

echo "NeoLaunch installed!"
