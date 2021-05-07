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
  wget https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
  mv server.jar vanilla-1.16.5.jar
  starterFile
}

function vanilla1164 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar
  mv server.jar vanilla-1.16.4.jar
  starterFile
}

function vanilla1163 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/f02f4473dbf152c23d7d484952121db0b36698cb/server.jar
  mv server.jar vanilla-1.16.3.jar
  starterFile
}

function vanilla1162 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/c5f6fb23c3876461d46ec380421e42b289789530/server.jar
  mv server.jar vanilla-1.16.2.jar
  starterFile
}

function vanilla1161 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/a412fd69db1f81db3f511c1463fd304675244077/server.jar
  mv server.jar vanilla-1.16.1.jar
  starterFile
}

function vanilla116 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/a0d03225615ba897619220e256a266cb33a44b6b/server.jar
  mv server.jar vanilla-1.16.jar
  starterFile
}

function vanilla1152 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
  mv server.jar vanilla-1.15.2.jar
  starterFile
}

function vanilla1151 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/4d1826eebac84847c71a77f9349cc22afd0cf0a1/server.jar
  mv server.jar vanilla-1.15.1.jar
  starterFile
}

function vanilla115 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/e9f105b3c5c7e85c7b445249a93362a22f62442d/server.jar
  mv server.jar vanilla-1.15.jar
  starterFile
}

function vanilla1144 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar
  mv server.jar vanilla-1.14.4.jar
  starterFile
}

function vanilla1143 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/d0d0fe2b1dc6ab4c65554cb734270872b72dadd6/server.jar
  mv server.jar vanilla-1.14.3.jar
  starterFile
}

function vanilla1142 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/808be3869e2ca6b62378f9f4b33c946621620019/server.jar
  mv server.jar vanilla-1.14.2.jar
  starterFile
}

function vanilla1141 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/ed76d597a44c5266be2a7fcd77a8270f1f0bc118/server.jar
  mv server.jar vanilla-1.14.1.jar
  starterFile
}

function vanilla114 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/f1a0073671057f01aa843443fef34330281333ce/server.jar
  mv server.jar vanilla-1.14.jar
  starterFile
}

function vanilla1132 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar
  mv server.jar vanilla-1.13.2.jar
  starterFile
}

function vanilla1131 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/fe123682e9cb30031eae351764f653500b7396c9/server.jar
  mv server.jar vanilla-1.13.1.jar
  starterFile
}

function vanilla113 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/d0caafb8438ebd206f99930cfaecfa6c9a13dca0/server.jar
  mv server.jar vanilla-1.13.jar
  starterFile
}

function vanilla1122 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar
  mv server.jar vanilla-1.12.2.jar
  starterFile
}

function vanilla1121 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/561c7b2d54bae80cc06b05d950633a9ac95da816/server.jar
  mv server.jar vanilla-1.12.1.jar
  starterFile
}

function vanilla112 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/8494e844e911ea0d63878f64da9dcc21f53a3463/server.jar
  mv server.jar vanilla-1.12.jar
  starterFile
}

function vanilla1112 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/f00c294a1576e03fddcac777c3cf4c7d404c4ba4/server.jar
  mv server.jar vanilla-1.11.2.jar
  starterFile
}

function vanilla1111 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/1f97bd101e508d7b52b3d6a7879223b000b5eba0/server.jar
  mv server.jar vanilla-1.11.1.jar
  starterFile
}

function vanilla111 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/48820c84cb1ed502cb5b2fe23b8153d5e4fa61c0/server.jar
  mv server.jar vanilla-1.11.jar
  starterFile
}

function vanilla1102 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/3d501b23df53c548254f5e3f66492d178a48db63/server.jar
  mv server.jar vanilla-1.10.2.jar
  starterFile
}

function vanilla194 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/edbb7b1758af33d365bf835eb9d13de005b1e274/server.jar
  mv server.jar vanilla-1.9.4.jar
  starterFile
}

function vanilla193 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/8e897b6b6d784f745332644f4d104f7a6e737ccf/server.jar
  mv server.jar vanilla-1.9.3.jar
  starterFile
}

function vanilla192 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/2b95cc7b136017e064c46d04a5825fe4cfa1be30/server.jar
  mv server.jar vanilla-1.9.2.jar
  starterFile
}

function vanilla191 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/bf95d9118d9b4b827f524c878efd275125b56181/server.jar
  mv server.jar vanilla-1.9.1.jar
  starterFile
}

function vanilla19 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/b4d449cf2918e0f3bd8aa18954b916a4d1880f0d/server.jar
  mv server.jar vanilla-1.9.jar
  starterFile
}

function vanilla188 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/5fafba3f58c40dc51b5c3ca72a98f62dfdae1db7/server.jar
  mv server.jar vanilla-1.8.8.jar
  starterFile
}

function vanilla187 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/35c59e16d1f3b751cd20b76b9b8a19045de363a9/server.jar
  mv server.jar vanilla-1.8.7.jar
  starterFile
}

function vanilla186 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/2bd44b53198f143fb278f8bec3a505dad0beacd2/server.jar
  mv server.jar vanilla-1.8.6.jar
  starterFile
}

function vanilla185 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/ea6dd23658b167dbc0877015d1072cac21ab6eee/server.jar
  mv server.jar vanilla-1.8.5.jar
  starterFile
}

function vanilla184 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/dd4b5eba1c79500390e0b0f45162fa70d38f8a3d/server.jar
  mv server.jar vanilla-1.8.4.jar
  starterFile
}

function vanilla183 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/163ba351cb86f6390450bb2a67fafeb92b6c0f2f/server.jar
  mv server.jar vanilla-1.8.3.jar
  starterFile
}

function vanilla182 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/a37bdd5210137354ed1bfe3dac0a5b77fe08fe2e/server.jar
  mv server.jar vanilla-1.8.2.jar
  starterFile
}

function vanilla181 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/68bfb524888f7c0ab939025e07e5de08843dac0f/server.jar
  mv server.jar vanilla-1.8.1.jar
  starterFile
}

function vanilla18 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/a028f00e678ee5c6aef0e29656dca091b5df11c7/server.jar
  mv server.jar vanilla-1.8.jar
  starterFile
}

function vanilla1710 {
  echo -e " "
  cd ${vanillafolder}
  wget https://launcher.mojang.com/v1/objects/952438ac4e01b4d115c5fc38f891710c4941df29/server.jar
  mv server.jar vanilla-1.7.10.jar
  starterFile
}

## Starter ##
function starterFile {
  cd ${vanillafolder}
  echo -e "${YELLOW} The startup file has been created. ${COLOR_NULL}"
  echo "  echo -e '   ___    __    __  __  __  __  ____  ____  _____ 
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)( 
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
  echo -e ' '
  java -Xms128M -Xmx${vanillamem}M -jar vanilla-${VANILLAVERSIONSEL}.jar nogui" >> starter.sh
  chmod +x starter.sh
  successInstall
}

## Success ##
function successInstall {
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}Vanilla ${VANILLAVERSIONSEL}\n   ${CYAN}* Location: ${WHITE}${vanillafolder}\n   ${CYAN}* RAM: ${WHITE}${vanillamem}M\n   ${CYAN}* Port: ${WHITE}${vanillaport} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}./starter.sh ${YELLOW}command${COLOR_NULL}"
  exit
}

vanilla
