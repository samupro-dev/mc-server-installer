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
  SPIGOTTYPE=("Spigot" "Paper" "Yatopia" "Tuinity" "Purpur" "Glowstone" "SportPaper" "FlamePaper" "Cancel")
  echo -e "${CYAN} Select the type of fork that suits you best! ${COLOR_NULL}"
  select OPTION in "${SPIGOTTYPE[@]}"; do
    case "$REPLY" in
    1) spigott ;;
    2) paper ;;
    3) yatopia ;;
    4) tuinity ;;
    5) purpur ;;
    6) glowstone ;;
    7) sportpaper ;;
    8) flamepaper;;
    9) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
} 

## Spigot ##
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
  SPIGOTVERSION=("1.17" "1.16.5" "1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.15.2" "1.15.1" "1.15" "1.14.4" "1.14.3" "1.14.2" "1.14.1" "1.14" "1.13.2" "1.13.1" "1.13" "1.12.2" "1.12.1" "1.12" "1.11" "1.10.2" "1.9.4" "1.9.2" "1.9" "1.8.8" "1.8.3" "1.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select SPIGOTVERSIONSEL in "${SPIGOTVERSION[@]}"; do
    case "$REPLY" in
    1) spigot117 ;;
    2) spigot1165 ;;
    3) spigot1164 ;;
    4) spigot1163 ;;
    5) spigot1162 ;;
    6) spigot1161 ;;
    7) spigot1152 ;;
    8) spigot1151 ;;
    9) spigot115 ;;
    10) spigot1444 ;;
    11) spigot1143 ;;
    12) spigot1142 ;;
    13) spigot1141 ;;
    14) spigot114 ;;
    15) spigot1132 ;;
    16) spigot1131 ;;
    17) spigot113 ;;
    18) spigot1122 ;;
    19) spigot1121 ;;
    20) spigot112 ;;
    21) spigot111 ;;
    22) spigot1102 ;;
    23) spigot194 ;;
    24) spigot192 ;;
    25) spigot19 ;;
    26) spigot188 ;;
    27) spigot183 ;;
    28) spigot18 ;;
    29) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function spigot117 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1165 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1164 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1163 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1162 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1161 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1152 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1151 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot115 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1444 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1143 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1142 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1141 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot114 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1132 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1131 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot113 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1122 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1121 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot112 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot111 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot1102 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot194 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot192 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot19 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot188 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot183 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function spigot18 {
  echo -e " "
  cd ${spigotfolder}
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  compilerSpigot
  starterFileSpigot
}

function compilerSpigot {
  cd ${spigotfolder}
  echo -e "${YELLOW} The build of the jar is in progress. . . (it will take a while)${COLOR_NULL}"
  curl -O -J -L https://javadl.oracle.com/webapps/download/AutoDL?BundleId=244575_d7fc238d0cbf4b0dac67be84580cfb4b
  mv 'AutoDL\?BundleId\=244575_d7fc238d0cbf4b0dac67be84580cfb4b' jre-8u291-linux.tar.gz
  tar -zxvf jre-8u291-linux.tar.gz 
  "${spigotfolder}/jre1.8.0_291/bin/java" -jar BuildTools.jar --rev ${SPIGOTVERSIONSEL} > /dev/null
  rm -r -v !("spigot-${SPIGOTVERSIONSEL}.jar")
}

function starterFileSpigot {
  cd ${spigotfolder}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar spigot-${SPIGOTVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallSpigot
}

function successInstallSpigot {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Spigot ${SPIGOTVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Paper ##
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
  PAPERVERSION=("1.17" "1.16.5" "1.15.2" "1.14.4" "1.13.2" "1.12.2" "1.11.2" "1.10.2" "1.9.4" "1.8.8" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select PAPERVERSIONSEL in "${PAPERVERSION[@]}"; do
    case "$REPLY" in
    1) paper117 ;;
    2) paper1165 ;;
    3) paper1152 ;;
    4) paper1144 ;;
    5) paper1132 ;;
    6) paper1122 ;;
    7) paper1112 ;;
    8) paper1102 ;;
    9) paper194 ;;
    10) paper188 ;;
    11) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function paper117 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.17.jar https://papermc.io/api/v1/paper/1.17/latest/download
  starterFilePaper
}

function paper1165 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.16.5.jar https://papermc.io/api/v1/paper/1.16.5/latest/download
  starterFilePaper
}

function paper1152 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.15.2.jar https://papermc.io/api/v1/paper/1.15.2/latest/download
  starterFilePaper
}

