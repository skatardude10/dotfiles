file=~/dotfiles/scripts/tmp
date=$(date '+%A, %B %d')
cal| tr " " . > $file && 
tail -n +2 $file > $file.tmp && mv $file.tmp $file
echo $date | cat - $file > $file.tmp && mv $file.tmp $file
mapfile -t calendar <~/dotfiles/scripts/tmp &&
$(echo -e ""${calendar[1]}"\n"${calendar[2]}"\n"${calendar[3]}"\n"${calendar[4]}"\n"${calendar[5]}"\n"${calendar[6]}"\n" | rofi -dmenu -hide-scrollbar -width -23 -p "${calendar[0]}")
rm ~/dotfiles/scripts/tmp
