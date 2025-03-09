#!/bin/bash

# Get coordinates for the tap
read -p "Enter the X coordinate: " X
read -p "Enter the Y coordinate: " Y

echo "Tapping on point ($X, $Y)..."

# Tap on the specified coordinates
adb shell input tap $X $Y

echo "Tap executed."
