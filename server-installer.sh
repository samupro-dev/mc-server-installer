#!/bin/bash
## updated script ##
INSTALLER=$(wget -qO- 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/installer.sh') || { echo "Could not download the installer, check your internet connection."; exit 1; }
bash <(printf '%s\n' "$INSTALLER")
