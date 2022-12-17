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

function spigot {
  echo -e "\n"
  echo -e -n "${CYAN} Enter the RAM to be assigned in MB (ex. 512): ${COLOR_NULL}"
  read spigotmem
  echo -e -n "${CYAN} Enter the location of the server folder. (ex. /root/spigot): ${COLOR_NULL}"
  read spigotfolder
  echo -e -n "${YELLOW} Enter the port of the server. (ex. 25565): ${COLOR_NULL}"
  read spigotport
  echo -e "${CYAN} Server type selected: ${YELLOW}Spigot ${COLOR_NULL}"
  SPIGOTTYPE=("Spigot" "Paper" "Purpur" "Glowstone" "SportPaper" "FlamePaper" "Airplane" "Pufferfish" "Cancel")
  echo -e "${CYAN} Select the type of fork that suits you best! ${COLOR_NULL}"
  select OPTION in "${SPIGOTTYPE[@]}"; do
    case "$REPLY" in
    1) spigott ;;
    2) paper ;;
    3) purpur ;;
    4) glowstone ;;
    5) sportpaper ;;
    6) flamepaper ;;
    7) airplane ;;
    8) pufferfish ;;
    9) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
} 

## Spigot ##
function spigott {
  echo -e "\n"
  mkdir ${spigotfolder:-/root/spigot}
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport:-25565}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  spigotversion
}

function spigotversion {
  SPIGOTVERSION=("1.19.3" "1.19.2" "1.19.1" "1.19" "1.18.2" "1.18.1" "1.18" "1.17.1" "1.17" "1.16.5" "1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.15.2" "1.15.1" "1.15" "1.14.4" "1.14.3" "1.14.2" "1.14.1" "1.14" "1.13.2" "1.13.1" "1.13" "1.12.2" "1.12.1" "1.12" "1.11" "1.10.2" "1.9.4" "1.9.2" "1.9" "1.8.8" "1.8.3" "1.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select SPIGOTVERSIONSEL in "${SPIGOTVERSION[@]}"; do
    case "$REPLY" in
    1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36) stepsSpigot ;;
    37) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function stepsSpigot {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function compilerSpigot {
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} The build of the jar is in progress. . . (it will take a while)${COLOR_NULL}"
  curl -O -J -L https://javadl.oracle.com/webapps/download/AutoDL?BundleId=247127_10e8cce67c7843478f41411b7003171c
  mv 'AutoDL\?BundleId\=247127_10e8cce67c7843478f41411b7003171c' jre-8u351-linux-x64.tar.gz
  tar -zxvf jre-8u351-linux-x64.tar.gz
  "${spigotfolder:-/root/spigot}/jre1.8.0_351/bin/java" -jar BuildTools.jar --rev ${SPIGOTVERSIONSEL} > /dev/null
  find ./ -type d -not -name spigot-${SPIGOTVERSIONSEL}.jar | xargs rm -r
  find ./ -type f -not -name spigot-${SPIGOTVERSIONSEL}.jar | xargs rm
}

function starterFileSpigot {
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem:-512}M -jar spigot-${SPIGOTVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallSpigot
}

function successInstallSpigot {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Spigot ${SPIGOTVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder:-/root/spigot}\n   ${CYAN}* RAM: ${WHITE}${spigotmem:-512}M\n   ${CYAN}* Port: ${WHITE}${spigotport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Paper ##
function paper {
  if ! [ -x "$(command -v ruby)" ]; then
    echo -e "${ERROR} ${LIGHT_RED} ruby is required in order for this installation to work. ${COLOR_NULL}"
    while true
    do
      echo -e -n "${YELLOW} Do you want to install ruby (Y/n)? ${COLOR_NULL}"
      read installruby
      case "$installruby" in
        n|N|no|No|NO) exit;;
        y|Y|yes|Yes|yEs|yeS|YEs|YeS|yES|YES) apt-get -y install ruby || yum install -y ruby
        break;;
        *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
      esac
    done
  fi
  echo -e " ${YELLOW} ruby is installed, the installation will work fine! ${COLOR_NULL}"
  echo -e "\n"
  mkdir ${spigotfolder:-/root/spigot}
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport:-25565}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  paperversion
}

