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
                https://github.com/samupro-dev${COLOR_NULL}"
echo -e "\n"
echo -e "${LIGHT_BLUE} This script makes it easy to install a minecraft server. ${COLOR_NULL}"
echo -e "${RED}CAUTION!! THIS IS A DEPRECATED VERSION AND NO LONGER SUPPORTED, PLEASE USE THE UPDATED VERSION.${COLOR_NULL}"
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

#################
## AutoUpdater ##
#################
echo -e "${LIGHT_GREEN} It is recommended to use the auto updated script where the performance ${COLOR_NULL}"
echo -e "${LIGHT_GREEN} of the script has been optimized, improved and fixed. ${COLOR_NULL}"
while true
do
  echo -e -n "${CYAN} Do you want to use the auto updated script (Y/n)? ${COLOR_NULL}"
  read choiceupdater
  case "$choiceupdater" in
    n|N|no|No|NO) break ;;
    y|Y|yes|Yes|YES) bash <(wget -O - 'https://github.com/samupro-dev/mc-server-installer/updated-server-installer.sh') ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
  esac    
done
echo -e " "

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

#################
## Bungee Type ##
#################
function bungee {
  echo -e "\n"
  echo -e "${CYAN} Server type selected: ${YELLOW}Proxy ${COLOR_NULL}"
  BUNGEETYPE=("BungeeCord" "Waterfall" "Travertine" "Velocity" "Cancel")
  echo -e "${CYAN} Select the type of fork that suits you best! ${COLOR_NULL}"
  select OPTION in "${BUNGEETYPE[@]}"; do
    case "$REPLY" in
    1) bungeecord ;;
    2) waterfall ;;
    3) travertine ;;
    5) velocity ;;
    7) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
} 

function bungeecord {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read bungeemem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/bungee): ${COLOR_NULL}"
  read bungeefolder
  mkdir ${bungeefolder}
  cd ${bungeefolder}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${bungeemem}M -jar BungeeCord.jar" > RunMe.sh
  chmod +x RunMe.sh
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}BungeeCord\n   ${CYAN}* Location: ${WHITE}${bungeefolder}\n   ${CYAN}* RAM: ${WHITE}${bungeemem}M ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  exit
}

function waterfall {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read waterfallmem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/bungee): ${COLOR_NULL}"
  read waterfallfolder
  mkdir ${waterfallfolder}
  cd ${waterfallfolder}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://papermc.io/ci/job/Waterfall/lastSuccessfulBuild/artifact/Waterfall-Proxy/bootstrap/target/Waterfall.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${waterfallmem}M -jar Waterfall.jar" > RunMe.sh
  chmod +x RunMe.sh
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Waterfall\n   ${CYAN}* Location: ${WHITE}${waterfallfolder}\n   ${CYAN}* RAM: ${WHITE}${waterfallmem}M ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  exit
}

function travertine {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read travertinemem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/bungee): ${COLOR_NULL}"
  read travertinefolder
  mkdir ${travertinefolder}
  cd ${travertinefolder}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://papermc.io/ci/job/Travertine/lastSuccessfulBuild/artifact/Travertine-Proxy/bootstrap/target/Travertine.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${travertinemem}M -jar Travertine.jar" > RunMe.sh
  chmod +x RunMe.sh
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Travertine\n   ${CYAN}* Location: ${WHITE}${travertinefolder}\n   ${CYAN}* RAM: ${WHITE}${travertinemem}M ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  exit
}

function velocity {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read velocitymem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/bungee): ${COLOR_NULL}"
  read velocityfolder
  mkdir ${velocityfolder}
  cd ${velocityfolder}
  echo -e "${CYAN} Downloading the jar file. . . ${COLOR_NULL}"
  wget https://versions.velocitypowered.com/download/1.1.x-SNAPSHOT.jar
  mv 1.1.x-SNAPSHOT.jar Velocity.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${velocitymem}M -jar Velocity.jar" > RunMe.sh
  chmod +x RunMe.sh
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Velocity\n   ${CYAN}* Location: ${WHITE}${velocityfolder}\n   ${CYAN}* RAM: ${WHITE}${velocitymem}M ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  exit
}

#################
## Spigot Type ##
#################
function spigot {
  echo -e "\n"
  echo -e "${CYAN} Server type selected: ${YELLOW}Spigot ${COLOR_NULL}"
  SPIGOTTYPE=("Spigot" "Paper" "Yatopia" "Cancel")
  echo -e "${CYAN} Select the type of fork that suits you best! ${COLOR_NULL}"
  select OPTION in "${SPIGOTTYPE[@]}"; do
    case "$REPLY" in
    1) spigott ;;
    2) paper ;;
    3) yatopia ;;
    7) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
} 

function spigott {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read spigotmem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/spigot): ${COLOR_NULL}"
  read spigotfolder
  mkdir ${spigotfolder}
  cd ${spigotfolder}
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 25599): ${COLOR_NULL}"
  read spigotport
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  spigottversion
}

