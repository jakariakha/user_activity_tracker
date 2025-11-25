#!/bin/bash

LOGFILE="/var/log/user-activity-tracker.log"
TS=$(date +"%d-%m-%Y %H:%M:%S")
USER_NAME=$(whoami)
CMD=$(history 1 | sed 's/^[ ]*[0-9]\+[ ]*//')

echo "$TS | $USER_NAME | $CMD" >> "$LOGFILE"
