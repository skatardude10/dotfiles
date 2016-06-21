#!/bin/bash
isplaying=$(cat ~/.config/pianobar/isplaying)
if [ "$isplaying" = "0" ]
then
	MPD_HOST=127.0.0.1 mpc $password volume -5
else
	if [[ -n `pidof pianobar` ]]; then
		echo -n "(" > "$HOME/.config/pianobar/ctl"
  	fi
fi


