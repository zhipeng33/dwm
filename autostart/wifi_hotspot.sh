#!/bin/bash

nmcli dev wifi hotspot ssid arch@czp password arch@czp123 ifname wlan0;
nmcli dev wifi show-password
