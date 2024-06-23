#!/bin/bash

# Get the current day of the week (1-5 for Monday-Friday, 6-7 for Saturday-Sunday)
day_of_week=$(date +%u)

# Path to your i3 configuration files
i3_config_dir=~/.config/i3
weekday_config=$i3_config_dir/work_config
weekend_config=$i3_config_dir/free_config
main_config=$i3_config_dir/dynamic_config

# Choose the correct configuration based on the day of the week
if [ "$day_of_week" -le 100 ]; then
    # It's a weekday
    CONFIG_FILE=$weekday_config
else
    # It's a weekend
    CONFIG_FILE=$weekend_config
fi

# Reload i3 to apply the new configuration
i3 -c $CONFIG_FILE

