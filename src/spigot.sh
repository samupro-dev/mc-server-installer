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
  SPIGOTVERSION=("1.19" "1.18.2" "1.18.1" "1.18" "1.17.1" "1.17" "1.16.5" "1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.15.2" "1.15.1" "1.15" "1.14.4" "1.14.3" "1.14.2" "1.14.1" "1.14" "1.13.2" "1.13.1" "1.13" "1.12.2" "1.12.1" "1.12" "1.11" "1.10.2" "1.9.4" "1.9.2" "1.9" "1.8.8" "1.8.3" "1.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select SPIGOTVERSIONSEL in "${SPIGOTVERSION[@]}"; do
    case "$REPLY" in
    1) spigot119 ;;
    2) spigot1182 ;;
    3) spigot1181 ;;
    4) spigot118 ;;
    5) spigot1171 ;;
    6) spigot117 ;;
    7) spigot1165 ;;
    8) spigot1164 ;;
    9) spigot1163 ;;
    10) spigot1162 ;;
    11) spigot1161 ;;
    12) spigot1152 ;;
    13) spigot1151 ;;
    14) spigot115 ;;
    15) spigot1444 ;;
    16) spigot1143 ;;
    17) spigot1142 ;;
    18) spigot1141 ;;
    19) spigot114 ;;
    20) spigot1132 ;;
    21) spigot1131 ;;
    22) spigot113 ;;
    23) spigot1122 ;;
    24) spigot1121 ;;
    25) spigot112 ;;
    26) spigot111 ;;
    27) spigot1102 ;;
    28) spigot194 ;;
    29) spigot192 ;;
    30) spigot19 ;;
    31) spigot188 ;;
    32) spigot183 ;;
    33) spigot18 ;;
    34) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function spigot119 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1182 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
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
  curl -O -J -L https://javadl.oracle.com/webapps/download/AutoDL?BundleId=246464_2dee051a5d0647d5be72a7c0abff270e
  mv 'AutoDL\?BundleId\=246464_2dee051a5d0647d5be72a7c0abff270e' jre-8u333-linux-x64.tar.gz
  tar -zxvf jre-8u333-linux-x64.tar.gz
  "${spigotfolder:-/root/spigot}/jre1.8.0_333/bin/java" -jar BuildTools.jar --rev ${SPIGOTVERSIONSEL} > /dev/null
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
  PAPERVERSION=("1.19" "1.18.2" "1.18.1" "1.18" "1.17.1" "1.17" "1.16.5" "1.15.2" "1.14.4" "1.13.2" "1.12.2" "1.11.2" "1.10.2" "1.9.4" "1.8.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select PAPERVERSIONSEL in "${PAPERVERSION[@]}"; do
    case "$REPLY" in
    1) paper119 ;;
    2) paper1182 ;;
    3) paper1181 ;;
    4) paper118 ;;
    5) paper1171 ;;
    6) paper117 ;;
    7) paper1165 ;;
    8) paper1152 ;;
    9) paper1144 ;;
    10) paper1132 ;;
    11) paper1122 ;;
    12) paper1112 ;;
    13) paper1102 ;;
    14) paper194 ;;
    15) paper188 ;;
    16) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function paper119 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -s "https://papermc.io/api/v2/projects/paper/versions/1.19" | ruby -rjson -e 'data = JSON.parse(STDIN.read); puts data["builds"]' >> builds-temp-1.19.txt
  grep -Eo '[0-9]+' builds-temp-1.19.txt | sort -rn >> builds-1.19.txt
  read build119 <<< $(awk 'NR==1 {print; exit}' builds-1.19.txt)
  wget https://papermc.io/api/v2/projects/paper/versions/1.19/builds/${build119}/downloads/paper-1.19-${build119}.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  rm *.txt
  starterFilePaper
}

function paper1182 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -s "https://papermc.io/api/v2/projects/paper/versions/1.18.2" | ruby -rjson -e 'data = JSON.parse(STDIN.read); puts data["builds"]' >> builds-temp-1.18.2.txt
  grep -Eo '[0-9]+' builds-temp-1.18.2.txt | sort -rn >> builds-1.18.2.txt
  read build1182 <<< $(awk 'NR==1 {print; exit}' builds-1.18.2.txt)
  wget https://papermc.io/api/v2/projects/paper/versions/1.18.2/builds/${build1182}/downloads/paper-1.18.2-${build1182}.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
  rm *.txt
  starterFilePaper
}

function paper1181 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  wget https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/216/downloads/paper-1.18.1-216.jar
  mv paper-*.jar paper-${PAPERVERSIONSEL}.jar
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
  PURPURVERSION=("1.19"  "1.18.2" "1.18.1" "1.18" "1.17.1" "1.17" "1.16.5" "1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.15.2" "1.15.1" "1.15" "1.14.4" "1.14.3" "1.14.2" "1.14.1" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select PURPURVERSIONSEL in "${PURPURVERSION[@]}"; do
    case "$REPLY" in
    1) purpur119 ;;
    2) purpur1182 ;;
    3) purpur1181 ;;
    4) purpur118 ;;
    5) purpur1171 ;;
    6) purpur117 ;;
    7) purpur1165 ;;
    8) purpur1164 ;;
    9) purpur1163 ;;
    10) purpur1162 ;;
    11) purpur1161 ;;
    12) purpur1152 ;;
    13) purpur1151 ;;
    14) purpur115 ;;
    15) purpur1144 ;;
    16) purpur1143 ;;
    17) purpur1142 ;;
    18) purpur1141 ;;
    19) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function purpur119 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.19/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1182 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.18.2/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1181 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.18.1/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur118 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.18/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1171 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.17.1/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur117 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.17/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1165 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.16.5/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1164 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.16.4/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1163 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.16.3/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1162 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.16.2/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1161 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.16.1/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1152 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.15.2/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1151 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.15.1/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur115 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.15/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1144 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.14.4/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1143 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.14.3/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1142 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.14.2/latest/download
  mv purpur-*.jar purpur-${PURPURVERSIONSEL}.jar
  starterFilePurpur
}

function purpur1141 {
  echo -e " "
  cd ${spigotfolder:-/root/spigot}
  curl -O -J -L https://api.purpurmc.org/v2/purpur/1.14.1/latest/download
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

spigot
