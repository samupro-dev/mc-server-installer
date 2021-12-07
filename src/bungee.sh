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
  mkdir ${bungeefolder:-/root/bungee}
  cd ${bungeefolder:-/root/bungee}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
  starterFile
}

## Waterfall ##
function waterfall {
  if ! [ -x "$(command -v ruby)" ]; then
    echo -e "${ERROR} ${LIGHT_RED} ruby is required in order for this installation to work. ${COLOR_NULL}"
    while true
    do
      echo -e -n "${YELLOW} Do you want to install ruby (Y/n)? ${COLOR_NULL}"
      read installruby
      case "$installruby" in
        n|N|no|No|NO) exit;;
        y|Y|yes|Yes|YES) apt-get -y install ruby || yum install -y ruby
        break;;
        *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
      esac
    done
  fi
  echo -e " ${YELLOW} ruby is installed, the installation will work fine! ${COLOR_NULL}"
  echo -e "\n"
  mkdir ${bungeefolder:-/root/bungee}
  cd ${bungeefolder:-/root/bungee}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  curl -s "https://papermc.io/api/v2/projects/waterfall/versions/1.18" | ruby -rjson -e 'data = JSON.parse(STDIN.read); puts data["builds"]' >> builds-temp-waterfall.txt
  grep -Eo '[0-9]+' builds-temp-waterfall.txt | sort -rn >> builds-waterfall.txt
  read buildwaterfall <<< $(awk 'NR==1 {print; exit}' builds-waterfall.txt)
  wget https://papermc.io/api/v2/projects/waterfall/versions/1.18/builds/${buildwaterfall}/downloads/waterfall-1.18-${buildwaterfall}.jar
  mv waterfall-*.jar Waterfall.jar
  rm *.txt
  starterFile
}

## Travertine ##
function travertine {
  echo -e "\n"
  mkdir ${bungeefolder:-/root/bungee}
  cd ${bungeefolder:-/root/bungee}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://papermc.io/api/v2/projects/travertine/versions/1.16/builds/191/downloads/travertine-1.16-191.jar
  mv travertine-*.jar Travertine.jar
  starterFile
}

## FlameCord ##
function flamecord {
  echo -e "\n"
  mkdir ${bungeefolder:-/root/bungee}
  cd ${bungeefolder:-/root/bungee}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://github.com/2lstudios-mc/FlameCord/releases/latest/download/FlameCord.jar
  starterFile
}

## Velocity ##
function velocity {
  echo -e "\n"
  mkdir ${bungeefolder:-/root/bungee}
  cd ${bungeefolder:-/root/bungee}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://versions.velocitypowered.com/download/3.0.x-SNAPSHOT.jar
  mv 3.0.x-SNAPSHOT.jar Velocity.jar
  starterFile
}

## HexaCord ##
function hexacord {
  echo -e "\n"
  mkdir ${bungeefolder:-/root/bungee}
  cd ${bungeefolder:-/root/bungee}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://github.com/HexagonMC/BungeeCord/releases/latest/download/BungeeCord.jar
  mv BungeeCord.jar HexaCord.jar
  starterFile
}

## Starter ##
function starterFile {
  cd ${bungeefolder:-/root/bungee}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${bungeemem:-512}M -jar ${BUNGEETYPESEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstall
}

## Success ##
function successInstall {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${BUNGEETYPESEL}\n   ${CYAN}* Location: ${WHITE}${bungeefolder:-/root/bungee}\n   ${CYAN}* RAM: ${WHITE}${bungeemem:-512}M ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

bungee
