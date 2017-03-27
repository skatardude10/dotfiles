#!/bin/bash

String=$(mpc | grep -m1 '' | sed 's/ /%20/g')
StringRead=$(mpc | grep -m1 '')

Artist=$(echo $String | sed 's/-.*//')
ArtistRead=$(echo $StringRead | sed 's/-.*//')

Song=$(echo $String | sed 's/^.*-//')
SongRead=$(echo $StringRead | sed 's/^.*-//')

GmusicString=$(curl -s "http://localhost:9999/search_id?type=song&artist=$Artist&title=$Song&exact=no")

echo "Love: $StringRead"
curl -s "http://localhost:9999/like_song?id=$GmusicString"

notify-send -t "1000" "Loved$SongRead by $ArtistRead"

if grep "$StringRead" "$HOME/dotfiles/songs/like"; 
	then
		echo "Like already logged in $HOME/dotfiles/songs/like... skipping."
		notify-send -t "1000" "Like already logged in $HOME/dotfiles/songs/like... skipping."
	else
		echo "$StringRead" >> $HOME/dotfiles/songs/like
		echo "$GmusicString" >> $HOME/dotfiles/songs/like
		echo " " >> $HOME/dotfiles/songs/like
		echo "Like logged in $HOME/dotfiles/songs/like!"
		notify-send -t "1000" "Like logged in $HOME/dotfiles/songs/like!"
fi
