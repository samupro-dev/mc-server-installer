#!/bin/bash
COMMON=${MCSI_COMMON:-$(wget -qO- https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/common.sh)} || { echo "Could not download common.sh, check your internet connection."; exit 1; }
# shellcheck source=src/common.sh
source /dev/stdin <<< "$COMMON"
declare -F die >/dev/null || { echo "Could not load common.sh, please try again later."; exit 1; }
require curl wget jq

function modded_conf {
  ask_basics modded
  echo -e "\n${LIGHT_RED} !! ${CYAN}Server type selected: ${YELLOW}MODDED ${COLOR_NULL}"
  echo -e "${CYAN} ( * ) Select the type of fork that suits you best! ${COLOR_NULL}"
  choose TYPE "Forge" "NeoForge" "Fabric" "Quilt" "Youer" "Mohist" "Arclight" "SpongeVanilla" "Crucible"
  ask_ram
  ask_game 25565
  step "Fetching the versions. . . (it might take a while)\n"
  case "$TYPE" in
    Forge) forge ;;
    NeoForge) neoforge ;;
    Fabric) fabric ;;
    Quilt) quilt ;;
    Youer) youer ;;
    Mohist) mohist ;;
    Arclight) arclight ;;
    SpongeVanilla) spongevanilla ;;
    Crucible) crucible ;;
  esac
}

function modded_setup {
  prepare_folder
  write_properties
  step "Downloading the jar file. . ."
  JAR="${TYPE,,}-${VERSION}.jar"
  START="java -Xms128M -Xmx${MEM}M -jar ${JAR} nogui"
}

