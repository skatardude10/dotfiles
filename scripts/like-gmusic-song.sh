#!/bin/bash
#  ╔═╗┬┌─┌─┐┌┬┐┌─┐┬─┐┌┬┐┬ ┬┌┬┐┌─┐┌─┐   
#  ╚═╗├┴┐├─┤ │ ├─┤├┬┘ │││ │ ││├┤ └─┐   
#  ╚═╝┴ ┴┴ ┴ ┴ ┴ ┴┴└──┴┘└─┘─┴┘└─┘└─┘   
#  ╔═╗╔╦╗┬ ┬┌─┐┬┌─┐  ╔═╗┬─┐┌─┐─┐ ┬┬ ┬  
#  ║ ╦║║║│ │└─┐││    ╠═╝├┬┘│ │┌┴┬┘└┬┘  
#  ╚═╝╩ ╩└─┘└─┘┴└─┘  ╩  ┴└─└─┘┴ └─ ┴   
#  ╦  ┬┬┌─┌─┐┬─┐  ╔═╗┌─┐┬─┐┬┌─┐┌┬┐     
#  ║  │├┴┐├┤ ├┬┘  ╚═╗│  ├┬┘│├─┘ │      
#  ╩═╝┴┴ ┴└─┘┴└─  ╚═╝└─┘┴└─┴┴   ┴      

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
#Echo to terminal that we love Artist - Song
echo "Love: $StringRead"
#Send like to Google Music via GMusicProxy SongID $GmusicString
curl -s "http://localhost:9999/like_song?id=$GmusicString"
#Notify on desktop that we love Song by Artist!
notify-send -t "1000" "Loved$SongRead by $ArtistRead"
#Check if song already exists in like file, if so, don't add another copy. If not, add the Readable title and SongID to the like file!
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
