#!/bin/bash
COMMON=${MCSI_COMMON:-$(wget -qO- https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/common.sh)} || { echo "Could not download common.sh, check your internet connection."; exit 1; }
# shellcheck source=src/common.sh
source /dev/stdin <<< "$COMMON"
declare -F die >/dev/null || { echo "Could not load common.sh, please try again later."; exit 1; }
require curl wget jq

function proxy_conf {
  ask_basics proxy
  echo -e "\n${LIGHT_RED} !! ${CYAN}Server type selected: ${YELLOW}PROXY ${COLOR_NULL}"
  echo -e "${CYAN} ( * ) Select the type of fork that suits you best! ${COLOR_NULL}"
  choose TYPE "BungeeCord" "Velocity" "Velocity-CTD" "Geyser" "Gate" "ViaProxy" "WaterdogPE" "Infrarust" "Limbo" "PicoLimbo" "NanoLimbo"
  # Gate, Infrarust and PicoLimbo do not run on Java
  case "$TYPE" in
    Gate|Infrarust|PicoLimbo) ;;
    *) ask_ram ;;
  esac
  case "$TYPE" in
    BungeeCord) bungeecord ;;
    Velocity) velocity ;;
    Velocity-CTD) velocity_ctd ;;
    Geyser) geyser ;;
    Gate) gate ;;
    ViaProxy) viaproxy ;;
    WaterdogPE) waterdogpe ;;
    Infrarust) infrarust ;;
    Limbo) limbo ;;
    PicoLimbo) picolimbo ;;
    NanoLimbo) nanolimbo ;;
  esac
}

function proxy_setup {
  prepare_folder
  step "Downloading the proxy. . ."
  JAR="${TYPE,,}.jar"
  START="java -Xms128M -Xmx${MEM}M -jar ${JAR} nogui"
}

## bungeecord ##
function bungeecord {
  proxy_setup
  download https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar "$JAR"
  starterFile
}

## velocity ##
function velocity {
  proxy_setup
  local version file
  version=$(fetch https://fill.papermc.io/v3/projects/velocity/versions | jq -r '.versions[0].version.id')
  file=$(fetch "https://fill.papermc.io/v3/projects/velocity/versions/${version}/builds/latest" | jq -c '.downloads["server:default"]')
  download "$(jq -r '.url' <<< "$file")" "$JAR" "sha256:$(jq -r '.checksums.sha256 // empty' <<< "$file")"
  starterFile
}

## velocity-ctd ##
function velocity_ctd {
  proxy_setup
  download_asset "$(github_asset GemstoneGG/Velocity-CTD '^velocity-ctd-[0-9].*\.jar$')" "$JAR"
  starterFile
}

## geyser ##
function geyser {
  proxy_setup
  local build
  build=$(fetch https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest)
  download "https://download.geysermc.org/v2/projects/geyser/versions/$(jq -r '.version' <<< "$build")/builds/$(jq -r '.build' <<< "$build")/downloads/standalone" \
    "$JAR" "sha256:$(jq -r '.downloads.standalone.sha256 // empty' <<< "$build")"
  starterFile
}

## gate ##
function gate {
  local arch
  case "$(uname -m)" in
    x86_64) arch="amd64" ;;
    aarch64|arm64) arch="arm64" ;;
    *) die "Gate is only available for x86_64 and aarch64 systems." ;;
  esac
  proxy_setup
  download_asset "$(github_asset minekube/gate "^gate_[0-9.]+_linux_${arch}$")" gate
  chmod +x gate
  START="./gate"
  starterFile
}

## viaproxy ##
function viaproxy {
  proxy_setup
  download_asset "$(github_asset ViaVersion/ViaProxy '^ViaProxy-[0-9.]+\.jar$')" "$JAR"
  START="java -Xms128M -Xmx${MEM}M -jar ${JAR} config viaproxy.yml"
  # the first start only writes viaproxy.yml and exits
  download_java 21
  "$JAVA" -jar "$JAR" config viaproxy.yml >/dev/null 2>&1
  warn "Set the address of your server in viaproxy.yml before starting ViaProxy."
  starterFile
}

## waterdogpe ##
function waterdogpe {
  proxy_setup
  download_asset "$(github_asset WaterdogPE/WaterdogPE '^Waterdog\.jar$')" "$JAR"
  START="java -Xms128M -Xmx${MEM}M -jar ${JAR}"
  starterFile
}

## infrarust ##
function infrarust {
  local arch
  case "$(uname -m)" in
    x86_64) arch="x86_64" ;;
    aarch64|arm64) arch="arm64" ;;
    *) die "Infrarust is only available for x86_64 and aarch64 systems." ;;
  esac
  proxy_setup
  make_temp
  download_asset "$(github_asset Shadowner/Infrarust "^infrarust-linux-${arch}\.tar\.gz$")" "$INSTALL_TEMP/infrarust.tar.gz"
  tar -xzf "$INSTALL_TEMP/infrarust.tar.gz" -C "$INSTALL_TEMP" && mv "$(find "$INSTALL_TEMP" -type f -name infrarust -print -quit)" infrarust || die "Could not extract Infrarust."
  chmod +x infrarust
  # without infrarust.toml Infrarust starts an interactive setup
  mkdir -p servers
  [ -f infrarust.toml ] || printf 'bind = "0.0.0.0:25565"\nservers_dir = "./servers"\n' > infrarust.toml
  warn "Add your servers as .toml files in the servers folder, see https://infrarust.dev/guide/"
  START="./infrarust"
  starterFile
}

## limbo ##
function limbo {
  proxy_setup
  local build
  build=$(fetch "https://ci.loohpjames.com/job/Limbo/lastSuccessfulBuild/api/json?tree=artifacts%5BfileName,relativePath%5D")
  download "https://ci.loohpjames.com/job/Limbo/lastSuccessfulBuild/artifact/$(jq -r '.artifacts[] | select(.fileName | test("^Limbo-.*\\.jar$")) | .relativePath' <<< "$build")" "$JAR"
  starterFile
}

## picolimbo ##
function picolimbo {
  local arch
  case "$(uname -m)" in
    x86_64) arch="x86_64" ;;
    aarch64|arm64) arch="aarch64" ;;
    *) die "PicoLimbo is only available for x86_64 and aarch64 systems." ;;
  esac
  proxy_setup
  make_temp
  download_asset "$(github_asset Quozul/PicoLimbo "^pico_limbo_linux-${arch}-gnu\.tar\.gz$")" "$INSTALL_TEMP/picolimbo.tar.gz"
  tar -xzf "$INSTALL_TEMP/picolimbo.tar.gz" -C "$INSTALL_TEMP" && mv "$(find "$INSTALL_TEMP" -type f -name pico_limbo -print -quit)" pico_limbo || die "Could not extract PicoLimbo."
  chmod +x pico_limbo
  START="./pico_limbo"
  starterFile
}

## nanolimbo ##
function nanolimbo {
  proxy_setup
  download_asset "$(github_asset BoomEaro/NanoLimbo '^NanoLimbo\.jar$')" "$JAR"
  START="java -Xms128M -Xmx${MEM}M -jar ${JAR}"
  starterFile
}

## end ##
function starterFile {
  write_starter "$START"
  case "$TYPE" in
    Gate|Infrarust|PicoLimbo) ;;
    *) check_java ;;
  esac
  success "$TYPE"
}

banner
proxy_conf
