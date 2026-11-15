#!/bin/bash
# shellcheck disable=SC2016 # some test inputs contain $(...) on purpose, they must not expand
# Unit tests for src/common.sh. Run from anywhere: bash tests/test_common.sh
R=$(cd "$(dirname "$0")/.." && pwd)
# shellcheck source=src/common.sh
source "$R/src/common.sh"
clear() { :; }
sleep() { :; }

fail=0
check() { # check <name> <got> <expected>
  if [ "$2" = "$3" ]; then echo "PASS $1"; else echo "FAIL $1: got '$2' want '$3'"; fail=1; fi
}

T=$(mktemp -d)
HOME="$T/home"
mkdir -p "$HOME" "$T/java17" "$T/java8"
printf '#!/bin/bash\necho %s >&2\n' "'openjdk version \"17.0.2\" 2022-01-18'" > "$T/java17/java"
printf '#!/bin/bash\necho %s >&2\n' "'java version \"1.8.0_392\"'" > "$T/java8/java"
chmod +x "$T/java17/java" "$T/java8/java"
chmod +x "$R/tests/bin/wget" # git on Windows may drop the executable bit
PATH="$R/tests/bin:$PATH"
PATH0=$PATH

## questions ##
ask_number MEM ram 2048 128 1048576 <<< $'2G\n08\n512' >/dev/null; check "ask_number validates" "$MEM" 512
ask_number MEM ram 2048 128 1048576 <<< '' >/dev/null; check "ask_number default" "$MEM" 2048
ask_yes_no X q <<< $'maybe\nYES' >/dev/null; check "ask_yes_no yes" "$X" true
ask_yes_no X q n <<< '' >/dev/null; check "ask_yes_no default" "$X" false
(ask_yes_no X q < /dev/null >/dev/null); check "ask_yes_no EOF exits" "$?" 1
# shellcheck disable=SC2088 # the tilde is typed by the user, ask_basics expands it
ask_basics srv <<< '~/mc' >/dev/null; check "ask_basics tilde" "$FOLDER" "$HOME/mc"
ask_basics srv <<< '' >/dev/null; check "ask_basics default folder" "$FOLDER" "$HOME/srv"

## choose ##
choose V a b <<< $'9\n2' >/dev/null 2>&1; check "choose picks" "$V" b
out=$(V=x; choose V a b <<< 3 2>/dev/null; echo "after:$V"); check "choose Cancel exits" "$out" ""
(choose V >/dev/null 2>&1); check "choose empty dies" "$?" 1
choose V '1.21;rm -rf ~' '$(id)' 'a b' '1.20.4' <<< 1 >/dev/null 2>&1; check "choose keeps only safe names" "$V" "1.20.4"
check "unsafe name not shown" "$(choose V 'x;y' '1.2' <<< 2 2>&1 | grep -c 'x;y')" 0
(choose V 'x;y' '`id`' >/dev/null 2>&1); check "only unsafe names dies" "$?" 1
valid_name "26.1-snapshot-3" && valid_name "1.20.1" && ! valid_name '1.2$(x)' && ! valid_name ''; check "valid_name" "$?" 0

## java ##
for p in 26.1:25 26.3:25 1.21.10:21 1.20.6:21 1.20.5:21 1.20.4:17 1.18.2:17 1.17.1:17 1.17:16 1.16.5:8 1.8:8; do
  check "java_for_mc ${p%:*}" "$(java_for_mc "${p%:*}")" "${p#*:}"
done
PATH="$T/java17:$PATH0"
check "java_major 17" "$(java_major)" 17
check "check_java 1.21 warns" "$(check_java 1.21.1 | grep -c 'at least Java 21')" 1
check "check_java 1.20.1 ok" "$(check_java 1.20.1)" ""
check "exact warns on Java 17 for 1.12.2" "$(check_java 1.12.2 exact | grep -c 'only works with Java 8')" 1
check "non-exact silent on Java 17 for 1.12.2" "$(check_java 1.12.2)" ""
PATH="$T/java8:$PATH0"
check "java_major 1.8" "$(java_major)" 8
check "check_java 1.16.5 ok" "$(check_java 1.16.5)" ""
check "exact silent on Java 8 for 1.12.2" "$(check_java 1.12.2 exact)" ""
# shellcheck disable=SC2123 # no java at all (only builtins run until PATH is restored)
PATH="$T/none"
missing=$(check_java 1.21.1); missing_proxy=$(check_java)
PATH=$PATH0
check "check_java missing" "$(grep -c 'not installed, install Java 21' <<< "$missing")" 1
check "check_java missing proxy" "$(grep -c 'not installed, install Java before' <<< "$missing_proxy")" 1
PATH="$T/java17:$PATH0"
check "JAVA_VERSION overrides the Minecraft one" "$(JAVA_VERSION=25; check_java 1.12.2 | grep -c 'at least Java 25')" 1
check "check_java sets JAVA_VERSION" "$(check_java 1.21.1 >/dev/null; echo "$JAVA_VERSION")" 21
PATH=$PATH0

## folders ##
FOLDER="$T/a/b/c"; (prepare_folder >/dev/null && pwd > "$T/pwd"); check "prepare nested folder" "$(cat "$T/pwd")" "$T/a/b/c"
touch "$T/a/b/c/world.dat"
(prepare_folder <<< n >/dev/null; echo "continued"); check "non-empty folder: n stops" "$(ls "$T/a/b/c")" "world.dat"
check "non-empty folder: y continues" "$(prepare_folder <<< y >/dev/null; echo continued)" continued
touch "$T/afile"; FOLDER="$T/afile/x"; (cd "$T" && prepare_folder >/dev/null 2>&1); check "uncreatable folder dies" "$?" 1
(cd "$T" && FOLDER=rel/dir && prepare_folder >/dev/null && echo "$FOLDER" > "$T/abs"); check "relative folder becomes absolute" "$(cat "$T/abs")" "$T/rel/dir"

