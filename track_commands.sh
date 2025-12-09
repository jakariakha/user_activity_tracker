#!/bin/bash

LOGFILE="/opt/user_activity_tracker/log/user_commands.log"

TS=$(date +"%d-%m-%Y %H:%M:%S")
USER_NAME=$(whoami)
CMD="$@"

echo "$TS | $USER_NAME | $CMD" >> "$LOGFILE"