#!/bin/bash

# Set the log file path to /tmp as it has read/write permissions
LOG_FILE="/tmp/command_log.txt"

# Ensure the log file exists and is writable
sudo touch "$LOG_FILE"
sudo chmod 666 "$LOG_FILE"  # Allow read/write for all users

# Check if PROMPT_COMMAND is already set for logging to avoid duplicates
if ! grep -q "PROMPT_COMMAND" ~/.bashrc; then
    echo "Setting up command logging in .bashrc..."

    # Append PROMPT_COMMAND to .bashrc to log each command to /tmp
    echo "export PROMPT_COMMAND='echo \"\$(date +\"%Y-%m-%d %H:%M:%S\") - \$(whoami) - \$(history 1 | sed \"s/^[ ]*[0-9]\+[ ]*//\")\" >> $LOG_FILE'" >> ~/.bashrc

    echo "Command logging setup complete. Logs will be saved to $LOG_FILE."
else
    echo "Command logging is already set up in .bashrc."
fi

#Apply the changes to the current session
source ~/.bashrc
#Confirmation
echo "Command logging is active. Each command will be logged in $LOG_FILE."
