#!/bin/bash
COMMON=${MCSI_COMMON:-$(wget -qO- https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/src/common.sh)} || { echo "Could not download common.sh, check your internet connection."; exit 1; }
# shellcheck source=src/common.sh
source /dev/stdin <<< "$COMMON"
declare -F die >/dev/null || { echo "Could not load common.sh, please try again later."; exit 1; }
require curl wget jq

function spigot_conf {
  ask_basics spigot
  ask_game 25565
  echo -e "\n${LIGHT_RED} !! ${CYAN}Server type selected: ${YELLOW}SPIGOT ${COLOR_NULL}"
  echo -e "${CYAN} ( * ) Select the type of fork that suits you best! ${COLOR_NULL}"
  choose TYPE "Spigot" "Paper" "Purpur" "Folia" "Leaf" "Canvas" "DivineMC" "ShreddedPaper" "Sakura" "Gale" "PandaSpigot" "Lophine"
  step "Fetching the versions. . . (it might take a while)\n"
  case "$TYPE" in
    Spigot) spigot ;;
    Paper) paper ;;
    Purpur) purpur ;;
    Folia) folia ;;
    Leaf) leaf ;;
    Canvas) canvas ;;
    DivineMC) divinemc ;;
    ShreddedPaper) shreddedpaper ;;
    Sakura) sakura ;;
    Gale) gale ;;
    PandaSpigot) pandaspigot ;;
    Lophine) lophine ;;
  esac
}

function spigot_setup {
  prepare_folder
  write_properties
  step "Downloading the jar file. . ."
  JAR="${TYPE,,}-${VERSION}.jar"
}

