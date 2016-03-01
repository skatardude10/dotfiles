#!/bin/bash
shopt -s nullglob
cd ~/dotfiles/wallpapers
if [[ $(ls /sys/class/net) =~ .*"wlp3s0u2".* ]] 
then
	while true; do
		files=()
		for i in *.jpg *.png; do
			[[ -f $i ]] && files+=("$i")
		done
		range=${#files[@]}
		((range)) && feh --bg-fill "${files[RANDOM % range]}" # "${files[RANDOM % range]}" "${files[RANDOM % range]}"
		sleep 10m
	done
else
	if [[ $(ls /sys/class/net) =~ .*"wlp3s0".* ]] 
	then
		feh --bg-fill ~/dotfiles/wallpapers/expand.png # "${files[RANDOM % range]}" "${files[RANDOM % range]}"
	else
		if [[ $(ls /sys/class/net) =~ .*"enp4s0".* ]] 
		then
			while true; do
				files=()
				for i in *.jpg *.png; do
					[[ -f $i ]] && files+=("$i")
				done
				range=${#files[@]}
				((range)) && feh --bg-tile "${files[RANDOM % range]}" # "${files[RANDOM % range]}" "${files[RANDOM % range]}"
				sleep 10m
			done
		fi
	fi
fi