function paper1144 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.14.4.jar https://papermc.io/api/v1/paper/1.14.4/latest/download
  starterFilePaper
}

function paper1132 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.13.2.jar https://papermc.io/api/v1/paper/1.13.2/latest/download
  starterFilePaper
}

function paper1122 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.12.2.jar https://papermc.io/api/v1/paper/1.12.2/latest/download
  starterFilePaper
}

function paper1112 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.11.2.jar https://papermc.io/api/v1/paper/1.11.2/latest/download
  starterFilePaper
}

function paper1102 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.10.2.jar https://papermc.io/api/v1/paper/1.10.2/latest/download
  starterFilePaper
}

function paper194 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.9.4.jar https://papermc.io/api/v1/paper/1.9.4/latest/download
  starterFilePaper
}

function paper188 {
  echo -e " "
  cd ${spigotfolder}
  curl -o paper-1.8.8.jar https://papermc.io/api/v1/paper/1.8.8/latest/download
  starterFilePaper
}

function starterFilePaper {
  cd ${spigotfolder}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar paper-${PAPERVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallPaper
}

function successInstallPaper {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Paper ${PAPERVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Yatopia ##
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
  YATOPIAVERSION=("1.17" "1.16.5" "1.16.4" "1.16.3" "1.16.2" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select YATOPIAVERSIONSEL in "${YATOPIAVERSION[@]}"; do
    case "$REPLY" in
    1) yatopia117 ;;
    2) yatopia1165 ;;
    3) yatopia1164 ;;
    4) yatopia1163 ;;
    5) yatopia1162 ;;
    6) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function yatopia117 {
  echo -e " "
  cd ${spigotfolder}
  wget https://ci.codemc.io/job/YatopiaMC/job/Yatopia/job/ver%252F1.17/lastSuccessfulBuild/artifact/target/*zip*/target.zip
  unzip target.zip
  cd target/
  mv yatopia-1.17-*.jar	..
  cd ..
  rm target.zip
  rm -r target/
  mv yatopia-1.17-*.jar yatopia-1.17.jar
  starterFileYatopia
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
  mv yatopia-1.16.5-*.jar yatopia-1.16.5.jar
  starterFileYatopia
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
  starterFileYatopia
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
  starterFileYatopia
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
  starterFileYatopia
}

function starterFileYatopia {
  cd ${spigotfolder}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar yatopia-${YATOPIAVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallYatopia
}

function successInstallYatopia {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Yatopia ${YATOPIAVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Tunity ##
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
  TUINITYVERSION=("1.17" "1.16.5" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select TUINITYVERSIONSEL in "${TUINITYVERSION[@]}"; do
    case "$REPLY" in
    1) tuinity117 ;;
    2) tuinity1165 ;;
    3) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function tuinity117 {
  echo -e " "
  cd ${spigotfolder}
  wget https://ci.codemc.io/job/Spottedleaf/job/Tuinity-1.17/lastSuccessfulBuild/artifact/tuinity-paperclip.jar
  mv tuinity-paperclip.jar tuinity-1.17.jar
  starterFileTunity
}

function tuinity1165 {
  echo -e " "
  cd ${spigotfolder}
  wget https://ci.codemc.io/job/Spottedleaf/job/Tuinity/lastSuccessfulBuild/artifact/tuinity-paperclip.jar
  mv tuinity-paperclip.jar tuinity-1.16.5.jar
  starterFileTunity
}

function starterFileTunity {
  cd ${spigotfolder}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar tuinity-${YATOPIAVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallTunity
}

function successInstallTunity {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Tuinity ${TUINITYVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Glowstone ##
function glowstone {
  echo -e "\n"
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport}" > server.properties
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
  starterFileGlowstone
}

function starterFileGlowstone {
  cd ${spigotfolder}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar glowstone-${GLOWSTONEVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallGlowstone
}

function successInstallGlowstone {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Glowstone ${GLOWSTONEVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## Purpur ##
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
  PURPURVERSION=("1.17" "1.16.5" "1.16.4" "1.16.3" "1.16.2" "1.16.1" "1.15.2" "1.15.1" "1.15" "1.14.4" "1.14.3" "1.14.2" "1.14.1" "Cancel")
  echo -e "${CYAN} Select the server version. ${COLOR_NULL}"
  select PURPURVERSIONSEL in "${PURPURVERSION[@]}"; do
    case "$REPLY" in
    1) purpur117 ;;
    2) purpur1165 ;;
    3) purpur1164 ;;
    4) purpur1163 ;;
    5) purpur1162 ;;
    6) purpur1161 ;;
    7) purpur1152 ;;
    8) purpur1151 ;;
    9) purpur115 ;;
    10) purpur1144 ;;
    11) purpur1143 ;;
    12) purpur1142 ;;
    13) purpur1141 ;;
    14) exit ;;
    *) echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}";;
    esac
  done
}

