#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
		if [ "$STATUS" = "Full" ]; then
			printf " |  %s%%" "$CHARGE"
        else
			if [ "$CHARGE" >= 70 ]; then
				printf " |  %s%%" "$CHARGE"
			elif [ "$CHARGE" >= 40]; then
				printf " |  %s%%" "$CHARGE"
			elif [ "$CHARGE" >= 20]; then
				printf " |  %s%%" "$CHARGE"
			else
				printf " |  %s%%" "$CHARGE"
			fi
        fi
    else
        printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
    printf "%s" "$SEP2"
}

dwm_battery
