#!/bin/bash

LOG_FILE="$HOME/wildrig/miner.log"
MINER_EXECUTABLE="$HOME/wildrig/wildrig-multi"
SESSION_NAME="quai"

# Check if the log file exists, if so, empty it
if [ -f "$LOG_FILE" ]; then
	> "$LOG_FILE"
fi

# Check if the screen session is already running, if so, stop it first
if screen -list | grep -q "$SESSION_NAME"; then
	echo "Screen session '$SESSION_NAME' is already running, stopping it now..."
	screen -S "$SESSION_NAME" -X quit
	sleep 2  # Give it some time to close
fi

screen -dmS "$SESSION_NAME" "$MINER_EXECUTABLE" --algo progpow-quai --opencl-threads auto --opencl-launch auto --url koala.straffesites.be:3333 --user seppe --pass x --gpu-temp-limit 90 --log-file "$LOG_FILE"

echo "Wildrig started in screen session '$SESSION_NAME'."
