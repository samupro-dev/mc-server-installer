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
  SPIGOTTYPE=("Spigot" "Paper" "Purpur" "Glowstone" "SportPaper" "FlamePaper" "Airplane" "Cancel")
  echo -e "${CYAN} Select the type of fork that suits you best! ${COLOR_NULL}"
  select OPTION in "${SPIGOTTYPE[@]}"; do
    case "$REPLY" in
    1) spigott ;;
    2) paper ;;
    3) purpur ;;
    4) glowstone ;;
    5) sportpaper ;;
    6) flamepaper;;
    7) airplane;;
    8) exit ;;
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
  spigottversion
}

function spigottversion {
  SPIGOTVERSION=("1.18.1" "1.18" "1.17.1" "1.17" "1.16.5" "1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.15.2" "1.15.1" "1.15" "1.14.4" "1.14.3" "1.14.2" "1.14.1" "1.14" "1.13.2" "1.13.1" "1.13" "1.12.2" "1.12.1" "1.12" "1.11" "1.10.2" "1.9.4" "1.9.2" "1.9" "1.8.8" "1.8.3" "1.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select SPIGOTVERSIONSEL in "${SPIGOTVERSION[@]}"; do
    case "$REPLY" in
    1) spigot1181 ;;
    2) spigot118 ;;
    3) spigot1171 ;;
    4) spigot117 ;;
    5) spigot1165 ;;
    6) spigot1164 ;;
    7) spigot1163 ;;
    8) spigot1162 ;;
    9) spigot1161 ;;
    10) spigot1152 ;;
    11) spigot1151 ;;
    12) spigot115 ;;
    13) spigot1444 ;;
    14) spigot1143 ;;
    15) spigot1142 ;;
    16) spigot1141 ;;
    17) spigot114 ;;
    18) spigot1132 ;;
    19) spigot1131 ;;
    20) spigot113 ;;
    21) spigot1122 ;;
    22) spigot1121 ;;
    23) spigot112 ;;
    24) spigot111 ;;
    25) spigot1102 ;;
    26) spigot194 ;;
    27) spigot192 ;;
    28) spigot19 ;;
    29) spigot188 ;;
    30) spigot183 ;;
    31) spigot18 ;;
    32) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function spigot1181 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot118 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1171 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot117 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1165 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1164 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1163 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1162 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1161 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1152 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1151 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot115 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1444 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1143 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1142 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1141 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot114 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1132 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1131 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot113 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1122 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1121 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot112 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot111 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1102 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot194 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot192 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot19 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot188 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot183 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot18 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function compilerSpigot {
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} The build of the jar is in progress. . . (it will take a while)${COLOR_NULL}"
  curl -O -J -L https://javadl.oracle.com/webapps/download/AutoDL?BundleId=245469_4d5417147a92418ea8b615e228bb6935
  mv 'AutoDL\?BundleId\=245469_4d5417147a92418ea8b615e228bb6935' jre-8u311-linux-x64.tar.gz
  tar -zxvf jre-8u311-linux-x64.tar.gz
  "${spigotfolder:-/root/spigot}/jre1.8.0_311/bin/java" -jar BuildTools.jar --rev ${SPIGOTVERSIONSEL} > /dev/null
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
        y|Y|yes|Yes|YES) apt-get -y install ruby || yum install -y ruby
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
  PAPERVERSION=("1.18.1" "1.18" "1.17.1" "1.17" "1.16.5" "1.15.2" "1.14.4" "1.13.2" "1.12.2" "1.11.2" "1.10.2" "1.9.4" "1.8.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select PAPERVERSIONSEL in "${PAPERVERSION[@]}"; do
    case "$REPLY" in
    1) paper1181 ;;
    2) paper118 ;;
    3) paper1171 ;;
    4) paper117 ;;
    5) paper1165 ;;
    6) paper1152 ;;
    7) paper1144 ;;
    8) paper1132 ;;
    9) paper1122 ;;
    10) paper1112 ;;
    11) paper1102 ;;
    12) paper194 ;;
    13) paper188 ;;
    14) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function paper1181 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -s "https://papermc.io/api/v2/projects/paper/versions/1.18.1" | ruby -rjson -e 'data = JSON.parse(STDIN.read); puts data["builds"]' >> builds-temp-1.18.1.txt
  grep -Eo '[0-9]+' builds-temp-1.18.1.txt | sort -rn >> builds-1.18.1.txt
  read build1181 <<< $(awk 'NR==1 {print; exit}' builds-1.18.1.txt)
  wget https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/${build1181}/downloads/paper-1.18.1-${build1181}.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  rm *.txt
  starterFilePaper
}

function paper118 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://papermc.io/api/v2/projects/paper/versions/1.18/builds/66/downloads/paper-1.18-66.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  starterFilePaper
}

