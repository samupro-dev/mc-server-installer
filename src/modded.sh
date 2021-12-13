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
  MODDEDTYPE=("Magma" "Mohist" "Arclight" "SpongeForge" "Cancel")
  echo -e "${CYAN} Select the type of fork that suits you best! ${COLOR_NULL}"
  select MODDEDTYPESEL in "${MODDEDTYPE[@]}"; do
    case "$REPLY" in
    1) magma ;;
    2) mohist ;;
    3) arclight ;;
    4) spongeforge;;
    5) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

## Magma ##
function magma {
  echo -e "\n"
  mkdir ${moddedfolder:-/root/modded}
  cd ${moddedfolder:-/root/modded}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${moddedport:-25565}" > server.properties
  magmaversion
}

function magmaversion {
  MAGMAVERSION=("1.16.5" "1.12.2" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select MAGMAVERSIONSEL in "${MAGMAVERSION[@]}"; do
    case "$REPLY" in
    1) magma1165 ;;
    1) magma1122 ;;
    2) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function magma1165{
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  curl -O -J -L https://api.magmafoundation.org/api/resources/magma/1.16.5/dev/latest/download
  mv Magma-*.jar magma-${MAGMAVERSIONSEL}.jar
  starterFileMagma
}

function magma1122 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  curl -O -J -L https://api.magmafoundation.org/api/resources/magma/1.12.2/dev/latest/download
  mv Magma-*.jar magma-${MAGMAVERSIONSEL}.jar
  starterFileMagma
}

function starterFileMagma {
  cd ${moddedfolder:-/root/modded}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${moddedmem:-512}M -jar magma-${MAGMAVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallMagma
}

function successInstallMagma {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${MODDEDTYPESEL} ${MAGMAVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${moddedfolder:-/root/modded}\n   ${CYAN}* RAM: ${WHITE}${moddedmem:-512}M\n   ${CYAN}* Port: ${WHITE}${moddedport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Mohist ##
function mohist {
  echo -e "\n"
  mkdir ${moddedfolder:-/root/modded}
  cd ${moddedfolder:-/root/modded}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${moddedport:-25565}" > server.properties
  mohistversion
}

function mohistversion {
  MOHISTVERSION=("1.16.5" "1.12.2" "1.7.10" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select MOHISTVERSIONSEL in "${MOHISTVERSION[@]}"; do
    case "$REPLY" in
    1) mohist1165 ;;
    2) mohist1122 ;;
    3) mohist1710 ;;
    4) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function mohist1165 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  curl -o mohist-1.16.5.jar https://mohistmc.com/api/1.16.5/latest/download
  starterFileMohist
}

function mohist1122 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  curl -o mohist-1.12.2.jar https://mohistmc.com/api/1.12.2/latest/download
  starterFileMohist
}

function mohist1710 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  curl -o mohist-1.7.10.jar https://mohistmc.com/api/1.7.10/latest/download
  starterFileMohist
}

function starterFileMohist {
  cd ${moddedfolder:-/root/modded}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${moddedmem:-512}M -jar mohist-${MOHISTVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallMohist
}

function successInstallMohist {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${MODDEDTYPESEL} ${MOHISTVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${moddedfolder:-/root/modded}\n   ${CYAN}* RAM: ${WHITE}${moddedmem:-512}M\n   ${CYAN}* Port: ${WHITE}${moddedport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Arclight ##
function arclight {
  echo -e "\n"
  mkdir ${moddedfolder:-/root/modded}
  cd ${moddedfolder:-/root/modded}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${moddedport:-25565}" > server.properties
  arclightversion
}

function arclightversion {
  ARCLIGHTVERSION=("1.18" "1.17.1" "1.16.5" "1.15.2" "1.14.4" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select ARCLIGHTVERSIONSEL in "${ARCLIGHTVERSION[@]}"; do
    case "$REPLY" in
    1) arclight118 ;;
    2) arclight1171 ;;
    3) arclight1165 ;;
    4) arclight1152 ;;
    5) arclight1144 ;;
    6) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function arclight118 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  curl --silent "https://api.github.com/repos/IzzelAliz/Arclight/releases/latest" |
    grep '"browser_download_url":' |
    sed -E 's/.*"([^"]+)".*/\1/' |
    xargs wget
    mv arclight-forge-1.16-*.jar arclight-1.16.5.jar
  starterFileArclight
}

