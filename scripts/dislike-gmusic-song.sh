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

#Format Current Song for URL compat for GMusicProxy 
String=$(mpc | grep -m1 '' | sed 's/ /%20/g')
#Format Current Song for readability in terminal output
StringRead=$(mpc | grep -m1 '')
#Cut artist from URL compat string for GMusicProxy
Artist=$(echo $String | sed 's/-.*//')
#Cut artist from readable string for terminal output
ArtistRead=$(echo $StringRead | sed 's/-.*//')
#Cut song from URL compat string for GMusicProxy
Song=$(echo $String | sed 's/^.*-//')
#Cut song from readable string for terminal output
SongRead=$(echo $StringRead | sed 's/^.*-//')
#Get Song ID from Artist and Song in URL format via GMusicProxy
GmusicString=$(curl -s "http://localhost:9999/search_id?type=song&artist=$Artist&title=$Song&exact=no")
#Echo to terminal that we hate Artist - Song
echo "Hate: $StringRead"
#Send dislike to Google Music via GMusicProxy SongID $GmusicString
curl -s "http://localhost:9999/dislike_song?id=$GmusicString"
#Notify on desktop that we dislike Song by Artist.
notify-send -t "1000" "Hated$SongRead by $ArtistRead"
#Check if song already exists in dislike file, if so, don't add another copy. If not, add the Readable title and SongID to the dislike file.
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
#Notify on desktop and skip to next song...
notify-send -t "1000" "Skipping to next song..."
mpc next