#!/bin/bash
COMMON=${MCSI_COMMON:-$(wget -qO- https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/common.sh)} || { echo "Could not download common.sh, check your internet connection."; exit 1; }
# shellcheck source=src/common.sh
source /dev/stdin <<< "$COMMON"
declare -F die >/dev/null || { echo "Could not load common.sh, please try again later."; exit 1; }
require curl wget jq unzip

function bedrock_conf {
  ask_basics bedrock
  ask_game 19132
  echo -e "\n${LIGHT_RED} !! ${CYAN}Server type selected: ${YELLOW}BEDROCK ${COLOR_NULL}"
  echo -e "${CYAN} ( * ) Select the type of fork that suits you best! ${COLOR_NULL}"
  choose TYPE "Bedrock" "Endstone" "NukkitX" "Nukkit-MOT" "Lumi" "PowerNukkitX" "Allay"
  VERSION="Latest"
  case "$TYPE" in
    Bedrock) bedrock ;;
    Endstone) endstone ;;
    NukkitX) nukkitx ;;
    Nukkit-MOT) nukkit_mot ;;
    Lumi) lumi ;;
    PowerNukkitX) powernukkitx ;;
    Allay) allay ;;
  esac
}

function bedrock_setup {
  prepare_folder
  step "Downloading the server files. . ."
  JAR="${TYPE,,}.jar"
  START="java -Xms128M -Xmx${MEM}M -jar ${JAR} nogui"
}

## bedrock ##
function bedrock {
  [ "$(uname -m)" = "x86_64" ] || die "The official Bedrock server only runs on x86_64 systems, choose a Nukkit based server or Allay instead."
  choose_version "Latest" "Preview"
  stepsBedrock
}

function stepsBedrock {
  bedrock_setup
  local link_type url unzip_args config
  link_type="serverBedrockLinux"
  [ "$VERSION" = "Preview" ] && link_type="serverBedrockPreviewLinux"
  url=$(fetch https://net-secondary.web.minecraft-services.net/api/v1.0/download/links | jq -r --arg t "$link_type" '.result.links[] | select(.downloadType == $t) | .downloadUrl')
  download "$url" bedrock-server.zip
  unzip_args=(-oq bedrock-server.zip)
  for config in server.properties allowlist.json permissions.json; do
    [ -f "$config" ] && unzip_args+=(-x "$config")
  done
  unzip "${unzip_args[@]}" || die "Could not extract the Bedrock server."
  rm bedrock-server.zip
  VERSION="$VERSION $(basename "$url" .zip | sed 's/^bedrock-server-//')"
  START="./bedrock_server"
  starterFile
}

## endstone ##
function endstone {
  [ "$(uname -m)" = "x86_64" ] || die "Endstone only runs on x86_64 systems, choose a Nukkit based server or Allay instead."
  bedrock_setup
  local install_it
  command -v python3 &>/dev/null || install_package python3 || die "Endstone needs Python 3.11 or newer, please install it."
  python3 -c 'import sys; sys.exit(sys.version_info < (3, 11))' || die "Endstone needs Python 3.11 or newer (Debian 12, Ubuntu 24.04 or newer systems)."
  if ! python3 -m venv .venv &>/dev/null; then
    ask_yes_no install_it "Endstone needs the python3-venv package, do you want to install it?" y
    [ "$install_it" = true ] && install_package python3-venv && python3 -m venv .venv || die "Could not create the Python environment, install python3-venv and try again."
  fi
  .venv/bin/pip install --upgrade endstone || die "Could not install Endstone, check the log above."
  VERSION=$(.venv/bin/python -c 'import importlib.metadata as m; print(m.version("endstone"))')
  START=".venv/bin/endstone --yes --server-folder ."
  starterFile
}

## nukkitx ##
function nukkitx {
  bedrock_setup
  download "https://repo.opencollab.dev/api/maven/latest/file/maven-snapshots/cn/nukkit/nukkit/1.0-SNAPSHOT?extension=jar" "$JAR"
  # without nukkit.yml the first start asks for the language
  [ -f nukkit.yml ] || printf 'settings:\n  language: eng\n' > nukkit.yml
  starterFile
}

## nukkit-mot ##
# GitHub serves artifacts only to logged in users: nightly.link serves the same file, checked with the GitHub digest
function nukkit_mot {
  bedrock_setup
  local run artifact jar
  run=$(fetch "https://api.github.com/repos/MemoriesOfTime/Nukkit-MOT/actions/workflows/maven.yml/runs?branch=master&status=success&per_page=1" | jq -r '.workflow_runs[0].id // empty')
  [ -n "$run" ] || die "Could not find the latest Nukkit-MOT build, the source may be offline."
  artifact=$(fetch "https://api.github.com/repos/MemoriesOfTime/Nukkit-MOT/actions/runs/${run}/artifacts" | jq -c '.artifacts[] | select(.name == "Nukkit-MOT")')
  make_temp
  download "https://nightly.link/MemoriesOfTime/Nukkit-MOT/actions/runs/${run}/Nukkit-MOT.zip" "$INSTALL_TEMP/nukkit-mot.zip" "$(jq -r '.digest // empty' <<< "$artifact")"
  jar=$(unzip -Z1 "$INSTALL_TEMP/nukkit-mot.zip" | grep -E '^Nukkit-MOT-.*\.jar$' | grep -vE 'Lite|sources' | head -n 1)
  [ -n "$jar" ] && unzip -q "$INSTALL_TEMP/nukkit-mot.zip" "$jar" -d "$INSTALL_TEMP" && mv "$INSTALL_TEMP/$jar" "$JAR" || die "Could not find the Nukkit-MOT jar in the build."
  starterFile
}

## lumi ##
function lumi {
  bedrock_setup
  download_asset "$(github_asset KoshakMineDEV/Lumi '^Lumi-[0-9.]+\.jar$')" "$JAR"
  starterFile
}

## powernukkitx ##
function powernukkitx {
  bedrock_setup
  download https://github.com/PowerNukkitX/PowerNukkitX/releases/download/snapshot/powernukkitx.jar "$JAR"
  starterFile
}

## allay ##
function allay {
  bedrock_setup
  download_asset "$(fetch https://api.github.com/repos/AllayMC/Allay/releases/tags/nightly | jq -c '.assets[] | select(.name | test("^allay-server-.*-shaded\\.jar$"))')" "$JAR"
  warn "Allay is still in development and uses server-settings.yml: set the port and the other settings there after the first start."
  starterFile
}

## end ##
function starterFile {
  # after the download, so the server.properties shipped with Bedrock gets the settings
  write_properties
  # Nukkit uses xbox-auth instead of online-mode
  case "$TYPE" in
    NukkitX|Nukkit-MOT|Lumi) set_property xbox-auth "$ONLINE_MODE" ;;
  esac
  write_starter "$START"
  case "$TYPE" in
    Bedrock|Endstone) ;;
    *) check_java ;;
  esac
  success "$TYPE $VERSION"
}

banner
bedrock_conf
