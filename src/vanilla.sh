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

function vanilla {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read vanillamem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/vanilla): ${COLOR_NULL}"
  read vanillafolder
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 25565): ${COLOR_NULL}"
  read vanillaport
  echo -e "${CYAN} Server type selected: ${YELLOW}Vanilla ${COLOR_NULL}"
  vanillaa
} 

function vanillaa {
  echo -e "\n"
  mkdir ${vanillafolder}
  cd ${vanillafolder}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${vanillaport}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  vanillaversion
}

function vanillaversion {
  VANILLAVERSION=("1.16.5" "1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.16" "1.15.2" "1.15.1" "1.15" "1.14.4" "1.14.3" "1.14.2" "1.14.1" "1.14" "1.13.2" "1.13.1" "1.13" "1.12.2" "1.12.1" "1.12" "1.11.2" "1.11.1" "1.11" "1.10.2" "1.9.4" "1.9.3" "1.9.2" "1.9.1" "1.9" "1.8.8" "1.8.7" "1.8.6" "1.8.5" "1.8.4" "1.8.3" "1.8.2" "1.8.1" "1.8" "1.7.10" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select VANILLAVERSIONSEL in "${VANILLAVERSION[@]}"; do
    case "$REPLY" in
    1) vanilla1165 ;;
    2) vanilla1164 ;;
    3) vanilla1163 ;;
    4) vanilla1162 ;;
    5) vanilla1161 ;;
    6) vanilla116 ;;
    7) vanilla1152 ;;
    8) vanilla1151 ;;
    9) vanilla115 ;;
    10) vanilla1144 ;;
    11) vanilla1143 ;;
    12) vanilla1142 ;;
    13) vanilla1141 ;;
    14) vanilla114 ;;
    15) vanilla1132 ;;
    16) vanilla1131 ;;
    17) vanilla113 ;;
    18) vanilla1122 ;;
    19) vanilla1121 ;;
    20) vanilla112 ;;
    21) vanilla1122 ;;
    22) vanilla1121 ;;
    23) vanilla112 ;;
    24) vanilla1112 ;;
    25) vanilla1111 ;;
    26) vanilla111 ;;
    27) vanilla1102 ;;
    28) vanilla194 ;;
    29) vanilla193 ;;
    30) vanilla192 ;;
    31) vanilla191 ;;
    32) vanilla19 ;;
    34) vanilla188 ;;
    35) vanilla187 ;;
    36) vanilla186 ;;
    37) vanilla185 ;;
    38) vanilla184 ;;
    39) vanilla184 ;;
    40) vanilla183 ;;
    41) vanilla182 ;;
    42) vanilla181 ;;
    43) vanilla1710 ;;
    44) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function vanilla1165 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.16.5.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.16.5.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1164 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.16.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.16.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1163 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.16.3.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.16.3.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1162 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.16.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.16.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1161 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.16.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.16.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla116 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.16.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.16.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1152 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.15.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.15.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1151 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.15.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.15.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla115 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.15.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.15.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1144 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.14.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.14.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1143 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.14.3.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.14.3.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1142 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.14.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.14.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1141 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.14.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.14.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla114 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.14.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.14.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1132 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.13.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.13.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1131 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.13.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.13.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla113 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.13.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.13.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1122 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.12.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.12.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1121 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.12.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.12.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla112 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.12.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.12.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1112 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.11.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.11.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1111 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.11.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.11.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla111 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.11.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.11.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1102 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.10.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.10.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla194 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.9.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.9.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla193 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.9.3.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.9.3.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla192 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.9.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.9.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla191 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.9.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.9.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla19 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.9.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.9.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla188 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.8.8.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.8.8.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla187 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.8.7.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.8.7.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla186 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.8.6.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.8.6.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla185 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.8.5.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.8.5.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla184 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.8.4.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.8.4.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla183 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.8.3.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.8.3.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla182 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.8.2.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.8.2.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla181 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.8.1.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.8.1.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla18 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.8.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.8.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanilla1710 {
  echo -e " "
  cd ${vanillafolder}
  wget https://serverjars.com/jars/vanilla/vanilla/vanilla-1.7.10.jar
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-1.7.10.jar nogui" > RunMe.sh
  chmod +x RunMe.sh
  vanillasuccess
}

function vanillasuccess {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Vanilla ${VANILLAVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${vanillafolder}\n   ${CYAN}* RAM: ${WHITE}${vanillamem}M\n   ${CYAN}* Port: ${WHITE}${vanillaport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  exit 1
}

vanilla
