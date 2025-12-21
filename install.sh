#!/usr/bin/env bash

set -e

term=$(readlink -f "$(command -v x-terminal-emulator)")

case "$term" in
  *gnome-terminal*)
    app_exec_command="gnome-terminal --full-screen --"
    ;;
  *alacritty*)
    app_exec_command="$term --option 'windows.startup_mode="Fullscreen"'"
    ;;
  *kitty*)
    app_exec_command="$term --start-as fullscreen"
    ;;
  *xterm*)
    app_exec_command="$term -fullscreen"
    ;;
  *terminator*)
    app_exec_command="$term --fullscreen --borderless"
    ;;
  *koi8rxterm*)
    app_exec_command="$term -fullscreen"
    ;;
  *xfce4*)
    app_exec_command="xfce4-terminal --hide-toolbar --hide-menubar --hide-scrollbar --fullscreen"
    ;;
  *)
    echo "No terminal emulator found" >&2
    exit 1
    ;;
esac

APP_DIR="$HOME/.local/share/NeoLaunch"
BIN_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"

mkdir -p "$APP_DIR" "$BIN_DIR" "$DESKTOP_DIR"

cp matrix.sh "$BIN_DIR/"
cp assets/matrix.png "$APP_DIR/"

cat > "$DESKTOP_DIR/NeoLaunch.desktop" <<EOF
[Desktop Entry]
Name=NeoLaunch
Comment=Fullscreen Matrix animation in Alacritty
Exec=$app_exec_command -e $BIN_DIR/matrix.sh
Icon=$APP_DIR/matrix.png
Terminal=true
Type=Application
Categories=Utility;Fun;
EOF

update-desktop-database "$DESKTOP_DIR"

echo "neo-launch installed!"