function arclight1171 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget https://github.com/IzzelAliz/Arclight/releases/download/1.17%2F1.0.2/arclight-forge-1.17.1-1.0.2.jar
  mv arclight-forge-1.17.1-1.0.2.jar arclight-1.17.1.jar
  starterFileArclight
}

function arclight1165 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  curl --silent "https://api.github.com/repos/IzzelAliz/Arclight/releases/latest" |
    grep '"browser_download_url":' |
    sed -E 's/.*"([^"]+)".*/\1/' |
    xargs wget
    mv arclight-forge-1.16-*.jar arclight-1.16.5.jar
  starterFileArclight
}

function arclight1152 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget https://github.com/IzzelAliz/Arclight/releases/download/1.15%2F1.0.19/arclight-forge-1.15-1.0.19.jar
  mv arclight-forge-1.15-1.0.19.jar arclight-1.15.2.jar
  starterFileArclight
}

function arclight1144 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget https://github.com/IzzelAliz/Arclight/releases/download/1.0.6/arclight-forge-1.14-1.0.6.jar
  mv arclight-forge-1.14-1.0.6.jar arclight-1.14.4.jar
  starterFileArclight
}

function starterFileArclight {
  cd ${moddedfolder:-/root/modded}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${moddedmem:-512}M -jar arclight-${ARCLIGHTVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallArclight
}

function successInstallarclight {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${MODDEDTYPESEL} ${ARCLIGHTVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${moddedfolder:-/root/modded}\n   ${CYAN}* RAM: ${WHITE}${moddedmem:-512}M\n   ${CYAN}* Port: ${WHITE}${moddedport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## SpongeForge ##
function spongeforge {
  echo -e "\n"
  mkdir ${moddedfolder:-/root/modded}
  cd ${moddedfolder:-/root/modded}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${moddedport:-25565}" > server.properties
  spongeforgeversion
}

function spongeforgeversion {
  SPONGEFORGEVERSION=("1.12.2" "1.12.1" "1.12" "1.11.2" "1.11" "1.10.2" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select SPONGEFORGEVERSIONSEL in "${SPONGEFORGEVERSION[@]}"; do
    case "$REPLY" in
    1) spongeforge1122 ;;
    2) spongeforge1121 ;;
    3) spongeforge112 ;;
    4) spongeforge1112 ;;
    5) spongeforge111 ;;
    6) spongeforge1102 ;;
    7) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function spongeforge1122 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2838-7.3.0/spongeforge-1.12.2-2838-7.3.0.jar
  mv spongeforge-1.12.2-2838-7.3.0.jar spongeforge-1.12.2.jar
  starterFileSpongeForge
}

function spongeforge1121 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.1-2480-7.0.0-BETA-2643/spongeforge-1.12.1-2480-7.0.0-BETA-2643.jar
  mv spongeforge-1.12.1-2480-7.0.0-BETA-2643.jar spongeforge-1.12.1.jar
  starterFileSpongeForge
}

function spongeforge112 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12-2443-7.0.0-BETA-2498/spongeforge-1.12-2443-7.0.0-BETA-2498.jar
  mv spongeforge-1.12-2443-7.0.0-BETA-2498.jar spongeforge-1.12.jar
  starterFileSpongeForge
}

function spongeforge1112 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.11.2-2476-6.1.0-BETA-2792/spongeforge-1.11.2-2476-6.1.0-BETA-2792.jar
  mv spongeforge-1.11.2-2476-6.1.0-BETA-2792.jar spongeforge-1.11.2.jar
  starterFileSpongeForge
}

function spongeforge111 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.11-2195-6.0.0-BETA-2004/spongeforge-1.11-2195-6.0.0-BETA-2004.jar
  mv spongeforge-1.11-2195-6.0.0-BETA-2004.jar spongeforge-1.11.jar
  starterFileSpongeForge
}

function spongeforge1102 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.10.2-2477-5.2.0-BETA-2793/spongeforge-1.10.2-2477-5.2.0-BETA-2793.jar
  mv spongeforge-1.10.2-2477-5.2.0-BETA-2793.jar spongeforge-1.10.2.jar
  starterFileSpongeForge
}

function starterFileSpongeForge {
  cd ${moddedfolder:-/root/modded}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${moddedmem:-512}M -jar spongeforge-${spongeforgeVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallSpongeForge
}

function successInstallSpongeForge {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${MODDEDTYPESEL} ${SPONGEFORGEVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${moddedfolder:-/root/modded}\n   ${CYAN}* RAM: ${WHITE}${moddedmem:-512}M\n   ${CYAN}* Port: ${WHITE}${moddedport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

modded
