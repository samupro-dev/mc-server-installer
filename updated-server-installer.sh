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
WHITE="\e[1;37m"
LIGHT_PURPLE="\e[1;35m"

clear
echo -e "\n"
echo -e "${PURPLE}  ██████  ▄▄▄       ███▄ ▄███▓ █    ██  ██▓███   ██▀███   ▒█████  
▒██    ▒ ▒████▄    ▓██▒▀█▀ ██▒ ██  ▓██▒▓██░  ██▒▓██ ▒ ██▒▒██▒  ██▒
░ ▓██▄   ▒██  ▀█▄  ▓██    ▓██░▓██  ▒██░▓██░ ██▓▒▓██ ░▄█ ▒▒██░  ██▒
  ▒   ██▒░██▄▄▄▄██ ▒██    ▒██ ▓▓█  ░██░▒██▄█▓▒ ▒▒██▀▀█▄  ▒██   ██░
▒██████▒▒ ▓█   ▓██▒▒██▒   ░██▒▒▒█████▓ ▒██▒ ░  ░░██▓ ▒██▒░ ████▓▒░
▒ ▒▓▒ ▒ ░ ▒▒   ▓▒█░░ ▒░   ░  ░░▒▓▒ ▒ ▒ ▒▓▒░ ░  ░░ ▒▓ ░▒▓░░ ▒░▒░▒░ 
░ ░▒  ░ ░  ▒   ▒▒ ░░  ░      ░░░▒░ ░ ░ ░▒ ░       ░▒ ░ ▒░  ░ ▒ ▒░ 
░  ░  ░    ░   ▒   ░      ░    ░░░ ░ ░ ░░         ░░   ░ ░ ░ ░ ▒  
      ░        ░  ░       ░      ░                 ░         ░ ░  
                https://github.com/samupro-dev
                                                  v.0.1${COLOR_NULL}"
echo -e "\n"
echo -e "${LIGHT_BLUE} This script makes it easy to install a minecraft server. ${COLOR_NULL}"
sleep 1
echo -e "\n"

echo -e " ${YELLOW} Control of administration permissions. . . ${COLOR_NULL}"
sleep 2
if [ "$(id -u)" != "0" ] ; then
	echo " ${ERROR} ${LIGHT_RED}This script requires root permissions. Please run this as root! ${COLOR_NULL}"
	exit 2
fi
echo -e " ${DONE} ${LIGHT_GREEN}Congratulations, this script will be run as root. ${COLOR_NULL}"
echo -e "\n"

##############
## Required ##
##############
if ! [ -x "$(command -v wget)" ]; then
  echo -e "${ERROR} ${LIGHT_RED} wget is required in order for this script to work. ${COLOR_NULL}"
  while true
  do
    echo -e -n "${YELLOW} Do you want to install wget (Y/n)? ${COLOR_NULL}"
    read installwget
    case "$installwget" in
      n|N|no|No|NO) exit;;
      y|Y|yes|Yes|YES) apt-get -y install wget
      break;;
      *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
fi
echo -e " ${YELLOW} wget is installed, the script will work fine! ${COLOR_NULL}"
echo -e " "

if ! [ -x "$(command -v curl)" ]; then
  echo -e "${ERROR} ${LIGHT_RED} curl is required in order for this script to work. ${COLOR_NULL}"
  while true
  do
    echo -e -n "${YELLOW} Do you want to install curl (Y/n)? ${COLOR_NULL}"
    read installcurl
    case "$installcurl" in
      n|N|no|No|NO) exit;;
      y|Y|yes|Yes|YES) apt-get -y install curl
      break;;
      *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
fi
echo -e " ${YELLOW} curl is installed, the script will work fine! ${COLOR_NULL}"
echo -e "\n"
sleep 1

#############
## Options ##
#############
function bungee {
  bash <(wget -O - 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/bungee.sh')
}

function spigot {
  bash <(wget -O - 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/spigot.sh')
}

function bedrock {
  bash <(wget -O - 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/bedrock.sh')
}

function modded {
  bash <(wget -O - 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/modded.sh')
}

function vanilla {
  bash <(wget -O - 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/vanilla.sh')
}

###########
## Types ##
###########
echo -e "${LIGHT_GREEN} Hi, before starting I would like to know what kind of server to install. ${COLOR_NULL}"
SERVERTYPE=("Proxy" "Spigot" "Bedrock" "Modded" "Vanilla" "Cancel")
echo -e "${CYAN} Select the type of server that suits you best! ${COLOR_NULL}"
select OPTION in "${SERVERTYPE[@]}"; do
  case "$REPLY" in
  1) bungee ;;
  2) spigot ;;
  3) bedrock ;;
  4) modded ;;
  5) vanilla ;;
  6) exit ;;
  *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
  esac
done
echo -e "\n"