## spigot ##
function spigot {
  command -v git &>/dev/null || die "Spigot needs git to be built, install it and run the script again."
  mapfile -t versions < <(fetch https://hub.spigotmc.org/nexus/content/repositories/snapshots/org/spigotmc/spigot-api/maven-metadata.xml | grep -oP '<version>\K\d+(\.\d+)+(?=-R0)' | sort -urV)
  choose_version "${versions[@]}"
  stepsSpigot
}

function stepsSpigot {
  spigot_setup
  local java_version
  # javaVersions holds class file versions: the Java version is the value - 44 (52 is Java 8)
  java_version=$(fetch "https://hub.spigotmc.org/versions/${VERSION}.json" | jq -r '.javaVersions[0] // empty | . - 44')
  download_java "${java_version:-$(java_for_mc "$VERSION")}"
  download https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar "$INSTALL_TEMP/BuildTools.jar"
  step "The building of the jar is in progress. . . (it will take a while)"
  (cd "$INSTALL_TEMP" && "$JAVA" -Xms1024M -jar BuildTools.jar --rev "$VERSION") || die "The Spigot build failed, check the log above."
  mv "$INSTALL_TEMP/spigot-${VERSION}.jar" "$JAR" || die "Could not find the built Spigot jar."
  starterFile
}

## paper ##
function paper {
  mapfile -t versions < <(fetch https://fill.papermc.io/v3/projects/paper/versions | jq -r '.versions[].version.id' | grep -v -- '-')
  choose_version "${versions[@]}"
  stepsPaper
}

function stepsPaper {
  spigot_setup
  local file
  file=$(fetch "https://fill.papermc.io/v3/projects/paper/versions/${VERSION}/builds/latest" | jq -c '.downloads["server:default"]')
  download "$(jq -r '.url' <<< "$file")" "$JAR" "sha256:$(jq -r '.checksums.sha256 // empty' <<< "$file")"
  starterFile
}

## purpur ##
function purpur {
  mapfile -t versions < <(fetch https://api.purpurmc.org/v2/purpur | jq -r '.versions[]' | tac)
  choose_version "${versions[@]}"
  stepsPurpur
}

function stepsPurpur {
  spigot_setup
  download "https://api.purpurmc.org/v2/purpur/${VERSION}/latest/download" "$JAR" \
    "md5:$(fetch "https://api.purpurmc.org/v2/purpur/${VERSION}/latest" | jq -r '.md5 // empty')"
  starterFile
}

## folia ##
function folia {
  mapfile -t versions < <(fetch https://fill.papermc.io/v3/projects/folia/versions | jq -r '.versions[].version.id')
  choose_version "${versions[@]}"
  stepsFolia
}

function stepsFolia {
  spigot_setup
  local file
  file=$(fetch "https://fill.papermc.io/v3/projects/folia/versions/${VERSION}/builds/latest" | jq -c '.downloads["server:default"]')
  download "$(jq -r '.url' <<< "$file")" "$JAR" "sha256:$(jq -r '.checksums.sha256 // empty' <<< "$file")"
  starterFile
}

## leaf ##
function leaf {
  mapfile -t versions < <(fetch https://api.leafmc.one/v2/projects/leaf | jq -r '.versions[]' | sort -rV)
  choose_version "${versions[@]}"
  stepsLeaf
}

function stepsLeaf {
  spigot_setup
  local build file
  build=$(fetch "https://api.leafmc.one/v2/projects/leaf/versions/${VERSION}" | jq -r '.builds | max')
  file=$(fetch "https://api.leafmc.one/v2/projects/leaf/versions/${VERSION}/builds/${build}" | jq -c '.downloads.primary')
  download "https://api.leafmc.one/v2/projects/leaf/versions/${VERSION}/builds/${build}/downloads/$(jq -r '.name' <<< "$file")" "$JAR" \
    "sha256:$(jq -r '.sha256 // empty' <<< "$file")"
  # the first start only writes config/leaf-loader.yml and exits
  if [ ! -f config/leaf-loader.yml ]; then
    download_java "$(java_for_mc "$VERSION")"
    timeout 120 "$JAVA" -jar "$JAR" >/dev/null 2>&1
  fi
  warn "Check config/leaf-loader.yml before starting the server."
  starterFile
}

## canvas ##
function canvas {
  canvas_build=$(fetch "https://jenkins.canvasmc.io/job/Canvas/lastSuccessfulBuild/api/json?tree=displayName,artifacts%5BrelativePath%5D")
  choose_version "$(jq -r '.displayName | sub(".* - "; "")' <<< "$canvas_build")"
  stepsCanvas
}

function stepsCanvas {
  spigot_setup
  download "https://jenkins.canvasmc.io/job/Canvas/lastSuccessfulBuild/artifact/$(jq -r '.artifacts[0].relativePath' <<< "$canvas_build")" "$JAR"
  starterFile
}

## divinemc ##
function divinemc {
  mapfile -t versions < <(fetch https://api.bxteam.org/v2/projects/divinemc | jq -r '.versions[]')
  choose_version "${versions[@]}"
  stepsDivineMC
}

function stepsDivineMC {
  spigot_setup
  divinemc_build=$(fetch "https://api.bxteam.org/v2/projects/divinemc/versions/${VERSION}/builds/latest")
  download "$(jq -r '.downloads.application.url' <<< "$divinemc_build")" "$JAR" "sha256:$(jq -r '.downloads.application.sha256 // empty' <<< "$divinemc_build")"
  starterFile
}

## shreddedpaper ##
function shreddedpaper {
  mapfile -t versions < <(fetch https://api.multipaper.io/v2/projects/shreddedpaper | jq -r '.versions[]' | sort -rV)
  choose_version "${versions[@]}"
  stepsShreddedPaper
}

function stepsShreddedPaper {
  spigot_setup
  local build file
  build=$(fetch "https://api.multipaper.io/v2/projects/shreddedpaper/versions/${VERSION}" | jq -r '.builds | max')
  file=$(fetch "https://api.multipaper.io/v2/projects/shreddedpaper/versions/${VERSION}/builds/${build}" | jq -c '.downloads.application')
  download "https://api.multipaper.io/v2/projects/shreddedpaper/versions/${VERSION}/builds/${build}/downloads/$(jq -r '.name' <<< "$file")" "$JAR" \
    "sha256:$(jq -r '.sha256 // empty' <<< "$file")"
  starterFile
}

## sakura ##
function sakura {
  sakura_releases=$(fetch https://api.github.com/repos/Samsuik/Sakura/releases)
  mapfile -t versions < <(jq -r '.[] | select(.draft | not) | .tag_name | split("+")[1] // empty' <<< "$sakura_releases" | sort -urV)
  choose_version "${versions[@]}"
  stepsSakura
}

function stepsSakura {
  spigot_setup
  download_asset "$(jq -c --arg v "$VERSION" '[.[] | select(.draft | not) | select(.tag_name | endswith("+" + $v))][0].assets[] | select(.name | test("^sakura-paperclip-.*\\.jar$"))' <<< "$sakura_releases")" "$JAR"
  starterFile
}

## gale ##
function gale {
  gale_run=$(fetch "https://api.github.com/repos/GaleMC/Gale/actions/workflows/build.yml/runs?branch=main&status=success&per_page=1" | jq -r '.workflow_runs[0].id // empty')
  gale_artifact=$(fetch "https://api.github.com/repos/GaleMC/Gale/actions/runs/${gale_run}/artifacts" | jq -c '.artifacts[0] // empty')
  choose_version "$(jq -r '.name | capture("^gale-(?<v>.+)-[0-9]+\\.jar$").v // empty' <<< "$gale_artifact")"
  stepsGale
}

function stepsGale {
  spigot_setup
  # GitHub serves artifacts only to logged in users: galemc.org serves the same file, checked with the GitHub digest
  download "https://www.galemc.org/api/v2/download/artifact?run_id=${gale_run}" "$JAR" "$(jq -r '.digest // empty' <<< "$gale_artifact")"
  starterFile
}

## pandaspigot ##
function pandaspigot {
  mapfile -t versions < <(fetch https://downloads.hpfxd.com/v2/projects/pandaspigot | jq -r '.versions[]' | sort -rV)
  choose_version "${versions[@]}"
  stepsPandaSpigot
}

function stepsPandaSpigot {
  spigot_setup
  local build sha256
  build=$(fetch "https://downloads.hpfxd.com/v2/projects/pandaspigot/versions/${VERSION}" | jq -r '.builds | max')
  sha256=$(fetch "https://downloads.hpfxd.com/v2/projects/pandaspigot/versions/${VERSION}/builds/${build}" | jq -r '.downloads.paperclip.sha256 // empty')
  download "https://downloads.hpfxd.com/v2/projects/pandaspigot/versions/${VERSION}/builds/${build}/downloads/paperclip" "$JAR" "sha256:${sha256}"
  starterFile
}

## lophine ##
function lophine {
  lophine_releases=$(fetch https://api.github.com/repos/LophineLabs/Lophine/releases)
  mapfile -t versions < <(jq -r '.[] | select(.draft | not) | .tag_name | split("-")[0]' <<< "$lophine_releases" | sort -urV)
  choose_version "${versions[@]}"
  stepsLophine
}

function stepsLophine {
  spigot_setup
  download_asset "$(jq -c --arg v "$VERSION" '[.[] | select(.draft | not) | select(.tag_name | startswith($v + "-"))][0].assets[] | select(.name | test("^lophine-.*\\.jar$"))' <<< "$lophine_releases")" "$JAR"
  starterFile
}

## end ##
function starterFile {
  write_starter "java -Xms128M -Xmx${MEM}M -jar ${JAR} nogui"
  check_java "$VERSION"
  success "$TYPE $VERSION"
}

banner
spigot_conf
