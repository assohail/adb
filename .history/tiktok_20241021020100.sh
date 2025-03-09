#!/bin/bash

# Define tap count
tap_count=0

# Infinite loop to swipe TikTok videos
while true; do
    # Simulate a swipe up (from bottom to top)
    adb shell input swipe 500 1600 500 400

    tap_count=$((tap_count + 1))
    echo "Swiped $tap_count times."

    # Wait for 3 seconds before swiping again
    sleep 3

    # Check for user input to exit the loop
    read -t 1 -p "Press q to quit: " input
    if [[ $input == "q" ]]; then
        echo "Exiting... Total swipes: $tap_count"
        break
    fi
done