function paperversion {
  PAPERVERSION=("1.19.3" "1.19.2" "1.19.1" "1.19" "1.18.2" "1.18.1" "1.18" "1.17.1" "1.17" "1.16.5" "1.15.2" "1.14.4" "1.13.2" "1.12.2" "1.11.2" "1.10.2" "1.9.4" "1.8.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select PAPERVERSIONSEL in "${PAPERVERSION[@]}"; do
    case "$REPLY" in
    1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18) stepsPaper ;;
    19) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function stepsPaper {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -s "https://papermc.io/api/v2/projects/paper/versions/${PAPERVERSIONSEL}" | ruby -rjson -e 'data = JSON.parse(STDIN.read); puts data["builds"]' >> builds-temp-${PAPERVERSIONSEL}.txt
  grep -Eo '[0-9]+' builds-temp-${PAPERVERSIONSEL}.txt | sort -rn >> builds-${PAPERVERSIONSEL}.txt
  read buildpaper <<< $(awk 'NR==1 {print; exit}' builds-${PAPERVERSIONSEL}.txt)
  wget https://papermc.io/api/v2/projects/paper/versions/${PAPERVERSIONSEL}/builds/${buildpaper}/downloads/paper-${PAPERVERSIONSEL}-${buildpaper}.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  rm *.txt
  starterFilePaper
}

function starterFilePaper {
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem:-512}M -jar paper-${PAPERVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallPaper
}

function successInstallPaper {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Paper ${PAPERVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder:-/root/spigot}\n   ${CYAN}* RAM: ${WHITE}${spigotmem:-512}M\n   ${CYAN}* Port: ${WHITE}${spigotport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Glowstone ##
function glowstone {
  echo -e "\n"
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport:-25565}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  glowstoneversion
}

function glowstoneversion {
  GLOWSTONEVERSION=("1.19" "1.12.2" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select GLOWSTONEVERSIONSEL in "${GLOWSTONEVERSION[@]}"; do
    case "$REPLY" in
    1) glowstone119 ;;
    2) glowstone1122 ;;
    3) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function glowstone119 {
  echo -e " "
  cd ${glowstonefolder}
  wget https://repo.glowstone.net/repository/snapshots/net/glowstone/glowstone/2022.6.1-SNAPSHOT/glowstone-2022.6.1-20220704.134955-17.jar
  mv glowstone-2022.6.1-20220704.134955-17.jar glowstone-1.19.jar
  starterFileGlowstone
}

function glowstone1122 {
  echo -e " "
  cd ${glowstonefolder}
  wget https://repo.glowstone.net/repository/releases/net/glowstone/glowstone/2021.8.0/glowstone-2021.8.0.jar
  mv glowstone-2021.8.0.jar glowstone-1.12.2.jar
  starterFileGlowstone
}

function starterFileGlowstone {
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem:-512}M -jar glowstone-${GLOWSTONEVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallGlowstone
}

