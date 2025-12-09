#!/bin/bash

# Log file location
LOG_FILE="/opt/user_activity_tracker/log/app_usage.log"

# Ensure log directory exists
mkdir -p "$(dirname "$LOG_FILE")"

INTERVAL=30  # seconds
FULL_DAY_SECONDS=86400  # 24 hours in seconds

# Allow date as argument, default to today
if [ -n "$1" ]; then
    REPORT_DATE="$1"
else
    REPORT_DATE=$(date '+%Y-%m-%d')
fi

echo "--- Usage Report for $REPORT_DATE ---"

if [ ! -f "$LOG_FILE" ]; then
    echo "No log file found at $LOG_FILE"
    exit 1
fi

# Calculate total active time (unique timestamps)
total_ticks=$(grep "^$REPORT_DATE" "$LOG_FILE" | awk -F '|' '{print $1}' | sort | uniq | wc -l)

if [ "$total_ticks" -eq 0 ]; then
    echo "No activity logs found for $REPORT_DATE."
    exit 0
fi

total_seconds=$((total_ticks * INTERVAL))
t_hours=$((total_seconds / 3600))
t_minutes=$(((total_seconds % 3600) / 60))
t_seconds=$((total_seconds % 60))
day_percent=$(awk "BEGIN {printf \"%.2f\", ($total_seconds / $FULL_DAY_SECONDS) * 100}")

echo "Total System Active Time: $t_hours h $t_minutes m $t_seconds s ($day_percent% of 24h)"
echo "---------------------------------"

# Extract the command column, deduplicate by timestamp, and count occurrences
grep "^$REPORT_DATE" "$LOG_FILE" | awk -F '|' '{gsub(/ /,"",$3); print $1 "|" $3}' | sort | uniq | awk -F '|' '{print $2}' | sort | uniq -c | sort -rn | while read count app; do
    usage_seconds=$((count * INTERVAL))
    hours=$((usage_seconds / 3600))
    minutes=$(((usage_seconds % 3600) / 60))
    seconds=$((usage_seconds % 60))
    percent=$(awk "BEGIN {printf \"%.1f\", ($usage_seconds / $total_seconds) * 100}")
    echo "$app: $hours h $minutes m $seconds s ($percent%)"
done

