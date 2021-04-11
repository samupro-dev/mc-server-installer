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

function spigot {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read spigotmem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/spigot): ${COLOR_NULL}"
  read spigotfolder
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 25565): ${COLOR_NULL}"
  read spigotport
  echo -e "${CYAN} Server type selected: ${YELLOW}Spigot ${COLOR_NULL}"
  SPIGOTTYPE=("Spigot" "Paper" "Yatopia" "Tuinity" "Purpur" "Glowstone" "Cancel")
  echo -e "${CYAN} Select the type of fork that suits you best! ${COLOR_NULL}"
  select OPTION in "${SPIGOTTYPE[@]}"; do
    case "$REPLY" in
    1) spigott ;;
    2) paper ;;
    3) yatopia ;;
    4) tuinity ;;
    5) purpur ;;
    6) glowstone ;;
    7) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
} 

function spigott {
  echo -e "\n"
  mkdir ${spigotfolder}
  cd ${spigotfolder}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  spigottversion
}

function spigottversion {
  SPIGOTVERSION=("1.16.5" "1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.15.2" "1.15.1" "1.15" "1.14.4" "1.14.3" "1.14.2" "1.14.1" "1.14" "1.13.2" "1.13.1" "1.13" "1.12.2" "1.12.1" "1.12" "1.11" "1.10.2" "1.9.4" "1.9.2" "1.9" "1.8.8" "1.8.3" "1.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select SPIGOTVERSIONSEL in "${SPIGOTVERSION[@]}"; do
    case "$REPLY" in
    1) spigot1165 ;;
    2) spigot1164 ;;
    3) spigot1163 ;;
    4) spigot1162 ;;
    5) spigot1161 ;;
    6) spigot1152 ;;
    7) spigot1151 ;;
    8) spigot115 ;;
    9) spigot1444 ;;
    10) spigot1143 ;;
    11) spigot1142 ;;
    12) spigot1141 ;;
    13) spigot114 ;;
    14) spigot1132 ;;
    15) spigot1131 ;;
    16) spigot113 ;;
    17) spigot1122 ;;
    18) spigot1121 ;;
    19) spigot112 ;;
    20) spigot111 ;;
    21) spigot1102 ;;
    22) spigot194 ;;
    23) spigot192 ;;
    24) spigot19 ;;
    25) spigot188 ;;
    26) spigot183 ;;
    27) spigot18 ;;
    28) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function spigot1165 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.16.5 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1164 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.16.4 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1163 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.16.3 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1162 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.16.2 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1161 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.16.1 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1152 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.15.2 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1151 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.15.1 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot115 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.15 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1444 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.14.4 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1143 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.14.3 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1142 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.14.2 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1141 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.14.1 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot114 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.14 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1132 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.13.2 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1131 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.13.1 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot113 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.13 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1122 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.12.2 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1121 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.12.1 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot112 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.12 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot111 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.11 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot1102 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.10.2 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot194 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.9.4 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot192 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.9.2 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot19 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.9 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot188 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.8.8 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot183 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.8.3 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigot18 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar BuildTools.jar --rev 1.8 nogui" > RunMe.sh
  chmod +x RunMe.sh
  spigottsuccess
}

function spigottsuccess {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Spigot ${SPIGOTVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  exit
}

function paper {
  echo -e "\n"
  mkdir ${spigotfolder}
  cd ${spigotfolder}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  paperversion
}

function paperversion {
  PAPERVERSION=("1.16.5" "1.15.2" "1.14.4" "1.13.2" "1.12.2" "1.11.2" "1.10.2" "1.9.4" "1.8.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select PAPERVERSIONSEL in "${PAPERVERSION[@]}"; do
    case "$REPLY" in
    1) paper1165 ;;
    2) paper1152 ;;
    3) paper1144 ;;
    4) paper1132 ;;
    5) paper1122 ;;
    6) paper1112 ;;
    7) paper1102 ;;
    8) paper194 ;;
    9) paper188 ;;
    10) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function paper1165 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.16.5.jar https://papermc.io/api/v1/paper/1.16.5/latest/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar paper-1.16.5.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1152 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.15.2.jar https://papermc.io/api/v1/paper/1.15.2/latest/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar paper-1.15.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1144 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.14.4.jar https://papermc.io/api/v1/paper/1.14.4/latest/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar paper-1.14.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1132 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.13.2.jar https://papermc.io/api/v1/paper/1.13.2/latest/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar paper-1.13.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1122 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.12.2.jar https://papermc.io/api/v1/paper/1.12.2/latest/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar paper-1.12.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1112 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.11.2.jar https://papermc.io/api/v1/paper/1.11.2/latest/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar paper-1.11.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper1102 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.10.2.jar https://papermc.io/api/v1/paper/1.10.2/latest/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar paper-1.10.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper194 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.9.4.jar https://papermc.io/api/v1/paper/1.9.4/latest/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar paper-1.9.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function paper188 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.8.8.jar https://papermc.io/api/v1/paper/1.8.8/latest/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar paper-1.8.8.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  papersuccess
}

