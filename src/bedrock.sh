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

function bedrock {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read bedrockmem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/bedrock): ${COLOR_NULL}"
  read bedrockfolder
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 19132): ${COLOR_NULL}"
  read bedrockport
  echo -e "${CYAN} Server type selected: ${YELLOW}Bedrock ${COLOR_NULL}"
  BEDROCKTYPE=("Bedrock" "NukkitX" "Cancel")
  echo -e "${CYAN} Select the type of fork that suits you best! ${COLOR_NULL}"
  select BEDROCKTYPESEL in "${BEDROCKTYPE[@]}"; do
    case "$REPLY" in
    1) bedrockk ;;
    2) nukkitx ;;
    3) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

## Bedrock ##
function bedrockk {
  echo -e "\n"
  mkdir ${bedrockfolder:-/root/bedrock}
  cd ${bedrockfolder:-/root/bedrock}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${bedrockport:-19132}" > server.properties
  bedrockkversion
}

function bedrockkversion {
  BEDROCKKVERSION=("Latest" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select BEDROCKKVERSIONSEL in "${BEDROCKKVERSION[@]}"; do
    case "$REPLY" in
    1) bedrockklatest ;;
    4) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function bedrockklatest {
  echo -e " "
  cd ${bedrockfolder:-/root/bedrock}
  curl -L -A "Mozilla/5.0 (X11; Linux x86_64; rv:99.0) Gecko/20100101 Firefox/99.0" -H "Accept-Language: en" -H "Accept-Encoding: gzip, deflate" -o versions.html.gz https://www.minecraft.net/en-us/download/server/bedrock
  read bedrockver <<< $(zgrep -o 'https://minecraft.azureedge.net/bin-linux/[^"]*' versions.html.gz)
  wget ${bedrockver}
  rm versions.html.gz
  unzip bedrock-server*.zip > /dev/null
  rm bedrock-server*.zip
  starterFileBedrockk
}

function starterFileBedrockk {
  cd ${bedrockfolder:-/root/bedrock}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  ./bedrock_server" >> starter.sh
  chmod +x starter.sh
  successInstall
}

## NukkitX ##
function nukkitx {
  echo -e "\n"
  mkdir ${bedrockfolder:-/root/bedrock}
  cd ${bedrockfolder:-/root/bedrock}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${bedrockport:-19132}" > server.properties
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
  cd ${bedrockfolder:-/root/bedrock}
  wget https://ci.opencollab.dev/job/NukkitX/job/Nukkit/job/master/lastSuccessfulBuild/artifact/target/nukkit-1.0-SNAPSHOT.jar
  mv nukkit-1.0-SNAPSHOT.jar NukkitX.jar
  starterFile
}

## Starter ##
function starterFile {
  cd ${bedrockfolder:-/root/bedrock}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${bedrockmem:-512}M -jar ${BEDROCKTYPESEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstall
}

## Success ##
function successInstall {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${BEDROCKTYPESEL}\n   ${CYAN}* Location: ${WHITE}${bedrockfolder:-/root/bedrock}\n   ${CYAN}* RAM: ${WHITE}${bedrockmem:-512}M\n   ${CYAN}* Port: ${WHITE}${bedrockport:-19132} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

bedrock
