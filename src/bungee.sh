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
echo -e "\n${LIGHT_PURPLE}      ╔╦╗╔═╗  ╔═╗╔═╗╦═╗╦  ╦╔═╗╦═╗  ╦╔╗╔╔═╗╔╦╗╔═╗╦  ╦  ╔═╗╦═╗
      ║║║║    ╚═╗║╣ ╠╦╝╚╗╔╝║╣ ╠╦╝  ║║║║╚═╗ ║ ╠═╣║  ║  ║╣ ╠╦╝
      ╩ ╩╚═╝  ╚═╝╚═╝╩╚═ ╚╝ ╚═╝╩╚═  ╩╝╚╝╚═╝ ╩ ╩ ╩╩═╝╩═╝╚═╝╩╚═
             ${PURPLE}You are using the auto updated script${COLOR_NULL}\n"
sleep 1

function bungee_conf {
  echo -e "\n${YELLOW}[[[--- Welcome to the setup for configuring your server! ---]]]${COLOR_NULL}\n"
  echo -e -n "${CYAN} ( * ) Enter the amount of RAM to allocate in megabytes (default: 2048): ${COLOR_NULL}"
  read bungeemem
  echo -e -n "${CYAN} ( * ) Enter the directory where the server will be installed (default: /root/bungee): ${COLOR_NULL}"
  read bungeefolder
  echo -e -n "${CYAN} ( * ) Do you want to grant server access only to premium users? (default: false): ${COLOR_NULL}"
  read bungeeomode
  echo -e -n "${CYAN} ( * ) How many maximum players should the server have? (default: 20): ${COLOR_NULL}"
  read bungeemplayers
  echo -e "\n${LIGHT_RED} !! ${CYAN}Server type selected: ${YELLOW}BUNGEE ${COLOR_NULL}"
  bungeetype=("BungeeCord" "Waterfall" "Velocity" "Cancel")
  echo -e "${CYAN} ( * ) Select the type of fork that suits you best! ${COLOR_NULL}"
  select bungeetype_sel in "${bungeetype[@]}"; do
    case "$REPLY" in
    1) bungeecord ;;
    2) waterfall ;;
    3) velocity ;;
    4) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function bungee_setup {
  echo -e "\n"
  mkdir ${bungeefolder:-/root/bungee}
  cd ${bungeefolder:-/root/bungee}
  echo -e "${YELLOW} Setting up the server settings. . . ${COLOR_NULL}"
  echo -e "online_mode=${bungeeomode:-false}\nplayer_limit=${bungeemplayers:-20}" > config.yml
  echo -e "${YELLOW} Fetching the versions. . . (it might take a while)\n ${COLOR_NULL}"
}

## bungeecord ##
function bungeecord {
  bungee_setup
  cd ${bungeefolder:-/root/bungee}
  echo -e "${YELLOW} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
  starterFile
}

## waterfall ##
function waterfall {
  bungee_setup
  cd ${bungeefolder:-/root/bungee}
  echo -e "${YELLOW} Downloading the jar file. . . ${COLOR_NULL}"
  waterfall_ver=$(curl -s -X 'GET' 'https://api.papermc.io/v2/projects/waterfall' -H 'accept: application/json' | jq -r '.versions | last')
  waterfall_build=$(curl -s -X 'GET' "https://api.papermc.io/v2/projects/waterfall/versions/${waterfall_ver}" -H 'accept: application/json' | jq -r '.builds | last')
  wget https://api.papermc.io/v2/projects/waterfall/versions/${waterfall_ver}/builds/${waterfall_build}/downloads/waterfall-${waterfall_ver}-${waterfall_build}.jar
  mv waterfall-*.jar waterfall.jar
  starterFile
}

## velocity ##
function velocity {
  bungee_setup
  cd ${bungeefolder:-/root/bungee}
  echo -e "${YELLOW} Downloading the jar file. . . ${COLOR_NULL}"
  velocity_ver=$(curl -s -X 'GET' 'https://api.papermc.io/v2/projects/velocity' -H 'accept: application/json' | jq -r '.versions | last')
  velocity_build=$(curl -s -X 'GET' "https://api.papermc.io/v2/projects/velocity/versions/${velocity_ver}" -H 'accept: application/json' | jq -r '.builds | last')
  wget https://api.papermc.io/v2/projects/velocity/versions/${velocity_ver}/builds/${velocity_build}/downloads/velocity-${velocity_ver}-${velocity_build}.jar
  mv velocity-*.jar velocity.jar
  starterFile
}

## end ##
function starterFile {
  bungee_name=$(echo "${bungeetype_sel}" | tr '[:upper:]' '[:lower:]')
  cd ${bungeefolder:-/root/bungee}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${bungeemem:-2048}M -jar ${bungee_name}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstall
}

function successInstall {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${bungeetype_sel}\n   ${CYAN}* Location: ${WHITE}${bungeefolder:-/root/bungee}\n   ${CYAN}* RAM: ${WHITE}${bungeemem:-2048}M ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit 0
}

bungee_conf
