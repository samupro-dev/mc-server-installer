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

function bedrock_conf {
  echo -e "\n${YELLOW}[[[--- Welcome to the setup for configuring your server! ---]]]${COLOR_NULL}\n"
  echo -e -n "${CYAN} ( * ) Enter the amount of RAM to allocate in megabytes (default: 2048): ${COLOR_NULL}"
  read bedrockmem
  echo -e -n "${CYAN} ( * ) Enter the directory where the server will be installed (default: /root/bedrock): ${COLOR_NULL}"
  read bedrockfolder
  echo -e -n "${CYAN} ( * ) Enter the port where to host the server (default: 25565): ${COLOR_NULL}"
  read bedrockport
  echo -e -n "${CYAN} ( * ) Do you want to grant server access only to premium users? (default: false): ${COLOR_NULL}"
  read bedrockomode
  echo -e -n "${CYAN} ( * ) How many maximum players should the server have? (default: 20): ${COLOR_NULL}"
  read bedrockmplayers
  echo -e -n "${CYAN} ( * ) Do you want to accept the EULA for minecraft? (default: true): ${COLOR_NULL}"
  read bedrockeula
  echo -e "\n${LIGHT_RED} !! ${CYAN}Server type selected: ${YELLOW}BEDROCK ${COLOR_NULL}"
  bedrocktype=("Bedrock" "NukkitX" "PowerNukkitX" "Cancel")
  echo -e "${CYAN} ( * ) Select the type of fork that suits you best! ${COLOR_NULL}"
  select bedrocktype_sel in "${bedrocktype[@]}"; do
    case "$REPLY" in
    1) bedrock ;;
    2) nukkitx ;;
    3) powernukkitx ;;
    4) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function bedrock_setup {
  echo -e "\n"
  mkdir ${bedrockfolder:-/root/bedrock}
  cd ${bedrockfolder:-/root/bedrock}
  echo -e "${YELLOW} Setting up the server settings. . . ${COLOR_NULL}"
  echo -e "server-port=${bedrockport:-25565}\nonline-mode=${bedrockomode:-false}\nmax-players=${bedrockmplayers:-20}" > server.properties
  echo -e "${YELLOW} Setting up the EULA file. . . ${COLOR_NULL}"
  echo -e "# The minecraft EULA file has been set to ' ${bedrockeula:-true} ' by the user who ran the script.\n# https://github.com/samupro-dev/mc-server-installer\neula=${bedrockeula:-true}" > eula.txt
  echo -e "${YELLOW} Fetching the versions. . . (it might take a while)\n ${COLOR_NULL}"
}

## bedrock ##
function bedrock {
  bedrock_setup
  bedrockver=("Latest" "Preview" "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select bedrockver_sel in "${bedrockver[@]}"; do
    case "$REPLY" in
    1) stepsBedrock ;;
    2) stepsBedrockPrev ;;
    3) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function stepsBedrock {
  echo -e " "
  cd ${bedrockfolder:-/root/bedrock}
  useragent=$(curl -s https://jnrbsn.github.io/user-agents/user-agents.json | jq -r '.[] | select(. | contains("Linux x86_64")) | select(. | contains("Chrome"))')
  bedrockver=$(curl -sL -A "${useragent}" -H "Accept-Language: en" -H "Accept-Encoding: gzip, deflate" https://www.minecraft.net/en-us/download/server/bedrock | zgrep -o 'https://minecraft.azureedge.net/bin-linux/[^"]*')
  wget ${bedrockver}
  unzip bedrock-server*.zip
  rm bedrock-server*.zip
  starterFile
}

function stepsBedrockPrev {
  echo -e " "
  cd ${bedrockfolder:-/root/bedrock}
  useragent=$(curl -s https://jnrbsn.github.io/user-agents/user-agents.json | jq -r '.[] | select(. | contains("Linux x86_64")) | select(. | contains("Chrome"))')
  bedrockver=$(curl -sL -A "${useragent}" -H "Accept-Language: en" -H "Accept-Encoding: gzip, deflate" https://www.minecraft.net/en-us/download/server/bedrock | zgrep -o 'https://minecraft.azureedge.net/bin-linux-preview/[^"]*')
  wget ${bedrockver}
  unzip bedrock-server*.zip
  rm bedrock-server*.zip
  starterFile
}

## nukkitx ##
function nukkitx {
  bedrock_setup
  nukkitxver=("Latest" "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select nukkitxver_sel in "${nukkitxver[@]}"; do
    case "$REPLY" in
    1) stepsNukkitX ;;
    2) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function stepsNukkitX {
  echo -e " "
  cd ${bedrockfolder:-/root/bedrock}
  wget https://ci.opencollab.dev/job/NukkitX/job/Nukkit/job/master/lastSuccessfulBuild/artifact/target/nukkit-1.0-SNAPSHOT.jar
  mv nukkit-1.0-SNAPSHOT.jar nukkitx.jar
  starterFile
}

## powernukkitx ##
function powernukkitx {
  bedrock_setup
  powernukkitxver=("Latest" "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select powernukkitxver_sel in "${powernukkitxver[@]}"; do
    case "$REPLY" in
    1) stepsPowerNukkitX ;;
    2) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function stepsPowerNukkitX {
  echo -e " "
  cd ${bedrockfolder:-/root/bedrock}
  powernukkitx_build=$(curl -s https://api.github.com/repos/PowerNukkitX/PNX-CLI/releases | jq -r '.[0].assets[] | select(.content_type == "application/java-archive") | .browser_download_url')
  wget ${powernukkitx_build}
  mv PNX-CLI-*.jar PNX-CLI.jar
  starterFile
}

## end ##
function starterFile {
  bedrock_name=$(echo "${bedrocktype_sel}" | tr '[:upper:]' '[:lower:]')
  cd ${bedrockfolder:-/root/bedrock}
  if [ "$bedrocktype_sel" = "Bedrock" ]; then
    java_args="./bedrock_server"
  elif [ "$bedrocktype_sel" = "PowerNukkitX" ]; then
    java_args="java -jar PNX-CLI.jar start"
  else
    java_args="java -Xms128M -Xmx${bedrockmem:-2048}M -jar ${bedrock_name}.jar nogui"
  fi
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  ${java_args}" >> starter.sh
  chmod +x starter.sh
  successInstall
}

function successInstall {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${bedrocktype_sel}\n   ${CYAN}* Location: ${WHITE}${bedrockfolder:-/root/bedrock}\n   ${CYAN}* RAM: ${WHITE}${bedrockmem:-2048}M\n   ${CYAN}* Port: ${WHITE}${bedrockport:-19132} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit 0
}

bedrock_conf
