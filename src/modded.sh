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

function modded_conf {
  echo -e "\n${YELLOW}[[[--- Welcome to the setup for configuring your server! ---]]]${COLOR_NULL}\n"
  echo -e -n "${CYAN} ( * ) Enter the amount of RAM to allocate in megabytes (default: 2048): ${COLOR_NULL}"
  read moddedmem
  echo -e -n "${CYAN} ( * ) Enter the directory where the server will be installed (default: /root/modded): ${COLOR_NULL}"
  read moddedfolder
  echo -e -n "${CYAN} ( * ) Enter the port where to host the server (default: 25565): ${COLOR_NULL}"
  read moddedport
  echo -e -n "${CYAN} ( * ) Do you want to grant server access only to premium users? (default: false): ${COLOR_NULL}"
  read moddedomode
  echo -e -n "${CYAN} ( * ) How many maximum players should the server have? (default: 20): ${COLOR_NULL}"
  read moddedmplayers
  echo -e -n "${CYAN} ( * ) Do you want to accept the EULA for minecraft? (default: true): ${COLOR_NULL}"
  read moddedeula
  echo -e "\n${LIGHT_RED} !! ${CYAN}Server type selected: ${YELLOW}MODDED ${COLOR_NULL}"
  moddedtype=("Forge" "Magma" "Mohist" "Arclight" "SpongeForge" "CatServer" "Crucible" "Krypton" "Banner" "Fabric" "Cancel")
  echo -e "${CYAN} ( * ) Select the type of fork that suits you best! ${COLOR_NULL}"
  select moddedtype_sel in "${moddedtype[@]}"; do
    case "$REPLY" in
    1) forge ;;
    2) magma ;;
    3) mohist ;;
    4) arclight ;;
    5) spongeforge ;;
    6) catserver ;;
    7) crucible ;;
    8) krypton ;;
    9) banner ;;
    10) fabric ;;
    11) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function modded_setup {
  echo -e "\n"
  mkdir ${moddedfolder:-/root/modded}
  cd ${moddedfolder:-/root/modded}
  echo -e "${YELLOW} Setting up the server settings. . . ${COLOR_NULL}"
  echo -e "server-port=${moddedport:-25565}\nonline-mode=${moddedomode:-false}\nmax-players=${moddedmplayers:-20}" > server.properties
  echo -e "${YELLOW} Setting up the EULA file. . . ${COLOR_NULL}"
  echo -e "# The minecraft EULA file has been set to ' ${moddedeula:-true} ' by the user who ran the script.\n# https://github.com/samupro-dev/mc-server-installer\neula=${moddedeula:-true}" > eula.txt
  echo -e "${YELLOW} Fetching the versions. . . (it might take a while)\n ${COLOR_NULL}"
}

