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

function vanilla_conf {
  echo -e "\n${YELLOW}[[[--- Welcome to the setup for configuring your server! ---]]]${COLOR_NULL}\n"
  echo -e -n "${CYAN} ( * ) Enter the amount of RAM to allocate in megabytes (default: 2048): ${COLOR_NULL}"
  read vanillamem
  echo -e -n "${CYAN} ( * ) Enter the directory where the server will be installed (default: /root/vanilla): ${COLOR_NULL}"
  read vanillafolder
  echo -e -n "${CYAN} ( * ) Enter the port where to host the server (default: 25565): ${COLOR_NULL}"
  read vanillaport
  echo -e -n "${CYAN} ( * ) Do you want to grant server access only to premium users? (default: false): ${COLOR_NULL}"
  read vanillaomode
  echo -e -n "${CYAN} ( * ) How many maximum players should the server have? (default: 20): ${COLOR_NULL}"
  read vanillamplayers
  echo -e -n "${CYAN} ( * ) Do you want to accept the EULA for minecraft? (default: true): ${COLOR_NULL}"
  read vanillaeula
  echo -e "\n${LIGHT_RED} !! ${CYAN}Server type selected: ${YELLOW}VANILLA ${COLOR_NULL}"
  vanillatype=("Vanilla" "Snapshot" "Cancel")
  echo -e "${CYAN} ( * ) Select the one that suits you best! ${COLOR_NULL}"
  select vanillatype_sel in "${vanillatype[@]}"; do
    case "$REPLY" in
    1) vanilla ;;
    2) snapshot ;;
    3) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function vanilla_setup {
  echo -e "\n"
  mkdir -p ${vanillafolder:-/root/vanilla}
  cd ${vanillafolder:-/root/vanilla}
  echo -e "${YELLOW} Setting up the server settings. . . ${COLOR_NULL}"
  echo -e "server-port=${vanillaport:-25565}\nonline-mode=${vanillaomode:-false}\nmax-players=${vanillamplayers:-20}" > server.properties
  echo -e "${YELLOW} Setting up the EULA file. . . ${COLOR_NULL}"
  echo -e "# The minecraft EULA file has been set to ' ${vanillaeula:-true} ' by the user who ran the script.\n# https://github.com/samupro-dev/mc-server-installer\neula=${vanillaeula:-true}" > eula.txt
  echo -e "${YELLOW} Fetching the versions. . . (it might take a while)\n ${COLOR_NULL}"
}

## vanilla ##
function vanilla {
  vanilla_setup
  vanillaver_list=$(curl -s https://piston-meta.mojang.com/mc/game/version_manifest.json | jq -r '.versions[] | select(.type == "release") | .id')
  vanillaver=($vanillaver_list "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select vanillaver_sel in "${vanillaver[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#vanillaver[@]} ]]; then
      stepsVanilla
    elif [[ $REPLY -eq ${#vanillaver[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsVanilla {
  vanilla_temp=$(curl -s 'https://piston-meta.mojang.com/mc/game/version_manifest.json' | jq -r '.versions[] | select(.id=="'"${vanillaver_sel}"'") | .url')
  vanilla_jar=$(curl -s ${vanilla_temp} | jq -r '.downloads.server.url')
  curl -so vanilla-${vanillaver_sel}.jar ${vanilla_jar}
  starterFile
}

## snapshot ##
function snapshot {
  vanilla_setup
  snapshotver=("Latest" "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select snapshotver_sel in "${snapshotver[@]}"; do
    case "$REPLY" in
    1) stepsSnapshot ;;
    2) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function stepsSnapshot {
  snapshot_tempver=$(curl -s 'https://piston-meta.mojang.com/mc/game/version_manifest.json' | jq -r '.latest.snapshot')
  snapshot_temp=$(curl -s 'https://piston-meta.mojang.com/mc/game/version_manifest.json' | jq -r '.versions[] | select(.id=="'"${snapshot_tempver}"'") | .url')
  snapshot_jar=$(curl -s ${snapshot_temp} | jq -r '.downloads.server.url')
  curl -so snapshot-${snapshotver_sel}.jar ${snapshot_jar}
  starterFile
}

## end ##
function starterFile {
  vanilla_name=$(echo "${vanillatype_sel}" | tr '[:upper:]' '[:lower:]')
  final_name="${vanilla_name}ver_sel"
  server_version="${!final_name}"
  cd ${vanillafolder:-/root/vanilla}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem:-2048}M -jar ${vanillatype_sel}-${server_version}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstall
}

function successInstall {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${vanillatype_sel} ${server_version}\n   ${CYAN}* Location: ${WHITE}${vanillafolder:-/root/vanilla}\n   ${CYAN}* RAM: ${WHITE}${vanillamem:-2048}M\n   ${CYAN}* Port: ${WHITE}${vanillaport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit 0
}

vanilla_conf
