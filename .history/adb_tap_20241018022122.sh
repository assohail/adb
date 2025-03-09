#!/bin/bash

tap_count=0
while true; do
    # echo "Tapping on point..."
    adb shell input tap 605 1315

    tap_count=$((tap_count + 1))
    echo "Total taps: $tap_count"

    # sleep 1

    # Check for user input to exit
    read -t 1 -p "Press q to quit: " input
    if [[ $input == "q" ]]; then
        echo "Exiting loop... Total taps: $tap_count"
        break
    fi
done

# output_file="tap_count.txt"
python3 write_to_excel.py $tap_count
# echo "Total taps: $tap_count" >> $output_file

echo "Tap data saved to $output_file."