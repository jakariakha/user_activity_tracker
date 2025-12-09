#!/bin/bash

# File to store login/logout events
LOG_FILE="/opt/user_activity_tracker/log/user_login_logout.log"

# Ensure log file exists
touch "$LOG_FILE"

timestamp=$(date '+%Y-%m-%d %H:%M:%S')

echo "$timestamp | LOGOUT | ${USER:-$(whoami)}" >> "$LOG_FILE"