#!/bin/bash
DONE="\e[0;32m ✔\e[0m"
ERROR="\e[0;31m ✘\e[0m"
YELLOW="\e[1;33m"
LIGHT_RED="\e[1;31m"
LIGHT_GREEN="\e[1;32m"
COLOR_NULL="\e[0m"
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

function vanilla {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read vanillamem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/vanilla): ${COLOR_NULL}"
  read vanillafolder
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 25565): ${COLOR_NULL}"
  read vanillaport
  echo -e "${CYAN} Server type selected: ${YELLOW}Vanilla ${COLOR_NULL}"
  VANILLATYPE=("Vanilla" "Snapshot" "Cancel")
  echo -e "${CYAN} Select the one fork that suits you best! ${COLOR_NULL}"
  select OPTION in "${VANILLATYPE[@]}"; do
    case "$REPLY" in
    1) vanillaa ;;
    2) snapshot ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
} 

## Vanilla ##
function vanillaa {
  if ! [ -x "$(command -v jq)" ]; then
    echo -e "${ERROR} ${LIGHT_RED} jq is required in order for this installation to work. ${COLOR_NULL}"
    while true
    do
      echo -e -n "${YELLOW} Do you want to install jq (Y/n)? ${COLOR_NULL}"
      read installjq
      case "$installjq" in
        n|N|no|No|NO) exit;;
        y|Y|yes|Yes|yEs|yeS|YEs|YeS|yES|YES) apt-get -y install jq || yum install -y jq
        break;;
        *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
      esac
    done
  fi
  echo -e " ${YELLOW} jq is installed, the installation will work fine! ${COLOR_NULL}"
  echo -e "\n"
  mkdir ${vanillafolder:-/root/vanilla}
  cd ${vanillafolder:-/root/vanilla}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${vanillaport:-25565}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  vanillaversion
}

function vanillaversion {
  VANILLAVERSION=("1.19" "1.18.2" "1.18.1" "1.18" "1.17.1" "1.17" "1.16.5" "1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.16" "1.15.2" "1.15.1" "1.15" "1.14.4" "1.14.3" "1.14.2" "1.14.1" "1.14" "1.13.2" "1.13.1" "1.13" "1.12.2" "1.12.1" "1.12" "1.11.2" "1.11.1" "1.11" "1.10.2" "1.9.4" "1.9.3" "1.9.2" "1.9.1" "1.9" "1.8.8" "1.8.7" "1.8.6" "1.8.5" "1.8.4" "1.8.3" "1.8.2" "1.8.1" "1.8" "1.7.10" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select VANILLAVERSIONSEL in "${VANILLAVERSION[@]}"; do
    case "$REPLY" in
    1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47) stepsVanilla ;;
    48) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function stepsVanilla {
  read manifestver <<< $(curl -s 'https://launchermeta.mojang.com/mc/game/version_manifest.json' | jq -r '.versions[] | select(.id=="'"${VANILLAVERSIONSEL}"'") | .url')
  read manifestserver <<< $(curl -s ${manifestver} | jq -r '.downloads.server.url')
  curl -so vanilla-${VANILLAVERSIONSEL}.jar ${manifestserver}
  starterFileVanilla
}

function starterFileVanilla {
  cd ${vanillafolder:-/root/vanilla}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem:-512}M -jar vanilla-${VANILLAVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallVanilla
}

function successInstallVanilla {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Vanilla ${VANILLAVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${vanillafolder:-/root/vanilla}\n   ${CYAN}* RAM: ${WHITE}${vanillamem:-512}M\n   ${CYAN}* Port: ${WHITE}${vanillaport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Snapshot ##
function snapshot {
  if ! [ -x "$(command -v jq)" ]; then
    echo -e "${ERROR} ${LIGHT_RED} jq is required in order for this installation to work. ${COLOR_NULL}"
    while true
    do
      echo -e -n "${YELLOW} Do you want to install jq (Y/n)? ${COLOR_NULL}"
      read installjq
      case "$installjq" in
        n|N|no|No|NO) exit;;
        y|Y|yes|Yes|yEs|yeS|YEs|YeS|yES|YES) apt-get -y install jq || yum install -y jq
        break;;
        *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
      esac
    done
  fi
  echo -e " ${YELLOW} jq is installed, the installation will work fine! ${COLOR_NULL}"
  echo -e "\n"
  mkdir ${vanillafolder:-/root/vanilla}
  cd ${vanillafolder:-/root/vanilla}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${vanillaport:-25565}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  snapshotversion
}

function snapshotversion {
  SNAPSHOTVERSION=("Latest" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select SNAPSHOTVERSIONSEL in "${SNAPSHOTVERSION[@]}"; do
    case "$REPLY" in
    1) snapshotlatest ;;
    2) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function snapshotlatest {
  read snapshotver <<< $(curl -s 'https://launchermeta.mojang.com/mc/game/version_manifest.json' | jq -r '.latest.snapshot')
  read manifestver <<< $(curl -s 'https://launchermeta.mojang.com/mc/game/version_manifest.json' | jq -r '.versions[] | select(.id=="'"${snapshotver}"'") | .url')
  read manifestserver <<< $(curl -s ${manifestver} | jq -r '.downloads.server.url')
  curl -so snapshot-${snapshotver}.jar ${manifestserver}
  starterFileSnapshot
}

function starterFileSnapshot {
  cd ${vanillafolder:-/root/vanilla}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem:-512}M -jar snapshot-${snapshotver}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallSnapshot
}

function successInstallSnapshot {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Snapshot ${snapshotver}\n   ${CYAN}* Location: ${WHITE}${vanillafolder:-/root/vanilla}\n   ${CYAN}* RAM: ${WHITE}${vanillamem:-512}M\n   ${CYAN}* Port: ${WHITE}${vanillaport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

vanilla
