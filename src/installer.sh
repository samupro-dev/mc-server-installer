#!/bin/bash
COMMON=$(wget -qO- https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/common.sh) || { echo "Could not download common.sh, check your internet connection."; exit 1; }
# shellcheck source=src/common.sh
source /dev/stdin <<< "$COMMON"
declare -F die >/dev/null || { echo "Could not load common.sh, please try again later."; exit 1; }
VERSION=$(wget -qO- https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/version.sh)

clear
echo -e "\n${PURPLE}  ██████  ▄▄▄       ███▄ ▄███▓ █    ██  ██▓███   ██▀███   ▒█████
▒██    ▒ ▒████▄    ▓██▒▀█▀ ██▒ ██  ▓██▒▓██░  ██▒▓██ ▒ ██▒▒██▒  ██▒
░ ▓██▄   ▒██  ▀█▄  ▓██    ▓██░▓██  ▒██░▓██░ ██▓▒▓██ ░▄█ ▒▒██░  ██▒
  ▒   ██▒░██▄▄▄▄██ ▒██    ▒██ ▓▓█  ░██░▒██▄█▓▒ ▒▒██▀▀█▄  ▒██   ██░
▒██████▒▒ ▓█   ▓██▒▒██▒   ░██▒▒▒█████▓ ▒██▒ ░  ░░██▓ ▒██▒░ ████▓▒░
▒ ▒▓▒ ▒ ░ ▒▒   ▓▒█░░ ▒░   ░  ░░▒▓▒ ▒ ▒ ▒▓▒░ ░  ░░ ▒▓ ░▒▓░░ ▒░▒░▒░
░ ░▒  ░ ░  ▒   ▒▒ ░░  ░      ░░░▒░ ░ ░ ░▒ ░       ░▒ ░ ▒░  ░ ▒ ▒░
░  ░  ░    ░   ▒   ░      ░    ░░░ ░ ░ ░░         ░░   ░ ░ ░ ░ ▒
      ░        ░  ░       ░      ░                 ░         ░ ░
                https://github.com/samupro-dev
                                                  v${VERSION}${COLOR_NULL}\n"
echo -e "${LIGHT_BLUE} This script makes it easy to install a minecraft server. ${COLOR_NULL}\n"
sleep 1
echo -e "${YELLOW} Checking the requirements. . . ${COLOR_NULL}\n"
sleep 2

if [ "$EUID" -eq 0 ]; then
    echo -e " ${DONE} ${LIGHT_GREEN}The script is running as root. ${COLOR_NULL}"
    warn "Running a minecraft server as root is not recommended, consider using a dedicated user.\n"
else
    echo -e " ${DONE} ${LIGHT_GREEN}The server will be installed for the user $(id -un). ${COLOR_NULL}\n"
fi

## packages ##
function check_package { # check_package <package> [note]: a note marks the package as optional
    local install_it
    if command -v "$1" &>/dev/null; then
        echo -e " ${DONE} ${YELLOW}$1 is installed. ${COLOR_NULL}"
        return
    fi
    echo -e "${ERROR} ${LIGHT_RED} $1 is required${2:+ $2} in order for this script to work. ${COLOR_NULL}"
    ask_yes_no install_it "Do you want to install $1?" y
    if [ "$install_it" = true ] && install_package "$1"; then
        echo -e " ${DONE} ${LIGHT_GREEN}$1 has been installed. ${COLOR_NULL}"
    elif [ -n "$2" ]; then
        warn "Continuing without $1."
    else
        die "$1 is missing, please install it manually."
    fi
}

check_package wget
check_package curl
check_package jq
check_package unzip
check_package git "[for Spigot jar only, not Paper etc.]"

echo -e "\n"

## servers types ##
echo -e "${LIGHT_GREEN} Hi, before starting I would like to know what kind of server to install. ${COLOR_NULL}"
echo -e "${CYAN} Select the type of server that suits you best! ${COLOR_NULL}"
choose TYPE "Proxy" "Spigot" "Bedrock" "Modded" "Vanilla"
body=$(wget -qO- "https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/${TYPE,,}.sh") || die "Could not download ${TYPE,,}.sh, check your internet connection."
# the sub-script reuses this common.sh, so both come from the same version
MCSI_COMMON="$COMMON" bash <(printf '%s\n' "$body")
