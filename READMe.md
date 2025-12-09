To track commands
1. mkdir /opt/user_activity_tracker
2. touch track_commands.sh
3. copy this --> echo 'PROMPT_COMMAND='"'"'LAST_CMD=$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//"); /opt/user_activity_tracker/track_commands.sh "$LAST_CMD"'"'" | sudo tee -a /etc/bash.bashrc
4. sudo nano /etc/bash.bashrc and paste here which is copied at step 3
5. sudo chmod 666 /opt/user_activity_tracker/log/user_commands.log && sudo chmod +x /opt/user_activity_tracker/track_commands.sh
6. sudo chmod 777 //opt/user_activity_tracker/user-activity-tracker.log
7. sudo chmod 777 /opt/user_activity_tracker/track_commands.sh
