#!/bin/bash
res=$(echo "logout|reboot|shutdown" | rofi -sep "|" -dmenu -i -p 'Power Menu: ' "" -width 15 -hide-scrollbar -location 5 -padding 15 -sidebar-mode -font "Ubuntu Condensed 16" -auto-select)

if [ $res = "logout" ]; then
    i3-msg exit
fi
if [ $res = "reboot" ]; then
    systemctl reboot
fi
if [ $res = "shutdown" ]; then
    systemctl poweroff
fi
exit 0