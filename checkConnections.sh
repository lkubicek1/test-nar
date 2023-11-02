#!/bin/bash

LOGFILE="/tmp/connections.log"

while true; do
    OF_COUNT=$(ps -u "$(whoami)" -o pid= | xargs -L 1 sh -c 'lsof -p "$1" 2>/dev/null | wc -l' | awk '{sum += $1} END {print sum}')
    NT_COUNT=$(ss -ant | grep -v State | wc -l)
    echo "$(date) | LSOF: ${OF_COUNT} | CONNECTIONS: ${NT_COUNT}" >> "${LOGFILE}"
    sleep 10
done