function papersuccess {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Paper ${PAPERVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  exit
}

function yatopia {
  echo -e "\n"
  mkdir ${spigotfolder}
  cd ${spigotfolder}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  yatopiaversion
}

function yatopiaversion {
  YATOPIAVERSION=("1.16.5" "1.16.4" "1.16.3" "1.16.2" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select YATOPIAVERSIONSEL in "${YATOPIAVERSION[@]}"; do
    case "$REPLY" in
    1) yatopia1165 ;;
    1) yatopia1164 ;;
    2) yatopia1163 ;;
    3) yatopia1162 ;;
    4) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function yatopia1165 {
  echo -e " "
  cd ${spigotfolder}
  wget https://ci.codemc.io/job/YatopiaMC/job/Yatopia/job/ver%252F1.16.5/lastSuccessfulBuild/artifact/target/*zip*/target.zip
  unzip target.zip
  cd target/
  mv yatopia-1.16.5-*.jar	..
  cd ..
  rm target.zip
  rm -r target/
  mv yatopia-1.16.5-*.jar yatopia-1.16.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar yatopia-1.16.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  yatopiasuccess
}

function yatopia1164 {
  echo -e " "
  cd ${spigotfolder}
  wget https://ci.codemc.io/job/YatopiaMC/job/Yatopia/job/ver%252F1.16.4/lastSuccessfulBuild/artifact/target/*zip*/target.zip
  unzip target.zip
  cd target/
  mv yatopia-1.16.4-*.jar	..
  cd ..
  rm target.zip
  rm -r target/
  mv yatopia-1.16.4-*.jar yatopia-1.16.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar yatopia-1.16.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  yatopiasuccess
}

function yatopia1163 {
  echo -e " "
  cd ${spigotfolder}
  wget https://ci.codemc.io/job/YatopiaMC/job/Yatopia/job/ver%252F1.16.3/lastSuccessfulBuild/artifact/target/*zip*/target.zip
  unzip target.zip
  cd target/
  mv yatopia-1.16.3-*.jar	..
  cd ..
  rm target.zip
  rm -r target/
  mv yatopia-1.16.3-*.jar yatopia-1.16.3.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar yatopia-1.16.3.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  yatopiasuccess
}

function yatopia1162 {
  echo -e " "
  cd ${spigotfolder}
  wget https://ci.codemc.io/job/YatopiaMC/job/Yatopia/job/ver%252F1.16.2/lastSuccessfulBuild/artifact/target/*zip*/target.zip
  unzip target.zip
  cd target/
  mv yatopia-1.16.2-*.jar	..
  cd ..
  rm target.zip
  rm -r target/
  mv yatopia-1.16.2-*.jar yatopia-1.16.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar yatopia-1.16.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  yatopiasuccess
}

function yatopiasuccess {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Yatopia ${YATOPIAVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  exit
}

function tuinity {
  echo -e "\n"
  mkdir ${spigotfolder}
  cd ${spigotfolder}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  tuinityversion
}

function tuinityversion {
  TUINITYVERSION=("1.16.5" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select TUINITYVERSIONSEL in "${TUINITYVERSION[@]}"; do
    case "$REPLY" in
    1) tuinity1165 ;;
    4) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function tuinity1165 {
  echo -e " "
  cd ${spigotfolder}
  wget https://ci.codemc.io/job/Spottedleaf/job/Tuinity/lastSuccessfulBuild/artifact/tuinity-paperclip.jar
  mv tuinity-paperclip.jar tuinity-1.16.5.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar tuinity-1.16.5.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  tuinitysuccess
}

function tuinitysuccess {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Tuinity ${TUINITYVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  exit
}

function glowstone {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read glowstonemem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/glowstone): ${COLOR_NULL}"
  read glowstonefolder
  mkdir ${glowstonefolder}
  cd ${glowstonefolder}
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 25599): ${COLOR_NULL}"
  read glowstoneport
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${glowstoneport}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  glowstoneversion
}

