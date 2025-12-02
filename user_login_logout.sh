#!/bin/bash

# File to store login/logout events
LOG_FILE="/var/log/user_login_logout.log"

# Ensure log file exists
touch "$LOG_FILE"

#2025-11-30T15:05:01.600413+06:00 khan-pc CRON[18299]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)

#2025-11-30T15:05:01.602622+06:00 khan-pc CRON[18299]: pam_unix(cron:session): session closed for user root

# Monitor auth logs for login/logout events
tail -F /var/log/auth.log | while read line; do
    # Check for login
    if echo "$line" | grep -q "session opened for user"; then
        user=$(echo "$line" | awk '{for(i=1;i<=NF;i++){if($i=="user") {print $(i+1)}}}')
        timestamp=$(date '+%Y-%m-%d %H:%M:%S')
        echo "$timestamp | LOGIN | $user" >> "$LOG_FILE"
    fi

    # Check for logout
    if echo "$line" | grep -q "session closed for user"; then
        user=$(echo "$line" | awk '{for(i=1;i<=NF;i++){if($i=="user") {print $(i+1)}}}')
        timestamp=$(date '+%Y-%m-%d %H:%M:%S')
        echo "$timestamp | LOGOUT | $user" >> "$LOG_FILE"
    fi
done
