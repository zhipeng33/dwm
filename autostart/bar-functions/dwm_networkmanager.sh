#!/bin/bash

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP using NetworkManager
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, curl

dwm_networkmanager () {
    CONNAME=$(nmcli -a | grep 'Wired connection' | awk 'NR==1{print $1}')
	if  [ "$CONNAME" != "" ]; then
		PRIVATE=$(nmcli -a | grep -A 5 'Wired connection' | grep 'inet4' | awk '{ printf $2 }')
		# PUBLIC=$(curl cip.cc | awk '{ printf $3 }' | awk '{ printf $1 }')

		printf "%s" "$SEP1"
		if [ "$IDENTIFIER" = "unicode" ]; then
			printf " |  %s" "$CONNAME"
			# printf " 𣏕 %s" "$PRIVATE"
			# printf " |  %s" "$PUBLIC"
		else
			printf " | NET %s" "$CONNAME"
			# printf " %s" "$PRIVATE"
			# printf " | %s" "$PUBLIC
		fi
		printf "%s" "$SEP2"
	else
		CONNAME=$(nmcli -a | grep -B 5 'wifi' | grep '已连接' | awk '{ printf $4 }')
		PRIVATE=$(nmcli -a | grep 'inet4' | awk '{print $2 " "}' | tr -d '\n')
		# PUBLIC=$(curl cip.cc | awk '{ printf $3 }' | awk '{ printf $1 }')

		printf "%s" "$SEP1"
		if [ "$IDENTIFIER" = "unicode" ]; then
			printf " |  %s" "$CONNAME"
			# printf " 𣏕 %s" "$PRIVATE"
			# printf " |  %s" "$PUBLIC"
		else
			printf " | NET %s" "$CONNAME"
			# printf " %s" "$PRIVATE"
			# printf " | %s" "$PUBLIC"
		fi
		printf "%s" "$SEP2"
	fi
}

# 存储设备状态信息
netup="$(cat /sys/class/net/enp8s0/operstate) $(cat /sys/class/net/wlan0/operstate)"

# 判断设备是否启用
if [ "$netup" = "up up" ]; then
	dwm_networkmanager
else
	printf " |  No Device"

fi
