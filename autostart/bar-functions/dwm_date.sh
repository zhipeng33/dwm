#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Date is formatted like like this: "[Mon 01-01-00 00:00:00]"
dwm_date () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf " |  %s " "$(date "+%a %T")"
    else
        printf " | BAT %s " "$(date "+%a %T")"
    fi
    printf "%s" "$SEP2"
}

dwm_date
