#!/bin/bash
# End-to-end check: installs one server with the real script, then starts it until it is ready.
# usage: tests/run-install.sh <script> <answers> <expected version text> <boot: true|false>
#   answers: the replies to the questions, separated by ";" (FOLDER is replaced with the install folder)
#   example: tests/run-install.sh spigot "FOLDER;2;;;;;y;1" "Paper" true
R=$(cd "$(dirname "$0")/.." && pwd)
script=$1 answers=$2 expected=$3 boot=$4
folder="${RUNNER_TEMP:-$(mktemp -d)}/server"
export PATH="$R/tests/bin:$PATH" TERM="${TERM:-dumb}"
fail() { echo "::error::$1"; exit 1; }
# git on Windows may drop the executable bit, without it the scripts would be fetched from main
chmod +x "$R/tests/bin/wget"
[ "$(type -P wget)" = "$R/tests/bin/wget" ] || fail "tests/bin/wget is not used, the checks would test the main branch"

## install ##
answers=${answers//FOLDER/$folder}
log=$(mktemp)
printf '%s\n' "${answers//;/$'\n'}" | bash "$R/src/$script.sh" 2>&1 | sed 's/\x1b\[[0-9;]*m//g' | tee "$log"
status=${PIPESTATUS[1]}
[ "$status" = 0 ] || fail "$script.sh exited with code $status"
grep -q "Version: $expected" "$log" || fail "the summary does not show 'Version: $expected'"
[ -x "$folder/starter.sh" ] || fail "starter.sh was not created"
echo "Installed files:"; ls -la "$folder"
[ "$boot" = true ] || exit 0

## start the server with the Java version it needs ##
# only the summary line: the Spigot build also prints "Java Version: Java 25"
version=$(sed -n 's/.*\* Version: [^ ]* \([^ ]*\).*/\1/p' "$log")
need=$(bash -c 'source "$1/src/common.sh"; java_for_mc "$2"' _ "$R" "$version")
java_home="JAVA_HOME_${need}_X64" # set by actions/setup-java for every installed version
[ -n "${!java_home}" ] && export PATH="${!java_home}/bin:$PATH"
echo "Starting the server with Java $need. . ."
cd "$folder" || exit 1
# new session, so the whole process tree can be stopped; stdin stays open like a real console
setsid bash -c 'sleep infinity | ./starter.sh' > boot.log 2>&1 &
pid=$!
for _ in $(seq 480); do
  # ready messages: Java servers and Velocity, BungeeCord and PicoLimbo, Bedrock, Gate, ViaProxy, Allay, WaterdogPE, Limbo, Infrarust, Pumpkin
  if grep -qE 'Done \(|Listening on|Server started|listening for connections|started successfully|Network interface started|Binding to|server listening on|accepting connections|is now running' boot.log; then
    tail -n 5 boot.log
    kill -- -"$pid" 2>/dev/null
    echo "The server started correctly."
    exit 0
  fi
  kill -0 "$pid" 2>/dev/null || break
  sleep 1
done
cat boot.log
kill -- -"$pid" 2>/dev/null
fail "the server did not start"
