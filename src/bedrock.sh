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

function bedrock {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read bedrockmem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/bedrock): ${COLOR_NULL}"
  read bedrockfolder
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 19132): ${COLOR_NULL}"
  read bedrockport
  echo -e "${CYAN} Server type selected: ${YELLOW}Bedrock ${COLOR_NULL}"
  BEDROCKTYPE=("NukkitX" "Cancel")
  echo -e "${CYAN} Select the type of fork that suits you best! ${COLOR_NULL}"
  select OPTION in "${BEDROCKTYPE[@]}"; do
    case "$REPLY" in
    1) nukkitx ;;
    2) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function nukkitx {
  echo -e "\n"
  mkdir ${bedrockfolder}
  cd ${bedrockfolder}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${bedrockport}" > server.properties
  nukkitxversion
}

function nukkitxversion {
  NUKKITXVERSION=("Latest" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select NUKKITXVERSIONSEL in "${NUKKITXVERSION[@]}"; do
    case "$REPLY" in
    1) nukkitxlatest ;;
    4) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function nukkitxlatest {
  echo -e " "
  cd ${bedrockfolder}
  wget https://ci.opencollab.dev/job/NukkitX/job/Nukkit/job/master/lastSuccessfulBuild/artifact/target/nukkit-1.0-SNAPSHOT.jar
  mv nukkit-1.0-SNAPSHOT.jar nukkitx-latest.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${bedrockmem}M -jar nukkitx-latest.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  nukkitxsuccess
}

function nukkitxsuccess {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}NukkitX\n   ${CYAN}* Location: ${WHITE}${bedrockfolder}\n   ${CYAN}* RAM: ${WHITE}${bedrockmem}M\n   ${CYAN}* Port: ${WHITE}${bedrockport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  exit 1
}

bedrock
