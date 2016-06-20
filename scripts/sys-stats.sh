conky -c ~/dotfiles/rc/.conkyrc > ~/dotfiles/scripts/tmp &&
mapfile -t sysinfos <~/dotfiles/scripts/tmp &&
$(echo -e ""${sysinfos[0]}"\n"${sysinfos[4]}"\n"${sysinfos[1]}"\n"${sysinfos[2]}"\n"${sysinfos[3]}"\n"${sysinfos[5]}"\n"${sysinfos[6]}"" | rofi -dmenu -hide-scrollbar -width -28 -p "System Status: ")
rm ~/dotfiles/scripts/tmp
