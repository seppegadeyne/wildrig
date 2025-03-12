#!/bin/bash

BASEDIR="$HOME/wildrig"
SESSION_NAME="quai"
PROCESS_PATH="$HOME/wildrig/wildrig-multi"  # Full path of the exact process
RUN_SCRIPT="$BASEDIR/run.sh"

# Check if the base directory exists, otherwise exit
if [ ! -d "$BASEDIR" ]; then
	logger -t check-wildrig "Error: Directory '$BASEDIR' does not exist. Exiting."
	exit 1
fi

# Check if the actual wildrig-multi process is running (exact match)
PROCESS_PID=$(ps aux | awk '$11 == "'$PROCESS_PATH'" {print $2}')

if [ -n "$PROCESS_PID" ]; then
	logger -t check-wildrig "Process '$PROCESS_PATH' is already running (PID: $PROCESS_PID). No action needed."
	exit 0
fi

logger -t check-wildrig "Process '$PROCESS_PATH' is not running. Restarting..."

# Call run.sh to restart the application
cd "$BASEDIR" && ./run.sh 

logger -t check-wildrig "Wildrig process restarted successfully."
