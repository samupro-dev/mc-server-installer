#!/bin/bash

DONE="\e[0;32m ✔\e[0m"
ERROR="\e[0;31m ✘\e[0m"
YELLOW="\e[1;33m"
LIGHT_RED="\e[1;31m"
LIGHT_GREEN="\e[1;32m"
COLOR_NULL="\e[0m"
LIGHT_BLUE="\e[1;34m"
PURPLE="\e[0;35m"
CYAN="\e[0;36m"
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
echo -e "${YELLOW} Checking for administrative permissions. . . ${COLOR_NULL}\n"
sleep 2

if [ "$(id -u)" != "0" ] ; then
    echo -e "${ERROR} ${LIGHT_RED}This script requires root permissions. Please run this as root! ${COLOR_NULL}"
    exit 1
fi
echo -e " ${DONE} ${LIGHT_GREEN}Congratulations, this script will be run as root. ${COLOR_NULL}\n"

## packages ##
function check_package {
    local package="$1"
    local name="$2"
    if ! command -v "$package" &>/dev/null; then
        echo -e "${ERROR} ${LIGHT_RED} $name is required in order for this script to work. ${COLOR_NULL}"
        while true
        do
            echo -e -n "${YELLOW} Do you want to install $name (Y/n)? ${COLOR_NULL}"
            read install_package
            case "$install_package" in
                n|N|no|No|nO|NO) if [[ "$package" == "openjdk-17-jdk" ]]; then break; else exit 1; fi;;
                y|Y|yes|Yes|yEs|yeS|YEs|YeS|yES|YES) apt-get -y install "$package" || echo -e "$package could not be installed, please try to install it manually.${COLOR_NULL}"
                break;;
                *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect!${COLOR_NULL}";;
            esac
        done
    fi
    echo -e " ${YELLOW} $name is installed, the script will work fine! ${COLOR_NULL}"
    echo -e " "
}

check_package "wget" "wget"
check_package "curl" "curl"
check_package "openjdk-17-jdk" "java 17 [optional]"
check_package "jq" "jq"

echo -e "\n"

## servers types ##
function install_server {
    local script_url="$1"
    wget -O - "$script_url" | bash
    exit 0
}

echo -e "${LIGHT_GREEN} Hi, before starting I would like to know what kind of server to install. ${COLOR_NULL}"
SERVERTYPES=("Proxy" "Spigot" "Bedrock" "Modded" "Vanilla" "Cancel")
echo -e "${CYAN} Select the type of server that suits you best! ${COLOR_NULL}"
select OPTION in "${SERVERTYPES[@]}"; do
    case "$REPLY" in
    1) install_server 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/bungee.sh' ;;
    2) install_server 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/spigot.sh' ;;
    3) install_server 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/bedrock.sh' ;;
    4) install_server 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/modded.sh' ;;
    5) install_server 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/vanilla.sh' ;;
    6) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect!${COLOR_NULL}";;
    esac
done
echo -e "\n"
