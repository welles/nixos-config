#!/usr/bin/env bash

TV="HDMI-A-1"
MAIN_ULTRAWIDE="DP-2"
SECONDARY_PORTRAIT="DP-1"

# Check if the TV is currently enabled
TV_ENABLED=$(kscreen-doctor -o | grep -A 1 "$TV" | grep -q "enabled" && echo "yes" || echo "no")

if [ "$TV_ENABLED" = "yes" ]; then
	# Switch to DESK MODE:
	# DP-1: rotation.right (1440x2560) at (0, 0)
	# DP-2: 3840x1600 at (1440, 960) -> Bottom edges align at Y=2560
	kscreen-doctor \
		output."$TV".disable \
		output."$SECONDARY_PORTRAIT".enable output."$SECONDARY_PORTRAIT".rotation.right output."$SECONDARY_PORTRAIT".position.0,0 \
		output."$MAIN_ULTRAWIDE".enable output."$MAIN_ULTRAWIDE".primary output."$MAIN_ULTRAWIDE".rotation.normal output."$MAIN_ULTRAWIDE".position.1440,960
	notify-send -a "Display Switcher" "Display Profile" "Switched to Dual Desk Monitors"
else
	# Switch to TV MODE:
	kscreen-doctor \
		output."$MAIN_ULTRAWIDE".disable \
		output."$SECONDARY_PORTRAIT".disable \
		output."$TV".enable output."$TV".primary output."$TV".rotation.normal output."$TV".position.0,0
	notify-send -a "Display Switcher" "Display Profile" "Switched to TV Only"
fi
