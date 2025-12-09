#!/bin/bash

while true; do
    clear
    echo "=============================="
    echo " User Activity Tracker Menu"
    echo "=============================="
    echo "1. Track User Login/Logout"
    echo "2. Track User Commands"
    echo "3. App Usage Report"
    echo "4. Exit"
    echo "=============================="
    read -p "Select an option (1-4): " choice

    case $choice in
        1)
            echo "Starting User Login/Logout Tracker..."
            cat /opt/user_activity_tracker/log/user_login_logout.log &
            ;;
        2)
            echo "Starting User Command Tracker..."
            cat /opt/user_activity_tracker/log/user_commands.log &
            ;;
        
        3)
            echo "Generating App Usage Report..."
            bash /opt/user_activity_tracker/app_usage.sh
            ;;
        4)  
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please select 1, 2, 3, or 4."
            ;;
    esac

    read -p "Press [Enter] to continue..."
done