function purpur117 {
  echo -e " "
  cd ${spigotfolder}
  wget https://ci.pl3x.net/job/Purpur/lastSuccessfulBuild/artifact/final/*zip*/final.zip
  unzip final.zip
  cd final/
  mv purpurclip-*.jar ..
  cd ..
  rm -r final/
  rm final.zip
  mv purpurclip-*.jar	purpur-1.17.jar
  starterFilePurpur
}

function purpur1165 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.16.5.jar https://purpur.pl3x.net/api/v1/purpur/1.16.5/1171/download
  starterFilePurpur
}

function purpur1164 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.16.4.jar https://purpur.pl3x.net/api/v1/purpur/1.16.4/956/download
  starterFilePurpur
}

function purpur1163 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.16.3.jar https://purpur.pl3x.net/api/v1/purpur/1.16.3/808/download
  starterFilePurpur
}

function purpur1162 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.16.2.jar https://purpur.pl3x.net/api/v1/purpur/1.16.2/750/download
  starterFilePurpur
}

function purpur1161 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.16.1.jar https://purpur.pl3x.net/api/v1/purpur/1.16.1/710/download
  starterFilePurpur
}

function purpur1152 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.15.2.jar https://purpur.pl3x.net/api/v1/purpur/1.15.2/606/download
  starterFilePurpur
}

function purpur1151 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.15.1.jar https://purpur.pl3x.net/api/v1/purpur/1.15.1/397/download
  starterFilePurpur
}

function purpur115 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.15.jar https://purpur.pl3x.net/api/v1/purpur/1.15/346/download
  starterFilePurpur
}

function purpur1144 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.14.4.jar https://purpur.pl3x.net/api/v1/purpur/1.14.4/337/download
  starterFilePurpur
}

function purpur1143 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.14.3.jar https://purpur.pl3x.net/api/v1/purpur/1.14.3/202/download
  starterFilePurpur
}

function purpur1142 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.14.2.jar https://purpur.pl3x.net/api/v1/purpur/1.14.2/126/download
  starterFilePurpur
}

function purpur1141 {
  echo -e " "
  cd ${spigotfolder}
  curl -o purpur-1.14.1.jar https://purpur.pl3x.net/api/v1/purpur/1.14.1/63/download
  starterFilePurpur
}

function starterFilePurpur {
  cd ${spigotfolder}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar purpur-${PURPURVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallPurpur
}

function successInstallPurpur {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Purpur ${PURPURVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## SportPaper ##
function sportpaper {
  echo -e "\n"
  mkdir ${spigotfolder}
  cd ${spigotfolder}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport}" > server.properties
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
  cd ${spigotfolder}
  wget https://github.com/linsaftw/SportPaper/releases/latest/download/sportpaper-1.8.8-R0.1-SNAPSHOT.jar
  mv sportpaper-1.8.8-R0.1-SNAPSHOT.jar sportpaper-1.8.8.jar
  starterFileSportPaper
}

function starterFileSportPaper {
  cd ${spigotfolder}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar sportpaper-${SPORTPAPERVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallSportPaper
}

function successInstallSportPaper {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}SportPaper ${SPORTPAPERVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

## FlamePaper ##
function flamepaper {
  echo -e "\n"
  mkdir ${spigotfolder}
  cd ${spigotfolder}
  echo -e "${YELLOW} I am setting up the server port. . . ${COLOR_NULL}"
  echo "server-port=${spigotport}" > server.properties
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
  cd ${spigotfolder}
  wget https://github.com/2lstudios-mc/FlamePaper/releases/latest/download/abe8d00/FlamePaper.jar
  mv FlamePaper.jar FlamePaper-1.8.8.jar
  starterFileFlamePaper
}

function starterFileFlamePaper {
  cd ${spigotfolder}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${spigotmem}M -jar FlamePaper-${FLAMEPAPERVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstallFlamePaper
}

function successInstallFlamePaper {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}FlamePaper ${FLAMEPAPERVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${spigotfolder}\n   ${CYAN}* RAM: ${WHITE}${spigotmem}M\n   ${CYAN}* Port: ${WHITE}${spigotport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

spigot
