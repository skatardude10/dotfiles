#!/bin/bash

shopt -s nullglob
cd ~/dotfiles/wallpapers

while true; do
	files=()
	for i in *.jpg *.png; do
		[[ -f $i ]] && files+=("$i")
	done
	range=${#files[@]}

	((range)) && feh --bg-fill "${files[RANDOM % range]}" "${files[RANDOM % range]}" "${files[RANDOM % range]}"

	sleep 3m
done
