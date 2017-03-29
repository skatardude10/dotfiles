#!/bin/bash
#  ╔═╗┬┌─┌─┐┌┬┐┌─┐┬─┐┌┬┐┬ ┬┌┬┐┌─┐┌─┐ 
#  ╚═╗├┴┐├─┤ │ ├─┤├┬┘ │││ │ ││├┤ └─┐ 
#  ╚═╝┴ ┴┴ ┴ ┴ ┴ ┴┴└──┴┘└─┘─┴┘└─┘└─┘ 
#  ╔═╗┌┬┐┬ ┬┌─┐┬┌─┐  ╔═╗┬─┐┌─┐─┐ ┬┬ ┬
#  ║ ╦││││ │└─┐││    ╠═╝├┬┘│ │┌┴┬┘└┬┘
#  ╚═╝┴ ┴└─┘└─┘┴└─┘  ╩  ┴└─└─┘┴ └─ ┴ 
#  ╦ ╦┌─┐┌┬┐┌─┐  ╔═╗┌─┐┬─┐┬┌─┐┌┬┐    
#  ╠═╣├─┤ │ ├┤   ╚═╗│  ├┬┘│├─┘ │     
#  ╩ ╩┴ ┴ ┴ └─┘  ╚═╝└─┘┴└─┴┴   ┴     
String=$(mpc | grep -m1 '' | sed 's/ /%20/g')
StringRead=$(mpc | grep -m1 '')

Artist=$(echo $String | sed 's/-.*//')
ArtistRead=$(echo $StringRead | sed 's/-.*//')

Song=$(echo $String | sed 's/^.*-//')
SongRead=$(echo $StringRead | sed 's/^.*-//')

GmusicString=$(curl -s "http://localhost:9999/search_id?type=song&artist=$Artist&title=$Song&exact=no")

echo "Hate: $StringRead"
curl -s "http://localhost:9999/dislike_song?id=$GmusicString"

notify-send -t "1000" "Hated$SongRead by $ArtistRead"

if grep "$StringRead" "$HOME/dotfiles/songs/dislike"; 
	then
		echo "Dislike already logged in $HOME/dotfiles/songs/dislike... skipping."
		notify-send -t "1000" "Dislike already logged in $HOME/dotfiles/songs/dislike... skipping."
	else
		echo "$StringRead" >> $HOME/dotfiles/songs/dislike
		echo "$GmusicString" >> $HOME/dotfiles/songs/dislike
		echo " " >> $HOME/dotfiles/songs/dislike
		echo "Dislike logged in $HOME/dotfiles/songs/dislike!"
		notify-send -t "1000" "Dislike logged in $HOME/dotfiles/songs/dislike!"
fi

notify-send -t "1000" "Skipping to next song..."
mpc next