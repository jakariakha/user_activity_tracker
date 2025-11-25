To track commands
1. mkdir /opt/user_activity_tracker/track_commands.sh
2. add this export PROMPT_COMMAND="/opt/user_activity_tracker/track_commands.sh" to sudo nano /etc/bash.bashrc
3. mkdir /var/log/user-activity-tracker.log
4. sudo chmod 777 /var/log/user-activity-tracker.log
5. sudo chmod 777 /opt/user_activity_tracker/track_commands.sh