## files ##
cd "$T/a/b/c" || exit 1
check "umask is 027" "$(umask)" "0027"
printf 'level-name=world\nserver-port=19132\n' > server.properties
PORT=25570 ONLINE_MODE=true MAX_PLAYERS=10 EULA=false
write_properties >/dev/null
check "properties merged" "$(cat server.properties)" $'level-name=world\nserver-port=25570\nonline-mode=true\nmax-players=10'
check "eula" "$(tail -n 1 eula.txt)" "eula=false"

write_starter "echo started" >/dev/null; write_starter "echo started" >/dev/null
check "starter not duplicated" "$(grep -c 'echo started' starter.sh)" 1
check "starter shebang" "$(head -n 1 starter.sh)" "#!/bin/bash"
check "starter runs from elsewhere" "$(cd / && "$T/a/b/c/starter.sh" | tail -n 1)" started

FOLDER="$T/a/b/c"
(make_temp; echo "$INSTALL_TEMP" > "$T/tmpname"; exit 0); check "temp removed on exit" "$(ls -d "$(cat "$T/tmpname")" 2>/dev/null)" ""
check "make_temp creates one folder" "$(make_temp; first=$INSTALL_TEMP; make_temp; [ "$first" = "$INSTALL_TEMP" ] && echo same)" same
(make_temp; die boom >/dev/null); check "temp removed on die" "$(find . -maxdepth 1 -name '.installer.*' | wc -l | tr -d ' ')" 0
bash -c 'source "$1/src/common.sh"; FOLDER=$2; make_temp; echo "$INSTALL_TEMP" > "$2/tmpname"; kill -INT $$; sleep 5' _ "$R" "$T" >/dev/null 2>&1
check "INT exit code" "$?" 130
check "INT removes temp" "$(ls -d "$(cat "$T/tmpname")" 2>/dev/null)" ""
bash -c 'source "$1/src/common.sh"; FOLDER=$2; make_temp; echo "$INSTALL_TEMP" > "$2/tmpname"; kill -TERM $$; sleep 5' _ "$R" "$T" >/dev/null 2>&1
check "TERM removes temp" "$(ls -d "$(cat "$T/tmpname")" 2>/dev/null)" ""

## downloads (tests/bin/wget serves this repository's LICENSE for this URL) ##
url=https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/LICENSE
sha256=$(sha256sum "$R/LICENSE" | cut -d ' ' -f 1)
sha1=$(sha1sum "$R/LICENSE" | cut -d ' ' -f 1)
(download "$url" ok256 "sha256:$sha256" >/dev/null 2>&1); check "sha256 match" "$?:$(ls ok256)" "0:ok256"
(download "$url" ok1 "sha1:$sha1" >/dev/null 2>&1); check "sha1 match" "$?:$(ls ok1)" "0:ok1"
(download "$url" bad "sha256:0000" >/dev/null 2>&1); check "sha256 mismatch dies" "$?" 1
check "mismatched file deleted" "$(ls bad 2>/dev/null)" ""
(download "$url" nohash "sha256:" >/dev/null 2>&1); check "empty hash skips check" "$?:$(ls nohash)" "0:nohash"
(download "" f.jar >/dev/null 2>&1); check "download empty url dies" "$?" 1
(download null f.jar >/dev/null 2>&1); check "download null dies" "$?" 1
(download https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/missing f.jar >/dev/null 2>&1); check "download error dies" "$?" 1
check "failed download leaves no file" "$(ls f.jar 2>/dev/null)" ""

## fetch (curl replaced by a fake that returns the exit codes listed in $T/codes, one per call) ##
curl() { local code; code=$(head -n 1 "$T/codes"); sed -i 1d "$T/codes"; echo x >> "$T/calls"; [ "$code" = 0 ] && echo body; return "$code"; }
fake() { printf '%s\n' "$@" > "$T/codes"; : > "$T/calls"; }
calls() { wc -l < "$T/calls" | tr -d ' '; }
fake 92 92 0; check "fetch retries network errors" "$(fetch https://x.test):$(calls)" "body:3"
fake 92 92 92; check "fetch gives nothing after 3 failures" "$(fetch https://x.test || echo failed):$(calls)" "failed:3"
fake 22 0; check "fetch does not retry HTTP errors" "$(fetch https://x.test || echo failed):$(calls)" "failed:1"
unset -f curl fake calls

## other ##
(require bash ls >/dev/null 2>&1); check "require present" "$?" 0
(require bash no-such-cmd-xyz >/dev/null 2>&1); check "require missing dies" "$?" 1
check "success shows port" "$(MEM=1024 PORT=25565 success "Paper 1.21" | grep -c 'Port')" 1
check "success hides empty port" "$(MEM=1024 PORT="" success "Velocity" | grep -c 'Port')" 0
check "success hides RAM when not asked" "$(MEM="" PORT="" success "Gate" | grep -c 'RAM')" 0
check "success shows Java" "$(MEM=1024 JAVA_VERSION=25 success "Cleanroom 1.12.2" | sed 's/\x1b\[[0-9;]*m//g' | grep -c '\* Java: 25')" 1
check "success hides empty Java" "$(MEM=1024 JAVA_VERSION="" success "Velocity" | grep -c 'Java')" 0

cd / && rm -rf "$T"
if [ "$fail" = 0 ]; then echo "ALL PASSED"; else exit 1; fi