function successInstallGlowstone {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Glowstone ${GLOWSTONEVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder:-/root/spigot}\n   ${CYAN}* RAM: ${WHITE}${spigotmem:-512}M\n   ${CYAN}* Port: ${WHITE}${spigotport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Purpur ##
function purpur {
  echo -e "\n"
  mkdir ${spigotfolder:-/root/spigot}
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport:-25565}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  purpurversion
}

function purpurversion {
  PURPURVERSION=("1.19.3" "1.19.2" "1.19.1" "1.19" "1.18.2" "1.18.1" "1.18" "1.17.1" "1.17" "1.16.5" "1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.15.2" "1.15.1" "1.15" "1.14.4" "1.14.3" "1.14.2" "1.14.1" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select PURPURVERSIONSEL in "${PURPURVERSION[@]}"; do
    case "$REPLY" in
    1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21) stepsPurpur ;;
    22) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function stepsPurpur {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/${PURPURVERSIONSEL}/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function starterFilePurpur {
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem:-512}M -jar purpur-${PURPURVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallPurpur
}

function successInstallPurpur {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Purpur ${PURPURVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder:-/root/spigot}\n   ${CYAN}* RAM: ${WHITE}${spigotmem:-512}M\n   ${CYAN}* Port: ${WHITE}${spigotport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## FlamePaper ##
function flamepaper {
  echo -e "\n"
  mkdir ${spigotfolder:-/root/spigot}
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport:-25565}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  flamepaperversion
}

function flamepaperversion {
  FLAMEPAPERVERSION=("1.8.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select FLAMEPAPERVERSIONSEL in "${FLAMEPAPERVERSION[@]}"; do
    case "$REPLY" in
    1) flamepaper188 ;;
    2) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function flamepaper188 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://ci.2lstudios.dev/job/FlamePaper/lastSuccessfulBuild/artifact/FlamePaper-Server/target/FlamePaper.jar
  mv FlamePaper.jar FlamePaper-1.8.8.jar
  starterFileFlamePaper
}

function starterFileFlamePaper {
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem:-512}M -jar FlamePaper-${FLAMEPAPERVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallFlamePaper
}

function successInstallFlamePaper {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}FlamePaper ${FLAMEPAPERVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder:-/root/spigot}\n   ${CYAN}* RAM: ${WHITE}${spigotmem:-512}M\n   ${CYAN}* Port: ${WHITE}${spigotport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Airplane ##
function airplane {
  echo -e "\n"
  mkdir ${spigotfolder:-/root/spigot}
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport:-25565}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  airplaneversion
}

function airplaneversion {
  AIRPLANEVERSION=("1.17.1" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select AIRPLANEVERSIONSEL in "${AIRPLANEVERSION[@]}"; do
    case "$REPLY" in
    1) airplane1171 ;;
    2) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function airplane1171 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://airplane.gg/dl/launcher-airplane1.17.1.jar
  mv launcher-airplane1.17.1.jar Airplane-1.17.1.jar
  starterFileAirplane
}

function starterFileAirplane {
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem:-512}M -jar Airplane-${AIRPLANEVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallAirplane
}

function successInstallAirplane {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Airplane ${AIRPLANEVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder:-/root/spigot}\n   ${CYAN}* RAM: ${WHITE}${spigotmem:-512}M\n   ${CYAN}* Port: ${WHITE}${spigotport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Pufferfish ##
function pufferfish {
  echo -e "\n"
  mkdir ${spigotfolder:-/root/spigot}
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport:-25565}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  pufferfishversion
}

function pufferfishversion {
  PUFFERFISHVERSION=("1.19.3" "1.18.2" "1.17.1" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select PUFFERFISHVERSIONSEL in "${PUFFERFISHVERSION[@]}"; do
    case "$REPLY" in
    1) pufferfish1193 ;;
    2) pufferfish1182 ;;
    3) pufferfish1171 ;;
    4) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function pufferfish1192 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://ci.pufferfish.host/job/Pufferfish-1.19/lastSuccessfulBuild/artifact/build/libs/*zip*/libs.zip
  unzip libs.zip
  cd libs/
  mv Pufferfish-*.jar ..
  cd ..
  rm libs.zip
  mv Pufferfish-*.jar Pufferfish-${PUFFERFISHVERSIONSEL}.jar
  starterFilePufferfish
}

function pufferfish1182 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://ci.pufferfish.host/job/Pufferfish-1.18/lastSuccessfulBuild/artifact/build/libs/*zip*/libs.zip
  unzip libs.zip
  cd libs/
  mv Pufferfish-*.jar ..
  cd ..
  rm libs.zip
  mv Pufferfish-*.jar Pufferfish-${PUFFERFISHVERSIONSEL}.jar
  starterFilePufferfish
}

function pufferfish1171 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://ci.pufferfish.host/job/Pufferfish-1.17/lastSuccessfulBuild/artifact/build/libs/*zip*/libs.zip
  unzip libs.zip
  cd libs/
  mv Pufferfish-*.jar ..
  cd ..
  rm libs.zip
  mv Pufferfish-*.jar Pufferfish-${PUFFERFISHVERSIONSEL}.jar
  starterFilePufferfish
}

function starterFilePufferfish {
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem:-512}M -jar Pufferfish-${PUFFERFISHVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallPufferfish
}

function successInstallPufferfish {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Pufferfish ${PUFFERFISHVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder:-/root/spigot}\n   ${CYAN}* RAM: ${WHITE}${spigotmem:-512}M\n   ${CYAN}* Port: ${WHITE}${spigotport:-25565} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

spigot
