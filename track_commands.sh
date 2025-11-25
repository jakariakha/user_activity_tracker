#!/bin/bash

LOGFILE="/var/log/user-activity-tracker.log"
TS=$(date +"%d-%m-%Y %H:%M:%S")
USER_NAME=$(whoami)
CMD="command name"

echo "$TS | $USER_NAME | $CMD" >> "$LOGFILE"
