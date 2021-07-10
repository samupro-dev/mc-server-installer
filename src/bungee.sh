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

function bungee {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read bungeemem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/bungee): ${COLOR_NULL}"
  read bungeefolder
  echo -e "${CYAN} Server type selected: ${YELLOW}Proxy ${COLOR_NULL}"
  BUNGEETYPE=("BungeeCord" "Waterfall" "Travertine" "FlameCord" "Velocity" "HexaCord" "Cancel")
  echo -e "${CYAN} Select the type of fork that suits you best! ${COLOR_NULL}"
  select BUNGEETYPESEL in "${BUNGEETYPE[@]}"; do
    case "$REPLY" in
    1) bungeecord ;;
    2) waterfall ;;
    3) travertine ;;
    4) flamecord ;;
    5) velocity ;;
    6) hexacord ;;
    7) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
} 

## BungeeCord ##
function bungeecord {
  echo -e "\n"
  mkdir ${bungeefolder}
  cd ${bungeefolder}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
  starterFile
}

## Waterfall ##
function waterfall {
  echo -e "\n"
  mkdir ${bungeefolder}
  cd ${bungeefolder}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  curl -o Waterfall.jar https://papermc.io/api/v1/waterfall/1.17/latest/download
  starterFile
}

## Travertine ##
function travertine {
  echo -e "\n"
  mkdir ${bungeefolder}
  cd ${bungeefolder}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  curl -o Travertine.jar https://papermc.io/api/v1/travertine/1.16/latest/download
  starterFile
}

## FlameCord ##
function flamecord {
  echo -e "\n"
  mkdir ${bungeefolder}
  cd ${bungeefolder}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://github.com/2lstudios-mc/FlameCord/releases/latest/download/FlameCord.jar
  starterFile
}

## Velocity ##
function velocity {
  echo -e "\n"
  mkdir ${bungeefolder}
  cd ${bungeefolder}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://versions.velocitypowered.com/download/3.0.x-SNAPSHOT.jar
  mv 3.0.x-SNAPSHOT.jar Velocity.jar
  starterFile
}

## HexaCord ##
function hexacord {
  echo -e "\n"
  mkdir ${bungeefolder}
  cd ${bungeefolder}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://github.com/HexagonMC/BungeeCord/releases/latest/download/BungeeCord.jar
  mv BungeeCord.jar HexaCord.jar
  starterFile
}

## Starter ##
function starterFile {
  cd ${bungeefolder}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${bungeemem}M -jar ${BUNGEETYPESEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstall
}

## Success ##
function successInstall {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${BUNGEETYPESEL}\n   ${CYAN}* Location: ${WHITE}${bungeefolder}\n   ${CYAN}* RAM: ${WHITE}${bungeemem}M ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

bungee
