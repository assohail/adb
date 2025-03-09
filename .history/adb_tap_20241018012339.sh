#!/bin/bash

while true; do
    echo "Tapping on point..."
    adb shell input tap 605 1315
    sleep 1

    # Check for user input to exit
    read -t 1 -p "Press q to quit: " input
    if [[ $input == "q" ]]; then
        echo "Exiting loop..."
        break
    fi
done