function paper1171 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -s "https://papermc.io/api/v2/projects/paper/versions/1.17.1" | ruby -rjson -e 'data = JSON.parse(STDIN.read); puts data["builds"]' >> builds-temp-1.17.1.txt
  grep -Eo '[0-9]+' builds-temp-1.17.1.txt | sort -rn >> builds-1.17.1.txt
  read build1171 <<< $(awk 'NR==1 {print; exit}' builds-1.17.1.txt)
  wget https://papermc.io/api/v2/projects/paper/versions/1.17.1/builds/${build1171}/downloads/paper-1.17.1-${build1171}.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  rm *.txt
  starterFilePaper
}

function paper117 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://papermc.io/api/v2/projects/paper/versions/1.17/builds/79/downloads/paper-1.17-79.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  starterFilePaper
}

function paper1165 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/790/downloads/paper-1.16.5-790.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  starterFilePaper
}

function paper1152 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://papermc.io/api/v2/projects/paper/versions/1.15.2/builds/391/downloads/paper-1.15.2-391.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  starterFilePaper
}

function paper1144 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://papermc.io/api/v2/projects/paper/versions/1.14.4/builds/243/downloads/paper-1.14.4-243.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  starterFilePaper
}

function paper1132 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://papermc.io/api/v2/projects/paper/versions/1.13.2/builds/655/downloads/paper-1.13.2-655.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  starterFilePaper
}

function paper1122 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://papermc.io/api/v2/projects/paper/versions/1.12.2/builds/1618/downloads/paper-1.12.2-1618.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  starterFilePaper
}

function paper1112 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://papermc.io/api/v2/projects/paper/versions/1.11.2/builds/1104/downloads/paper-1.11.2-1104.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  starterFilePaper
}

function paper1102 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://papermc.io/api/v2/projects/paper/versions/1.10.2/builds/916/downloads/paper-1.10.2-916.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  starterFilePaper
}

function paper194 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://papermc.io/api/v2/projects/paper/versions/1.9.4/builds/773/downloads/paper-1.9.4-773.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  starterFilePaper
}

function paper188 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://papermc.io/api/v2/projects/paper/versions/1.8.8/builds/443/downloads/paper-1.8.8-443.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
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
  PURPURVERSION=("1.18.1" "1.18" "1.17.1" "1.17" "1.16.5" "1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.15.2" "1.15.1" "1.15" "1.14.4" "1.14.3" "1.14.2" "1.14.1" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select PURPURVERSIONSEL in "${PURPURVERSION[@]}"; do
    case "$REPLY" in
    1) purpur1181 ;;
    2) purpur118 ;;
    3) purpur1171 ;;
    4) purpur117 ;;
    5) purpur1165 ;;
    6) purpur1164 ;;
    7) purpur1163 ;;
    8) purpur1162 ;;
    9) purpur1161 ;;
    10) purpur1152 ;;
    11) purpur1151 ;;
    12) purpur115 ;;
    13) purpur1144 ;;
    14) purpur1143 ;;
    15) purpur1142 ;;
    16) purpur1141 ;;
    17) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function purpur1181 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.18.1/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}


function purpur118 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.18/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1171 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.17.1/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur117 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.17/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1165 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.16.5/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1164 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.16.4/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1163 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.16.3/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1162 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.16.2/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1161 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.16.1/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1152 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.15.2/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1151 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.15.1/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur115 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.15/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1144 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.14.4/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1143 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.14.3/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1142 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.14.2/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1141 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.pl3x.net/v2/purpur/1.14.1/latest/download
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

## SportPaper ##
function sportpaper {
  echo -e "\n"
  mkdir ${spigotfolder:-/root/spigot}
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport:-25565}" > server.properties
  echo -e "${YELLOW} The eula file has been created. ${COLOR_NULL}"
  echo "eula=true" > eula.txt
  sportpaperversion
}

function sportpaperversion {
  SPORTPAPERVERSION=("1.8.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select SPORTPAPERVERSIONSEL in "${SPORTPAPERVERSION[@]}"; do
    case "$REPLY" in
    1) sportpaper188 ;;
    2) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function sportpaper188 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://github.com/linsaftw/SportPaper/releases/latest/download/sportpaper-1.8.8-R0.1-SNAPSHOT.jar
  mv sportpaper-1.8.8-R0.1-SNAPSHOT.jar sportpaper-1.8.8.jar
  starterFileSportPaper
}

function starterFileSportPaper {
  cd ${spigotfolder:-/root/spigot}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem:-512}M -jar sportpaper-${SPORTPAPERVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallSportPaper
}

function successInstallSportPaper {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}SportPaper ${SPORTPAPERVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder:-/root/spigot}\n   ${CYAN}* RAM: ${WHITE}${spigotmem:-512}M\n   ${CYAN}* Port: ${WHITE}${spigotport:-25565} ${COLOR_NULL}"
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
  wget https://github.com/2lstudios-mc/FlamePaper/releases/latest/download/FlamePaper.jar
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
    2) airplane1165 ;;
    3) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function airplane1171 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://ci.tivy.ca/job/Airplane-1.17/lastSuccessfulBuild/artifact/launcher-airplane.jar
  mv launcher-airplane.jar Airplane-1.17.1.jar
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

spigot
