conky -c ~/dotfiles/rc/.conkyrc > ~/dotfiles/scripts/tmp &&
mapfile -t sysinfos <~/dotfiles/scripts/tmp &&
$(echo -e ""${sysinfos[0]}"\n"${sysinfos[4]}"\n"${sysinfos[1]}"\n"${sysinfos[2]}"\n"${sysinfos[3]}"" | rofi -dmenu -hide-scrollbar -width -20 -p "System Status: ")
rm ~/dotfiles/scripts/tmp
