#!/bin/bash

LOGFILE="/tmp/recon/connections.log"

while true; do
    OF_COUNT=$(ps -u $(whoami) -o pid= | xargs -L 1 sh -c 'lsof -p "$1" 2>/dev/null | wc -l' sh | awk '{sum += $1} END {print sum}')
    NT_COUNT=$(ss -ant | grep -v State | wc -l)
    msg="$(date) | LSOF: ${OF_COUNT} | CONNECTIONS: ${NT_COUNT}"
    echo "$msg"       # This will print the message to stdout.
    echo "$msg" >> "$LOGFILE"  # This will append the message to the log file.
    sleep 10
done
