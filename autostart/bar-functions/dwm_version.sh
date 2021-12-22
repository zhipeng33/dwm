#!/bin/sh

dwm_version() {
	printf " \uf303 %s" "$(uname -r | awk -F '-' '{ printf $1 }')"
}

dwm_version
