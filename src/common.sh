#!/bin/bash
# shellcheck disable=SC2034 # colors are used by the scripts that load this file

DONE="\e[0;32m ✔\e[0m"
ERROR="\e[0;31m ✘\e[0m"
YELLOW="\e[1;33m"
LIGHT_RED="\e[1;31m"
LIGHT_GREEN="\e[1;32m"
LIGHT_BLUE="\e[1;34m"
COLOR_NULL="\e[0m"
PURPLE="\e[0;35m"
CYAN="\e[0;36m"
WHITE="\e[1;37m"
LIGHT_PURPLE="\e[1;35m"

TYPE="" VERSION="" MEM="" FOLDER="" PORT="" ONLINE_MODE="" MAX_PLAYERS="" EULA="" INSTALL_TEMP="" JAVA=""

# server files readable only by the owner (server.properties may hold the rcon password)
umask 027
# so the EXIT trap of make_temp also cleans up after Ctrl+C
trap 'exit 130' INT TERM HUP

die() { echo -e "\n${ERROR} ${LIGHT_RED}$1 ${COLOR_NULL}"; exit 1; }
warn() { echo -e "${LIGHT_RED} !! ${YELLOW}$1 ${COLOR_NULL}"; }
step() { echo -e "${YELLOW} $1 ${COLOR_NULL}"; }
fetch() { # fetch <url>: prints the whole response or nothing, so a broken download never gives a cut list
  local try body auth=()
  # a GITHUB_TOKEN (set in the GitHub checks) raises the GitHub API rate limit, it is sent only to api.github.com
  [ -n "${GITHUB_TOKEN:-}" ] && [[ $1 == https://api.github.com/* ]] && auth=(-H "Authorization: Bearer ${GITHUB_TOKEN}")
  for try in 1 2 3; do
    body=$(curl -fsSL -m 60 "${auth[@]}" "$1") && { printf '%s\n' "$body"; return 0; }
    # 22 is an HTTP error (like 404): only network errors are retried
    [ $? = 22 ] && return 1
    [ "$try" = 3 ] || sleep 2
  done
  return 1
}
valid_name() { [[ $1 =~ ^[A-Za-z0-9._+-]+$ ]]; } # versions from remote APIs end up in file names and starter.sh

APT_UPDATED=false
install_package() { # install_package <package>: uses sudo when not root, updates the package list once
  local sudo=()
  [ "$EUID" -eq 0 ] || sudo=(sudo)
  if [ "$APT_UPDATED" = false ]; then
    "${sudo[@]}" apt-get update || return 1
    APT_UPDATED=true
  fi
  "${sudo[@]}" apt-get -y install "$1"
}

require() { # require <command...>: stops when a needed command is missing
  local cmd
  for cmd in "$@"; do
    command -v "$cmd" &>/dev/null || die "$cmd is required, please run the installer or install it manually."
  done
}

banner() {
  clear
  echo -e "\n${LIGHT_PURPLE}      ╔╦╗╔═╗  ╔═╗╔═╗╦═╗╦  ╦╔═╗╦═╗  ╦╔╗╔╔═╗╔╦╗╔═╗╦  ╦  ╔═╗╦═╗
      ║║║║    ╚═╗║╣ ╠╦╝╚╗╔╝║╣ ╠╦╝  ║║║║╚═╗ ║ ╠═╣║  ║  ║╣ ╠╦╝
      ╩ ╩╚═╝  ╚═╝╚═╝╩╚═ ╚╝ ╚═╝╩╚═  ╩╝╚╝╚═╝ ╩ ╩ ╩╩═╝╩═╝╚═╝╩╚═
             ${PURPLE}You are using the auto updated script${COLOR_NULL}\n"
  sleep 1
}

## questions ##
ask() { # ask <var> <question> <default>
  local answer
  echo -e -n "${CYAN} ( * ) $2 (default: $3): ${COLOR_NULL}"
  read -r answer || exit 1
  printf -v "$1" '%s' "${answer:-$3}"
}

ask_number() { # ask_number <var> <question> <default> <min> <max>
  while true; do
    ask "$1" "$2" "$3"
    [[ ${!1} =~ ^[0-9]+$ ]] && (( 10#${!1} >= $4 && 10#${!1} <= $5 )) && return
    echo -e "${ERROR} ${LIGHT_RED}Please enter a number between $4 and $5! ${COLOR_NULL}"
  done
}

ask_yes_no() { # ask_yes_no <var> <question> [default y|n]: stores true or false
  local answer
  while true; do
    echo -e -n "${CYAN} ( * ) $2 (y/n${3:+, default: $3}): ${COLOR_NULL}"
    read -r answer || exit 1
    answer=${answer:-$3}
    case "${answer,,}" in
      y|yes|true) printf -v "$1" true; return ;;
      n|no|false) printf -v "$1" false; return ;;
    esac
    echo -e "${ERROR} ${LIGHT_RED}Please answer y or n! ${COLOR_NULL}"
  done
}

ask_basics() { # ask_basics <default folder name>: sets FOLDER
  echo -e "\n${YELLOW}[[[--- Welcome to the setup for configuring your server! ---]]]${COLOR_NULL}\n"
  ask FOLDER "Enter the directory where the server will be installed" "$HOME/$1"
  FOLDER=${FOLDER/#\~/$HOME}
}

ask_ram() { # sets MEM, only for the software that runs on Java
  ask_number MEM "Enter the amount of RAM to allocate in megabytes" 2048 128 1048576
}

ask_game() { # ask_game <default port>: sets PORT, ONLINE_MODE, MAX_PLAYERS and EULA
  ask_number PORT "Enter the port where to host the server" "$1" 1 65535
  ask_yes_no ONLINE_MODE "Do you want to grant server access only to premium users?" y
  ask_number MAX_PLAYERS "How many maximum players should the server have?" 20 1 100000
  ask_yes_no EULA "Do you accept the Minecraft EULA (https://aka.ms/MinecraftEULA)?"
  [ "$EULA" = true ] || warn "The server will not start until you set eula=true in eula.txt."
}

choose() { # choose <var> <options...>: lets the user pick one option, exits on Cancel
  local var=$1 option options=()
  shift
  for option in "$@"; do
    valid_name "$option" && options+=("$option")
  done
  [ ${#options[@]} -gt 0 ] || die "Could not fetch the list, the download source may be offline."
  select option in "${options[@]}" "Cancel"; do
    if [ "$option" = "Cancel" ]; then
      exit 0
    elif [ -n "$option" ]; then
      printf -v "$var" '%s' "$option"
      return
    fi
    echo -e "${ERROR} ${LIGHT_RED}The argument you entered is incorrect! ${COLOR_NULL}"
  done
  exit 0
}

choose_version() { # choose_version <versions...>: sets VERSION
  echo -e "${CYAN} ( * ) Select the server version: ${COLOR_NULL}"
  choose VERSION "$@"
}

## files ##
prepare_folder() { # creates FOLDER and moves into it, asking before reusing a non-empty one
  local reuse
  echo -e "\n"
  if [ -n "$(ls -A "$FOLDER" 2>/dev/null)" ]; then
    ask_yes_no reuse "The folder $FOLDER is not empty, existing files may be overwritten. Continue?" n
    [ "$reuse" = true ] || exit 0
  fi
  mkdir -p "$FOLDER" && cd "$FOLDER" || die "Could not create the folder $FOLDER"
  FOLDER=$PWD
}

make_temp() { # creates INSTALL_TEMP inside FOLDER (once), removed when the script exits
  [ -n "$INSTALL_TEMP" ] && return
  INSTALL_TEMP=$(mktemp -d "$FOLDER/.installer.XXXXXX") || die "Could not create a temporary folder in $FOLDER"
  trap 'rm -rf "$INSTALL_TEMP"' EXIT
}

set_property() { # set_property <key> <value>: updates or adds a line in server.properties
  if grep -q "^$1=" server.properties 2>/dev/null; then
    sed -i "s|^$1=.*|$1=$2|" server.properties
  else
    echo "$1=$2" >> server.properties
  fi
}

write_properties() {
  step "Setting up the server settings. . ."
  set_property server-port "$PORT"
  set_property online-mode "$ONLINE_MODE"
  set_property max-players "$MAX_PLAYERS"
  step "Setting up the EULA file. . ."
  printf '# The minecraft EULA file has been set to %s by the user who ran the script.\n# https://github.com/samupro-dev/mc-server-installer\neula=%s\n' "$EULA" "$EULA" > eula.txt
}

download() { # download <url> <file> [sha256:<hash>|sha1:<hash>]: the hash is checked when given
  [ -n "$1" ] && [ "$1" != "null" ] || die "Could not find the download link, the source may be offline."
  wget -q --show-progress --tries=3 --timeout=30 -O "$2" "$1" || { rm -f "$2"; die "Download failed: $1"; }
  if [ -n "${3#*:}" ]; then
    echo "${3#*:}  $2" | "${3%%:*}sum" -c --status - || { rm -f "$2"; die "The checksum of $2 does not match, the file has been deleted."; }
  fi
}

github_asset() { # github_asset <owner/repo> <asset name regex>: the asset of the newest release that has it
  fetch "https://api.github.com/repos/$1/releases" | jq -c --arg re "$2" '[.[] | select(.draft | not) | .assets[] | select(.name | test($re))][0] // empty'
}
download_asset() { # download_asset <asset json> <file>: downloads a GitHub release asset, checked with its sha256 digest
  download "$(jq -r '.browser_download_url' <<< "$1")" "$2" "$(jq -r '.digest // empty' <<< "$1")"
}


## java ##
java_for_mc() { # java_for_mc <minecraft version>: prints the Java version it needs
  case "$1" in
    1.21*|1.20.5|1.20.6) echo 21 ;;
    1.17.1|1.18*|1.19*|1.20*) echo 17 ;;
    1.17) echo 16 ;;
    1.*) echo 8 ;;
    *) echo 25 ;; # 26.x and later; shortcut: update when Mojang raises the Java requirement again
  esac
}

