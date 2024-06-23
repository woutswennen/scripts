#!/bin/bash

# Path to your i3 configuration file
config_file=~/.config/i3/general_config/dynamic/controller

# Function to activate a specific setup
activate_setup() {
    local setup_file=$1
    echo "Current user: $(whoami)"
    # Comment out all includes
    echo "Executing: sed -e '/include/ s/^#*/#/' -i " $config_file
    sed -e "/include/ s/^#*/#/" -i $config_file

    # Uncomment the specific setup
    echo "Executing: sed -i /'$setup_file'/s/^#// -i " $config_file
    sed -i "/$setup_file/s/^#//" -i $config_file
}

# Main script logic
case "$1" in
    home)
        activate_setup "home_setup_xrandr"
        ;;
    solo)
        activate_setup "solo_setup_xrandr"
        ;;
    work)
        activate_setup "work_setup_xrandr"
        ;;
    *)
        echo "Usage: $0 {home|solo|work}"
        exit 1
esac

# Reload i3 to apply changes
i3-msg reload