function spigottversion {
  SPIGOTVERSION=("1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.15.2" "1.15.1" "1.15" "1.14.4" "1.14.3" "1.14.2" "1.14.1" "1.14" "1.13.2" "1.13.1" "1.13" "1.12.2" "1.12.1" "1.12" "1.11.2" "1.11.1" "1.11" "1.10.2" "1.10" "1.9.4" "1.9.2" "1.9" "1.8.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select SPIGOTVERSIONSEL in "${SPIGOTVERSION[@]}"; do
    case "$REPLY" in
    1) spigot1164 ;;
    2) spigot1163 ;;
    3) spigot1162 ;;
    4) spigot1161 ;;
    5) spigot1152 ;;
    6) spigot1151 ;;
    7) spigot115 ;;
    8) spigot1444 ;;
    9) spigot1143 ;;
    10) spigot1142 ;;
    11) spigot1141 ;;
    12) spigot114 ;;
    13) spigot1132 ;;
    14) spigot1131 ;;
    15) spigot113 ;;
    16) spigot1122 ;;
    17) spigot1121 ;;
    18) spigot112 ;;
    19) spigot1112 ;;
    20) spigot1111 ;;
    21) spigot111 ;;
    22) spigot1102 ;;
    23) spigot110 ;;
    24) spigot194 ;;
    25) spigot188 ;;
    26) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function spigot1164 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.16.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.16.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1163 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.16.3.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.16.3.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1162 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.16.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.16.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1161 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.16.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.16.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1152 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.15.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.15.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1151 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.15.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.15.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot115 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.15.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.15.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1444 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.14.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.14.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1143 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.14.3.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.14.3.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1142 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.14.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.14.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1141 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.14.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.14.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot114 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.14.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.14.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1132 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.13.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.13.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1131 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.13.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.13.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot113 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.13.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.13.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1122 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.12.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.12.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1121 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.12.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.12.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot112 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.12.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.12.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1112 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.11.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.11.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1111 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.11.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.11.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot111 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.11.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.11.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1102 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.10.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.10.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot110 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.10.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.10.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot194 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.9.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.9.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot188 {
  echo -e " "
  cd ${spigotfolder}
  wget https://serverjars.com/jars/servers/spigot/spigot-1.8.8.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${spigotmem}M -jar spigot-1.8.8.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigottsuccess {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Spigot ${SPIGOTVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  exit
}

function paper {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read papermem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/paper): ${COLOR_NULL}"
  read paperfolder
  mkdir ${paperfolder}
  cd ${paperfolder}
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 25599): ${COLOR_NULL}"
  read paperport
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${paperport}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  paperversion
}