download_java() { # download_java <java version>: downloads a JDK from Azul into INSTALL_TEMP and sets JAVA
  local arch package
  case "$(uname -m)" in
    x86_64) arch="x64" ;;
    aarch64|arm64) arch="aarch64" ;;
    *) die "Java can only be downloaded on x86_64 and aarch64 systems." ;;
  esac
  make_temp
  step "Downloading Java $1. . ."
  package=$(fetch "https://api.azul.com/metadata/v1/zulu/packages/?java_version=$1&os=linux&arch=${arch}&archive_type=tar.gz&java_package_type=jdk&latest=true&release_status=ga&availability_types=CA&page=1&page_size=100" | jq -c --arg a "$arch" 'map(select(.download_url | test("zulu.*-ca-jdk.*-linux_" + $a + "\\.tar\\.gz$"))) | .[0] // empty')
  [ -n "$package" ] || die "Could not find Java $1 for ${arch}, the download source may be offline."
  download "$(jq -r '.download_url' <<< "$package")" "$INSTALL_TEMP/jdk.tar.gz" \
    "sha256:$(fetch "https://api.azul.com/metadata/v1/zulu/packages/$(jq -r '.package_uuid' <<< "$package")" | jq -r '.sha256_hash // empty')"
  mkdir "$INSTALL_TEMP/jdk" && tar -xzf "$INSTALL_TEMP/jdk.tar.gz" -C "$INSTALL_TEMP/jdk" --strip-components=1 || die "Could not extract Java."
  JAVA="$INSTALL_TEMP/jdk/bin/java"
}