## forge ##
function forge {
  modded_setup
  forgever_list=$(curl -s -sSL https://files.minecraftforge.net/maven/net/minecraftforge/forge/promotions_slim.json | jq -r '.promos | to_entries[] | select(.key | endswith("-latest")) | .key | rtrimstr("-latest")' | grep -v '_' | tac)
  forgever=($forgever_list "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select forgever_sel in "${forgever[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#forgever[@]} ]]; then
      stepsForge
    elif [[ $REPLY -eq ${#forgever[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsForge {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  forge_build=$(curl -s -sSL https://files.minecraftforge.net/maven/net/minecraftforge/forge/promotions_slim.json | jq -r ".promos.\"$forgever_sel-latest\"")
  wget https://maven.minecraftforge.net/net/minecraftforge/forge/${forgever_sel}-${forge_build}/forge-${forgever_sel}-${forge_build}-installer.jar
  java -jar forge-${forgever_sel}-${forge_build}-installer.jar --installServer
  rm *-installer*
  starterFile
}

## magma ##
function magma {
  modded_setup
  magmaver_list=$(curl -s -X 'GET' 'https://api.magmafoundation.org/api/v2/allVersions' -H 'accept: application/json' | jq -r '.[]')
  magmaver=($magmaver_list "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select magmaver_sel in "${magmaver[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#magmaver[@]} ]]; then
      stepsMagma
    elif [[ $REPLY -eq ${#magmaver[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsMagma {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget --content-disposition https://api.magmafoundation.org/api/v2/${magmaver_sel}/latest/download
  mv Magma-*.jar magma-${magmaver_sel}.jar
  starterFile
}

## mohist ##
function mohist {
  modded_setup
  mohistver_list=$(curl -s -X 'GET' 'https://mohistmc.com/api/v2/projects/mohist' -H 'accept: application/json' | jq -r '.versions[]' | tac)
  mohistver=($mohistver_list "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select mohistver_sel in "${mohistver[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#mohistver[@]} ]]; then
      stepsMohist
    elif [[ $REPLY -eq ${#mohistver[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsMohist {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget --content-disposition https://mohistmc.com/api/v2/projects/mohist/${mohistver_sel}/builds/latest/download
  mv mohist-*.jar mohist-${mohistver_sel}.jar
  starterFile
}

## arclight ##
function arclight {
  modded_setup
  arclightver_list=$(curl -s https://files.hypoglycemia.icu/v1/files/arclight/minecraft | jq -r '.files | sort_by(.["last-modified"]) | reverse | .[].name')
  arclightver=($arclightver_list "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select arclightver_sel in "${arclightver[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#arclightver[@]} ]]; then
      stepsArclight
    elif [[ $REPLY -eq ${#arclightver[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsArclight {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget --content-disposition https://files.hypoglycemia.icu/v1/files/arclight/minecraft/${arclightver_sel}/latest-snapshot/forge
  mv arclight-*.jar arclight-${arclightver_sel}.jar
  starterFile
}

## spongeforge ##
function spongeforge {
  modded_setup
  spongeforgever_list=$(curl -s -X 'GET' 'https://dl-api.spongepowered.org/v2/groups/org.spongepowered/artifacts/spongeforge' -H 'accept: application/json' | jq -r '.tags.minecraft[]')
  spongeforgever=($spongeforgever_list "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select spongeforgever_sel in "${spongeforgever[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#spongeforgever[@]} ]]; then
      stepsSpongeForge
    elif [[ $REPLY -eq ${#spongeforgever[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsSpongeForge {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  spongeforge_temp=$(curl -s -X 'GET' "https://dl-api.spongepowered.org/v2/groups/org.spongepowered/artifacts/spongeforge/versions?tags=minecraft%3A${spongeforgever_sel}" -H 'accept: application/json' | jq -r '.artifacts | keys_unsorted[0]')
  spongeforge_build=$(curl -s -X 'GET' "https://dl-api.spongepowered.org/v2/groups/org.spongepowered/artifacts/spongeforge/versions/${spongeforge_temp}" -H 'accept: application/json' | jq -r '.assets[] | select(.extension == "jar" and .classifier == "") | .downloadUrl' | head -n 1)
  wget ${spongeforge_build}
  mv spongeforge-*.jar spongeforge-${spongeforgever_sel}.jar
  starterFile
}

## catserver ##
function catserver {
  modded_setup
  catserverver=("1.18.2" "1.16.5" "1.12.2" "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select catserverver_sel in "${catserverver[@]}"; do
    case "$REPLY" in
    1|2) stepsCatServer ;;
    3) catserver1122 ;;
    4) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function stepsCatServer {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget https://jenkins.rbqcloud.cn:30011/job/CatServer-${catserverver_sel}/lastSuccessfulBuild/artifact/projects/forge/build/libs/*zip*/libs.zip
  unzip libs.zip
  mv libs/CatServer-*.jar catserver-${catserverver_sel}.jar
  rm -r libs/ libs.zip
  starterFile
}

function catserver1122 {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget https://jenkins.rbqcloud.cn:30011/job/CatServer-1.12.2/lastSuccessfulBuild/artifact/build/distributions/*zip*/distributions.zip
  unzip distributions.zip
  mv distributions/CatServer-*.jar catserver-${catserverver_sel}.jar
  rm -r distributions/ distributions.zip
  starterFile
}

## crucible ##
function crucible {
  modded_setup
  cruciblever=("1.7.10" "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select cruciblever_sel in "${cruciblever[@]}"; do
    case "$REPLY" in
    1) stepsCrucible ;;
    2) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function stepsCrucible {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  crucible_build=$(curl -s https://api.github.com/repos/CrucibleMC/Crucible/releases | jq -r '.[0].assets[] | select(.content_type == "application/java-archive") | .browser_download_url')
  wget ${crucible_build}
  mv Crucible-*.jar crucible-${cruciblever_sel}.jar
  starterFile
}

## krypton ##
function krypton {
  modded_setup
  kryptonver=("Latest" "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select kryptonver_sel in "${kryptonver[@]}"; do
    case "$REPLY" in
    1) stepsKrypton ;;
    2) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function stepsKrypton {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget --content-disposition https://api.kryptonmc.org/downloads/v1/krypton/latest/download
  mv krypton-*.jar krypton-latest.jar
  starterFile
}

## fabric ##
function fabric {
  modded_setup
  fabricver_list=$(curl -s https://meta.fabricmc.net/v2/versions | jq -r '.game[] | select(.stable == true) | .version')
  fabricver=($fabricver_list "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select fabricver_sel in "${fabricver[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#fabricver[@]} ]]; then
      stepsFabric
    elif [[ $REPLY -eq ${#fabricver[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsFabric {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  fabric_temp=$(curl -s https://meta.fabricmc.net/v2/versions/installer | jq -r '.[0].version')
  fabric_build=$(curl -s "https://meta.fabricmc.net/v2/versions/loader/${fabricver_sel}" | jq -r '.[0].loader.version')
  wget --content-disposition https://meta.fabricmc.net/v2/versions/loader/${fabricver_sel}/${fabric_build}/${fabric_temp}/server/jar
  mv fabric-*.jar fabric-${fabricver_sel}.jar
  starterFile
}

## banner ##
function banner {
  modded_setup
  bannerver_list=$(curl -s -X 'GET' 'https://mohistmc.com/api/v2/projects/banner' -H 'accept: application/json' | jq -r '.versions[]' | tac)
  bannerver=($bannerver_list "Cancel")
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  select bannerver_sel in "${bannerver[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#bannerver[@]} ]]; then
      stepsBanner
    elif [[ $REPLY -eq ${#bannerver[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsBanner {
  echo -e " "
  cd ${moddedfolder:-/root/modded}
  wget --content-disposition https://mohistmc.com/api/v2/projects/banner/${bannerver_sel}/builds/latest/download
  mv banner-*.jar banner-${bannerver_sel}.jar
  starterFile
}

## end ##
function starterFile {
  modded_name=$(echo "${moddedtype_sel}" | tr '[:upper:]' '[:lower:]')
  final_name="${modded_name}ver_sel"
  server_version="${!final_name}"
  cd ${moddedfolder:-/root/modded}
  if [ "$moddedtype_sel" = "Forge" ]; then
    java_args="./run.sh"
  elif [ "$moddedtype_sel" = "Krypton" ]; then
    java_args="java -Xms128M -Xmx${moddedmem:-2048}M -jar ${modded_name}-latest.jar nogui"
  else
    java_args="java -Xms128M -Xmx${moddedmem:-2048}M -jar ${modded_name}-${server_version}.jar nogui"
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
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${moddedtype_sel} ${server_version}\n   ${CYAN}* Location: ${WHITE}${moddedfolder:-/root/modded}\n   ${CYAN}* RAM: ${WHITE}${moddedmem:-2048}M\n   ${CYAN}* Port: ${WHITE}${moddedport:-19132} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit 0
}

modded_conf
