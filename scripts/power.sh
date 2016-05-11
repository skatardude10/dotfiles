#!/bin/bash
res=$(echo "logout|reboot|shutdown" | rofi -sep "|" -dmenu -i -p 'Power Menu: ' "" -hide-scrollbar -width 10 -location 5 -sidebar-mode)

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