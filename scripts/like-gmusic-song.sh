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

if grep "$StringRead" "$HOME/dotfiles/songs/like"; 
	then
		echo "Song already logged... skipping."
	else
		echo "$StringRead" >> $HOME/dotfiles/songs/like
		echo "$GmusicString" >> $HOME/dotfiles/songs/like
		echo " " >> $HOME/dotfiles/songs/like
		echo "Song logged!"
fi

notify-send -t "1000" "Loved$SongRead by $ArtistRead"