function paperversion {
  PAPERVERSION=("1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.15.2" "1.14.4" "1.13.2" "1.12.2" "1.11.2" "1.10.2" "1.9.4" "1.8.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select PAPERVERSIONSEL in "${PAPERVERSION[@]}"; do
    case "$REPLY" in
    1) paper1164 ;;
    2) paper1163 ;;
    3) paper1162 ;;
    4) paper1161 ;;
    5) paper1152 ;;
    6) paper1144 ;;
    7) paper1132 ;;
    8) paper1122 ;;
    9) paper1112 ;;
    10) paper1102 ;;
    11) paper194 ;;
    12) paper188 ;;
    13) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function paper1164 {
  echo -e " "
  cd ${paperfolder}
  wget https://papermc.io/ci/job/Paper-1.16/lastSuccessfulBuild/artifact/paperclip.jar
  mv paperclip.jar paper-1.16.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${papermem}M -jar paper-1.16.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1163 {
  echo -e " "
  cd ${paperfolder}
  wget https://papermc.io/api/v2/projects/paper/versions/1.16.3/builds/253/downloads/paper-1.16.3-253.jar
  mv paper-1.16.3-253.jar paper-1.16.3.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${papermem}M -jar paper-1.16.3.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1162 {
  echo -e " "
  cd ${paperfolder}
  wget https://papermc.io/api/v2/projects/paper/versions/1.16.2/builds/189/downloads/paper-1.16.2-189.jar
  mv paper-1.16.2-189.jar paper-1.16.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${papermem}M -jar paper-1.16.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1161 {
  echo -e " "
  cd ${paperfolder}
  wget https://papermc.io/api/v2/projects/paper/versions/1.16.1/builds/138/downloads/paper-1.16.1-138.jar
  mv paper-1.16.1-138.jar paper-1.16.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${papermem}M -jar paper-1.16.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1152 {
  echo -e " "
  cd ${paperfolder}
  wget https://papermc.io/api/v2/projects/paper/versions/1.15.2/builds/391/downloads/paper-1.15.2-391.jar
  mv paper-1.15.2-391.jar paper-1.15.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${papermem}M -jar paper-1.15.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1144 {
  echo -e " "
  cd ${paperfolder}
  wget https://papermc.io/api/v2/projects/paper/versions/1.14.4/builds/243/downloads/paper-1.14.4-243.jar
  mv paper-1.14.4-243.jar paper-1.14.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${papermem}M -jar paper-1.14.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1132 {
  echo -e " "
  cd ${paperfolder}
  wget https://papermc.io/api/v2/projects/paper/versions/1.13.2/builds/655/downloads/paper-1.13.2-655.jar
  mv paper-1.13.2-655.jar paper-1.13.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${papermem}M -jar paper-1.13.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1122 {
  echo -e " "
  cd ${paperfolder}
  wget https://papermc.io/api/v2/projects/paper/versions/1.12.2/builds/1618/downloads/paper-1.12.2-1618.jar
  mv paper-1.12.2-1618.jar paper-1.12.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${papermem}M -jar paper-1.12.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1112 {
  echo -e " "
  cd ${paperfolder}
  wgethttps://papermc.io/api/v2/projects/paper/versions/1.11.2/builds/1104/downloads/paper-1.11.2-1104.jar
  mv paper-1.11.2-1104.jar paper-1.11.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${papermem}M -jar paper-1.11.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1102 {
  echo -e " "
  cd ${paperfolder}
  wget https://papermc.io/api/v2/projects/paper/versions/1.10.2/builds/916/downloads/paper-1.10.2-916.jar
  mv paper-1.10.2-916.jar paper-1.10.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${papermem}M -jar paper-1.10.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper194 {
  echo -e " "
  cd ${paperfolder}
  wget https://papermc.io/api/v2/projects/paper/versions/1.9.4/builds/773/downloads/paper-1.9.4-773.jar
  mv paper-1.9.4-773.jar paper-1.9.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${papermem}M -jar paper-1.9.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper188 {
  echo -e " "
  cd ${paperfolder}
  wget https://papermc.io/api/v2/projects/paper/versions/1.8.8/builds/443/downloads/paper-1.8.8-443.jar
  mv paper-1.8.8-443.jar paper-1.8.8.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${papermem}M -jar paper-1.8.8.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function papersuccess {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Paper ${SPIGOTVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  exit
}

function yatopia {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read yatopiamem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/yatopia): ${COLOR_NULL}"
  read yatopiafolder
  mkdir ${yatopiafolder}
  cd ${yatopiafolder}
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 25599): ${COLOR_NULL}"
  read yatopiaport
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${yatopiaport}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  yatopiaversion
}

function yatopiaversion {
  YATOPIAVERSION=("1.16.4" "1.16.3" "1.16.2" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select YATOPIAVERSIONSEL in "${YATOPIAVERSION[@]}"; do
    case "$REPLY" in
    1) yatopia1164 ;;
    2) yatopia1163 ;;
    3) yatopia1162 ;;
    4) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function yatopia1164 {
  echo -e " "
  cd ${yatopiafolder}
  curl -O -J -L https://api.yatopiamc.org/v2/latestBuild/download?branch=ver/1.16.4
  mv 1.16.4 yatopia-1.16.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${yatopiamem}M -jar yatopia-1.16.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  yatopiasuccess
}

function yatopia1163 {
  echo -e " "
  cd ${yatopiafolder}
  wget https://ci.codemc.io/job/YatopiaMC/job/Yatopia/job/ver%252F1.16.3/lastSuccessfulBuild/artifact/target/yatopia-1.16.3-paperclip-b134.jar
  mv yatopia-1.16.3-paperclip-b134.jar yatopia-1.16.3.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${yatopiamem}M -jar yatopia-1.16.3.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  yatopiasuccess
}

function yatopia1162 {
  echo -e " "
  cd ${yatopiafolder}
  wget https://ci.codemc.io/job/YatopiaMC/job/Yatopia/job/ver%252F1.16.2/lastSuccessfulBuild/artifact/target/yatopia-1.16.2-paperclip-b17.jar
  mv yatopia-1.16.2-paperclip-b17.jar yatopia-1.16.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${yatopiamem}M -jar yatopia-1.16.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  yatopiasuccess
}

function yatopiasuccess {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Yatopia ${YATOPIAVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${yatopiafolder}\n   ${CYAN}* RAM: ${WHITE}${yatopiamem}M\n   ${CYAN}* Port: ${WHITE}${yatopiaport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  exit
}

##################
## Bedrock Type ##
##################
function bedrock {
  echo -e "\n"
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
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read nukkitxmem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/nukkitx): ${COLOR_NULL}"
  read nukkitxfolder
  mkdir ${nukkitxfolder}
  cd ${nukkitxfolder}
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 19132): ${COLOR_NULL}"
  read nukkitxport
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${nukkitxport}" > server.properties
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
  cd ${nukkitxfolder}
  wget https://ci.opencollab.dev/job/NukkitX/job/Nukkit/job/master/lastSuccessfulBuild/artifact/target/nukkit-1.0-SNAPSHOT.jar
  mv nukkit-1.0-SNAPSHOT.jar nukkitx-latest.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "java -Xms128M -Xmx${nukkitxmem}M -jar nukkitx-latest.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  nukkitxsuccess
}

function nukkitxsuccess {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}NukkitX\n   ${CYAN}* Location: ${WHITE}${nukkitxfolder}\n   ${CYAN}* RAM: ${WHITE}${nukkitxmem}M\n   ${CYAN}* Port: ${WHITE}${nukkitxport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_"
  exit
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
  4) break ;;
  5) break ;;
  6) exit ;;
  *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
  esac
done
echo -e "\n"
