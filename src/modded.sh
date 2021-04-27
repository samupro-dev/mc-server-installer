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
echo -e "${LIGHT_PURPLE}      ╔╦╗╔═╗  ╔═╗╔═╗╦═╗╦  ╦╔═╗╦═╗  ╦╔╗╔╔═╗╔╦╗╔═╗╦  ╦  ╔═╗╦═╗
      ║║║║    ╚═╗║╣ ╠╦╝╚╗╔╝║╣ ╠╦╝  ║║║║╚═╗ ║ ╠═╣║  ║  ║╣ ╠╦╝
      ╩ ╩╚═╝  ╚═╝╚═╝╩╚═ ╚╝ ╚═╝╩╚═  ╩╝╚╝╚═╝ ╩ ╩ ╩╩═╝╩═╝╚═╝╩╚═
             ${PURPLE}You are using the auto updated script${COLOR_NULL}"
echo -e "\n"
sleep 1

function modded {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read moddedmem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/modded): ${COLOR_NULL}"
  read moddedfolder
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 25565): ${COLOR_NULL}"
  read moddedport
  echo -e "${CYAN} Server type selected: ${YELLOW}Modded ${COLOR_NULL}"
  MODDEDTYPE=("Magma" "Cancel")
  echo -e "${CYAN} Select the type of fork that suits you best! ${COLOR_NULL}"
  select MODDEDTYPESEL in "${MODDEDTYPE[@]}"; do
    case "$REPLY" in
    1) magma ;;
    2) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

## Magma ##
function magma {
  echo -e "\n"
  mkdir ${moddedfolder}
  cd ${moddedfolder}
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 25599): ${COLOR_NULL}"
  read magmaport
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${moddedport}" > server.properties
  magmaversion
}

function magmaversion {
  MAGMAVERSION=("1.12.2" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select MAGMAVERSIONSEL in "${MAGMAVERSION[@]}"; do
    case "$REPLY" in
    1) magma1122 ;;
    2) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function magma1122 {
  echo -e " "
  cd ${moddedfolder}
  curl -o magma-1.12.2.jar https://api.magmafoundation.org/api/resources/magma/1.12.2/dev/latest/download
  starterFileMagma
}

## Starter ##
function starterFileMagma {
  cd ${moddedfolder}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${moddedmem}M -jar magma-${MAGMAVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstall
}

## Success ##
function successInstall {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${MODDEDTYPESEL}\n   ${CYAN}* Location: ${WHITE}${moddedfolder}\n   ${CYAN}* RAM: ${WHITE}${moddedmem}M\n   ${CYAN}* Port: ${WHITE}${moddedport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

modded
