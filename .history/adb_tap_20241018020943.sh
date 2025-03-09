#!/bin/bash

tap_count = 0
while true; do
    echo "Tapping on point..."
    adb shell input tap 605 1315

    tap_count=$((tap_count + 1))
    # sleep 1

    # Check for user input to exit
    read -t 1 -p "Press q to quit: " input
    if [[ $input == "q" ]]; then
        echo "Exiting loop..."
        break
    fi
done

output_file="tap_count.txt"
echo "Total taps: $tap_count" >> $output_file

echo "Tap data saved to $output_file."