## forge ##
function forge {
  promos=$(fetch https://files.minecraftforge.net/maven/net/minecraftforge/forge/promotions_slim.json)
  mapfile -t versions < <(jq -r '.promos | keys[] | select(endswith("-latest")) | rtrimstr("-latest")' <<< "$promos" | grep -v '_' | sort -rV)
  choose_version "${versions[@]}"
  stepsForge
}

function stepsForge {
  modded_setup
  local forge url
  forge="${VERSION}-$(jq -r --arg v "$VERSION" '.promos[$v + "-recommended"] // .promos[$v + "-latest"]' <<< "$promos")"
  url="https://maven.minecraftforge.net/net/minecraftforge/forge/${forge}/forge-${forge}-installer.jar"
  # some old versions (1.7.10 - 1.9.4) repeat the minecraft version at the end of the path
  curl -fsIL -m 30 -o /dev/null "$url" || url="https://maven.minecraftforge.net/net/minecraftforge/forge/${forge}-${VERSION}/forge-${forge}-${VERSION}-installer.jar"
  download "$url" forge-installer.jar "sha256:$(fetch "$url.sha256")"
  run_forge_installer forge-installer.jar "forge-*.jar"
  starterFile
}

function run_forge_installer { # <installer jar> <server jar pattern for old versions>
  download_java "$(java_for_mc "$VERSION")"
  "$JAVA" -jar "$1" --installServer || die "The $TYPE installer failed, check the log above."
  rm -f "$1" "$1.log"
  if [ -f run.sh ]; then
    # run.sh reads the RAM from user_jvm_args.txt, the line of a previous install is replaced
    [ -f user_jvm_args.txt ] && sed -i '/^-Xms[0-9]*M -Xmx[0-9]*M$/d' user_jvm_args.txt
    echo "-Xms128M -Xmx${MEM}M" >> user_jvm_args.txt
    START="./run.sh nogui"
  else
    local jars
    mapfile -t jars < <(compgen -G "$2")
    [ -f "${jars[0]}" ] || die "Could not find the $TYPE server jar."
    START="java -Xms128M -Xmx${MEM}M -jar ${jars[0]} nogui"
  fi
}

## neoforge ##
function neoforge {
  # NeoForge 21.1.x is Minecraft 1.21.1, 26.3.0.x is 26.3
  neoforge_builds=$(fetch https://maven.neoforged.net/releases/net/neoforged/neoforge/maven-metadata.xml | grep -oP '<version>\K[0-9]+(\.[0-9]+){2,3}(?=</version>)' |
    awk -F. '{ if ($1 >= 26) mc = ($3 == 0 ? $1 "." $2 : $1 "." $2 "." $3); else mc = ($2 == 0 ? "1." $1 : "1." $1 "." $2); print mc, $0 }')
  mapfile -t versions < <(cut -d ' ' -f 1 <<< "$neoforge_builds" | sort -urV)
  choose_version "${versions[@]}"
  stepsNeoForge
}

function stepsNeoForge {
  modded_setup
  local neo url
  neo=$(awk -v v="$VERSION" '$1 == v { print $2 }' <<< "$neoforge_builds" | sort -V | tail -n 1)
  url="https://maven.neoforged.net/releases/net/neoforged/neoforge/${neo}/neoforge-${neo}-installer.jar"
  download "$url" neoforge-installer.jar "sha256:$(fetch "$url.sha256")"
  run_forge_installer neoforge-installer.jar "neoforge-*.jar"
  starterFile
}

## fabric ##
function fabric {
  mapfile -t versions < <(fetch https://meta.fabricmc.net/v2/versions | jq -r '.game[] | select(.stable == true) | .version')
  choose_version "${versions[@]}"
  stepsFabric
}

function stepsFabric {
  modded_setup
  local installer loader
  installer=$(fetch https://meta.fabricmc.net/v2/versions/installer | jq -r '.[0].version')
  loader=$(fetch "https://meta.fabricmc.net/v2/versions/loader/${VERSION}" | jq -r '.[0].loader.version')
  download "https://meta.fabricmc.net/v2/versions/loader/${VERSION}/${loader}/${installer}/server/jar" "$JAR"
  starterFile
}

## quilt ##
function quilt {
  mapfile -t versions < <(fetch https://meta.quiltmc.org/v3/versions/game | jq -r '.[] | select(.stable == true) | .version')
  choose_version "${versions[@]}"
  stepsQuilt
}

function stepsQuilt {
  modded_setup
  download_java 21
  local url
  url=$(fetch https://meta.quiltmc.org/v3/versions/installer | jq -r '.[0].url')
  download "$url" "$INSTALL_TEMP/quilt-installer.jar" "sha256:$(fetch "$url.sha256")"
  # the installer writes the server in a "server" folder
  (cd "$INSTALL_TEMP" && "$JAVA" -jar quilt-installer.jar install server "$VERSION" --download-server) || die "The Quilt installer failed, check the log above."
  cp -r "$INSTALL_TEMP/server/." . || die "Could not find the Quilt server files."
  START="java -Xms128M -Xmx${MEM}M -jar quilt-server-launch.jar nogui"
  starterFile
}

## youer ##
function youer {
  # the API also lists versions without builds
  mapfile -t versions < <(
    for version in $(fetch https://api.mohistmc.com/project/youer/versions | jq -r '.[].name' | sort -rV); do
      fetch "https://api.mohistmc.com/project/youer/${version}/builds/latest" &>/dev/null && echo "$version"
    done)
  choose_version "${versions[@]}"
  stepsYouer
}

function stepsYouer {
  modded_setup
  local build
  build=$(fetch "https://api.mohistmc.com/project/youer/${VERSION}/builds/latest")
  download "https://api.mohistmc.com/project/youer/${VERSION}/builds/$(jq -r '.id' <<< "$build")/download" "$JAR" \
    "sha256:$(jq -r '.file_sha256 // empty' <<< "$build")"
  starterFile
}

## mohist ##
function mohist {
  # the API also lists versions without builds
  mapfile -t versions < <(
    for version in $(fetch https://api.mohistmc.com/project/mohist/versions | jq -r '.[].name' | sort -rV); do
      fetch "https://api.mohistmc.com/project/mohist/${version}/builds/latest" &>/dev/null && echo "$version"
    done)
  choose_version "${versions[@]}"
  stepsMohist
}

function stepsMohist {
  modded_setup
  local build
  build=$(fetch "https://api.mohistmc.com/project/mohist/${VERSION}/builds/latest")
  download "https://api.mohistmc.com/project/mohist/${VERSION}/builds/$(jq -r '.id' <<< "$build")/download" "$JAR" \
    "sha256:$(jq -r '.file_sha256 // empty' <<< "$build")"
  starterFile
}

## arclight ##
function arclight {
  mapfile -t versions < <(fetch https://files.hypoglycemia.icu/v1/files/arclight/minecraft | jq -r '.files[].name' | sort -rV)
  choose_version "${versions[@]}"
  stepsArclight
}

function stepsArclight {
  modded_setup
  download "https://files.hypoglycemia.icu/v1/files/arclight/minecraft/${VERSION}/latest-snapshot/forge" "$JAR"
  starterFile
}

## spongevanilla ##
function spongevanilla {
  mapfile -t versions < <(fetch https://dl-api.spongepowered.org/v2/groups/org.spongepowered/artifacts/spongevanilla | jq -r '.tags.minecraft[] | select(test("^[0-9]+(\\.[0-9]+)+$"))' | sort -rV)
  choose_version "${versions[@]}"
  stepsSpongeVanilla
}

function stepsSpongeVanilla {
  modded_setup
  local sponge asset
  sponge=$(fetch "https://dl-api.spongepowered.org/v2/groups/org.spongepowered/artifacts/spongevanilla/versions?tags=minecraft%3A${VERSION}&limit=1" | jq -r '.artifacts | keys_unsorted[0]')
  asset=$(fetch "https://dl-api.spongepowered.org/v2/groups/org.spongepowered/artifacts/spongevanilla/versions/${sponge}" | jq -c '[.assets[] | select(.extension == "jar" and (.classifier == "universal" or .classifier == ""))] | sort_by(.classifier != "universal") | .[0]')
  download "$(jq -r '.downloadUrl' <<< "$asset")" "$JAR" "sha1:$(jq -r '.sha1 // empty' <<< "$asset")"
  starterFile
}

## crucible ##
function crucible {
  choose_version "1.7.10"
  stepsCrucible
}

function stepsCrucible {
  modded_setup
  download_asset "$(github_asset CrucibleMC/Crucible '-server\.jar$')" "$JAR"
  # the first start only downloads the libraries and exits
  if [ ! -d libraries ]; then
    download_java 8
    timeout 600 "$JAVA" -jar "$JAR" nogui >/dev/null 2>&1
  fi
  starterFile
}

## end ##
function starterFile {
  write_starter "$START"
  # old modded servers only start with Java 8
  local java_mode=""
  [ "$(java_for_mc "$VERSION")" = 8 ] && java_mode="exact"
  check_java "$VERSION" "$java_mode"
  success "$TYPE $VERSION"
}

banner
modded_conf
