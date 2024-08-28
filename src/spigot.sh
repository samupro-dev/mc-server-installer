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

function spigot_conf {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (default: 2048): ${COLOR_NULL}"
  read spigotmem
  echo -e -n "${CYAN} Enter the location of the server folder. (default: /root/spigot): ${COLOR_NULL}"
  read spigotfolder
  echo -e -n "${YELLOW} Enter the port of the server. (default: 25565): ${COLOR_NULL}"
  read spigotport
  echo -e "${CYAN} Server type selected: ${YELLOW}Spigot ${COLOR_NULL}"
  spigottype=("Spigot" "Paper" "Purpur" "Glowstone" "Pufferfish" "Folia" "Cancel")
  echo -e "${CYAN} Select the type of fork that suits you best! ${COLOR_NULL}"
  select spigottype_sel in "${spigottype[@]}"; do
    case "$REPLY" in
    1) spigot ;;
    2) paper ;;
    3) purpur ;;
    4) glowstone ;;
    5) pufferfish ;;
    6) folia ;;
    7) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
} 

function spigot_setup {
  echo -e "\n"
  mkdir ${spigotfolder:-/root/spigot}
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport:-25565}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
}

## spigot ##
function spigot {
  spigot_setup
  spigot_temp=$(curl -s https://hub.spigotmc.org/nexus/content/repositories/snapshots/org/spigotmc/spigot-api/maven-metadata.xml | grep -oP '<version>\K\d+(\.\d+)+(?=-R0)' | tr '\n' ' ' | sed 's/ \{1,\}/\n/g')
  echo '{ "versions": [' > versions.json
  first=true
  for spigot_tempver in $spigot_temp; do
    build_number=$(curl -s https://hub.spigotmc.org/versions/$spigot_tempver.json | jq -r '.name')
    if [ "$first" = false ]; then
      echo ',' >> versions.json
    else
      first=false
    fi
    echo '  {"version": "'"$spigot_tempver"'", "build_number": "'"$build_number"'"}' >> versions.json
  done
  echo '  ] }' >> versions.json
  spigotver_list=$(cat versions.json | jq -r 'reduce .versions[] as $v ({}; .[$v.build_number] = $v.version) | .[]' | tac)
  rm versions.json
  spigotver=($spigotver_list "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select spigotver_sel in "${spigotver[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#spigotver[@]} ]]; then
      stepsSpigot
    elif [[ $REPLY -eq ${#spigotver[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsSpigot {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo -e "${YELLOW} The building of the jar is in progress. . . (it will take a while)${COLOR_NULL}"
  if [[ $spigotver_sel =~ ^1.21.* ||  "$spigotver_sel" = "1.20.6" ]]; then
    java_version="21"
  elif [[ $spigotver_sel =~ ^1.20.* || $spigotver_sel =~ ^1.19.* || $spigotver_sel =~ ^1.18.* || $spigotver_sel == "1.17.1" ]]; then
    java_version="17"
  elif [ "$spigotver_sel" = "1.17" ]; then
    java_version="16"
  else
    java_version="8"
  fi
  java_jre=$(curl -s -X GET "https://api.azul.com/metadata/v1/zulu/packages/?java_version=${java_version}&os=linux&arch=x64&archive_type=tar.gz&java_package_type=jre&latest=true&release_status=ga&availability_types=CA&page=1&page_size=100" -H "accept: application/json" | jq -r 'map(select(.download_url | test("zulu.*-ca-jre.*-linux_x64.tar.gz")) | .download_url) | .[0]')
  wget ${java_jre}
  java_tar=$(find . -type f -name "*.tar.gz" | sed 's/^\.\///')
  tar -zxvf ${java_tar}
  java_folder=$(basename "$java_tar" .tar.gz)
  "${spigotfolder:-/root/spigot}/${java_folder}/bin/java" -Xms1024M -jar BuildTools.jar --rev ${spigotver_sel}
  find . ! -name spigot-${spigotver_sel}.jar | xargs rm -r > /dev/null
  starterFile
}

## paper ##
function paper {
  spigot_setup
  paperver_list=$(curl -s -X 'GET' 'https://api.papermc.io/v2/projects/paper' -H 'accept: application/json' | jq -r '.versions[]' | grep -v '-' | tac)
  paperver=($paperver_list "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select paperver_sel in "${paperver[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#paperver[@]} ]]; then
      stepsPaper
    elif [[ $REPLY -eq ${#paperver[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsPaper {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  paper_temp=$(curl -s -X 'GET' "https://api.papermc.io/v2/projects/paper/versions/${paperver_sel}" -H 'accept: application/json')
  paper_build=$(echo "$paper_temp" | jq -r '.builds | last')
  wget "https://api.papermc.io/v2/projects/paper/versions/${paperver_sel}/builds/${paper_build}/downloads/paper-${paperver_sel}-${paper_build}.jar"
  mv paper-*.jar paper-${paperver_sel}.jar
  starterFile
}

## glowstone ##
function glowstone {
  spigot_setup
  glowstonever=("1.19" "1.12.2" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select glowstonever_sel in "${glowstonever[@]}"; do
    case "$REPLY" in
    1) glowstone119 ;;
    2) glowstone1122 ;;
    3) exit 0 ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function glowstone119 {
  echo -e " "
  cd ${glowstonefolder}
  wget https://repo.glowstone.net/repository/snapshots/net/glowstone/glowstone/2022.6.1-SNAPSHOT/glowstone-2022.6.1-20220704.134955-17.jar
  mv glowstone-2022.6.1-20220704.134955-17.jar glowstone-1.19.jar
  starterFile
}

function glowstone1122 {
  echo -e " "
  cd ${glowstonefolder}
  wget https://repo.glowstone.net/repository/releases/net/glowstone/glowstone/2021.8.0/glowstone-2021.8.0.jar
  mv glowstone-2021.8.0.jar glowstone-1.12.2.jar
  starterFile
}

## purpur ##
function purpur {
  spigot_setup
  purpurver_list=$(curl -s -X 'GET' 'https://api.purpurmc.org/v2/purpur' H 'accept: */*' | jq -r '.versions[]' | tac)
  purpurver=($purpurver_list "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select purpurver_sel in "${purpurver[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#purpurver[@]} ]]; then
      stepsPurpur
    elif [[ $REPLY -eq ${#purpurver[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsPurpur {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget --content-disposition https://api.purpurmc.org/v2/purpur/${purpurver_sel}/latest/download
  mv purpur-*.jar purpur-${purpurver_sel}.jar
  starterFile
}

## pufferfish ##
function pufferfish {
  spigot_setup
  pufferfish_templist=""
  pufferfish_api=$(curl -s https://ci.pufferfish.host/api/json | jq -r '.jobs[] | select(.name | test("^Pufferfish-[0-9]+")) | .name')
  for pufferfish_temp in $pufferfish_api; do
    pufferfish_temp=$(curl -s "https://ci.pufferfish.host/job/${pufferfish_temp}/lastSuccessfulBuild/api/json" | jq -r '.artifacts[].fileName | capture("(?<version>[0-9]+(?:\\.[0-9]+){1,2})") | .version')
    if [ ! -z "$pufferfish_temp" ]; then
      pufferfish_templist+="$pufferfish_temp"$'\n'
    fi
  done
  pufferfishver_list=$(echo -e "$pufferfish_templist" | tac)
  pufferfishver=($pufferfishver_list "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select pufferfishver_sel in "${pufferfishver[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#pufferfishver[@]} ]]; then
      stepsPufferfish
    elif [[ $REPLY -eq ${#pufferfishver[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsPufferfish {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  pufferfish_tempver=$(echo "${pufferfishver_sel}" | cut -d '.' -f 1,2)
  wget https://ci.pufferfish.host/job/Pufferfish-${pufferfish_tempver}/lastSuccessfulBuild/artifact/build/libs/*zip*/libs.zip
  unzip libs.zip
  mv libs/*ufferfish-*.jar pufferfish-${pufferfishver_sel}.jar
  rm -r libs/ libs.zip
  starterFile
}

## folia ##
function folia {
  spigot_setup
  foliaver_list=$(curl -s -X 'GET' 'https://api.papermc.io/v2/projects/folia' -H 'accept: application/json' | jq -r '.versions[]' | tac)
  foliaver=($foliaver_list "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select foliaver_sel in "${foliaver[@]}"; do
    if [[ $REPLY -ge 1 && $REPLY -lt ${#foliaver[@]} ]]; then
      stepsFolia
    elif [[ $REPLY -eq ${#foliaver[@]} ]]; then
      exit 0
    else
      echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
    fi
  done
}

function stepsFolia {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  folia_temp=$(curl -s -X 'GET' "https://api.papermc.io/v2/projects/folia/versions/${foliaver_sel}" -H 'accept: application/json')
  folia_build=$(echo "$folia_temp" | jq -r '.builds | map(.build) | last')
  wget "https://api.papermc.io/v2/projects/folia/versions/${foliaver_sel}/builds/${folia_build}/downloads/folia-${foliaver_sel}-${folia_build}.jar"
  mv folia-*.jar folia-${foliaver_sel}.jar
  starterFile
}

## end ##
function starterFile {
  spigot_name=$(echo "${spigottype_sel}" | tr '[:upper:]' '[:lower:]')
  final_name="${spigot_name}ver_sel"
  server_version="${!final_name}"
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem:-2048}M -jar ${spigot_name}-${server_version}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstall
}

function successInstall {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}${spigottype_sel} ${server_version}\n   ${CYAN}* Location: ${WHITE}${spigotfolder:-/root/spigot}\n   ${CYAN}* RAM: ${WHITE}${spigotmem:-2048}M\n   ${CYAN}* Port: ${WHITE}${spigotport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit 0
}

spigot_conf
