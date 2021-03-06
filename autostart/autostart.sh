#!/bin/bash

picom -cb &
dunst &
fcitx5 &
clight &
qv2ray &
numlockx &
flameshot &
blueman-applet &
optimus-manager-qt &

# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Change the appearance of the module identifier. if this is set to "unicode", then symbols will be used as identifiers instead of text. E.g. [📪 0] instead of [MAIL 0].
# Requires a font with adequate unicode character support
export IDENTIFIER="unicode"

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.
# export SEP1=" | "
# export SEP2=" | "

# Import the modules
. "$DIR/bar-functions/dwm_amixer.sh"
. "$DIR/bar-functions/dwm_backlight.sh"
. "$DIR/bar-functions/dwm_battery.sh"
. "$DIR/bar-functions/dwm_start_countdown.sh"
. "$DIR/bar-functions/dwm_date.sh"
. "$DIR/bar-functions/dwm_networkmanager.sh"
. "$DIR/bar-functions/dwm_resources.sh"
. "$DIR/bar-functions/dwm_version.sh"

# Wallpaper
feh --bg-fill --no-fehbg --randomize ~/czp-Personal_data/030-Public/032-dwm_wallpaper &

# Update dwm status bar every second
noe_time() {
	while true
	do
		# Append results of each func one by one to a string
 		var=""
		var="$var$(dwm_version)"
		var="$var$(dwm_start_countdown)"
		var="$var$(dwm_amixer)"
		var="$var$(dwm_backlight)"
		var="$var$(dwm_resources)"
		var="$var$(dwm_networkmanager)"
		var="$var$(dwm_battery)"
 		var="$var$(dwm_date)"

		xsetroot -name "$var"
 		# sleep 0.3
	done
}

noe_time &
