# <img src="assets/matrix.png" width="32" height="32"> NeoLaunch
A Linux desktop application that opens terminal in fullscreen and runs a Matrix-style animation.

## Motivation

This project was created to bridge the gap between command-line knowledge and desktop-level application integration, demonstrating:

- Linux desktop entries (.desktop)
- Application icons
- Terminal emulator automation
- Bash scripting
- Fullscreen window handling
- User-level application installation

## Requirements

The following dependencies must be installed on the system:

- [alacritty](https://github.com/alacritty/alacritty) (terminal emulator)
- cmatrix (terminal animation)

```bash
sudo apt update
sudo apt install alacritty cmatrix
```
## Installation

```bash
git clone https://github.com/aldenpower/NeoLaunch.git
cd NeoLaunch

./install.sh
```
## Usage
Launch "NeoLaunch" from your application menu.

## Tested versions

| Distro       | DE / WM | Terminal  | Result |
|--------------|---------|-----------|--------|
| Ubuntu       | GNOME   | Alacritty | ✅ OK |
| Debian       | GNOME   | Alacritty | ✅ OK |