java_major() { java -version 2>&1 | awk -F'"' '/version/ {split($2, v, "."); print (v[1] == 1 ? v[2] : v[1] + 0); exit}'; }

check_java() { # check_java [minecraft version] [exact]: warns when Java is missing, too old, or (exact) different
  local need="" have
  [ -n "$1" ] && need=$(java_for_mc "$1")
  if ! command -v java &>/dev/null; then
    warn "Java is not installed, install Java${need:+ $need} before starting the server."
  elif [ -n "$need" ]; then
    have=$(java_major)
    if [ "$2" = "exact" ] && [ "${have:-0}" != "$need" ]; then
      warn "This version only works with Java $need, but Java ${have:-?} is installed."
    elif [ "${have:-0}" -lt "$need" ]; then
      warn "This version needs at least Java $need, but Java ${have:-?} is installed."
    fi
  fi
}

## end ##
write_starter() { # write_starter <start command>
  step "The startup file has been created."
  cat > starter.sh <<'EOF'
#!/bin/bash
cd "$(dirname "$0")" || exit 1
echo '   ___    __    __  __  __  __  ____  ____  _____
  / __)  /__\  (  \/  )(  )(  )(  _ \(  _ \(  _  )
  \__ \ /(__)\  )    (  )(__)(  )___/ )   / )(_)(
  (___/(__)(__)(_/\/\_)(______)(__)  (_)\_)(_____)
          https://github.com/samupro-dev'
echo ' '
EOF
  echo "$1" >> starter.sh
  chmod +x starter.sh
}

success() { # success <installed version>
  echo -e " "
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${LIGHT_GREEN} Your server was successfully installed!\n   ${CYAN}* Version: ${WHITE}$1\n   ${CYAN}* Location: ${WHITE}${FOLDER}${MEM:+\n   ${CYAN}* RAM: ${WHITE}${MEM}M}${PORT:+\n   ${CYAN}* Port: ${WHITE}${PORT}} ${COLOR_NULL}"
  echo -e "${LIGHT_PURPLE}_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_/-/_${COLOR_NULL}"
  echo -e "${YELLOW}To start the server use the ${LIGHT_RED}${FOLDER}/starter.sh ${YELLOW}command${COLOR_NULL}"
  exit 0
}
