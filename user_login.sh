# Prevent multiple executions in the same session
if [ -n "$LOGIN_TRACKED" ]; then
    return 0 2>/dev/null || exit 0
fi
export LOGIN_TRACKED=1

# File to store login/logout events
LOG_FILE="/opt/user_activity_tracker/log/user_login_logout.log"

# Ensure log file exists
touch "$LOG_FILE"

timestamp=$(date '+%Y-%m-%d %H:%M:%S')

echo "$timestamp | LOGIN | ${USER:-$(whoami)}" >> "$LOG_FILE"
