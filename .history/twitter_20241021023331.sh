#!/bin/bash

# Define scroll count
scroll_count=0
hold_duration=0

# Infinite loop to scroll Twitter feed
while true; do
    # Check if there is a long press (tap and hold)
    echo "Hold the device to pause scrolling..."

    # Detect if screen is tapped (simulate tap detection using sleep as a hold)
    read -t 0.1 -n 1 input  # Read input in non-blocking mode

    # Check if the 't' (tap) key is pressed (replace 't' with the actual condition for tap detection)
    if [[ $input == "t" ]]; then
        echo "Tap detected, entering hold state..."
        # Simulate hold by waiting while tap is held
        while [[ $input == "t" ]]; do
            read -t 1 -n 1 input  # Check for release of tap every second
            echo "Holding, scrolling paused..."
            hold_duration=$((hold_duration + 1))

            # Break hold after some time (optional) or continue waiting for release
            if [[ $hold_duration -ge 10 ]]; then
                echo "Tap held too long, automatically resuming..."
                break
            fi
        done
        continue  # Skip scrolling if holding is detected
    fi

    # Simulate a swipe up (scrolling down the Twitter feed)
    adb shell input swipe 500 1000 500 800  # Adjust coordinates as needed

    scroll_count=$((scroll_count + 1))
    echo "Scrolled $scroll_count times."

    # Wait for 2 seconds before scrolling again to mimic user behavior
    sleep 12

    # Check for 'q' input to exit the loop
    read -t 1 -n 1 input  # Check again if the user pressed 'q'
    if [[ $input == "q" ]]; then
        echo "Exiting... Total scrolls: $scroll_count"
        break
    fi
done