function glowstoneversion {
  GLOWSTONEVERSION=("1.12.2" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select GLOWSTONEVERSIONSEL in "${GLOWSTONEVERSION[@]}"; do
    case "$REPLY" in
    1) glowstone1122 ;;
    4) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function glowstone1122 {
  echo -e " "
  cd ${glowstonefolder}
  wget https://repo.glowstone.net/repository/releases/net/glowstone/glowstone/2020.12.0/glowstone-2020.12.0.jar
  mv glowstone-2020.12.0.jar glowstone-1.12.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${glowstonemem}M -jar glowstone-1.12.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  glowstonesuccess
}

function glowstonesuccess {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Glowstone ${GLOWSTONEVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${glowstonefolder}\n   ${CYAN}* RAM: ${WHITE}${glowstonemem}M\n   ${CYAN}* Port: ${WHITE}${glowstoneport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  exit
}





function purpur {
  echo -e "\n"
  mkdir ${spigotfolder}
  cd ${spigotfolder}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  purpurversion
}

function purpurversion {
  PURPURVERSION=("1.16.5" "1.16.4" 1.16.3 1.16.2 1.16.1 1.15.2 1.15.1 1.15 1.14.4 1.14.3 1.14.2 1.14.1 "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select PURPURVERSIONSEL in "${PURPURVERSION[@]}"; do
    case "$REPLY" in
    1) purpur1165 ;;
    2) purpur1164 ;;
    3) purpur1163 ;;
    4) purpur1162 ;;
    5) purpur1161 ;;
    6) purpur1152 ;;
    7) purpur1151 ;;
    8) purpur115 ;;
    9) purpur1144 ;;
    10) purpur1143 ;;
    11) purpur1142 ;;
    12) purpur1141 ;;
    13) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function purpur1165 {
  echo -e " "
  cd ${spigotfolder}
  wget https://ci.pl3x.net/job/Purpur/lastSuccessfulBuild/artifact/final/*zip*/final.zip
  unzip final.zip
  cd final/
  mv purpurclip-*.jar ..
  cd ..
  rm -r final/
  rm final.zip
  mv purpurclip-*.jar	purpur-1.16.5.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-1.16.5.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  purpursuccess
}

function purpur1164 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.16.4.jar https://purpur.pl3x.net/api/v1/purpur/1.16.4/956/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-1.16.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  purpursuccess
}

function purpur1163 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.16.3.jar https://purpur.pl3x.net/api/v1/purpur/1.16.3/808/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-1.16.3.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  purpursuccess
}

function purpur1162 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.16.2.jar https://purpur.pl3x.net/api/v1/purpur/1.16.2/750/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-1.16.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  purpursuccess
}

function purpur1161 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.16.1.jar https://purpur.pl3x.net/api/v1/purpur/1.16.1/710/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-1.16.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  purpursuccess
}

function purpur1152 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.15.2.jar https://purpur.pl3x.net/api/v1/purpur/1.15.2/606/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-1.15.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  purpursuccess
}

function purpur1151 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.15.1.jar https://purpur.pl3x.net/api/v1/purpur/1.15.1/397/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-1.15.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  purpursuccess
}

function purpur115 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.15.jar https://purpur.pl3x.net/api/v1/purpur/1.15/346/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-1.15.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  purpursuccess
}

function purpur1144 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.14.4.jar https://purpur.pl3x.net/api/v1/purpur/1.14.4/337/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-1.14.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  purpursuccess
}

function purpur1143 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.14.3.jar https://purpur.pl3x.net/api/v1/purpur/1.14.3/202/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-1.14.3.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  purpursuccess
}

function purpur1142 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.14.2.jar https://purpur.pl3x.net/api/v1/purpur/1.14.2/126/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-1.14.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  purpursuccess
}

function purpur1141 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.14.1.jar https://purpur.pl3x.net/api/v1/purpur/1.14.1/63/download
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-1.14.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  purpursuccess
}

function purpursuccess {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Purpur ${PURPURVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  exit
}

spigot
