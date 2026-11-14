#!/bin/bash
COMMON=${MCSI_COMMON:-$(wget -qO- https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/common.sh)} || { echo "Could not download common.sh, check your internet connection."; exit 1; }
# shellcheck source=src/common.sh
source /dev/stdin <<< "$COMMON"
declare -F die >/dev/null || { echo "Could not load common.sh, please try again later."; exit 1; }
require curl wget jq

function vanilla_conf {
  ask_basics vanilla
  echo -e "\n${LIGHT_RED} !! ${CYAN}Server type selected: ${YELLOW}VANILLA ${COLOR_NULL}"
  echo -e "${CYAN} ( * ) Select the one that suits you best! ${COLOR_NULL}"
  choose TYPE "Vanilla" "Snapshot" "Pumpkin"
  # Pumpkin does not run on Java and has its own config files
  [ "$TYPE" = "Pumpkin" ] || { ask_ram; ask_game 25565; }
  step "Fetching the versions. . . (it might take a while)\n"
  case "$TYPE" in
    Vanilla) vanilla ;;
    Snapshot) snapshot ;;
    Pumpkin) pumpkin ;;
  esac
}

function vanilla_setup {
  prepare_folder
  write_properties
  step "Downloading the jar file. . ."
  JAR="${TYPE,,}-${VERSION}.jar"
  START="java -Xms128M -Xmx${MEM}M -jar ${JAR} nogui"
}

## vanilla ##
function vanilla {
  manifest=$(fetch https://piston-meta.mojang.com/mc/game/version_manifest.json) || die "Could not fetch the versions from Mojang."
  mapfile -t versions < <(jq -r '.versions[] | select(.type == "release") | .id' <<< "$manifest")
  choose_version "${versions[@]}"
  stepsVanilla
}

function stepsVanilla {
  vanilla_setup
  version_url=$(jq -r --arg v "$VERSION" '.versions[] | select(.id == $v) | .url' <<< "$manifest")
  server=$(fetch "$version_url" | jq -c '.downloads.server')
  download "$(jq -r '.url' <<< "$server")" "$JAR" "sha1:$(jq -r '.sha1 // empty' <<< "$server")"
  starterFile
}

## snapshot ##
function snapshot {
  manifest=$(fetch https://piston-meta.mojang.com/mc/game/version_manifest.json) || die "Could not fetch the versions from Mojang."
  VERSION=$(jq -r '.latest.snapshot' <<< "$manifest")
  valid_name "$VERSION" || die "Could not read the latest snapshot version from Mojang."
  stepsVanilla
}

## pumpkin ##
function pumpkin {
  local arch
  case "$(uname -m)" in
    x86_64) arch="X64" ;;
    aarch64|arm64) arch="ARM64" ;;
    *) die "Pumpkin is only available for x86_64 and aarch64 systems." ;;
  esac
  VERSION="canary"
  prepare_folder
  step "Downloading the server. . ."
  download_asset "$(fetch https://api.github.com/repos/Pumpkin-MC/Pumpkin/releases/tags/canary | jq -c --arg n "pumpkin-${arch}-Linux" '.assets[] | select(.name == $n)')" pumpkin
  chmod +x pumpkin
  warn "Pumpkin is still in development: keep backups of the world, and set the port and the other settings in the config folder after the first start."
  START="./pumpkin"
  starterFile
}

## end ##
function starterFile {
  write_starter "$START"
  [ "$TYPE" = "Pumpkin" ] || check_java "$VERSION"
  success "$TYPE $VERSION"
}

banner
vanilla_conf
