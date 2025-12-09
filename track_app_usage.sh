#!/bin/bash

# Log file location
LOG_FILE="/opt/user_activity_tracker/log/app_usage.log"

# Ensure log directory exists
mkdir -p "$(dirname "$LOG_FILE")"

INTERVAL=30  # seconds

while true; do
    TS=$(date '+%Y-%m-%d %H:%M:%S')
    USER_NAME=$(whoami)
    
    # Get top processes by CPU usage for the current user
    ps -u "$USER_NAME" -o comm=,%cpu=,%mem= --sort=-%cpu | head -10 | while read APP_NAME CPU MEM; do
        if [ -n "$APP_NAME" ]; then
            echo "$TS | $USER_NAME | $APP_NAME | $CPU | $MEM" >> "$LOG_FILE"
        fi
    done
    
    sleep $INTERVAL
done
